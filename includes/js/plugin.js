/*________________________________________________________
SCRIPT FOR GLOBAL STICKY toolbar
________________________________________________________*/
$('#toolbar_trigger').live('click', function(){
    toggletoolbar();
});
//stickytoolbar.data('orgWidth', stickytoolbar.width())
// tnw = stickytoolbar.data('orgWidth');
function toggletoolbar() {
    var stickytoolbar = $('#stickytoolbar');
    var toolbarContent = $('#toolbarContainer', stickytoolbar)
    if($('#toolbar_trigger').hasClass('active')) {
        //- show toolbar 
        stickytoolbar.animate({
            'bottom': '-100'
        }, function(){
            $('#toolbar_trigger').removeClass('active');
            // stickytoolbar.width(tnw)
            stickytoolbar.css({
                width: 'auto',
                left: '0'
            });
            toolbarContent.show();
        }).animate({
            'bottom': 0
        })
    } else {
        stickytoolbar.animate({
            'bottom': '-100'
        }, function(){
            $('#toolbar_trigger').addClass('active');
            //stickytoolbar.width('auto')
            stickytoolbar.css({
                width: 'auto',
                left: 'auto'
            });
            toolbarContent.hide();
        }).animate({
            'bottom': '-6'
        })
    }
}

/*__________________________________________
Search Input
__________________________________________ */
$('.search input').live('click', function(){
    obj = $(this);
    $(this).prevAll('label').hide();
    obj.addClass('focused');
	obj.focus();
});

$('.search label').live('click', function(){
    $(this).nextAll('input.text').focus();
    $(this).hide(); //- hide label
});
$('.search .text').live('blur', function(){
    input = $(this);
    if(input.val() == '') {
       $(this).prevAll('label').show();//- show label
    }
    input.removeClass('focused');
});

