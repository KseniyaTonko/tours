package com.example.tours.service;

import com.cloudinary.utils.ObjectUtils;
import com.example.tours.dto.Mail;
import com.example.tours.dto.request.SearchParams;
import com.example.tours.dto.request.TourDto;
import com.example.tours.dto.response.SearchValues;
import com.example.tours.model.*;
import com.example.tours.model.enums.FoodType;
import com.example.tours.model.enums.TourType;
import com.example.tours.model.enums.Transport;
import com.example.tours.repository.TourRepository;
import com.example.tours.repository.UsersTourRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Service
@EnableScheduling
public class TourService {

    @Autowired
    private TourRepository tourRepository;

    @Autowired
    private HotelService hotelService;

    @Autowired
    private ImageService imageService;

    @Autowired
    private UserService userService;

    @Autowired
    private CardService cardService;

    @Autowired
    private MailServiceImpl mailService;

    @Autowired
    private UsersTourService usersTourService;

    @Autowired
    private UsersTourRepository usersTourRepository;

    private SearchValues searchValues = null;


    private String changeDateFormat(String inputText) throws ParseException {
        DateFormat outputFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm", Locale.US);
        DateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm", Locale.US);
        Date date = inputFormat.parse(inputText);
        return outputFormat.format(date);
    }

    public void addTour(TourDto dto) throws ParseException {
        Hotel hotel = hotelService.getHotelById(dto.getHotelId());
        Tour tour = new Tour(dto.getName(), hotel, dto.getCountry(),
                dto.getResort(), dto.getTownFrom(), dto.getLasting(), changeDateFormat(dto.getStartTime()),
                changeDateFormat(dto.getEndDate()), dto.getTransport(), dto.getType(), dto.getFoodType(),
                dto.getPrice(), dto.getDescription(), dto.getRemainingSeats());
        tourRepository.save(tour);
    }

    public void editTour(TourDto dto, String id) throws ParseException {
        Hotel hotel = hotelService.getHotelById(dto.getHotelId());
        Tour tour = tourRepository.findById(Integer.parseInt(id));
        tour.setName(dto.getName());
        tour.setHotel(hotel);
        tour.setCountry(dto.getCountry());
        tour.setResort(dto.getResort());
        tour.setTownFrom(dto.getTownFrom());
        tour.setLasting(dto.getLasting());
        tour.setStartTime(changeDateFormat(dto.getStartTime()));
        tour.setEndDate(changeDateFormat(dto.getEndDate()));
        tour.setTransport(dto.getTransport());
        tour.setType(dto.getType());
        tour.setFoodType(dto.getFoodType());
        tour.setDescription(dto.getDescription());
        tour.setRemainingSeats(dto.getRemainingSeats());
        tourRepository.save(tour);
    }

    public List<Hotel> getHotels() {
        return hotelService.getHotels();
    }

    public Tour getTourById(String id) {
        return tourRepository.findById(Integer.parseInt(id));
    }

    public void editPrice(Float price, String id) {
        Tour tour = tourRepository.findById(Integer.parseInt(id));
        tour.setPrice(price);
        tourRepository.save(tour);
    }

    public Date stringToDate(String inputText) throws ParseException {
        DateFormat inputFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm", Locale.US);
        return inputFormat.parse(inputText);
    }

    public boolean compareDates(String date, Date now) throws ParseException {
        return stringToDate(date).compareTo(now) > 0;
    }

    public boolean checkCanBook(String date) throws ParseException {
        Date now = new Date();
        int noOfDays = 7; //7 days
        Calendar calendar = Calendar.getInstance(Locale.US);
        calendar.setTime(now);
        calendar.add(Calendar.DAY_OF_YEAR, noOfDays);
        Date resultDateNow = calendar.getTime();

        calendar.setTime(stringToDate(date));
        Date resultDate = calendar.getTime();

        return resultDateNow.compareTo(resultDate) < 0;
    }

