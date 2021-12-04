<#import '../index.ftlh' as i>
<#import 'profileAdminActions.ftlh' as admin>
<#import 'loadProfileImg.ftlh' as img>
<#import 'editActions.ftlh' as edit>
<#import 'modalDelAvatar.ftlh' as del>

<@i.page>

    <style>

        .cover {
            background-size: cover;
            background: var(--darkest-color) no-repeat;
        }

    </style>

    <style>

        body {
            background-color: #F1F2F3;
        }

        .profile-card-4 {
            max-width: 60%;
            background-color: #FFF;
            border-radius: 5px;
            box-shadow: 0 0 25px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            position: relative;
            margin: 10px auto;
            cursor: pointer;
        }

        .profile-card-4 img {
            transition: all 0.25s linear;
            max-height: 400px;
        }

        .profile-card-4 .profile-content {
            position: relative;
            padding: 15px;
            background-color: #FFF;
        }

        .profile-card-4 .profile-name {
            font-weight: bold;
            position: absolute;
            left: 0;
            right: 0;
            top: -70px;
            color: #FFF;
            font-size: 25px;
        }

        .profile-card-4 .profile-name p {
            font-weight: 600;
            font-size: 13px;
            letter-spacing: 1.5px;
        }

        .profile-card-4 .profile-description {
            color: #777;
            font-size: 12px;
            padding: 10px;
        }

        .profile-card-4 .profile-overview {
            padding: 15px 0;
        }

        .profile-card-4 .profile-overview p {
            font-size: 10px;
            font-weight: 600;
            color: #777;
        }

        .profile-card-4 .profile-overview h4 {
            color: #273751;
            font-weight: bold;
        }

        .profile-card-4 .profile-content::before {
            content: "";
            position: absolute;
            height: 20px;
            top: -10px;
            left: 0;
            right: 0;
            background-color: #FFF;
            z-index: 0;
            transform: skewY(3deg);
        }

        .profile-card-4:hover img {
            transform: rotate(5deg) scale(1.1, 1.1);
            filter: brightness(110%);
        }

        @media only screen and (max-width: 767px) {
            .marrr {
                margin: 0;
            }
        }

    </style>

    <div class="profile-card-4 text-center marrr">
        <#if profile.getImage()??>
            <img src="${profile.getImage()}"
                 class="img img-responsive" alt="avatar">
            <#else>
                <img src="https://res.cloudinary.com/dwfvcpiak/image/upload/v1637518434/%D0%B8%D0%B7%D0%BE%D0%B1%D1%80%D0%B0%D0%B6%D0%B5%D0%BD%D0%B8%D0%B5_2021-11-21_211351_dsj4fa.png"
                     class="img img-responsive" alt="avatar">
        </#if>

        <div class="profile-content">
            <div class="profile-name" style="text-shadow: 2px 2px 5px black">
                ${profile.getLastName()} ${profile.getFirstName()} ${profile.getMiddleName()}
                <p>${profile.getUsername()}</p>
            </div>
            <div class="profile-description m-2">
                <#if user?? && profile.getEmail() == user.getEmail()>
                    <@edit.editActions user profile></@edit.editActions>
                </#if>
                <#if user?? && profile.getEmail() == user.getEmail()>
                    <@admin.profileAdminActions user profile></@admin.profileAdminActions>
                    <h6>${profile.getPhone()}</h6>
                </#if>
                <h6>${profile.getEmail()}</h6>
            </div>
        </div>
        <div>
            <!--<div class="row text-center">
            </div>
            <div class="row text-center">
                <#if user?? && profile.getEmail() == user.getEmail()>
                    <@edit.editActions user profile></@edit.editActions>
                </#if>
            </div><br>-->
            <div class="row mb-5">
                <#if user?? && profile.getEmail() == user.getEmail()>
                    <div class="btn-group" style="left: 0; display: inline-block;" role="group" aria-label="...">
                        <a class="glo-small" href="/cards" style="display: inline-block;">Cards</a>
                        <a class="glo-small" href="/my-tours" style="display: inline-block;">My tours</a>
                        <a class="glo-small" href="/my-book-tours" style="display: inline-block;">My book tours</a>
                        <#if user?? && profile.getEmail() == user.getEmail()>
                            <#if profile.getImage()??>
                                <@del.modalRevoke user></@del.modalRevoke>
                            </#if>
                            <@img.loadImage user></@img.loadImage><br>
                        </#if>
                    </div>
                </#if>
            </div>
        </div>
    </div>

</@i.page>