/*________________________________________________________________
VZ TIP - INIT
________________________________________________________________*/
renderTips($('body'));
function renderTips(obj) {
    // Define our positioning and style arrays
    var opposites = ['top', 'topLeft', 'topRight', 'bottom', 'bottomLeft', 'bottomRight', 'right', 'rightTop', 'rightBottom', 'left', 'leftTop', 'leftBottom'];
    var at = ['bottom center', 'bottom left', 'bottom right', 'top center', 'top left', 'top right', 'left center', 'left top', 'left bottom', 'right center', 'right top', 'right bottom', 'center']
    my = ['top center', 'top left', 'top right', 'bottom center', 'bottom left', 'bottom right', 'right center', 'right top', 'right bottom', 'left center', 'left top', 'left bottom', 'center']
    styles = ['red', 'blue', 'dark', 'light', 'green', 'jtools', 'plain', 'youtube', 'cluetip', 'tipsy', 'tipped'];
    var i, target, content, title, clickable, ready, closebtn, hidewhen, solo, timer, closeafter;
    $('.vztip', obj).each(function(){
        for(i = 0; i <= opposites.length; i++) {
            //-- Check if tip matches with specific class
            if($(this).hasClass(opposites[i])) {
                //- Check it has rel attribute or not.
                if($(this).attr("rel") == undefined || $(this).attr("rel") == "") {
                    target = false
                } else {
                    target = $("#" + $(this).attr('rel')); //-- If specified any rel id, then it will load the content from id div
                }
                //-- Check it has ready function
                if($(this).attr("ready") == undefined || $(this).attr("ready") == "") {
                    ready = false;
                } else {
                    ready = $(this).attr('ready'); //-- Tooltip will show's when page is ready
                }
                //-- Show when you click on tooltip or on mouseover
                clickable = ($(this).hasClass('click')) ? 'click' : 'mouseover';
                hidewhen = "mouseleave"; //-- Event when popup needs to hidden
                solo = true; //-- All other tips will be hide and only this tip will display
                content = (target) ? target : $(this).nextAll('.tip_content:first');
                //-- Tooltip with Title
                title = (content.attr('title') == undefined) ? false : content.attr('title');
                text = (content.html() == '') ? false : content.html(); //- check content is not null
                text = (!text) ? $(this).attr('title') : text;
                text = (text == undefined) ? $(this).attr('oldtitle') : text;
                //text = (content.attr('title') == undefined && content.html() == '') ? title : $(this).attr("oldtitle"); //- check content is not null
                /*if(content.attr('title') == undefined && content.html() == ''){
					text = 
				}*/
                //-- Check it has close attribute
                if(content.attr("close") == undefined || content.attr("close") == "") {
                    closebtn = false;
                } else {
                    closebtn = content.attr("close"); //-- If specified any rel id, then it will load the content from id div
                    hidewhen = false;
                }
                if(content.attr("mouse") == undefined || content.attr("mouse") == "") {
                    mouse = false;
                    postarget = false;
                } else {
                    mouse = content.attr("mouse"); //-- If specified any rel id, then it will load the content from id div
                    //mouse = mouse
                    postarget = (mouse) ? "mouse" : false;
                }
                //-- Check it has close attribute
                if(content.attr("closeafter") == undefined || content.attr("closeafter") == "") {
                    timer = false;
                } else {
                    closeafter = content.attr("closeafter"); //-- If specified any rel id, then it will load the content from id div
                    timer = true;
                }
                ady = (content.attr("y")) ? content.attr("y") : 0;
                adx = (content.attr("x")) ? content.attr("x") : 0;
                ady = ($(this).attr("y")) ? $(this).attr("y") : ady;
                adx = ($(this).attr("x")) ? $(this).attr("x") : adx;
                h = 12;
                w = 6;
                tipoffset = (i == 0 || i == 3 || i == 6 || i == 9) ? 0 : 4;
                if(i > 5) {
                    width = w;
                    height = h;
                } else {
                    width = h;
                    height = w;
                }
                // width = ;
                //--------------- TIP RENDERS FROM HERE ---------------  //
                $(this).qtip({
                    content: {
                        text: text,
                        title: {
                            text: title,
                            button: closebtn
                        }
                    },
                    // prerender: true,
                    position: {
                        my: at[i],
                        // Use the corner...
                        at: my[i] // ...and opposite corner
                        ,
                        viewport: $(window) //-- Adjust with screen
                        ,
                        target: postarget,
                        adjust: {
                            mouse: mouse,
                            screen: true,
                            y: Number(ady),
                            x: Number(adx)
                        }
                    },
                    show: {
                        event: clickable,
                        // Don't specify a show event...
                        ready: ready,
                        // ... but show the tooltip when ready
                        solo: solo // ...and hide all other tooltips...
                        ,
                        effect: function (offset) {
                            $(this).css('display', 'block'); // "this" refers to the tooltip
                        }
                    },
                    hide: {
                        fixed: true,
                        event: hidewhen,
                        delay: 50,
                        effect: function (offset) {
                            $(this).slideDown(100); // "this" refers to the tooltip
                        } /*,delay: 10*/
                    } // Don't specify a hide event either!
                    ,
                    style: {
                        classes: 'ui-tooltip-dark ui-tooltip-shadow',
                        tip: {
                            width: width,
                            height: height,
                            offset: tipoffset,
                            border: 1
                        }
                    },
                    events: {
                        /* render: function (event, api) {
                            afterCreation(event, api)
                            //
                        }*/
                    }
                    //}
                }); //-- Tip Ends here
                function afterCreation(e, api) {
                    if(timer) {
                        setTimeout(api.hide, closeafter); // Hide after 1 second
                    }
                }
            } // if ends here
        } //- For Ends here
    });
}

$(".globalnav li").hover(function(){					 
    $('.search input').blur();
});



$('h1,.expander').bind('click', function(){
	$parent  = $(this).parent();
	if($parent.hasClass('opened')){
		$('.todo_box .content').hide();
		$(".expand_content").fadeIn(600);
		$parent.removeClass('opened');
	}else{
		$('.todo_box .content').fadeIn(600);
		$(".expand_content").hide();
		$parent.addClass('opened');
		
		
	}
});

/* Main tabs code */
function getTabId(obj) {
    prnt = obj.parents('.tabset_top');
    stringref = obj.attr("href").split('#')[1];
    $('.gt_content#' + stringref, prnt).fadeIn();
    $('.gt_content', prnt).hide();
    $('#' + stringref, prnt).show();
    $('.gt_labels li a', prnt).removeClass("active_tab");
    obj.addClass("active_tab");
    
}

