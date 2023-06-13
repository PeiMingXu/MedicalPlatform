//界面加载完毕执行以下程序
$(function(){
    //定义i变量为动态控制图片轮播做准备，i的值与每张图片进行一一的对应
    var i=0;
    //时间变量，为自动轮播以及对光标的影响做出相应的反应
    var timer=null;
    //根据图片的张数动态添加圆点个数
    for (var j = 0; j < $('.img li').length; j++) {
        $('.num').append('<li></li>');
    }
    //默认情况下的第一个圆点进行背景设计
    $('.num li').first().addClass('active');
    //根据光标的影响控制按钮的显示和隐藏
    $('.banner').hover(function(){
        $('.btn').show();
    },function(){
        $('.btn').hide();
    });
    //将第一张图片复制并添加到img部分下与前五张图片相接
    var firstimg=$('.img li').first().clone(); //复制第一张图片
    $('.img').append(firstimg).width($('.img li').length*($('.img img').width()));
    //定时器自动轮播
    timer=setInterval(function(){
        i++;
        if (i==$('.img li').length) {
            i=1;
            $('.img').css({left:0});//保证无缝轮播，设置left值
        }
        //进行下一张图片
        $('.img').stop().animate({left:-i*1024},500);
        //圆点跟着变化
        if (i==$('.img li').length-1) {
            $('.num li').eq(0).addClass('active').siblings().removeClass('active');
        }else{
            $('.num li').eq(i).addClass('active').siblings().removeClass('active');
        }
    },1000);
    //鼠标移入，暂停自动播放，移出，开始自动播放
    $('.banner').hover(function(){
        clearInterval(timer);
    },function(){
        timer=setInterval(function(){
            i++;
            if (i==$('.img li').length) {
                i=1;
                $('.img').css({left:0});
            };
            //进行下一张图片
            $('.img').stop().animate({left:-i*1024},500);
            //圆点跟着变化
            if (i==$('.img li').length-1) {
                $('.num li').eq(0).addClass('active').siblings().removeClass('active');
            }else{
                $('.num li').eq(i).addClass('active').siblings().removeClass('active');
            }
        },1000)
    });
    //上一个按钮
    $('.prev').click(function(){
        i--;
        if (i==-1) {
            i=$('.img li').length-2;
            $('.img').css({left:-($('.img li').length-1)*1024});
        }
        $('.img').stop().animate({left:-i*1024},500);
        $('.num li').eq(i).addClass('active').siblings().removeClass('active');
    });
    // 下一个按钮
    $('.next').click(function(){
        i++;
        if (i==$('.img li').length) {
            i=1; //这里不是i=0
            $('.img').css({left:0});
        };
        $('.img').stop().animate({left:-i*1024},500);
        if (i==$('.img li').length-1) { //设置小圆点指示
            $('.num li').eq(0).addClass('active').siblings().removeClass('active');
        }else{
            $('.num li').eq(i).addClass('active').siblings().removeClass('active');
        };
 
    });
    //鼠标划入圆点
    $('.num li').mouseover(function(){
        var _index=$(this).index();
        //维持i变量控制的对应关系不变
        i = _index;                 
        $('.img').stop().animate({left:-_index*1024},300);
        $('.num li').eq(_index).addClass('active').siblings().removeClass('active');
    });
 
})
$(function(){
    // 获取页面中包含图片的li元素
    var imgLi=$('.imgBox');

    $.each(imgLi,function(index,value){
        $(value).mouseenter(function(e){
            // 这里一定要注意，先使用stop()停止之前的动画，再开始后面的动画，否则会有不足
            $(this).stop().animate({'width':'360px','opacity':'1'},'100');
            $(this).siblings('.imgBox').stop().animate({'width':'100px','opacity':'0.4'},'100');
        });
    });

});
        window.onload = function () {
            //需求：无缝滚动。
            //思路：赋值第一张图片放到ul的最后，然后当图片切换到第五张的时候
            //     直接切换第六章，再次从第一张切换到第二张的时候先瞬间切换到
            //     第一张图片，然后滑动到第二张
            //步骤：
            //1.获取事件源及相关元素。（老三步）
            //2.复制第一张图片所在的li,添加到ul的最后面。
            //3.给ol中添加li，ul中的个数-1个，并点亮第一个按钮。
            //4.鼠标放到ol的li上切换图片
            //5.添加定时器
            //6.左右切换图片（鼠标放上去隐藏，移开显示）
            var screen = document.getElementById("screen");
            var ul = screen.children[0];
            var ol = screen.children[1];
            var div = screen.children[2];
            var imgWidth = screen.offsetWidth;
 
            //2
            var tempLi = ul.children[0].cloneNode(true);
            ul.appendChild(tempLi);
            //3
            for(var i = 0; i < ul.children.length - 1; i++) {
                var newOlLi = document.createElement("li");
                newOlLi.innerHTML = i + 1;
                ol.appendChild(newOlLi);
            }
            var olLiArr = ol.children;
            olLiArr[0].className = "current";
            //4
            for(var i = 0, len = olLiArr.length; i < len; i++) {
                olLiArr[i].index = i;
                olLiArr[i].onmouseover = function (ev) {
                    for(var j = 0; j < len; j++) {
                        olLiArr[j].className = "";
                    }
                    this.className = "current";
                    key = square = this.index;
                    animate(ul, -this.index * imgWidth);
                }
            }
            //5
            var key = 0;
            var square = 0;
            var timer = setInterval(autoPlay, 5000);
            screen.onmouseover = function (ev) {
                clearInterval(timer);
                div.style.display = "block";
            }
            screen.onmouseout = function (ev) {
                timer = setInterval(autoPlay, 5000);
                div.style.display = "none";
            }
            //6
            var divArr = div.children;
            divArr[0].onclick = function (ev) {
                key--;
                if(key < 0) {
                    ul.style.left = -(ul.children.length-1) * imgWidth + "px";
                    key = 4;
                }
                animate(ul, -key * imgWidth);
                square--;
                if(square < 0) {
                    square = 4;
                }
                for(var k = 0; k < len; k++) {
                    olLiArr[k].className = "";
                }
                olLiArr[square].className = "current";
            }
            divArr[1].onclick = autoPlay;
            function autoPlay() {
                key++;
                //当不满足下面的条件是时候，轮播图到了最后一个孩子，进入条件中后，瞬移到
                //第一张，继续滚动。
                if(key > ul.children.length - 1) {
                    ul.style.left = 0;
                    key = 1;
                }
                animate(ul, -key * imgWidth);
                square++;
                if(square > 4) {
                    square = 0;
                }
                for(var k = 0; k < len; k++) {
                    olLiArr[k].className = "";
                }
                olLiArr[square].className = "current";
            }
            function animate(ele,target){
                    clearInterval(ele.timer);
                    var speed = target>ele.offsetLeft?10:-10;
                    ele.timer = setInterval(function () {
                        var val = target - ele.offsetLeft;
                        ele.style.left = ele.offsetLeft + speed + "px";
                        if(Math.abs(val)<Math.abs(speed)){
                            ele.style.left = target + "px";
                            clearInterval(ele.timer);
                        }
                    },10)  
            }
 
        }