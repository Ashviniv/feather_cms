CKEDITOR.editorConfig = function(config){
    config.filebrowserBrowseUrl = "/" + FEATHER_NAMESPACE + "/ckeditor/attachment_files";
    config.filebrowserFlashBrowseUrl = "/" + FEATHER_NAMESPACE + "/ckeditor/attachment_files";

    // The location of a script that handles file uploads in the Flash dialog.
    config.filebrowserFlashUploadUrl = "/" + FEATHER_NAMESPACE + "/ckeditor/attachment_files";

    // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Link tab of Image dialog.
    config.filebrowserImageBrowseLinkUrl = "/" + FEATHER_NAMESPACE + "/ckeditor/pictures";

    // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Image dialog.
    config.filebrowserImageBrowseUrl = "/" + FEATHER_NAMESPACE + "/ckeditor/pictures";

    // The location of a script that handles file uploads in the Image dialog.
    config.filebrowserImageUploadUrl = "/" + FEATHER_NAMESPACE + "/ckeditor/pictures";

    // The location of a script that handles file uploads.
    config.filebrowserUploadUrl = "/" + FEATHER_NAMESPACE + "/ckeditor/attachment_files";
}
