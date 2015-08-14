$(document).ready(function(){

  $('#edit_keyword_button').click(function(e){

    e.preventDefault();

    $.ajax({
      url: '/dashboard/home/edit_keyword',
      type: 'post',
      contentType: 'application/x-www-form-urlencoded',
      data: $('#edit_keyword_form').serialize(),
      success: function( data, textStatus, jQxhr ){
        // Apply the plugin to the body
        //$('body').pgNotification({
        //  style: 'bar',
        //  message: "Successfully updated keyword!",
        //  position: 'top',
        //  timeout: 4000,
        //  type: 'success'
        //}).show();
        //$('#editKeyword').modal('hide');
        //
        //$('#edit_keyword').hide();
        //$('#edit_keyword').parent().append('<div class="text-center pull-right" id="article_search_status"><div class="progress" style="margin-bottom: 10px;"><div class="progress-bar-indeterminate progress-bar-primary" ></div></div><p class="small hint-text">Getting Articles for new keyword</p></div>');
        //
        //$('#keyword_id').val(data["id"]);
        //
        //setTimeout(updateSearchStatus, 100000)

        location.reload();

      },
      error: function( jqXhr, textStatus, errorThrown ){
        alert("Oops! Something went wrong. We are looking into it.");
      }
    });


  });

  function updateSearchStatus(){
    // Todo: Poll the server for the status

    $.ajax({
      url: '/dashboard/home/search_status',
      type: 'post',
      contentType: 'application/x-www-form-urlencoded',
      data: { keyword_id: $('#keyword_id').val() },
      success: function( data, textStatus, jQxhr ){
        console.log (data);

        if(data["search_complete"] == true  ){
          $('#article_search_status').hide();
          // Todo: Show a success message about the search being complete

          $('body').pgNotification({
            style: 'bar',
            message: "Search completed. Refresh the page to see the new articles.",
            position: 'top',
            timeout: 4000,
            type: 'success'
          }).show();

          $('.panel-controls button').show();
        }
        else{
          setTimeout(updateSearchStatus, 100000);
        }

      },
      error: function( jqXhr, textStatus, errorThrown ){
        alert("Oops! Something went wrong. We are looking into it.");
      }
    });

    // Todo: Show the success message once the search is done

  }

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
        alert("Oops! Something went wrong. We are looking into it.");
      }
    });


  })

});