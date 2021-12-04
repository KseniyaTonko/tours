<#macro page>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=0.6">
        <title>Tours</title>

        <script src="//cdnjs.cloudflare.com/ajax/libs/list.js/2.3.1/list.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Macondo" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <style>
        :root {
            --lightest-color: #f9f5e3;
            --second-light-color: #ccf5ac;
            --middle-color: #ef798a;
            --second-dark-color: #d14081;
            --darkest-color: #7e2e84;
            --background-gray-color: #F1F2F3;
        }

        .table [data-sort] {
            cursor: pointer;
        }
        .table [data-sort]::after {
            margin-left: .25rem;
            content: url('data:image/svg+xml;utf8,<svg width=\'6\' height=\'10\' viewBox=\'0 0 6 10\' fill=\'none\' xmlns=\'http://www.w3.org/2000/svg\'><path fill-rule=\'evenodd\' clip-rule=\'evenodd\' d=\'M3 0L6 4H0L3 0ZM3 10L0 6H6L3 10Z\' fill=\'%238898aa\'/></svg>');
        }

        body {
            font-family: 'Macondo', -apple-system, system-ui, BlinkMacSystemFont, "Segoe UI", "Macondo", "Helvetica Neue",
            Arial, sans-serif;
            background-color: var(--background-gray-color);
        }
        nav {
            background:var(--darkest-color);
        }
        .btn {
            background: var(--second-dark-color);
        }
        .btn:hover {
            background: var(--second-light-color);
        }
        .btn:focus {
            background: var(--middle-color);
        }

        .form-container {
            background: linear-gradient(240deg, var(--darkest-color), var(--second-dark-color), var(--middle-color));
            display: inline-block;
        }

        .form-big {
            background: linear-gradient(240deg, var(--darkest-color), var(--second-dark-color), var(--middle-color));
            width: 400px;
        }
        .form-input {
            background: var(--lightest-color);
            border-radius: 20px 20px;
        }
        .form-btn {
            background: var(--middle-color);
            color: black;
        }
        .form-a {
            color: var(--darkest-color);
        }
        .form-a:hover {
            color: var(--second-dark-color);
        }
        .form-btn:hover {
            background: var(--lightest-color);
            color: var(--darkest-color);
        }
        .btn-options {
            border: none;
            background: none;
        }
        .tag {
            color: var(--middle-color);
            text-decoration: none;
        }
        .tag:hover {
            color: black;
        }

        .carousel-indicators li {
            border-radius: 12px;
            width: 12px;
            height: 12px;
            background-color: #404040;
        }
        .carousel-indicators li {
            border-radius: 12px;
            width: 12px;
            height: 12px;
            background-color: #404040;
        }
        .carousel-indicators .active {
            background-color: white;
            max-width: 12px;
            margin: 0 3px;
            height: 12px;
        }
        .carousel-control-prev-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' viewBox='0 0 8 8'%3E%3Cpath d='M5.25 0l-4 4 4 4 1.5-1.5-2.5-2.5 2.5-2.5-1.5-1.5z'/%3E%3C/svg%3E") !important;
        }

        .carousel-control-next-icon {
            background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='%23fff' viewBox='0 0 8 8'%3E%3Cpath d='M2.75 0l-1.5 1.5 2.5 2.5-2.5 2.5 1.5 1.5 4-4-4-4z'/%3E%3C/svg%3E") !important;

            flex-direction: column;
        }

        a.glo{
            color: var(--darkest-color);
            padding: 15px 20px;
            text-transform: uppercase;
            width: 200px;
            text-decoration:none;
            text-align:center;
            margin:30px 0;
            display: block;
            background-image: linear-gradient(to left,transparent,transparent 50%,var(--darkest-color) 50%,var(--darkest-color));
            background-position: 100% 0;
            background-size: 200% 100%;
            transition: all .25s ease-in;
            font: 400 18px tahoma;
            border: 1px solid var(--darkest-color);
        }
        a.glo:hover {
            background-position: 0 0;
            color:#fff;
        }

        .glo-small{
            color: var(--darkest-color);
            padding: 5px 5px;
            width: auto;
            text-decoration:none;
            text-align:center;
            display: block;
            background: white;
            background-image: linear-gradient(to left,transparent,transparent 50%,var(--darkest-color) 50%, var(--darkest-color));
            background-position: 100% 0;
            background-size: 200% 100%;
            transition: all .25s ease-in;
            border: 1px solid var(--darkest-color);
        }
        .glo-small:hover {
            background-position: 0 0;
            color:#fff;
        }

    </style>
    <body>

    <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="/"><@spring.message "home"/></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
               <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <#if user?? && user.getIsAdmin()>
                        <li class="nav-item">
                            <a class="nav-link active" href="/admin"><@spring.message "users"/></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/bought">Bought</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="/booked">Booked</a>
                        </li>
                    </#if>
                    <li class="nav-item">
                        <a class="nav-link active" href="/contacts"><@spring.message "contacts"/></a>
                    </li>
                   <li class="nav-item">
                       <a class="nav-link active" href="/about">FAQ</a>
                   </li>
                   <li class="nav-item">
                       <a class="nav-link active" href="/test/1">Test</a>
                   </li>
                </ul>
                <#if user??>
                    <ul class="navbar-nav mb-2 mb-lg-0 justify-content-end">
                        <li>
                            <a class="nav-link active" href="/profile/${user.getId()}">${user.getUsername()}</a>
                        </li>
                    </ul>
                    <ul class="navbar-nav mb-2 mb-lg-0 justify-content-end">
                        <li class="nav-item">
                            <a class="nav-link active" href="/logout" tabindex="-1" aria-disabled="true">
                                <@spring.message "logout"/>
                            </a>
                        </li>
                    </ul>
                <#else>
                    <ul class="navbar-nav mb-2 mb-lg-0 justify-content-end">
                        <li class="nav-item">
                            <a class="nav-link active" href="/login" tabindex="-1" aria-disabled="true">
                                <@spring.message "login"/>
                            </a>
                        </li>
                    </ul>
                </#if>

            </div>
        </div>
    </nav>
        <#nested>
    </body>
    </html>
</#macro>
