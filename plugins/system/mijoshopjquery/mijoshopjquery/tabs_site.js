jQuery.fn.tabs = function() {
	var selector = this;
	
	this.each(function() {
		var obj = jQuery(this); 
		
		jQuery(obj.attr('href')).hide();
		
		jQuery(obj).click(function() {
			jQuery(selector).removeClass('selected');
			
			jQuery(selector).each(function(i, element) {
				jQuery(jQuery(element).attr('href')).hide();
			});
			
			jQuery(this).addClass('selected');
			
			jQuery(jQuery(this).attr('href')).fadeIn();
			
			return false;
		});
	});

	jQuery(this).show();
	
	jQuery(this).first().click();
};