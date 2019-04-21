<%@ page language="java" pageEncoding="UTF-8" %>

<!-- main header, body, footer -->
<script id="templates/BSC.html" type="text/ng-template">
  <ion-side-menus enable-menu-with-back-views="false" ng-controller="LotteryBet">

    <ion-side-menu-content>
      <ion-nav-bar class="bar-assertive">
        <ion-nav-back-button >
        </ion-nav-back-button>

        <ion-nav-buttons side="left">
          <button class="button button-icon button-clear ion-ios-arrow-back" ng-click="goback()">
          </button>
        </ion-nav-buttons>
<!--
        <ion-nav-buttons side="right">
          <button class="button button-icon button-clear ion-ios-contact-outline" menu-toggle="right">
          </button>
-->
        </ion-nav-buttons>
      </ion-nav-bar>
      <!-- 原采种选择 -->
          <span class='title' style="display: block; position: absolute; z-index: 999; top: 0px; left: 80px; right: 80px; height: 45px; line-height:45px; text-align: center; font-size: 18px; color:#fff;"
                ng-click="lotteryList.show()">${game.gameName} ▼
          </span>

      <ion-nav-view name="menuContent" >
  <ion-view view-title="${game.gameNickNameame} ▼">
 
    <ion-content style="margin-top:45px;">
			<a href="javascript:;" class="item item-icon-right lottery-choose long-choose watchCarLive" ng-if="isCarType">
				<div class="wrapCarLive" >
					收起直播
				</div>
			</a>
		
