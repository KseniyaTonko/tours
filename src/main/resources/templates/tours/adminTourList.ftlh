<#import '../index.ftlh' as i>

<@i.page>
    <style>
        td a {
            color: black;
        }
        td a:hover {
            color: var(--darkest-color);
        }
    </style>

    <h1 class="text-center m-5">List of ${title} tours</h1>

    <#if tours?size != 0>
        <div id="item-list">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th scope="col"><@spring.message "id"/></th>
                    <th scope="col" class="sort" data-sort="name"><@spring.message "name"/></th>
                    <th scope="col" class="sort" data-sort="username">User</th>
                    <th scope="col">Money</th>
                    <th scope="col" class="sort" data-sort="date">Date</th>
                </tr>
                </thead>
                <tbody class="list">
                <#list tours as tour>
                    <tr>
                        <td>${tour.getId()}</td>
                        <td><a class="name" href="/tour/${tour.getTour().getId()}">${tour.getTour().getName()}</a></td>
                        <td><a class="username" href="/profile/${tour.getUser().getId()}">${tour.getUser().getUsername()}</a></td>
                        <td style="color: var(--darkest-color);">${tour.getPrice() * tour.getSeats()}</td>
                        <td>${tour.getDate()?string.short}</td>
                    </tr>
                </#list>
                </tbody>
            </table>
        </div>
    <#else>
        <div class="alert alert-info justify-content-center text-center" role="alert">
            No such tours
        </div>
    </#if>


    <script>
        var options = {
            valueNames: [ 'name', 'username']
        };

        var itemList = new List('item-list', options);
    </script>

</@i.page>