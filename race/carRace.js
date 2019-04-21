(function($) {
    $(document).ready(function() {
    	$(".msgConfirm").click(function () {
    		$(".alertMsgCar").css("opacity",'0');
    	});
    	lockScreen();
    	// detectScreen();
        $.racingReset();
        // here
        $(".RaceSpace").css("opacity","1");
        $(window).resize(function() {
        	lockScreen();
            // detectScreen();
            $.racingReset();
        });
        $("#raceReciprocal").css({ opacity :"0"});
        // isImgLoad($(".wrapRace img"), 5, loadSucc, loadFail); //check圖片
        $.racingReset();
        $.raceInitial();     //初始倒數
        // detectScreen();    //偵測螢幕

        $(".wrapCarLive").click(function () {
        	       	$(".watchCarLive").css("background-color","black");
        	   		liveClick++;
        	   		var mtop = -250;
        	    		if ( divWidth >767 ){
        	    			mtop = -450;
        	    		}
        	   		if(liveClick === 1){
        	   			$(".wrapCarLive").text("观看直播");
        	    			$(".nothing").animate({
        	        			marginTop:""+ mtop +"px"
        	        		});
        	    			}else{
        	    			$(".wrapCarLive").text("收起直播");
        					$(".nothing").animate({
        	        			marginTop:"0%"
        	        		});
        					liveClick = 0;
        				}
        	    	});
    });
    var divWidth  = $("#wrapRace").width();      //DIV寬
    var divHeight = $("#wrapRace").height();     //DIV高
    
    var countdownnumber = 5; //倒數秒數
    var countdownid, x;      //倒數用
    var fire;                //噴射GIF
    var carPosArr = [];      //存車子的高 i=1~10
    var objSorted = [];      //車子排完名
    var carPosFlag = '';     //清空carPos的Timeout
    var rank = [3, 2, 4, 6, 7, 5, 8, 10, 9, 1]; //接到的排名 *****
    var carDistance = [9, 8, 7, 6, 5, 4, 3, 2, 1, 0]; //車子排名的距離
    var roadSpeed, roadObj;  //背景 移動距離 秒數調整
    var proportion;          //車子按比例位移

    var racePerformTimer = '',  //racePerform timer
        carTimer = '',          //車子
        scoreTimer = '',        //排名
        roadRepeat = true,      //賽道開關
        carCounter = true,      //車子開關
        scoreCounter = true,    //排名開關
        checkTimer = '',        //確認是否有接到值
        billingTimer = '',      //結算Timeout
        controlSpeedTimer = '', //是否加速開關
        carResetPos = '',       //reset car 的位置
        no1Timer = '',          //第一名 timer
        no2Timer = '',          //第二名 timer
        no3Timer = '',          //第三名 timer
        headScore1 = '',        //彈跳第一名Timer
        headScore2 = '',        //彈跳第二名Timer
        headScore3 = '',        //彈跳第三名Timer
        m200 = '',              //200M Timer
        m100 = '',              //100M Timer
        succBilling = '';       //billing 結束reset Timer
                                //確認全部停止

    var distance = 0;           //排名位移距離
    var speedupFlag = true;     //車子加速FLAG
    var billingTop = 0;       //結算畫面的animate 下來的位置
    var iniCarH = 0;            //抓車子圖片的高度
    var callSlowMotionTimer = '';//slowMotion Timer
    var resetCountDownFlag = '' //最長表演時間重置
    var liveClick = 0;
    var checkFlag = '';       //test
    $.raceStep = 0;           //賽車進程
    function loadFail() {} //圖片載入失敗
    function loadSucc() { //圖片載入成功
        $(".wrap_loading").animate({
            "marginTop": "-130%",
            "opacity": "0"
        }, '600', 'linear');
    }
    
    function lockScreen () {
    	var w = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
        var h = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);
        if(w > h){//橫屏
        	// $(".msgConfirm").css("opacity",'0');
        	// $(".alertMsgCar").css("opacity",'1');
        	// $(".msgTextInner").text("请用直屏游戏享受完整游戏体验！");
        	// $(".alertMsgCar").addClass("alertMsgZ");
        	// $(".nothing").css("background-color","black");
        }else {
        	$(".alertMsgCar").removeClass("alertMsgZ");
        	$(".alertMsgCar").css("opacity",'0');
        	$(".nothing").css('width','100%');
        }
    }
    function detectScreen() {
        divWidth  = $("#wrapRace").width();      //DIV寬
        divHeight = $("#wrapRace").height();     //DIV高
        if ( divHeight > divWidth ) {
            proportion = ((divWidth / divHeight) * 100 - 25);
        } else if (divHeight < divWidth) {
            proportion = ((divHeight / divWidth) * 100 - 25);
        } else if (divHeight == divWidth) {
            proportion = ((divHeight / divWidth) * 100 - 30);
        }
        if (proportion >= 80) {
            proportion = proportion - 10;
        }
        if (divWidth >= 1024) {
            roadObj = -630;
            roadSpeed = 500;
            distance = 18;//排名時車子位移的距離
        }
        if (divWidth >= 900) {
            roadObj = -630;
            roadSpeed = 350;
            distance = 30;
        }
        if (divWidth >= 768 && divWidth < 900) {
            roadObj = -630;
            roadSpeed = 500;
            distance = 30;
        }
        if (divWidth > 480 && divWidth < 768) {
            roadObj = -800;
            roadSpeed = 700;
            distance = 23;
        }
        if (divWidth < 480) {
            roadObj = -800;
            roadSpeed = 1500;
            distance = 20;
        }
    }

    $.raceInitial = function () {
        if ($.raceStep >= 1 || $.raceStep !== 0) {
        	$.raceStep = "error";
	       	 $.racingReset();
	    	 return;
      }
        $.raceStep = 1;
        
        x = document.getElementById("raceNum");
        x.innerHTML = countdownnumber;
        clearInterval(countdownid);
        countdownid = setInterval( function() {
            countdownfunc();
        }, 1000);
        resetCountDownFlag = setTimeout(function() {
            $.racingReset();
        }, 50000);
    }

    $.racingReset = function () {   //重置
        //倒數觸發清除
        clearInterval(countdownid);

        //頒獎車子 timer clear
        clearTimeout(no1Timer);
        clearTimeout(no2Timer);
        clearTimeout(no3Timer);

        //抵達終點彈跳效果 timer clear
        clearTimeout(headScore1);
        clearTimeout(headScore2);
        clearTimeout(headScore3);

        //全清
        clearTimeout(racePerformTimer);
        clearTimeout(carTimer);
        clearTimeout(scoreTimer);
        clearTimeout(checkTimer);
        clearTimeout(billingTimer);
        clearTimeout(m200);
        clearTimeout(m100);
        clearTimeout(carPosFlag);
        clearTimeout(succBilling);
        clearTimeout(resetCountDownFlag);
        clearTimeout(callSlowMotionTimer);
        clearTimeout(checkFlag);
        carTimer = '';         //車子
        scoreTimer = '';       //排名
        checkTimer = true;       //確認是否有接到值
        billingTimer = '';     //結算Timeout
        controlSpeedTimer = ''; //是否加速開關

        roadRepeat = false;    //賽道開關
        carCounter = false;    //車子開關
        scoreCounter = false;  //排名開關
        m200 = '';             //200公尺線
        m100 = '';             //100公尺線
        carPosFlag = '';
        succBilling = '';
        callSlowMotionTimer = '';
        checkFlag = '';
        //回復透明
        $("#endLine").css("opacity","1");
        $("#startLine").css("opacity","1");
        $(".car").css("opacity","1");
        //動畫STOP
        $(".m300").stop(true,true);
        $(".m200").stop(true,true);
        $(".m100").stop(true,true);
        $(".wrapBilling").stop(true,true);
        $(".wrap_loading").stop(true,true);
        $(".car").stop(true,true);
        $(".RaceSpace").stop(true,true);
        $("#startLine").stop(true,true);
        $("#endLine").stop(true,true);

        //重設秒數
        countdownnumber = 5;
        //載入
        $(".wrap_loading").animate({
            "marginTop": "0%",
            "opacity": "1"
        }, '100', 'linear',function(){
        	 //頒獎位置reset
            $("#no1").css({
                "marginTop": "0%",
                "marginLeft": "0%",
                "width": "100%"
            });
            $("#no2").css({
                "marginTop": "0%",
                "marginLeft": "0%",
                "width": "100%"
            });
            $("#no3").css({
                "marginTop": "0%",
                "marginLeft": "0%",
                "width": "100%"
            });
        	
            $(".RaceSpace").css("opacity","0");
            //lightBox reset
            $("#fullScreen").css("opacity","0");

            //結算畫面上拉
            $(".wrapBilling").animate({
                "opacity": "0",
                "top": "-130%"
            }, 100);

            //排名重置
            for(var i = 1; i <= 10 ; i++) {
                $("#score"+i).find('img').attr("src",'./carRace/car_number'+ i +'.png');
            }

            //車子reset
            $(".car").css({"marginTop":"0%"});

            //起點reset
            var resetStartLine = $("#car1").height() + ($("#car1").height()/3);
            $("#startLine").css({"top":""+resetStartLine +"px"});
            $(".car").css("opacity",'1');

        }).delay(900).animate({
            "marginTop": "-130%",
            "opacity": "1"
        }, '100',function() { $(".RaceSpace").css("opacity","1");});//載入放下來1秒
        
        //賽車燈號
        $("#raceLight").attr("src","./carRace/red_light.png");

        //倒數reset
        $("#raceNum").attr("src", "./carRace/sec_5.png");
        $("#raceReciprocal").css({opacity : "0"});
        //倒数数字
        $("#raceNum").css({
            "width": "100%",
            "marginTop": "0",
            "marginLeft": "0"
        });

        //賽道reset
        $('.RaceSpace').css({
            backgroundPosition: '0px 0px'
        });

        //噴射reset
        $(".fire").css("opacity", '0');

        //終點線reset
        var endLine = $(".endLine");
        endLine.css("marginTop","150%");
        $("#endLine").css("opacity","1");
        
        // slowMotion 彈跳效果reset
        $(".headScore").removeClass("rankJump");
        //名次排透明
        $(".headScore").css("opacity",'0');

        //公尺線reset
        $(".m300").css("marginTop","130%");
        $(".m200").css("marginTop","130%");
        $(".m100").css("marginTop","130%");

        detectScreen();//偵測螢幕
        var w = Math.max(document.documentElement.clientWidth, window.innerWidth || 0);
        var h = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);
        // if ( $.raceStep !== 0 && $.raceStep !== 'finish' && h>w) {
        // 	$(".msgConfirm").css("opacity",'1');
        // 	$(".alertMsgCar").css("opacity",'1');
        // 	$(".msgTextInner").text("网路异常，重新载入!");
        // 	$(".alertMsgCar").addClass("alertMsgZ");
        // }
        $.raceStep = 0;
    }

    function countdownfunc() {
        x.innerHTML = countdownnumber;
        var num = $("#raceNum");
        var light = document.getElementById("raceLight");
        var reciprocal = document.getElementById('raceReciprocal');
        var startLine = document.getElementById("startLine");
        var fullScreen = $("#fullScreen");
        fire = document.getElementById("fire1");
        if(countdownnumber === 5){
        	reciprocal.style.opacity="1";
        	$(".raceNumber").addClass("rubberBand");
        }
        if (countdownnumber > 0) { // 倒數數字
            $("#raceReciprocal").css({
                    opacity : "1",
                    transition : ".1s"
            });
            num.attr("src", "./carRace/sec_" + countdownnumber + ".png");
            if (countdownnumber === 1) {
                num.css({
                    "width": '75%',
                    "marginTop": "-11%",
                    "marginLeft": "3%"
                }); // 1比較大
            }
        }
        if (countdownnumber === 0) { // 倒數 GO
            light.src = "./carRace/green_light.png";
            num.attr("src", "./carRace/sec_go.png");
            num.css({
                "width": "100%",
                "marginTop": "10px",
                "marginLeft": "3%"
            });
        }

        if (countdownnumber == -1) { //倒數消失
        	$(".raceNumber").removeClass("rubberBand");
            roadRepeat = true;  //賽道開關
            carCounter = true;  //車子開關
            scoreCounter = true;//排名開關
            reciprocal.style.opacity = "0";
            reciprocal.style.transition = ".1s";
            $(".fire").css("opacity", '1'); //GIF start
            fire.stop();
            fire.play();
            //起點 消失
            $("#startLine").animate({
                top: "-300px",
                transition: ".7s"
            }, 100, "linear");
            //車子表演
            var forRoad = 1200;
            if (divWidth < 400) {
                forRoad = 2000
            } //for mobile sec
            $(".RaceSpace").animate({ //賽道變慢
                'backgroundPositionY': '-800px'
            }, forRoad, 'linear', function() {
                $(".RaceSpace").css({
                    backgroundPosition: '0px 0px'
                });
            });
            animateDiv(); //亂數 車子
            raceRepeat(); // 賽道
            carPos(); //抓取車子 高 &排名
            scoreRepeat(); //名次
            clearInterval(countdownid); //清除倒數 interval
            checkValue();
        }
        countdownnumber--;
    }

   function checkValue() { //確認有沒有接到表演時間 並開始表演 測試用
       checkFlag = setTimeout(function () {
           $.racePerform(1,rank);
        //    $.racingReset();
        //    $.raceInitial();
       },3000);
   }

    $.racePerform = function (performTime, rank) { //車子接到表演時間後開始動作
        if ($.raceStep >= 2 || $.raceStep !== 1) {
        	$.raceStep = "error";
          	 $.racingReset();
          	 return;
          }
        $.raceStep = 2;

        //清除最長表演時間記號
        clearTimeout(resetCountDownFlag);

        if ( typeof rank != 'object' || rank.length != 10) {
            $.racingReset();
        }
        if (typeof performTime != 'number' || !IsParmReady(performTime) || performTime <= 0) {
            performTime = 1;
        }

        var endLine = $(".endLine");
        $(".m300").animate({ //300m的線
            "marginTop": "-20%"
        }, 850, 'linear');

        m200 = setTimeout(function () {
            $(".m200").animate({ //200m的線
                "marginTop": "-20%"
            }, 850, 'linear');
        },(performTime * 1000));

        m100 = setTimeout(function () {
            $(".m100").animate({ //100m的線
                "marginTop": "-20%"
            }, 850, 'linear');

            //終點線開始移動
            var forMobile = 1400; //正常
            var endLineMtop = 40;
            if ( divWidth < 375 ) {
                forMobile = 1700; //FOR 375以下
                endLineMtop = 45;
            }
            if ( divWidth >= 768 ) {
                forMobile = 1600;
                endLineMtop = 30;
            }
            if ( divWidth > 1000 ) {
                forMobile = 1000;
                endLineMtop = 25;
            }
            racePerformTimer = setTimeout(function () {
                speedupFlag = false; //排隊型前停止噴射
                carCounter = false; //停止
                $(".car").stop(true, false); //所有動畫停止
                for (var i = 0; i <= 9; i++) { //車子排好位置距離
                    var z2 = rank[i];
                    z1 = carDistance[i] * distance;
                    $('#car' + z2).stop(true, false);
                    $("#car" + z2).animate({
                        "marginTop": "" + z1 + "px"
                    }, 1100, "linear", function() {
                        $("#car" + z2).delay(750).stop(true, false);
                    });
                }
                endLine.animate({
                    'marginTop': ''+ endLineMtop +'%'
                }, forMobile, 'swing', function() {});
                callSlowMotion(rank);
            }, ( performTime * 1000));
        },( (performTime * 2) * 1000));
    }

    function callSlowMotion (rank) {
    	       var fullScreen = $("#fullScreen");
    	       var endPos = $("#endLine");
    	       var first  = $("#car" + rank[0]); // 第一名
    	       var two    = $("#car" + rank[1]); // 第二名
    	       var three  = $("#car" + rank[2]); // 第三名
    	       var fourth = $("#car" + rank[3]); // 第4名
    	        var last   = $("#car" + rank[9]); // 最後一名
    	        var firstA  = Math.floor(first.offset().top);
    	        var threeA  = Math.floor(three.offset().top);
    	        var endPosA = Math.floor(endPos.offset().top);
    	        var topPlus = 30;
    	        var endMargin = 15;
    	        var slowMotion = 5500;
    	       if (divWidth > 900) {
    	            topPlus   = 110;
    	            endMargin = 0;
    	        }
    	        if (divWidth <= 320) {
    	            slowMotion = 6000;
    	        }
    	        if ((firstA + first.height()) > endPosA) {
    	            clearTimeout(callSlowMotion);
    	            $(".car").stop(true, false);
    	            $(".car").css("opacity", "0.5");
    	            first.css("opacity", "1");
    	            two.css("opacity", "1");
    	            three.css("opacity", "1");
    	            endPos.css('z-index', "21");
    	            fullScreen.css("opacity", '0.7');
    	            endPos.animate({
    	                "marginTop": "" + endMargin + "%"
    	            }, slowMotion, "linear", function() {});
    	            $(".RaceSpace").stop(true, false);
    	            $(".RaceSpace").animate({ //賽道變慢
    	                'backgroundPositionY': '-800px'
    	            }, slowMotion, 'linear', function() {});
    	            //排名跳出
    	            headScore1 = setTimeout(function() {
    	            	$("#headScore" + rank[0]).css("opacity",'1');
    	                $("#headScore" + rank[0]).addClass("rankJump");
    	            }, 100);
    	            headScore2 = setTimeout(function() {
    	            	$("#headScore" + rank[1]).css("opacity",'1');
    	                $("#headScore" + rank[1]).addClass("rankJump");
    	            }, 500);
    	            headScore3 = setTimeout(function() {
    	            	$("#headScore" + rank[2]).css("opacity",'1');
    	                $("#headScore" + rank[2]).addClass("rankJump");
    	            }, 800);
    	        } //if
    	        var threeX = threeA;
    	        if (divWidth < 350) {
    	            threeX = threeA - 6;
    	        }
    	        if (threeX > endPosA) {
    	            //停止所有動畫、計數器
    	            roadRepeat = false;
    	            scoreCounter = false;
    	            clearTimeout(carTimer);
    	            clearTimeout(roadRepeat);
    	            clearTimeout(scoreTimer);
    	            clearTimeout(carPosFlag);
    	            clearTimeout(callSlowMotionTimer);
    	            //畫面推出去
    	            $(".car").css("opacity", "1");
    	            $(".RaceSpace").stop(true, false);
    	            $(".RaceSpace").animate({
    	                'backgroundPositionY': '' + roadObj + 'px'
    	            }, roadSpeed, 'linear');
    	            fullScreen.css("opacity", '0');
    	            $('.car').stop(true, false);
    	            $(".car").animate({
    	                "marginTop": "120%"
    	            }, 500, "linear", function() {});
    	            endPos.stop(true, true);
    	            endPos.animate({
    	                'marginTop': '-40%'
    	            }, 250, 'linear', function() {});
    	            //結算畫面
    	            var no = {
    	                "carNo1": rank[0],
    	                "carNo2": rank[1],
    	                "carNo3": rank[2]
    	            };
    	            clearTimeout(billingTimer);
    	            billingTimer = setTimeout(function() {
    	                billing(no);
    	            }, 2000);
    	        }else {
    	        	clearTimeout(callSlowMotionTimer);
	   		         callSlowMotionTimer = setTimeout( function () {
	   		        	 callSlowMotion (rank);
	   		        },200);	
    	        }
    	    }
    
    function billing(obj, winMoney) { //結算畫面
    	if ($.raceStep>=3 || $.raceStep !== 2) {
    		$.raceStep = "error";
	       	 $.racingReset();
	    	 return;
    	}
        $.raceStep = 3;

        $("#no1").attr("src", './carRace/cutEND/carEND' + obj.carNo1 + '.png');
        $("#no2").attr("src", './carRace/cutEND/carEND' + obj.carNo2 + '.png');
        $("#no3").attr("src", './carRace/cutEND/carEND' + obj.carNo3 + '.png');
        
        $("#endLine").css("opacity","0");
        $("#startLine").css("opacity","0");
        $(".car").css("opacity","0");
        winMoney = 1000000;//贏得的獎金 可帶入這裡
        var moneyFormat = winMoney.toLocaleString('en-US');
        $("#win_money span").text(moneyFormat);
        if (divWidth < 350){
            billingTop = 0;
        }
        if (divWidth >= 1024) {
            billingTop = -34;
        }
        $(".wrapBilling").animate({
            "opacity": "1",
            "top": "" + billingTop + "%"
        }, 1000);
        no1Timer = setTimeout(function() {
            $("#no1").animate({
                "marginTop": "15%",
                "marginLeft": "-18%",
                "width": "140%"
            }, 500);
        }, 1500);
        no2Timer = setTimeout(function() {
            $("#no2").animate({
                "marginTop": "15%",
                "marginLeft": "-18%",
                "width": "130%"
            }, 500);
        }, 2200);
        no3Timer = setTimeout(function() {
            $("#no3").animate({
                "marginTop": "15%",
                "marginLeft": "-18%",
                "width": "130%"
            }, 500);
        }, 2900);
        succBilling = setTimeout(function() {
        	$.raceStep = "finish";
            $.racingReset();
        },4500);
    }

    function raceRepeat() { // 賽道移動
        obj = roadObj;
        if (roadRepeat) {
            $(".RaceSpace").animate({ //-800px
                'backgroundPositionY': '' + obj + 'px'
            }, roadSpeed, 'linear', function() {
                raceRepeat();
                $('.RaceSpace').css({
                    backgroundPosition: '0px 0px'
                });
            });
        }
    }

    function goAhead() { //加速  位移
        var h = Math.floor(Math.random() * 10 + 25);
        if (divWidth >= 1024) {
            h = h - 15;
        }
        return h;
    }

    function makeNewPosition() { //亂數 margin 的位移
        var nh = Math.floor(Math.random() * (proportion + 1) + 1);
        return nh;
    }

    function animateDiv() { //車子移動 animate
        if (carCounter) {
            var baseLine = (divHeight/2)+100; //加速基準Mobile
            if (speedupFlag) {
                var fire = document.getElementById("fire1");
                //車子加速位移
                var go = goAhead();
                var carNum = Math.floor(Math.random() * 10 + 1);
                if (carPosArr[carNum] <= baseLine) { //如果 CAR 小於加速基準
                    speedupFlag = false;
                    $("#car" + carNum).stop(true, false);
                    $('#car' + carNum).animate({
                        marginTop: "" + go + "%"
                    }, speedUp(), function() {});
                    $(".fire").css("opacity", '0');
                    $("#fire" + carNum).css("opacity", '1');
                    fire.stop();
                    fire.play();
                    clearTimeout(controlSpeedTimer);
                    controlSpeedTimer = setTimeout(function() {
                        speedupFlag = true;
                    }, 1000);
                }
            }
            for (var i = 1; i <= 10; i++) {
                //車子一般位移
                var newq = makeNewPosition();
                $('#car' + i).animate({
                    marginTop: "" + newq + "%"
                }, calcSpeed(), function() {});
            }
        }
        carTimer = setTimeout(function() {
            animateDiv();
        }, 800);
    }

    function speedUp() { // 瞬間加速
        var speedUp = Math.floor(Math.random() * 1000 + 150);
        return speedUp;
    }

    function calcSpeed() { //車子平常速度
        var speed = Math.ceil(Math.random() * 1000 + 1000);
        return speed;
    }

    function carPos() { //抓車子的高
        for (var i = 1; i <= 10; i++) {
            var cari = $("#car" + i);
            carPosArr[i] = cari.offset().top; //抓取車子的TOP
        }
        var obj = {
            car_number1: carPosArr[1],
            car_number2: carPosArr[2],
            car_number3: carPosArr[3],
            car_number4: carPosArr[4],
            car_number5: carPosArr[5],
            car_number6: carPosArr[6],
            car_number7: carPosArr[7],
            car_number8: carPosArr[8],
            car_number9: carPosArr[9],
            car_number10: carPosArr[10]
        };
        objSorted = Object.keys(obj).sort( //obj排序 排完變成陣列
            function(a, b) {
                return obj[b] - obj[a];
            }
        );
        clearTimeout(carPosFlag);
        carPosFlag = setTimeout(function() {
            carPos();
        }, 100);
    }

    function scoreRepeat() { //抓取車子位移位置
        if (scoreCounter) {
            for (var a = 0; a < objSorted.length; a++) { //更改名次圖片
                $('#score' + (a + 1)).find('img').attr("src", './carRace/' + objSorted[a] + '.png');
            }
            clearTimeout(scoreTimer);
            scoreTimer = setTimeout(function() {
                scoreRepeat();
            }, 100);
        }
    }

    //gif檔播放&停止控制器
    if ('getContext' in document.createElement('canvas')) {
        HTMLImageElement.prototype.play = function() {
            if (this.storeCanvas) {
                // 移除存储的canvas
                this.storeCanvas.parentElement.removeChild(this.storeCanvas);
                // this.storeCanvas = null;
                // 透明度还原
                // image.style.opacity = '';
                // console.log('this.storeCanvas',this.storeCanvas)
            }
            if (this.storeUrl) {
                this.src = this.storeUrl;
            }
        };
        HTMLImageElement.prototype.stop = function() {
            var canvas = document.createElement('canvas');
            // 尺寸
            var width = this.width,
                height = this.height;
            if (width && height) {
                // 存储之前的地址
                if (!this.storeUrl) {
                    this.storeUrl = this.src;
                }
                // canvas大小
                canvas.width = width;
                canvas.height = height;
                // 绘制图片帧（第一帧）
                canvas.getContext('2d').drawImage(this, 0, 0, width, height);
                // 重置当前图片
                try {
                    this.src = canvas.toDataURL("image/gif");
                } catch (e) {
                    // 跨域
                    this.removeAttribute('src');
                    // 载入canvas元素
                    canvas.style.position = 'absolute';
                    // 前面插入图片
                    this.parentElement.insertBefore(canvas, this);
                    // 隐藏原图
                    this.style.opacity = '0';
                    // 存储canvas
                    this.storeCanvas = canvas;
                }
            }
        };
    }
    function isImgLoad(selector, times, speedTest = false) {
        return new Promise((resolve, reject) => {
            // 檢查參數
            times = parseInt(times, 10)
            isNaN(times) ? times = 1 : ''

            if (typeof selector !== 'object') {
                reject('parameters err')
            }

            // 檢查秒數限制flag
            let timeFlag
            // 檢查圖片迴圈限制flag
            let intFlag

            timeFlag = setTimeout(() => {
                clearInterval(intFlag)
                reject('load test timeout')
            }, times * 100)
            intFlag = setInterval(() => {
                let count = 0
                let firstImg = ''
                for (let num = 0; num < selector.length; num++) {
                    if (selector[num].complete === true) {
                        if (selector[num].naturalWidth !== 0 && selector[num].naturalHeight !== 0 && !IsParmReady(firstImg)) {
                            firstImg = selector[num]
                        }
                        count++
                    }
                    // 如果有開啟測線功能,則回傳最快線路
                    if (speedTest && IsParmReady(firstImg)) {
                        clearInterval(intFlag)
                        clearTimeout(timeFlag)
                        resolve(firstImg)
                    } else if ((count === selector.length)) {
                        // 全部載入完成
                        clearInterval(intFlag)
                        clearTimeout(timeFlag)
                        resolve()
                    }
                }
            }, 100)
        })
    }
    function IsParmReady(par) {
        if (typeof par === 'undefined' || !par) {
            if (typeof par === 'boolean') {
                return true
            }
            if (par !== 0) {
                return false
            }
        }
        return true
    }
})(jQuery);
