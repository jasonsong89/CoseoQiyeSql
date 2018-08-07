/*
 * jQuery.global.1.4
 * QQ:2816173824
 * http://www.microue.com
*/
$(function () {

    $("#goods_list ul li a,#news_list dl dt a,.show_list li a,.is_top .box a,.is_red ul li a,#goods ul li a").click(function () {
        popWin.showWin("1000", $(window).height(), $(this).attr("title"), $(this).attr("name"));
    });
    
    
    //* Navigation Dropdown
    //* 导航下拉伸缩
    $('#nav li').mousemove(function () {
        $(this).find('ul').slideDown();//you can give it a speed
    });
    $('#nav li').mouseleave(function () {
        $(this).find('ul').slideUp("fast");
    });
    $('#nav li:last').css('background-position', '0 -50px');

    
    //* Name: Back Top
    //* Tag: 返回顶部
    
    function backtop() {
        this.init();
    }

    backtop.prototype = {
        constructor: backtop,
        init: function () {
            this._initBackTop();
        },
        _initBackTop: function () {
            var $backTop = this.$backTop = $('<div class="cbbfixed">' +
							//'<a class="cweixin cbbtn"">'+
								//'<span class="weixin-icon"></span><div></div>'+
							//'</a>'+
							'<a class="gotop cbbtn">' +
								'<span class="up-icon"></span>' +
							'</a>' +
						'</div>');
            $('body').append($backTop);

            $backTop.click(function () {
                $("html, body").animate({
                    scrollTop: 0
                }, 120);
            });

            var timmer = null;
            $(window).bind("scroll", function () {
                var d = $(document).scrollTop(),
				e = $(window).height();
                0 < d ? $backTop.css("bottom", "10px") : $backTop.css("bottom", "-90px");
                clearTimeout(timmer);
                timmer = setTimeout(function () {
                    clearTimeout(timmer)
                }, 100);
            });
        }
    }
    var backtop = new backtop();

    

    //* slider
    //* 滑块新闻焦点图
    $("#focus").hover(function () {
        $("#focus-prev,#focus-next").show();
    }, function () {
        $("#focus-prev,#focus-next").hide();
    });
    $("#focus").slide({
        mainCell: "#focus-bar-box ul",
        targetCell: "#focus-title a",
        titCell: "#focus-num a",
        prevCell: "#focus-prev",
        nextCell: "#focus-next",
        effect: "left",
        easing: "easeInOutCirc",
        autoPlay: true,
        delayTime: 200
    });

    //* qqservice
    //* QQ在线客服

    var KF = $(".qqservice");
    var wkbox = $(".qqservice_box");
    var kf_close = $(".qqservice .qqservice_close");
    var icon_qqservice = $(".icon_qqservice");
    var kH = wkbox.height();
    var kW = wkbox.width();
    var wH = $(window).height();
    KF.css({ height: kH });
    icon_qqservice.css("top", parseInt((kH - 100) / 2));
    var KF_top = (wH - kH) / 2;
    if (KF_top < 0) KF_top = 0;
    KF.css("top", KF_top);
    $(kf_close).click(function () {
        KF.animate({ width: "0" }, 200, function () {
            wkbox.hide();
            icon_qqservice.show();
            KF.animate({ width: 26 }, 300);
        });
    });
    $(icon_qqservice).click(function () {
        $(this).hide();
        wkbox.show();
        KF.animate({ width: kW }, 200);
    });
    //* ifocus
    //* 内页横向切换带索引焦点图
    //*
    var sWidth = $("#ifocus").width(); //获取焦点图的宽度（显示面积）
    var len = $("#ifocus ul li").length; //获取焦点图个数
    var index = 0;
    var picTimer;

    //以下代码添加数字按钮和按钮后的半透明长条
    var btn = "<div class='btn_bg'></div><div class='btn'>";
    for (var i = 0; i < len; i++) {
        btn += "<span>" + (i + 1) + "</span>";
    }
    btn += "</div>"
    $("#ifocus").append(btn);
    $("#ifocus .btn_bg").css("opacity", 0.0);

    //为数字按钮添加鼠标滑入事件，以显示相应的内容
    $("#ifocus .btn span").mouseenter(function () {
        index = $("#ifocus .btn span").index(this);
        showPics(index);
    }).eq(0).trigger("mouseenter");

    //本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
    $("#ifocus ul").css("width", sWidth * (len + 1));

    //鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
    $("#ifocus").hover(function () {
        clearInterval(picTimer);
    }, function () {
        picTimer = setInterval(function () {
            if (index == len) { //如果索引值等于li元素个数，说明最后一张图播放完毕，接下来要显示第一张图，即调用showFirPic()，然后将索引值清零
                showFirPic();
                index = 0;
            } else { //如果索引值不等于li元素个数，按普通状态切换，调用showPics()
                showPics(index);
            }
            index++;
        }, 5000); //此3000代表自动播放的间隔，单位：毫秒
    }).trigger("mouseleave");

    //显示图片函数，根据接收的index值显示相应的内容
    function showPics(index) { //普通切换
        var nowLeft = -index * sWidth; //根据index值计算ul元素的left值
        $("#ifocus ul").stop(true, false).animate({ "left": nowLeft }, 500); //通过animate()调整ul元素滚动到计算出的position
        $("#ifocus .btn span").removeClass("on").eq(index).addClass("on"); //为当前的按钮切换到选中的效果
    }

    function showFirPic() { //最后一张图自动切换到第一张图时专用
        $("#ifocus ul").append($("#ifocus ul li:first").clone());
        var nowLeft = -len * sWidth; //通过li元素个数计算ul元素的left值，也就是最后一个li元素的右边
        $("#ifocus ul").stop(true, false).animate({ "left": nowLeft }, 500, function () {
            //通过callback，在动画结束后把ul元素重新定位到起点，然后删除最后一个复制过去的元素
            $("#ifocus ul").css("left", "0");
            $("#ifocus ul li:last").remove();
        });
        $("#ifocus .btn span").removeClass("on").eq(0).addClass("on"); //为第一个按钮添加选中的效果
    }

    //* Nav Cursor Droplist
    //* 光标跟随带下拉菜单导航栏
    //* Plugin: jquery.SuperSlide.2.1.1.js
    
    var nav = $(".nav");
    var init = $(".nav .m").eq(ind);
    var block = $(".nav .block");
    block.css({
        "left": init.position().left - 0
    });
    nav.hover(function () { },
    function () {
        block.stop().animate({
            "left": init.position().left - 0
        },
        500);
    });
    $(".nav").slide({
        type: "menu",
        titCell: ".m",
        targetCell: ".sub",
        delayTime: 500,
        triggerTime: 0,
        returnDefault: true,
        defaultIndex: ind,
        startFun: function (i, c, s, tit) {
            block.stop().animate({
                "left": tit.eq(i).position().left - 0
            },
            500);
        }
    });

    //* Name: Images Scroll
    //* Tag: 图片滚动
    //* Plugin: jquery.imgScroll.js

    $("#count1").dayuwscroll({
        parent_ele: '#wrapBox1',
        list_btn: '#tabT04',
        pre_btn: '#left1',
        next_btn: '#right1',
        path: 'left',
        auto: true,//true为自动播放，false为不自动播放
        time: 3000,
        num: 4,
        gd_num: 3,
        waite_time: 1000
    });
    $("#count2").dayuwscroll({
        parent_ele: '#wrapBox2',
        list_btn: '#tabT04',
        pre_btn: '#left2',
        next_btn: '#right2',
        path: 'left',
        auto: false,
        time: 3000,
        num: 3,
        gd_num: 3,
        waite_time: 1000
    });
    $('#goods').hover(function () {
        $(".prev", this).stop().animate({ left: '0px' }, { queue: false, duration: 110 });
        $(".next", this).stop().animate({ right: '0px' }, { queue: false, duration: 110 });
    }, function () {
        $(".prev", this).stop().animate({ left: '-50px' }, { queue: false, duration: 110 });
        $(".next", this).stop().animate({ right: '-50px' }, { queue: false, duration: 110 });
    });
    $('#goods li').hover(function () {
        $(".cover", this).stop().animate({ bottom: '0px' }, { queue: false, duration: 110 });
    }, function () {
        $(".cover", this).stop().animate({ bottom: '-50px' }, { queue: false, duration: 110 });
    });

    //* Name: Touch Slider
    //* Tag: 横向切换焦点图
    //* Plugin: jquery.touchSlider.js

    $(".focus").hover(function () {
        $("#btn_prev,#btn_next").fadeIn()
    }, function () {
        $("#btn_prev,#btn_next").fadeOut()
    })
    $dragBln = false;
    $(".focus_item").touchSlider({
        flexible: true,
        speed: 300,
        btn_prev: $("#btn_prev"),
        btn_next: $("#btn_next"),
        paging: $(".flicking_btn a"),
        counter: function (e) {
            $(".flicking_btn a").removeClass("on").eq(e.current - 1).addClass("on");
        }
    });
    $(".focus_item").bind("mousedown", function () {
        $dragBln = false;
    })
    $(".focus_item").bind("dragstart", function () {
        $dragBln = true;
    })
    $(".focus_item a").click(function () {
        if ($dragBln) {
            return false;
        }
    })
    timer = setInterval(function () { $("#btn_next").click(); }, 5000);
    $(".focus").hover(function () {
        clearInterval(timer);
    }, function () {
        timer = setInterval(function () { $("#btn_next").click(); }, 5000);
    })
    $(".focus_item").bind("touchstart", function () {
        clearInterval(timer);
    }).bind("touchend", function () {
        timer = setInterval(function () { $("#btn_next").click(); }, 5000);
    });


    function initMenu() {
        $('#menu ul').hide();
        $('#menu ul').children('.current').parent().show();
        //$('#menu ul:first').show();
        $('#menu li a').click(
          function () {
              var checkElement = $(this).next();
              if ((checkElement.is('ul')) && (checkElement.is(':visible'))) {
                  return false;
              }
              if ((checkElement.is('ul')) && (!checkElement.is(':visible'))) {
                  $('#menu ul:visible').slideUp('normal');
                  checkElement.slideDown('normal');
                  return false;
              }
          }
          );
    }
    $(document).ready(function () { initMenu(); });
    //////////////////////////
});