    public List<Tour> getTours() {
        Date now = new Date();
        return tourRepository.findAllByOrderByStartTimeAsc().stream()
                .filter(el-> {
                    try {
                        return compareDates(el.getStartTime(), now);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    return false;
                })
                .collect(Collectors.toList());
    }

    public List<Tour> getToursByType(int index) {
        Date now = new Date();
        return tourRepository.findAllByTypeOrderByStartTimeAsc(TourType.values()[index])
                .stream().filter(el-> {
                    try {
                        return compareDates(el.getStartTime(), now);
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    return false;
                }).collect(Collectors.toList());
    }

    // upload image

    public void deleteImage(String tourId, String imageId) throws IOException {
        Image image = imageService.getById(imageId);
        Tour tour = tourRepository.findById(Integer.parseInt(tourId));
        imageService.cloudinary.uploader().destroy(image.getImagePublicId(), ObjectUtils.emptyMap());
        tour.getImages().remove(image);
        tourRepository.save(tour);
    }

    public void saveImage(MultipartFile file, String id) throws IOException {
        Map uploadResult = imageService.cloudinary.uploader().upload(imageService.getFile(file), ObjectUtils.emptyMap());
        Image image = new Image(uploadResult.get("secure_url").toString(), uploadResult.get("public_id").toString());
        Tour tour = tourRepository.findById(Integer.parseInt(id));
        tour.getImages().add(image);
        tourRepository.save(tour);
    }

    // -----------

    public String buyTour(String userId, String cardId, String tourId, Integer seats) {
        User user = userService.getUserById(userId);
        Card card = cardService.getCardById(cardId);
        Tour tour = tourRepository.findById(Integer.parseInt(tourId));
        if (seats > tour.getRemainingSeats()) {
            return "There are no such seats!";
        }
        String res = checkCardExpired(card, tour.getPrice(), seats);
        if (!res.equals("ok")) {
            return res;
        }
        if (tour.getRemainingSeats() == 0) {
            return "No remaining seats!";
        }
        card.setMoney(card.getMoney() - tour.getPrice() * seats);
        cardService.saveCard(card);
        UsersTour usersTour = new UsersTour(tour, user, seats, tour.getPrice(), new Date());
        user.getTours().add(usersTour);
        userService.saveUser(user);
        tour.setRemainingSeats(tour.getRemainingSeats() - seats);
        tourRepository.save(tour);
        return "Operation done successfully!";
    }

    public List<UsersTour> getUserTours(Integer userId) {
        return userService.getUserById(userId.toString()).getTours();
    }

    public String bookTour(String userId,String tourId, Integer seats) throws ParseException {
        Tour tour = tourRepository.findById(Integer.parseInt(tourId));
        User user = userService.getUserById(userId);

        if (seats > tour.getRemainingSeats()) {
            return "There are no such seats!";
        }

        Date now = new Date();

        int noOfDays = 7; //7 days
        Calendar calendar = Calendar.getInstance(Locale.US);
        calendar.setTime(now);
        calendar.add(Calendar.DAY_OF_YEAR, noOfDays);
        Date date = calendar.getTime();

        UsersTour usersTour = new UsersTour(tour, user, seats, tour.getPrice(), now);

        usersTour.setEndBookDate(date);

        user.getBookTours().add(usersTour);
        userService.saveUser(user);
        tour.setRemainingSeats(tour.getRemainingSeats() - seats);
        tourRepository.save(tour);
        return "Operation done successfully!";
    }

    @Scheduled(initialDelay = 1000, fixedRate = 60000)
    public void run() {
        //System.out.println("Current time is :: " + Calendar.getInstance().getTime());
        Date now = new Date();
        List<UsersTour> bookedTours = ((List<UsersTour>) usersTourRepository.findAll()).stream()
                .filter(el->(el.getEndBookDate()!=null)&&(el.getEndBookDate().compareTo(now) < 0))
                .collect(Collectors.toList());
        for (UsersTour usersTour: bookedTours) {
            Tour tour = tourRepository.findById((int)usersTour.getTour().getId());
            User user = userService.getUserById(usersTour.getUser().getId().toString());

            mailService.sendActiveMail(new Mail(user.getEmail(), "Booking time expired",
                    "Link to tour: https://spring-tours.herokuapp.com/tour/" + tour.getId()));

            //System.out.println("delete usersTour:\t" + usersTour.getId());
            tour.setRemainingSeats(tour.getRemainingSeats() + usersTour.getSeats());
            tourRepository.save(tour);
            usersTourRepository.delete(usersTour);
        }

    }

    public List<UsersTour> getUserBookTours(Integer userId) {
        return userService.getUserById(userId.toString()).getBookTours();
    }

    private String checkCardExpired(Card card, float price, int seats) {
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int month = Calendar.getInstance().get(Calendar.MONTH);
        if ((Integer.parseInt(card.getYear()) < year % 100) || ((Integer.parseInt(card.getYear()) == year % 100) &&
                (Integer.parseInt(card.getMonth()) < month))) {
            return "Card expired!";
        }
        if (card.getMoney() < price * seats) {
            return "Not enough money!";
        }
        return "ok";
    }

    public String payTour(String userId, String cardId, String usersTourId) {
        User user = userService.getUserById(userId);
        Card card = cardService.getCardById(cardId);
        UsersTour usersTour = usersTourService.getById(usersTourId);

        String result = checkCardExpired(card, usersTour.getPrice(), usersTour.getSeats());
        if (!result.equals("ok")) {
            return result;
        }

        card.setMoney(card.getMoney() - usersTour.getPrice() * usersTour.getSeats());
        cardService.saveCard(card);

        UsersTour usersTourRes = new UsersTour(usersTour.getTour(), user, usersTour.getSeats(), usersTour.getPrice(),
                new Date());
        user.getTours().add(usersTourRes);
        userService.saveUser(user);

        usersTourRepository.delete(usersTour);

        return "Operation done successfully!";
    }

    public void revokeBooking(String userId, String usersTourId) {
        User user = userService.getUserById(userId);
        UsersTour usersTour = usersTourService.getById(usersTourId);
        user.getBookTours().remove(usersTour);
        userService.saveUser(user);
    }

    public List<UsersTour> getBookedTours() {
        return usersTourRepository.findAllByOrderByDateAsc().stream()
                .filter(el->el.getEndBookDate()!=null)
                .collect(Collectors.toList());
    }

    //--------------------------------------------------------

    public SearchParams getSearchParams() {
        List<Tour> tours = (List<Tour>) tourRepository.findAll();
        float minPrice = (float)1000000000, maxPrice = (float)0;
        int minSeats = 10000000, maxSeats = 0;

        for (Tour tour: tours) {
            minPrice = Math.min(minPrice, tour.getPrice());
            maxPrice = Math.max(maxPrice, tour.getPrice());
            minSeats = Math.min(minSeats, tour.getRemainingSeats());
            maxSeats = Math.max(maxSeats, tour.getRemainingSeats());
        }

        return new SearchParams(Arrays.stream(Transport.values()).collect(Collectors.toList()),
                Arrays.stream(TourType.values()).collect(Collectors.toList()),
                Arrays.stream(FoodType.values()).collect(Collectors.toList()),
                minPrice, maxPrice, minSeats, maxSeats);
    }

    private List<Transport> getTransportList(String[] transport) {
        List<Transport> transports = new ArrayList<>();
        for (String i: transport) {
            if (!i.equals("-1")) {
                transports.add(Transport.values()[Integer.parseInt(i)]);
            }
        }
        if (transports.size() == 0) {
            transports.addAll(Arrays.stream(Transport.values()).collect(Collectors.toList()));
        }
        return transports;
    }

    private List<TourType> getTypeList(String[] type) {
        List<TourType> types = new ArrayList<>();
        for (String i: type) {
            if (!i.equals("-1")) {
                types.add(TourType.values()[Integer.parseInt(i)]);
            }
        }
        if (types.size() == 0) {
            types.addAll(Arrays.stream(TourType.values()).collect(Collectors.toList()));
        }
        return types;
    }

    private List<FoodType> getFoodList(String[] food) {
        List<FoodType> foods = new ArrayList<>();
        for (String i: food) {
            if (!i.equals("-1")) {
                foods.add(FoodType.values()[Integer.parseInt(i)]);
            }
        }
        if (foods.size() == 0) {
            foods.addAll(Arrays.stream(FoodType.values()).collect(Collectors.toList()));
        }
        return foods;
    }


    private boolean compareStringDates(String date, String date2) throws ParseException {
        return stringToDate(date).compareTo(stringToDate(date2)) > 0;
    }

    private float getResPrice(float param, String value) {
        if (value.equals("")) {
            return param;
        }
        return Float.parseFloat(value);
    }

    private int getResSeats(int param, String value) {
        if (value.equals("")) {
            return param;
        }
        return Integer.parseInt(value);
    }

    private String getResDate(String date, String option) throws ParseException {
        if (date.equals("")) {
            switch (option) {
                case "min":
                    return "01.01.2000 00:00";
                case "max":
                    return "01.01.3000 00:00";
            }
        }
        return changeDateFormat(date);
    }

    public List<Tour> search(String[] transport, String[] type, String[] food, String minPrice, String maxPrice,
                             String minSeats, String maxSeats, String minDate, String maxDate) throws ParseException {
        List<Transport> transports = getTransportList(transport);
        List<TourType> types = getTypeList(type);
        List<FoodType> foods = getFoodList(food);

        SearchParams params = getSearchParams();
        searchValues = new SearchValues(transport, type, food, minPrice, maxPrice, minSeats, maxSeats, minDate, maxDate);

        float resMinPrice = getResPrice(params.getMinPrice(), minPrice);
        float resMaxPrice = getResPrice(params.getMaxPrice(), maxPrice);
        int resMinSeats = getResSeats(params.getMinSeats(), minSeats);
        int resMaxSeats = getResSeats(params.getMaxSeats(), maxSeats);
        String resMinDate = getResDate(minDate, "min");
        String resMaxDate = getResDate(maxDate, "max");

        return getTours().stream()
                .filter(el -> {
                    try {
                        return (transports.contains(el.getTransport())) && (types.contains(el.getType())) &&
                                (foods.contains(el.getFoodType())) && (el.getPrice() >= resMinPrice) &&
                                (el.getPrice() <= resMaxPrice) &&
                                (el.getRemainingSeats() >= resMinSeats) &&
                                (el.getRemainingSeats() <= resMaxSeats) &&
                                    (compareStringDates(el.getStartTime(), resMinDate)) &&
                                            (compareStringDates(resMaxDate, el.getEndDate()));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }
                    return false;
                })
                .collect(Collectors.toList());

    }

    public SearchValues getSearchValues() {
        return searchValues;
    }

    public void setSearchValues() {
        searchValues = null;
    }


    public List<Tour> sortLowPrice(List<Tour> tours) {
        tours.sort(Comparator.comparing(Tour::getPrice));
        int a = 5;
        return tours;
    }

}