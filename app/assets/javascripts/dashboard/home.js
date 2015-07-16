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
          timeout: 4000,
          type: 'success'
        }).show();
        $('#editKeyword').modal('hide');
      },
      error: function( jqXhr, textStatus, errorThrown ){
        alert("Damn!");
      }
    });

  });

  $('.delete_article').click(function(e){
    e.preventDefault();

    var article_id = $(this).data("id");
    var parent_row = $(this).parents("tr");

    $.ajax({
      url: '/dashboard/home/delete_article',
      dataType: 'text',
      type: 'post',
      contentType: 'application/x-www-form-urlencoded',
      data: {article_id: article_id},
      success: function( data, textStatus, jQxhr ){
        parent_row.fadeOut(300, function(){ parent_row.remove();});
        // Apply the plugin to the body
        $('body').pgNotification({
          style: 'bar',
          message: "Successfully deleted article!",
          position: 'top',
          timeout: 4000,
          type: 'success'
        }).show();
      },
      error: function( jqXhr, textStatus, errorThrown ){
        alert("Damn!");
      }
    });


  })

});