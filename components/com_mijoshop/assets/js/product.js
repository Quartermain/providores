jQuery(document).ready(function() {
    jQuery('.success img, .warning img, .attention img, .information img').live('click', function() {
        jQuery(this).parent().fadeOut('slow', function() {
            jQuery(this).remove();
        });
    });
});

function addProductToCart(product_id, product_options) {
    var post_data = 'product_id=' + product_id + '&quantity=1';

    if (product_options) {
        var options_array = product_options.toString().split('|');

        for (var i in options_array) {
            var option_array = options_array[i].toString().split(':');

            post_data = post_data + '&' + option_array[0] + '=' + option_array[1];
        }
    }

    jQuery.ajax({
        url: 'index.php?option=com_mijoshop&format=raw&tmpl=component&route=checkout/cart/add',
        type: 'post',
        data: post_data,
        dataType: 'json',
        success: function(json) {
            jQuery('.success, .warning, .attention, .information, .error').remove();

            if (json['redirect']) {
                location = json['redirect'];
            }

            if (json['success']) {
                jQuery('#p_notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="components/com_mijoshop/opencart/catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

                jQuery('.success').fadeIn('slow');

                jQuery('#cart-total').html(json['total']);

                updateMijocartModule();

                jQuery('html, body').animate({ scrollTop: 0 }, 'slow');
            }
        }
    });
}