$(".tabset_top .gt_content").hide();
gtActiveTab = $(".tabset_top .gt_labels li a.active_tab");
for(gt = 0; gt < gtActiveTab.length; gt++) {
    getTabId($(gtActiveTab[gt]))
}
$(".tabset_top .gt_labels li a").bind('click', function(){
    getTabId($(this));
    return false;
	
});



function getTabIdNew(obj) {
    prnt1 = obj.parents('.tabset2');
    stringref = obj.attr("href").split('#')[1];
    $('.gt_content_new#' + stringref, prnt1).fadeIn();
    $('.gt_content_new', prnt1).hide();
    $('#' + stringref, prnt1).show();
    $('.gt_labels_new li a', prnt1).removeClass("active_tab");
    obj.addClass("active_tab");
    
}

$(".tabset2 .gt_content_new").hide();
gtActiveTab = $(".tabset2 .gt_labels_new li a.active_tab");
for(gt = 0; gt < gtActiveTab.length; gt++) {
    getTabIdNew($(gtActiveTab[gt]))
}
$(".tabset2 .gt_labels_new li a").bind('click', function(){
    getTabIdNew($(this));
    return false;
	
});




/* Equal coloumns*/
 /*var biggestHeight = 0;  
	$('.eq_hgt').each(function(){    
		if($(this).height() > biggestHeight){  
			biggestHeight = $(this).height();  
		}  
	});  
	$('.eq_hgt').height(biggestHeight); */


var otxt;
$('.showmore').bind('click', function(){						  
	var	morelinks = $(this).prevAll('.morecontent');
	if(morelinks.hasClass('showed')){
		morelinks.slideUp('fast').removeClass('showed');
		otxt = $(this).text();
		$(this).text($(this).attr('toggleText')).removeClass('less');
		$(this).attr('toggleText',otxt);

	}else{

		morelinks.slideDown('fast').addClass('showed');
		otxt = $(this).text();
		$(this).text($(this).attr('toggleText')).addClass('less');
		$(this).attr('toggleText',otxt)
	
	}
	
});

/*$('.drop_n').toggle(function() {
 $('.share_dd .share_items').fadeIn(200);
 $(this).addClass("opens");
}, function() {
 $('.share_dd .share_items').css('display','none');
  $(this).removeClass("opens");
});
*/

var tgl = true;
//--- ANIMATE / SLIDE THE BOX
$('.drop_n').live('click', function(){
    if(tgl) {
        isOpened = true;
        openayHelpBoxBox();
    } else {
        isOpened = false;
        closeayHelpBoxBox();
    }
});
$('.btnbox .button,.btnbox .cancel').live('click', function(){
    closeayHelpBoxBox();
});
function closeayHelpBoxBox() {
    box = $('.share_dd .share_items');
    tgl = true;
    $('.drop_n').removeClass('opens')
    box.hide();
}
function openayHelpBoxBox() {
    box = $('.share_dd .share_items');
    tgl = false;
    $('.drop_n').addClass('opens')
    box.fadeIn(200);
}


$(".share_btn").hover(function(){
$(this).find(".share_items").fadeIn(200);
},function(){
$(this).find(".share_items").hide();	
});

//For Z-index  fix

$(".share_btn").hover(function(){
var obj = $(this).parent();	
	var parent = obj.parents('.slider-feature');
	parent.css("z-index", "20");
	
	$('.news_articles .slider-feature').each(function(){
		$(this).not(parent).css("z-index", "1");
	});
});



$(".gt_labels li.new_st").hover(function(){
	if($(".gt_labels li.new_st a").hasClass("active_tab")){
	$(this).find(".share_items").fadeIn(200);
	}else{
	$(this).find(".share_items").hide();	
	}
},function(){
$(this).find(".share_items").hide();	
});



/*__________________________________________________________________
CONTENT SLIDER INIT
__________________________________________________________________*/
$('.content-slider-container').each(function(){
	$slider = $(this);
	$slider.slides({
		preload: true,
	    //play: 3000,
		play: 6000,
		hoverPause: true,
	    //pause: 5000,
		pause: 5000,
		slideSpeed:3000,		
		generatePagination: false,
		slideChanged: function () {
		}
	});
});
