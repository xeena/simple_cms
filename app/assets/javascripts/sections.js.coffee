# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'page:load', ->
    if $('#textarea').length > 0
      KindEditor.create '#textarea',
                      "width":"100%",
                      "height":300,
                      "allowFileManager":true,
                      "uploadJson":"/kindeditor/upload",
                      "fileManagerJson":"/kindeditor/filemanager",
                      "items":["fontname","fontsize","|","forecolor","hilitecolor","bold","italic","underline","removeformat","|","justifyleft","justifycenter","justifyright","insertorderedlist","insertunorderedlist","|","emoticons","image","link"]
