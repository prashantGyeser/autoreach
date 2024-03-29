// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Note: Form Wizard Jquery code
$(document).ready(function() {
    $('#myFormWizard').bootstrapWizard({
        onTabShow: function(tab, navigation, index) {
            var $total = navigation.find('li').length;
            var $current = index + 1;

            // If it's the last tab then hide the last button and show the finish instead
            if ($current >= $total) {
                $('#myFormWizard').find('.pager .next').hide();
                $('#myFormWizard').find('.pager .finish').show();
                $('#myFormWizard').find('.pager .finish').removeClass('disabled');
            } else {
                $('#myFormWizard').find('.pager .next').show();
                $('#myFormWizard').find('.pager .finish').hide();
            }

            var li = navigation.find('li.active');

            var btnNext = $('#myFormWizard').find('.pager .next').find('button');
            var btnPrev = $('#myFormWizard').find('.pager .previous').find('button');

            // remove fontAwesome icon classes
            function removeIcons(btn) {
                btn.removeClass(function(index, css) {
                    return (css.match(/(^|\s)fa-\S+/g) || []).join(' ');
                });
            }

            if ($current > 1 && $current < $total) {

                var nextIcon = li.next().find('.fa');
                var nextIconClass = nextIcon.attr('class').match(/fa-[\w-]*/).join();

                removeIcons(btnNext);
                btnNext.addClass(nextIconClass + ' btn-animated from-left fa');

                var prevIcon = li.prev().find('.fa');
                var prevIconClass = prevIcon.attr('class').match(/fa-[\w-]*/).join();

                removeIcons(btnPrev);
                btnPrev.addClass(prevIconClass + ' btn-animated from-left fa');
            } else if ($current == 1) {
                // remove classes needed for button animations from previous button
                btnPrev.removeClass('btn-animated from-left fa');
                removeIcons(btnPrev);
            } else {
                // remove classes needed for button animations from next button
                btnNext.removeClass('btn-animated from-left fa');
                removeIcons(btnNext);
            }
        }
    });
});