/*
<img id="img" 
  fieldname="user_pictureref" <== MANDATORY: input hidden with file name to use 
  class="ajaxUpload" <== MANDATORY 
  width="100" 
  height="100" 
  src="/data/<%=@user.pictureref %>" />

*/
// wait for the DOM to be loaded 
$(document).ready(function() { 

  $(".ajaxUpload").each(function (index, element) {

    var id = element.genId ? element.genId: (new Date()).getTime();
    element.genId = id ;

        // ajaxForm_####
        // file_####
        // hiddenbutton_####
        var form = $("<form enctype='multipart/form-data' accept-charset='UTF-8' action='' fieldname='"+element.attributes.fieldname.value+"' id='ajaxForm_"+id+"' genId='"+id+"' method='post'><input accept=\"image/*\" type='file' name='upload[datafile]' id='file_"+id+"'/><input type='submit' id='hiddenbutton_"+id+"'/></form>");

        $("body").append(form);
        form.genId = element.genId ;

        $('#file_'+form.genId).change(function  (eventObject) {
          $("#hiddenbutton_"+eventObject.srcElement.form.attributes['genid'].value)[0].click();
        })

        $(element).click(function () {
          $('#file_'+this.genId)[0].click();
        });

        // element data={imgId}
        var options={
          beforeSubmit:function (formData, jqForm, options) {
            console.log("")
            options.url = "/picture_file/"+$("#"+jqForm[0].attributes.fieldname.value)[0].value  +"/upload_file"
            return true;
          },
          success:function (formData, jqForm, options) {
            alert("El Archivo fue Cargado con exito");
            $('#'+this.imgId)[0].src = "/data/"+$("#"+this.fieldname)[0].value
          },
          imgId:null,
          fieldname:null
        }
        options.imgId = element.id?element.id:"img_"+id;
        options.fieldname = element.attributes.fieldname.value;

        $("#ajaxForm_"+id).ajaxForm(options);

      });
});
