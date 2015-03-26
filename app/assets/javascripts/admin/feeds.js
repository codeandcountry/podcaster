podcaster.feeds = {
    index: function() {  },
    view: function() {  },
    edit: function() { 
      jQuery('#feed_category').change(function(){
        var category = jQuery('#feed_category').val();
        if(category != ""){
          updateSubcategories(category);
        }else{
          jQuery('#feed_subcategory').find('option').remove();
        }
      });

      jQuery(document).ready(function(){
        var category = jQuery('#feed_category').val();
        var subcategory = jQuery('#feed_subcategory').val();
        console.log('cat = '+category);
        if(category != ""){
          updateSubcategories(category, subcategory);          
        }
      })
    },
    new: function() {
      jQuery('#feed_subcategory').find('option').remove();

      jQuery('#feed_category').change(function(){
        var category = jQuery('#feed_category').val();
        if(category != ""){
          updateSubcategories(category);
         }else{
          jQuery('#feed_subcategory').find('option').remove();
        } 
      });
    }
};

function updateSubcategories(category, subcategory){
  subcategory = typeof subcategory !== 'undefined' ? subcategory : "None";
  jQuery.ajax({
    url: "/subcategories/"+category,
    success: function(data, status, xhr){
      var optionsAsString = "";
      for(var i = 0; i < data.length; i++) {
          optionsAsString += "<option value='" + data[i] + "'>" + data[i] + "</option>";
      }
      jQuery('#feed_subcategory').find('option').remove().end().append( optionsAsString ).find('option:contains('+subcategory+')').attr("selected",true);
    },
    error: function(data, status, xhr){
      // TODO - handle this
      console.log(data);
    }
  })
}