<!-- 赛车表演区 -->
<div class="nothing" ng-if="isCarType">
    <div class="wrapRace" id="wrapRace">
		<div class="alertMsgCar"><!-- 警示 -->
				<div class="msgText">
					<div class="msgTextInner"></div>
					<div class="msgConfirm">確定</div>
				</div>
		</div>
        <div class="wrap_loading"><!--loading-->
            <div class="forAbso">
                <div class="loading outer">
                    <div class="loading inner"></div>
                </div>
                <div class="loadWord">载入中</div>
            </div>
        </div>
        <div class="RaceSpace"><!-- 賽道-->
            <div class="wrapBilling"><!-- 結算畫面 -->
                <div class="billing">
                    <div class="rank">
                        <img src="/theme/wap/img/carRace/cutEND/bg_top.png">
                    </div>
                    <div class="carRank">
                        <div class="st">
                            <img src="/theme/wap/img/carRace/cutEND/carEND1.png" id="no1">
                        </div>
                        <div class="nd carMid">
                            <img src="/theme/wap/img/carRace/cutEND/carEND2.png" id="no2">
                        </div>
                        <div class="rd carMid">
                            <img src="/theme/wap/img/carRace/cutEND/carEND3.png" id="no3">
                        </div>
                    </div>
                    <div class="wrap_ribbon">
                        <div class="money_icon">
                            <img src="/theme/wap/img/carRace/cutEND/icon_money.png">
                        </div>
                        <div class="ribbon">
                            <img src="/theme/wap/img/carRace/cutEND/bg_win_money.png">
                        </div>
                        <div class="car_win_money" id="win_money">
                            +
                            <span></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="fullScreen" id="fullScreen"></div><!--lightBox-->
            <!--  -->
            <div class="startLine" id="startLine">
                <!-- 起跑線 -->
                <img src="/theme/wap/img/carRace/grid.png">
            </div>
            <div class="m300">
                <img src="/theme/wap/img/carRace/300m.png">
            </div>
            <div class="m200">
                <img src="/theme/wap/img/carRace/200m.png">
            </div>
            <div class="m100">
                <img src="/theme/wap/img/carRace/100m.png">
            </div>
            <div class="wrapCar clearfix">
                <!-- 車子 -->
                <div class="car" id="car1">
                    <div class="headScore" id="headScore1">
                        <img src="/theme/wap/img/carRace/car_number1.png">
                    </div>
                    <img src="/theme/wap/img/carRace/car01.png" id="test">
                    <img src="/theme/wap/img/carRace/speedUp.gif" class="fire" id="fire1">
                </div>
                <div class="car" id="car2">
                    <div class="headScore" id="headScore2">
                        <img src="/theme/wap/img/carRace/car_number2.png">
                    </div>
                    <img src="/theme/wap/img/carRace/car02.png">
                    <img src="/theme/wap/img/carRace/speedUp.gif" class="fire" id="fire2">
                </div>
                <div class="car" id="car3">
                    <div class="headScore" id="headScore3">
                        <img src="/theme/wap/img/carRace/car_number3.png">
                    </div>
                    <img src="/theme/wap/img/carRace/car03.png">
                    <img src="/theme/wap/img/carRace/speedUp.gif" class="fire" id="fire3">
                </div>
                <div class="car" id="car4">
                    <div class="headScore" id="headScore4">
                        <img src="/theme/wap/img/carRace/car_number4.png">
                    </div>
                    <img src="/theme/wap/img/carRace/car04.png">
                    <img src="/theme/wap/img/carRace/speedUp.gif" class="fire" id="fire4">
                </div>
                <div class="car" id="car5">
                    <div class="headScore" id="headScore5">
                        <img src="/theme/wap/img/carRace/car_number5.png">
                    </div>
                    <img src="/theme/wap/img/carRace/car05.png">
                    <img src="/theme/wap/img/carRace/speedUp.gif" class="fire" id="fire5">
                </div>
                <div class="car" id="car6">
                    <div class="headScore" id="headScore6">
                        <img src="/theme/wap/img/carRace/car_number6.png">
                    </div>
                    <img src="/theme/wap/img/carRace/car06.png">
                    <img src="/theme/wap/img/carRace/speedUp.gif" class="fire" id="fire6">
                </div>
                <div class="car" id="car7">
                    <div class="headScore" id="headScore7">
                        <img src="/theme/wap/img/carRace/car_number7.png">
                    </div>
                    <img src="/theme/wap/img/carRace/car07.png">
                    <img src="/theme/wap/img/carRace/speedUp.gif" class="fire" id="fire7">
                </div>
                <div class="car" id="car8">
                    <div class="headScore" id="headScore8">
                        <img src="/theme/wap/img/carRace/car_number8.png">
                    </div>
                    <img src="/theme/wap/img/carRace/car08.png">
                    <img src="/theme/wap/img/carRace/speedUp.gif" class="fire" id="fire8">
                </div>
                <div class="car" id="car9">
                    <div class="headScore" id="headScore9">
                        <img src="/theme/wap/img/carRace/car_number9.png">
                    </div>
                    <img src="/theme/wap/img/carRace/car09.png">
                    <img src="/theme/wap/img/carRace/speedUp.gif" class="fire" id="fire9">
                </div>
                <div class="car" id="car10">
                    <div class="headScore" id="headScore10">
                        <img src="/theme/wap/img/carRace/car_number10.png">
                    </div>
                    <img src="/theme/wap/img/carRace/car10.png">
                    <img src="/theme/wap/img/carRace/speedUp.gif" class="fire" id="fire10">
                </div>
                <div class="endLine" id="endLine">
                    <!--終點線-->
                    <img src="/theme/wap/img/carRace/grid.png">
                </div>
            </div>
        </div>
        <div class="reciprocal" id="raceReciprocal">
            <!-- 倒數 -->
            <div class="raceWood">
                <img src="/theme/wap/img/carRace/flag.png">
            </div>
            <div class="raceLight">
                <div class="light">
                    <img src="/theme/wap/img/carRace/red_light.png" id="raceLight">
                </div>
                <div class="raceNumber">
                    <img src="/theme/wap/img/carRace/sec_5.png" id="raceNum">
                </div>
            </div>
        </div>
        <div class="racePlace clearfix">
            <!-- 分數-->
            <div class="raceScore" id="score1">
                <img src="/theme/wap/img/carRace/car_number1.png">
            </div>
            <div class="raceScore" id="score2">
                <img src="/theme/wap/img/carRace/car_number2.png">
            </div>
            <div class="raceScore" id="score3">
                <img src="/theme/wap/img/carRace/car_number3.png">
            </div>
            <div class="raceScore" id="score4">
                <img src="/theme/wap/img/carRace/car_number4.png">
            </div>
            <div class="raceScore" id="score5">
                <img src="/theme/wap/img/carRace/car_number5.png">
            </div>
            <div class="raceScore" id="score6">
                <img src="/theme/wap/img/carRace/car_number6.png">
            </div>
            <div class="raceScore" id="score7">
                <img src="/theme/wap/img/carRace/car_number7.png">
            </div>
            <div class="raceScore" id="score8">
                <img src="/theme/wap/img/carRace/car_number8.png">
            </div>
            <div class="raceScore" id="score9">
                <img src="/theme/wap/img/carRace/car_number9.png">
            </div>
            <div class="raceScore" id="score10">
                <img src="/theme/wap/img/carRace/car_number10.png">
            </div>
            <hr class="whiteLine">
        </div>
    </div>
