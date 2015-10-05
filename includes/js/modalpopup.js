/* ---------------------------------------------------------------------------------------------------------
VZ MODAL POPUP - COMPONENT CODE
--------------------------------------------------------------------------------------------------------- */


(function ($, document, window) {
    var defaults = {
        transition: "elastic",
        speed: 300,
        width: false,
        initialWidth: "600",
        innerWidth: false,
        maxWidth: false,
        height: false,
        initialHeight: "450",
        innerHeight: false,
        maxHeight: false,
        scalePhotos: true,
        scrolling: true,
        inline: false,
        html: false,
        iframe: false,
        fastIframe: true,
        photo: false,
        href: false,
        title: false,
        rel: false,
        opacity: 0.7,
        preloading: true,
        current: "image {current} of {total}",
        previous: "previous",
        next: "next",
        close: "<span>Close</span>",
        open: false,
        returnFocus: true,
        loop: true,
        slideshow: false,
        slideshowAuto: true,
        slideshowSpeed: 2500,
        slideshowStart: "start slideshow",
        slideshowStop: "stop slideshow",
        onOpen: false,
        onLoad: false,
        onComplete: false,
        onCleanup: false,
        onClosed: false,
        overlayClose: false,
        escKey: false,
        arrowKey: true,
        top: false,
        bottom: false,
        left: false,
        right: false,
        fixed: true,
        data: false
    },
        modalpopup = 'modalpopup',
        prefix = 'cbox',
        boxElement = prefix + 'Element',
        event_open = prefix + '_open',
        event_load = prefix + '_load',
        event_complete = prefix + '_complete',
        event_cleanup = prefix + '_cleanup',
        event_closed = prefix + '_closed',
        event_purge = prefix + '_purge',
        isIE = $.browser.msie && !$.support.opacity,
        isIE6 = isIE && $.browser.version < 7,
        event_ie6 = prefix + '_IE6',
        $overlay, $box, $wrap, $content, $topBorder, $leftBorder, $rightBorder, $bottomBorder, $related, $window, $loaded, $loadingBay, $loadingOverlay, $title, $current, $slideshow, $next, $prev, $close, $groupControls, settings, interfaceHeight, interfaceWidth, loadedHeight, loadedWidth, element, index, photo, open, active, closing, handler, loadingTimer, publicMethod;
    function $div(id, cssText, div) {
        div = document.createElement('div');
        if(id) {
            div.id = prefix + id
        }
        div.style.cssText = cssText || '';
        return $(div)
    }
    function setSize(size, dimension) {
        return Math.round((/%/.test(size) ? ((dimension === 'x' ? $window.width() : $window.height()) / 100) : 1) * parseInt(size, 10))
    }
    function isImage(url) {
        return settings.photo || /\.(gif|png|jpg|jpeg|bmp)(?:\?([^#]*))?(?:#(\.*))?$/i.test(url)
    }
    function makeSettings(i) {
        settings = $.extend({}, $.data(element, modalpopup));
        for(i in settings) {
            if($.isFunction(settings[i]) && i.substring(0, 2) !== 'on') {
                settings[i] = settings[i].call(element)
            }
        }
        settings.rel = settings.rel || element.rel || 'nofollow';
        settings.href = settings.href || $(element).attr('href');
        settings.title = settings.title || element.title;
        if(typeof settings.href === "string") {
            settings.href = $.trim(settings.href)
        }
    }
    function trigger(event, callback) {
        if(callback) {
            callback.call(element)
        }
        $.event.trigger(event)
    }
    function slideshow() {
        var timeOut, className = prefix + "Slideshow_",
            click = "click." + prefix,
            start, stop, clear;
        if(settings.slideshow && $related[1]) {
            start = function () {
                $slideshow.text(settings.slideshowStop).unbind(click).bind(event_complete, function () {
                    if(index < $related.length - 1 || settings.loop) {
                        timeOut = setTimeout(publicMethod.next, settings.slideshowSpeed)
                    }
                }).bind(event_load, function () {
                    clearTimeout(timeOut)
                }).one(click + ' ' + event_cleanup, stop);
                $box.removeClass(className + "off").addClass(className + "on");
                timeOut = setTimeout(publicMethod.next, settings.slideshowSpeed)
            };
            stop = function () {
                clearTimeout(timeOut);
                $slideshow.text(settings.slideshowStart).unbind([event_complete, event_load, event_cleanup, click].join(' ')).one(click, start);
                $box.removeClass(className + "on").addClass(className + "off")
            };
            if(settings.slideshowAuto) {
                start()
            } else {
                stop()
            }
        } else {
            $box.removeClass(className + "off " + className + "on")
        }
    }
    function launch(target) {
        if(!closing) {
            element = target;
            makeSettings();
            $related = $(element);
            index = 0;
            if(settings.rel !== 'nofollow') {
                $related = $('.' + boxElement).filter(function () {
                    var relRelated = $.data(this, modalpopup).rel || this.rel;
                    return(relRelated === settings.rel)
                });
                index = $related.index(element);
                if(index === -1) {
                    $related = $related.add(element);
                    index = $related.length - 1
                }
            }
            if(!open) {
                open = active = true;
                $box.show();
                if(settings.returnFocus) {
                    try {
                        element.blur();
                        $(element).one(event_closed, function () {
                            try {
                                this.focus()
                            } catch(e) {}
                        })
                    } catch(e) {}
                }
                $overlay.css({
                    "opacity": +settings.opacity,
                    "cursor": settings.overlayClose ? "pointer" : "auto"
                }).show();
                settings.w = setSize(settings.initialWidth, 'x');
                settings.h = setSize(settings.initialHeight, 'y');
                publicMethod.position();
                if(isIE6) {
                    $window.bind('resize.' + event_ie6 + ' scroll.' + event_ie6, function () {
                        $overlay.css({
                            width: $window.width(),
                            height: $window.height(),
                            top: $window.scrollTop(),
                            left: $window.scrollLeft()
                        })
                    }).trigger('resize.' + event_ie6)
                }
                trigger(event_open, settings.onOpen);
                $close.html(settings.close).show()
            }
            publicMethod.load(true)
        }
    }
    publicMethod = $.fn[modalpopup] = $[modalpopup] = function (options, callback) {
        var $this = this;
        options = options || {};
        if(!$this[0]) {
            if($this.selector) {
                return $this
            }
            $this = $('<a/>');
            options.open = true
        }
        if(callback) {
            options.onComplete = callback
        }
        $this.each(function () {
            $.data(this, modalpopup, $.extend({}, $.data(this, modalpopup) || defaults, options));
            $(this).addClass(boxElement)
        });
        if(($.isFunction(options.open) && options.open.call($this)) || options.open) {
            launch($this[0])
        }
        return $this
    };
    publicMethod.init = function () {
        $window = $(window);
        $box = $div().attr({
            id: modalpopup,
            'class': isIE ? prefix + (isIE6 ? 'IE6' : 'IE') : ''
        });
        $overlay = $div("Overlay", isIE6 ? 'position:absolute' : '').hide();
        $wrap = $div("Wrapper");
        $content = $div("Content").append($loaded = $div("LoadedContent", 'width:0; height:0; overflow:hidden'), $loadingOverlay = $div("LoadingOverlay").add($div("LoadingGraphic")), $title = $div("Title"), $current = $div("Current"), $slideshow = '', $close = $div("Close"));
        $wrap.append($div().append($div("TopLeft"), $topBorder = $div("TopCenter"), $div("TopRight")), $div(false, 'clear:left').append($leftBorder = $div("MiddleLeft"), $content, $rightBorder = $div("MiddleRight")), $div(false, 'clear:left').append($div("BottomLeft"), $bottomBorder = $div("BottomCenter"), $div("BottomRight"))).children().children().css({
            'float': 'left'
        });
        $loadingBay = $div(false, 'position:absolute; width:9999px; visibility:hidden; display:none');
        $('body').prepend($overlay, $box.append($wrap, $loadingBay));
        $content.children().hover(function () {
            $(this).addClass('hover')
        }, function () {
            $(this).removeClass('hover')
        }).addClass('hover');
        interfaceHeight = $topBorder.height() + $bottomBorder.height() + $content.outerHeight(true) - $content.height();
        interfaceWidth = $leftBorder.width() + $rightBorder.width() + $content.outerWidth(true) - $content.width();
        loadedHeight = $loaded.outerHeight(true);
        loadedWidth = $loaded.outerWidth(true);
        $box.css({
            "padding-bottom": interfaceHeight,
            "padding-right": interfaceWidth
        }).hide();
        $close.click(function () {
            publicMethod.close()
        });
        $content.children().removeClass('hover');
        $overlay.click(function () {
            if(settings.overlayClose) {
                publicMethod.close()
            }
        });
        $(document).bind('keydown.' + prefix, function (e) {
            var key = e.keyCode;
            if(open && settings.escKey && key === 27) {
                e.preventDefault();
                publicMethod.close()
            }
        })
    };
    publicMethod.remove = function () {
        $box.add($overlay).remove();
        $('.' + boxElement).removeData(modalpopup).removeClass(boxElement)
    };
    publicMethod.position = function (speed, loadedCallback) {
        var top = 0,
            left = 0;
        $window.unbind('resize.' + prefix);
        $box.hide();
        if(settings.fixed && !isIE6) {
            $box.css({
                position: 'fixed'
            })
        } else {
            top = $window.scrollTop();
            left = $window.scrollLeft();
            $box.css({
                position: 'absolute'
            })
        }
        if(settings.right !== false) {
            left += Math.max($window.width() - settings.w - loadedWidth - interfaceWidth - setSize(settings.right, 'x'), 0)
        } else if(settings.left !== false) {
            left += setSize(settings.left, 'x')
        } else {
            left += Math.round(Math.max($window.width() - settings.w - loadedWidth - interfaceWidth, 0) / 2)
        }
        if(settings.bottom !== false) {
            top += Math.max(document.documentElement.clientHeight - settings.h - loadedHeight - interfaceHeight - setSize(settings.bottom, 'y'), 0)
        } else if(settings.top !== false) {
            top += setSize(settings.top, 'y')
        } else {
            top += Math.round(Math.max(document.documentElement.clientHeight - settings.h - loadedHeight - interfaceHeight, 0) / 2)
        }
        $box.show();
        speed = ($box.width() === settings.w + loadedWidth && $box.height() === settings.h + loadedHeight) ? 0 : speed || 0;
        $wrap[0].style.width = $wrap[0].style.height = "9999px";
        function modalDimensions(that) {
            $topBorder[0].style.width = $bottomBorder[0].style.width = $content[0].style.width = that.style.width;
            $loadingOverlay[0].style.height = $loadingOverlay[1].style.height = $content[0].style.height = $leftBorder[0].style.height = $rightBorder[0].style.height = that.style.height
        }
        $box.dequeue().animate({
            width: settings.w + loadedWidth,
            height: settings.h + loadedHeight,
            top: top,
            left: left
        }, {
            duration: speed,
            complete: function () {
                modalDimensions(this);
                active = false;
                $wrap[0].style.width = (settings.w + loadedWidth + interfaceWidth) + "px";
                $wrap[0].style.height = (settings.h + loadedHeight + interfaceHeight) + "px";
                if(loadedCallback) {
                    loadedCallback()
                }
                setTimeout(function () {
                    $window.bind('resize.' + prefix, publicMethod.position)
                }, 1)
            },
            step: function () {
                modalDimensions(this)
            }
        })
    };
    publicMethod.resize = function (options) {
        if(open) {
            options = options || {};
            if(options.width) {
                settings.w = setSize(options.width, 'x') - loadedWidth - interfaceWidth
            }
            if(options.innerWidth) {
                settings.w = setSize(options.innerWidth, 'x')
            }
            $loaded.css({
                width: settings.w
            });
            if(options.height) {
                settings.h = setSize(options.height, 'y') - loadedHeight - interfaceHeight
            }
            if(options.innerHeight) {
                settings.h = setSize(options.innerHeight, 'y')
            }
            if(!options.innerHeight && !options.height) {
                var $child = $loaded.wrapInner("<div style='overflow:auto'></div>").children();
                settings.h = $child.height();
                $child.replaceWith($child.children())
            }
            $loaded.css({
                height: settings.h
            });
            publicMethod.position(settings.transition === "none" ? 0 : settings.speed)
        }
    };
    publicMethod.prep = function (object) {
        if(!open) {
            return
        }
        var callback, speed = settings.transition === "none" ? 0 : settings.speed;
        $loaded.remove();
        $loaded = $div('LoadedContent').append(object);
        function getWidth() {
            settings.w = settings.w || $loaded.width();
            settings.w = settings.mw && settings.mw < settings.w ? settings.mw : settings.w;
            return settings.w
        }
        function getHeight() {
            settings.h = settings.h || $loaded.height();
            settings.h = settings.mh && settings.mh < settings.h ? settings.mh : settings.h;
            return settings.h
        }
        $loaded.hide().appendTo($loadingBay.show()).css({
            width: getWidth(),
            overflow: settings.scrolling ? 'auto' : 'hidden'
        }).css({
            height: getHeight()
        }).prependTo($content);
        $loadingBay.hide();
        $(photo).css({
            'float': 'none'
        });
        if(isIE6) {
            $('select').not($box.find('select')).filter(function () {
                return this.style.visibility !== 'hidden'
            }).css({
                'visibility': 'hidden'
            }).one(event_cleanup, function () {
                this.style.visibility = 'inherit'
            })
        }
        callback = function () {
            var prev, prevSrc, next, nextSrc, total = $related.length,
                iframe, complete;
            if(!open) {
                return
            }
            function removeFilter() {
                if(isIE) {
                    $box[0].style.removeAttribute('filter')
                }
            }
            complete = function () {
                clearTimeout(loadingTimer);
                $loadingOverlay.hide();
                trigger(event_complete, settings.onComplete)
            };
            if(isIE) {
                if(photo) {
                    $loaded.fadeIn(100)
                }
            }
			
			var titlebox = $('.titlebox', $content).html()
            if(settings.title != '' &&titlebox==null) {
                $title.html(settings.title).add($loaded).show()
            } else {
                $title.html($('.titlebox', $content).html()).add($loaded).show()
			}
            if(settings.iframe) {
                iframe = $('<iframe/>').addClass(prefix + 'Iframe')[0];
                if(settings.fastIframe) {
                    complete()
                } else {
                    $(iframe).one('load', complete)
                }
                iframe.name = prefix + (+new Date());
                iframe.src = settings.href;
                if(!settings.scrolling) {
                    iframe.scrolling = "no"
                }
                if(isIE) {
                    iframe.frameBorder = 0;
                    iframe.allowTransparency = "true"
                }
                $(iframe).appendTo($loaded).one(event_purge, function () {
                    iframe.src = "//about:blank"
                })
            } else {
                complete()
            }
            if(settings.transition === 'fade') {
                $box.fadeTo(speed, 1, removeFilter)
            } else {
                removeFilter()
            }
        };
        if(settings.transition === 'fade') {
            $box.fadeTo(speed, 0, function () {
                publicMethod.position(0, callback)
            })
        } else {
            publicMethod.position(speed, callback)
        }
    };
    publicMethod.load = function (launched) {
        var href, setResize, prep = publicMethod.prep;
        active = true;
        photo = false;
        element = $related[index];
        if(!launched) {
            makeSettings()
        }
        trigger(event_purge);
        trigger(event_load, settings.onLoad);
        settings.h = settings.height ? setSize(settings.height, 'y') - loadedHeight - interfaceHeight : settings.innerHeight && setSize(settings.innerHeight, 'y');
        settings.w = settings.width ? setSize(settings.width, 'x') - loadedWidth - interfaceWidth : settings.innerWidth && setSize(settings.innerWidth, 'x');
        settings.mw = settings.w;
        settings.mh = settings.h;
        if(settings.maxWidth) {
            settings.mw = setSize(settings.maxWidth, 'x') - loadedWidth - interfaceWidth;
            settings.mw = settings.w && settings.w < settings.mw ? settings.w : settings.mw
        }
        if(settings.maxHeight) {
            settings.mh = setSize(settings.maxHeight, 'y') - loadedHeight - interfaceHeight;
            settings.mh = settings.h && settings.h < settings.mh ? settings.h : settings.mh
        }
        href = settings.href;
        loadingTimer = setTimeout(function () {
            $loadingOverlay.show()
        }, 100);
        if(settings.inline) {
            $div().hide().insertBefore($(href)[0]).one(event_purge, function () {
                $(this).replaceWith($loaded.children())
            });
            prep($(href))
        } else if(settings.iframe) {
            prep(" ")
        } else if(settings.html) {
            prep(settings.html)
        } else if(isImage(href)) {
            $(photo = new Image()).addClass(prefix + 'Photo').error(function () {
                settings.title = false;
                prep($div('Error').text('This image could not be loaded'))
            }).load(function () {
                var percent;
                photo.onload = null;
                if(settings.scalePhotos) {
                    setResize = function () {
                        photo.height -= photo.height * percent;
                        photo.width -= photo.width * percent
                    };
                    if(settings.mw && photo.width > settings.mw) {
                        percent = (photo.width - settings.mw) / photo.width;
                        setResize()
                    }
                    if(settings.mh && photo.height > settings.mh) {
                        percent = (photo.height - settings.mh) / photo.height;
                        setResize()
                    }
                }
                if(settings.h) {
                    photo.style.marginTop = Math.max(settings.h - photo.height, 0) / 2 + 'px'
                }
                if($related[1] && (index < $related.length - 1 || settings.loop)) {
                    photo.style.cursor = 'pointer';
                    photo.onclick = function () {
                        publicMethod.next()
                    }
                }
                if(isIE) {
                    photo.style.msInterpolationMode = 'bicubic'
                }
                setTimeout(function () {
                    prep(photo)
                }, 1)
            });
            setTimeout(function () {
                photo.src = href
            }, 1)
        } else if(href) {
            $loadingBay.load(href, settings.data, function (data, status, xhr) {
                prep(status === 'error' ? $div('Error').text('Request unsuccessful: ' + xhr.statusText) : $(this).contents())
            })
        }
    };
    publicMethod.next = function () {
        if(!active && $related[1] && (index < $related.length - 1 || settings.loop)) {
            index = index < $related.length - 1 ? index + 1 : 0;
            publicMethod.load()
        }
    };
    publicMethod.prev = function () {
        if(!active && $related[1] && (index || settings.loop)) {
            index = index ? index - 1 : $related.length - 1;
            publicMethod.load()
        }
    };
    publicMethod.close = function () {
        if(open && !closing) {
            closing = true;
            open = false;
            trigger(event_cleanup, settings.onCleanup);
            $window.unbind('.' + prefix + ' .' + event_ie6);
            $overlay.fadeTo(200, 0);
            $box.stop().fadeTo(300, 0, function () {
                $box.add($overlay).css({
                    'opacity': 1,
                    cursor: 'auto'
                }).hide();
                trigger(event_purge);
                $loaded.remove();
                setTimeout(function () {
                    closing = false;
                    trigger(event_closed, settings.onClosed)
                }, 1)
            })
        }
    };
    publicMethod.element = function () {
        return $(element)
    };
    publicMethod.settings = defaults;
    handler = function (e) {
        if(!((e.button !== 0 && typeof e.button !== 'undefined') || e.ctrlKey || e.shiftKey || e.altKey)) {
            e.preventDefault();
            launch(this)
        }
    };
    if($.fn.delegate) {
        $(document).delegate('.' + boxElement, 'click', handler)
    } else {
        $('.' + boxElement).live('click', handler)
    }
    $(publicMethod.init)
}(jQuery, document, this));

/*makes modals on iPad display on top*/
$(document).ready(function(){
$(".modalpopup").bind("click",function(){
$("#modalpopup").css("z-index",9999);
});

});


