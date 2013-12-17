if (naviox == null) var naviox = {};

naviox.init = function() {
		
	jQuery( "#search_module_text" ).typeWatch({
		callback: naviox.filterModules,
	    wait:500,
	    highlight:true,
	    captureLength:0
	});
	
	$( "#search_module_text" ).keyup(function() {
		if ($(this).val() == "") naviox.filterModules();
	});
	
	$( "#show_modules" ).click(function() {			
		if ($("#modules_list" ).css("display") == "none") {
			naviox.showModules();
		}
		else {
			naviox.hideModules();
		}
		return false;
	});
}

naviox.hideModules = function() { 
	$("#modules_list").fadeOut();			
	$("#show_modules").removeClass("show-modules-selected");
}

naviox.showModules = function() {  
	$("#modules_list").fadeIn();			
	$("#modules_list").show(); // For IE8
	$("#show_modules").addClass("show-modules-selected");	
}

naviox.filterModules = function() {	
	var filter = $("#search_module_text").val().toLowerCase();	
	$('.module-row').each(function() {		
		if ($(this).text() == "" || $(this).text().toLowerCase().indexOf(filter) >= 0)	$(this).show();		
		else $(this).hide();
	});
}

naviox.goFolder = function(folderOid) {
	AjaxModules.goFolder(folderOid, naviox.refreshModuleList);
}

naviox.goBack = function(folderOid) {
	AjaxModules.goBack(naviox.refreshModuleListBack);
}

naviox.refreshModuleList = function(moduleList) {
	if (moduleList == null) {
		alert("Error going to folder"); 
		return;
	}
	$('#modules_list_content').append("<td></td>"); 
	$('#modules_list_content').children().last().html(moduleList);	
	var box = $('#modules_list_box');
    box.animate({
    		left: -box.outerWidth() / 2
    	},    	
    	function() {
    		$('#modules_list_content').children().first().remove();
    		box.css("left", "0");
    	}
    );
}

naviox.refreshModuleListBack = function(moduleList) {
	if (moduleList == null) {
		alert("Error going folder"); 
		return;
	}
	$('#modules_list_content').prepend("<td></td>"); 
	var box = $('#modules_list_box');
	box.css("left", "-" + box.outerWidth() + "px");
	$('#modules_list_content').children().first().html(moduleList);
    box.animate({
    		left: 0 
    	},    	
    	function() {
    		$('#modules_list_content').children().last().remove();
    	}
    );
}
