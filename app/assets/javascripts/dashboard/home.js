$(document).ready(function(){

  $('#edit_keyword_button').click(function(e){

    e.preventDefault();

    $.ajax({
      url: '/dashboard/home/edit_keyword',
      dataType: 'text',
      type: 'post',
      contentType: 'application/x-www-form-urlencoded',
      data: $('#edit_keyword_form').serialize(),
      success: function( data, textStatus, jQxhr ){
        // Apply the plugin to the body
        $('body').pgNotification({
          style: 'bar',
          message: "Successfully updated keyword!",
          position: 'top',
          timeout: 3000,
          type: 'success'
        }).show();
        $('#editKeyword').modal('hide');
      },
      error: function( jqXhr, textStatus, errorThrown ){
        alert("Damn!");
      }
    });

  })

});