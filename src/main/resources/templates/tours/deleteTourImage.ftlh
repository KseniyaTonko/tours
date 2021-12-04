<#macro deleteTourImg tour image>
    <!--
    <form action="/delete-tour-image" method="post" style="position: absolute;
                                                 z-index: 20; display: inline-block; right: 0;">
        <input type="hidden" name="tourId" value="{tour.getId()}">
        <input type="hidden" name="imageId" value="{image.getId()}">
        <input type="hidden" name="_csrf" value="{_csrf.token}"/>
        <button type="submit" class="btn btn-primary" style="color: black; background: none;
                text-shadow: 1px 1px 5px white; border: none;">
            <i class="fa fa-trash"></i>
        </button>
    </form>-->


    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modalDelImage"
            style="color: black; background: none; text-shadow: 1px 1px 5px white; border: none;
                  position: absolute; z-index: 20; display: inline-block; right: 0;">
        <i class="fa fa-trash"></i>
    </button>

    <!-- Modal -->
    <div class="modal fade" id="modalDelImage" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Delete image</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete image?
                </div>
                <div class="modal-footer text-center">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <form action="/delete-tour-image" method="post">
                        <input type="hidden" name="tourId" value="${tour.getId()}">
                        <input type="hidden" name="imageId" value="${image.getId()}">
                        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                        <button type="submit" class="btn btn-primary">
                            Delete
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</#macro>