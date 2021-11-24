<#macro page>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
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
            background: var(--second-light-color);
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
            color: black;
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
                    </#if>
                   <li class="nav-item">
                       <a class="nav-link active" href="/tours"><@spring.message "home"/></a>
                   </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/contacts"><@spring.message "contacts"/></a>
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
