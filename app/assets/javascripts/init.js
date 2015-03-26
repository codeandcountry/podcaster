// initialize your global object will all your model names
podcaster = {
    feeds:{},
    episodes:{},
    users:{}
}

jQuery(document).ready(function($) {
       // get the page action

    var action,model, b = $("body");
    if (b.hasClass("edit")) {
        action = "edit";
    } else if(b.hasClass("view")){
        action = "view";
    } else if(b.hasClass("index")){
        action = "index"
    } else if(b.hasClass("new")){
        action = "new"
    }

    // run the code specific to a model and an action
    for (var m in podcaster) {
        if (b.hasClass("admin_"+m)) {
            if (podcaster[m][action] && typeof podcaster[m][action] == "function") {
                podcaster[m][action]();
                break;
            }
        }
    }
});