</div>
<!-- 賽車表演區結束 -->

      <a href="javascript:;" class="item item-icon-right lottery-choose long-choose" ng-click="numbersList.show()">
 	      <div class="middleArea">
 		 	 <div ng-show="isIssueNeedFlag"><font class="assertive font12"> {{ lotteryResults.last.issue}} </font>期</div>
          	 <span ng-show="!isIssueNeedFlag">开奖号码</span>

          	  <div class="ballArea">
			      <font ng-repeat="small in lastResultShow" class="{{small.class}}">{{small.no}}</font>
		      </div>
          </div>
			<i class="icon ion-chevron-down icon-accessory"></i>
      </a>

      <a href="javascript:;" class="item item-icon-right lottery-choose" ng-show="isIssueNeedFlag">
          <font class="assertive font12">{{lotteryResults.current.issue}}</font> 期  倒计时 <span id="clock">00:00:00</span>
      </a>

      <a href="javascript:;" ng-click="playList.show()" class="item item-icon-right lottery-choose">
        {{selNav.title}} / {{selPlay.desc}}
        <i class="icon ion-chevron-right icon-accessory"></i>
      </a>
      <div class="lottery-tip pull-left">{{ selPlay.methoddesc}}{{selPlay.prizeDesc }}</div>
      <div class="betrecord_btn pull-right">
        <a href="../../pro/betCenter/bet?pageGameId=${game.id}&playId=${playId}">
        <img src="/theme/wap/img/betrecord_PK10.png" alt="">
          <p>投注记录</p>
        </a>
      </div> 
      <div class="clearfix"></div>
       	<label class="item item-input" ng-if="selPlay.selectarea.type == 'input'">
            <textarea id="inputNumber" ng-model="betContent.inputNumber" placeholder="
                {{
                    (gameId == 'BJPK
' || gameId == 'JX11X5' || gameId == 'GD11X5' || gameId == 'SD11X5' || gameId == 'SH11X5' || gameId == 'HLJ11X5' || gameId == 'XJ11X5' || gameId == 'JS11X5')?'每注的号码之间使用空格分隔，注与注之间使用逗号或者分号或者回车换行分隔，注意：不足2位要在前面加0。':'注与注之间使用逗号或者分号或者回车换行分隔'
                }}">
            </textarea>
      	</label>
      <div class="position-list" style="overflow: auto; margin: 10px 0px;" ng-if="selPlay.selectarea.selPositionArray != null">
        <div class="" style="float: left; font-size: 100%; padding: 0px 10px; line-height: 33px; ">选择位置</div>
        <div class="bottom-button-g" style="float: left;">
          <a href="javascript:;"
             ng-repeat="pos in selPlay.selectarea.selPositionArray"
             class="{{ pos.sel == true ? 'active' : ''}}"
             ng-click="changePosition(pos)"
            >{{pos.text}}</a>
        </div>
      </div>
      <div class="ball-list" ng-style="">
        <div ng-repeat="layout in selPlay.selectarea.layout">          
          <div class="lottery-side" ng-if="layout.title != ''">
            <div class="lottery-wei">{{layout.title}}<em></em><i></i></div>
            <!--<div class="lottery-lose">遗漏</div>-->
          </div>
          <div class="{{optionData('class')}}{{titleShow ? ' classTitle' : ''}}">
            <div class="row" ng-repeat="row in layout.noArray">
              <div class="col col-{{optionData('col')}} default {{layout.selNumbers[n] ? ' active' : ''}}" ng-repeat="n in row" ng-click="selectNumber(layout, n)">
                <a href="javascript:;" class="{{getBallColor(n)}}{{layout.selNumbers[n] ? ' active' : ''}}{{optionData('contentClass')}}">{{n}}</a>
                <span ng-if=optionData('showPlus') class="{{getBallColor(n)}}{{layout.selNumbers[n] ? ' active' : ''}}">{{getRebuildShow(n)}}</span>
              </div>

            </div>
          </div>
          <div class="line"></div>
        </div>
      </div>
      <div style="height:93px"> </div>
    </ion-content>
  </ion-view>
</ion-nav-view>
    </ion-side-menu-content>

    <ion-side-menu side="left">
      <%@ include file="../layout/left.jsp"%>
    </ion-side-menu>

    <ion-side-menu side="right">
      <%@ include file="../layout/right.jsp"%>
    </ion-side-menu>

    <footer class="bar bar-footer bar-stable has-tabs showBlock" ng-show="playType!='BSC'">
      <div class="bottom-button-g" ng-if="selRebate != null">
        <c:choose>
            <c:when test='${pubSiteGame.resetRebate}'>
                <c:set var ="subVal" value="-0.1"/>
                <c:set var ="addVal" value="0.1"/>
                <c:set var="rebateColor" value="color: black"/>
            </c:when>
            <c:otherwise>
                <c:set var ="subVal" value="-10.3"/>
                <c:set var ="addVal" value="10.3"/>
                <c:set var="rebateColor" value="color: #A4A4A4"/>
            </c:otherwise>
        </c:choose>
        <a class="b-left" on-touch="changeRebate(${subVal})" on-hold="initChangeRebateEvent(${subVal})" on-release="clearValidClick()"><i class="icon ion-minus"></i></a>
        奖金<input id="iRebateInput" readonly="readonly" type="text" style="width: 120px; ${rebateColor}"  value="{{selRebate.displayValue}}">
        <a class="b-right" on-touch="changeRebate(${addVal})" on-hold="initChangeRebateEvent(${addVal})" on-release="clearValidClick()"><i class="icon ion-plus"></i></a>
      </div>
      <div class="bottom-button-letter" ng-if="specialRebateShow()">
        赔率
      </div>
      <div class="bottom-button-g" ng-if="specialRebateShow()">
        <a href="javascript:;" ng-repeat="rebate in specialRebet"
           ng-click="setSpecialRebetNum(rebate.show)"
           style="padding:0 6px;"
           class="{{ specialRebetNum == rebate.real ? 'active' : ''}}"> {{ rebate.show }} </a>
      </div>

      <div class="bottom-button-g">
        <a href="javascript:;" ng-repeat="mode in selPlay.modes"
           id="mode{{mode.modeid}}"
           ng-click="changeSelMode(mode)"
           class="{{ selMode == mode ? 'active' : ''}}"> {{ mode.name }} </a>
      </div>
    </footer>
	<%-- footer --%>
        <nav class="tabs tabs-icon-top tabs-dark">
          <div class="bottom-bar">
            <button id="btnCR" class="button button-energized button-outline bottom-button bottom-button-l" ng-click="randomBetSelect()">机选</button>
            {{selBetCount}}注 共{{selBetMoney}}元
            <button class="button button-assertive bottom-button bottom-button-r" ng-click="saveSelBet()">选定</button>
          </div>
        </nav>

  </ion-side-menus>
</script>

<!-- body content -->
<script id="templates/home.html" type="text/ng-template">

</script>

<%--历史开奖记录 --%>
<script id="templates/numbersListBSC.html" type="text/ng-template">
  <ion-modal-view>
    <ion-header-bar class="bar bar-header bar-light">
      <button class="button button-icon button-clear ion-ios-arrow-back" ng-click="numbersList.hide()">
          </button>
      <h1 class="title">往期开奖号码</h1>
    </ion-header-bar>
    <ion-content>
        <button id="datePick" class="button button-positive button-block" style="border-radius: 4px; margin: 14px 0 14px 14px;width: 144px; height: 42px; background: #e71516; border: none; color:#FFFFFF" ng-click="openDatePickerOne()"> {{ selectedDate1 }} </button>
      <div class="list">
        <div class="lottery-kj" ng-show="isIssueNeedFlag">
          <div class="lottery-qs">{{lotteryResults.current.issue}} 期<em></em><i></i></div>
          <div class="lottery-num">预计{{lotteryResults.current.remain}}分钟后开奖</div>
        </div>

        <div ng-if="selectedDate1 == (servertime|limitTo:10)" class="lottery-kj" ng-repeat="item in lotteryResults.top10History">
          <div class="lottery-qs">{{item.issue}} 期<em></em><i></i></div><div class="lottery-num"> {{ item.result | lresult }} </div><!--<div class="lottery-num"> {{ item.createDate}} </div>-->
        </div>

        <div ng-if="selectedDate1 < (servertime|limitTo:10)" class="lottery-kj" ng-repeat="item in lotteryResults.history">
          <div class="lottery-qs">{{item.issue}} 期<em></em><i></i></div><div class="lottery-num"> {{ item.result | lresult }} </div><!--<div class="lottery-num"> {{ item.createDate}} </div>-->
        </div>

        <button class="button button-full button-light mt10" ng-click="numbersList.hide()">收起</button>
      </div>
    </ion-content>
  </ion-modal-view>
</script>

<%-- 所有采种列表 --%>
<script id="templates/lotteryListBSC.html" type="text/ng-template">
  <ion-modal-view>
    <ion-header-bar class="bar bar-header bar-light">
      <button class="button button-icon button-clear ion-ios-arrow-back" ng-click="lotteryList.hide()">
      </button>
      <h1 class="title">选择彩种</h1>
    </ion-header-bar>
    <ion-content>
      <ion-list>
		<ion-item ng-repeat="item in allGames" ng-if="item.playId == playType">
			<a href="/wap/lottery/{{item.id}}/bet#/{{item.playId}}/{{item.id}}" style="color: #555;display:block;" >{{item.gameNickName}}</a>
       </ion-item>
		 <!--<ion-item ng-repeat="item in sameTypeGames">
			<a ng-click="jumpCheck('{{item.playId}}','{{item.id}}')" style="color: #555;display:block;" ng-if="item.playId == playType">{{item.gameName}}</a>
        </ion-item> -->
      </ion-list>
    </ion-content>
  </ion-modal-view>
</script>

<%-- 彩种玩法列表 --%>
<script id="templates/playListBSC.html" type="text/ng-template">
  <ion-modal-view class="wrapPlayNav">
    <!-- <ion-header-bar class="bar bar-header bar-light">
      <h1 class="title">选择玩法</h1>
    </ion-header-bar> -->
    <ion-content class="padding">
          <div class="lottery-wf">
            <a href="javascript:;" class="{{ selNav.title == playNav.title ? 'active' : ''}}"
               ng-click="changeSelNav(playNav)"
               ng-repeat="playNav in betPlays">{{playNav.title}}</a>
          </div>
          <div ng-repeat="playNav2 in selNav.label">
            <div class="lottery-wf-t nb">{{playNav2.gtitle}}</div>
            <div class="lottery-wf">
              <a href="javascript:;" ng-repeat="item in playNav2.label"
                 class="{{ item.methodid == selPlay.methodid ? 'active' : ''}}"
                 ng-click="changeSelPlay(item); 
				<c:if test="${game.playId eq 'SSC' || game.playId eq 'FFC' || game.playId eq 'K3'}">
					playList.hide();
 				</c:if>
				">{{item.desc}}</a>
            </div>
          </div>
          <c:if test="${game.playId ne 'SSC' && game.playId ne 'FFC' && game.playId ne 'K3'}">
            <button class="button button-full button-assertive" ng-click="playList.hide()">确定</button>
          </c:if>
    </ion-content>
  </ion-modal-view>
</script>

<%-- 注单 --%>
<script id="templates/betListBSC.html" type="text/ng-template">
  <ion-modal-view class="h_100">
    <ion-header-bar class="bar bar-header bar-light">
      <h1 class="title">已选的注单</h1>
    </ion-header-bar>
    <ion-content class="padding bgc_white">
      <div class="button-bar bar-light">
        <a class="button" ng-click="backToBetSelect()"><i class="icon ion-ios-plus-outline"></i> 添加手选</a>
        <a class="button" ng-click="backToRandomBetSelect()" ng-if="selPlay.selectarea.type != 'input'"><i class="icon ion-ios-plus-outline"></i> 添加机选</a>
      </div>


<div class="lottery-note">
    <div class="lottery-note-t"></div>
    <div class="lottery-note-list">
        <ion-scroll zooming="true" direction="y" style="height: {{betListScH}}px; ">
        <dl ng-if="betContent.items.length < 1">
            <dt>
                <font class="assertive font16" style="text-align: center;">目前还没有任何选注内容</font>
            </dt>
        </dl>
        <dl ng-repeat="item in betContent.items">
            <dt>
                <font class="assertive font16" style="word-break: break-all;">{{ item.betText.length > 70 ? item.betText.substring(0, 70) + '...' : item.betText}}</font>
                <span>{{ item.title }} {{ item.nums }}注</span>
            </dt>
            <dd><a href="javascript:;" ng-click="delBetContent($index)"><i class="icon ion-ios-close"></i></a></dd>
        </dl>
        </ion-scroll>
    </div>
    <div class="lottery-note-bottom"><a href="javascript:;" ng-click="clearBetContent()">清空投注内容</a></div>
</div>

    </ion-content>

      <div class="bar bar-stable has-tabs" style=" font-size:12px">
        <div class="bottom-button-g" style="flex: none; color: black;">
        <c:choose>
            <c:when test='${pubSiteGame.multipleBet}'>
                <a ng-click="betContent.times = (betContent.times - 1) || 1 " class="b-left"><i class="icon ion-minus"></i></a>
                 投<input type="tel" ng-model="betContent.times" style="width:50px" ng-blur="blurCheckTimes()">倍
                <a ng-click="betContent.times = (betContent.times + 1) || 1" class="b-right"><i class="icon ion-plus"></i></a>
            </c:when>
            <c:otherwise>
                <a class="b-left" style="color: #A4A4A4"><i class="icon ion-minus"></i></a>
                投<input type="tel" style="width: 60px" readonly="readonly" value="1">倍
                <a class="b-right" style="color: #A4A4A4"><i class="icon ion-plus"></i></a>
            </c:otherwise>
        </c:choose>
        </div>
        <div class="bottom-button-g" style="flex: none; color: black;" ng-show="isIssueNeedFlag && playType != 'LHC'">
        <c:choose>
            <c:when test='${pubSiteGame.purseNumber}'>
                  <a ng-click="betContent.trace = (betContent.trace - 1) || 1" class="b-left"><i class="icon ion-minus"></i></a>
                  追<input type="tel" ng-model="betContent.trace" min="1" ng-blur="blurCheckTrace()">期
                  <a ng-click="betContent.trace = (betContent.trace + 1) || 1" class="b-right"><i class="icon ion-plus"></i></a>
            </c:when>
            <c:otherwise>
                  <a><i class="icon ion-minus"></i></a>
                  追<input type="tel" ng-model="betContent.trace" min="1" ng-blur="blurCheckTrace()" readonly="readonly">期
                  <a class="b-right"><i class="icon ion-plus"></i></a>
            </c:otherwise>
        </c:choose>
        </div>
        <div class="bottom-ck" ng-show="isIssueNeedFlag && playType != 'LHC'">
          <label class="checkbox checkbox-assertive" style=" font-size:12px">
            <input type="checkbox" ng-model="betContent.traceStop" style="width: 25px; height: 25px">
            中奖追停</label>
        </div>
        <div class="bottom-ck" ng-show="!isIssueNeedFlag">
          <label class="" style="font-size:12px">
                      连续<br/>开奖
          </label>
        </div>
        <div class="bottom-button-g ml5" ng-show="!isIssueNeedFlag">
        <a href="javascript:;" ng-repeat="bet in betTimes"
           ng-click="setBetTimes({{bet.times}})"
           class="{{betTimesNow == bet.times ? 'active' : ''}} {{bet.classPlus}}">{{bet.times}}</a>
      </div>
      </div>

      <div class="tabs tabs-icon-top tabs-dark">
      <div class="bottom-bar">
        <span>{{ betContent.count }}注 共{{ betContent.totalMoney }}元</span>
        <button id="btnPaySubmit" ng-show="isIssueNeedFlag" class="button button-assertive bottom-button bottom-button-r" ng-click="checkSubmit()">付款</button>
        <button id="btnNoIssueSubmit" ng-show="!isIssueNeedFlag" class="button button-assertive bottom-button bottom-button-r" ng-click="checkSubmit()">马上开奖</button>
      </div>
      </div>

  </ion-modal-view>
</script>