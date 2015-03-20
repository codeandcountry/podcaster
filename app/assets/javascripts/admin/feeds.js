podcaster.feeds = {
    index: function() {  },
    view: function() {  },
    edit: function() { 
      jQuery('#feed_category').change(function(){
        var category = jQuery('#feed_category').val();
        jQuery.ajax({
          url: "/subcategories/"+category,
          success: function(data, status, xhr){
            var optionsAsString = "";
            for(var i = 0; i < data.length; i++) {
                optionsAsString += "<option value='" + data[i] + "'>" + data[i] + "</option>";
            }
            jQuery('#feed_subcategory').find('option').remove().end().append( optionsAsString );
          },
          error: function(data, status, xhr){
            // TODO - handle this
            console.log(data);
          }
        })
      });
    }
};

