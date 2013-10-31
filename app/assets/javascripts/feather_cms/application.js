// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require ckeditor/init

$(document).ready(function(){
    (function() {
        if (typeof window['CKEDITOR_BASEPATH'] === "undefined" || window['CKEDITOR_BASEPATH'] === null) {
            window['CKEDITOR_BASEPATH'] = "/assets/feather_cms/ckeditor/";
        }
    }).call(this);

    function ck_load() {
        $('.feather-editor').each(function(){
            CKEDITOR.replace( $(this).attr('name'), { customConfig : '/assets/feather_cms/ckeditor_config.js'});
        });
    }

    ck_load();
})

