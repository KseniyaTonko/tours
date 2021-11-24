<#macro loadImage profile>

    <link rel="stylesheet" type="text/css" href="/static/css/dropzone.css"/>
    <script src="/static/js/dropzone.js"></script>
    <!--<link rel="stylesheet" type="text/css" href="/static/css/dropzone.min.css"/>
    <script src="/static/js/dropzone.min.js"></script>-->

    <button class="btn btn-primary" type="button" data-toggle="collapse"
            data-target="#collapseLoadImage" style="border: 0; color: black">
        <@spring.message "load.image" />
    </button>
    <div class="collapse" id="collapseLoadImage">
        <form action="/file-upload-user" method="post" class="dropzone" id="myAwesomeDropzone" enctype="multipart/form-data">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <div class="fallback">
                <input name="file" type="file"/>
            </div>

            <div class="dz-message">
                <button type="button" class="dz-button" style="color: #666666"><@spring.message "drop.image"/></button>
                <br/>
            </div>

            <input type="hidden" name="userId" value="${profile.getId()}">
        </form>
    </div>

    <script>

        Dropzone.options.myAwesomeDropzone = {
            paramName: "file", // The name that will be used to transfer the file
            maxFilesize: 10, // MB
            maxFiles: 1,
            width: "200px",
            accept: function(file, done) {
                done();
            },
            success: function (file, response) {
                window.location.replace("http://localhost:8080/profile/"+response);
            }
        };

    </script>

</#macro>
