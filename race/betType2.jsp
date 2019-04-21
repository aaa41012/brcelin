<%@ page language="java" pageEncoding="UTF-8" %>
<!-- main header, body, footer -->
<script id="templates/SSC.html" type="text/ng-template">
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
		<%-- header --%>
            <div class="wrap_playTitle clearfix">
              <div class="playTitle uc_center_playTitle">
                  <span>玩法</span>
                  <span>
                      {{methodnameDisplay}}
                      <i class="icon ion-arrow-down-b yelArr"></i>
                  </sapn>
              </div>
           </div>
          <div class="nowPage">
              <span>{{gameNameNow}}</span>
              <i class="icon ion-arrow-down-b whiteArr"></i>
          </div>
		  <div class="rightTopArea">
              <div class="rightTopArr"></div>
              <ion-item ng-repeat="item in sameTypeGames">
                 <a ng-click="jumpCheck('{{item.playId}}','{{item.id}}')" style="color: #555;display:block;">{{item.gameNickName}}</a>
              </ion-item>
          </div>

          <div class="wrapPlayList">
              <div class="playListfff">
                  <div class="lottery-wf boxsh">
                    <a href="javascript:;" class="{{ selNav.title == playNav.title ? 'active' : ''}}"
                       ng-click="changeSelNav(playNav)"
                       ng-repeat="playNav in betPlays">{{playNav.title}}</a>
                  </div>
            		<div class="wrap_playtype">
                      <div class="betType" ng-repeat="playNav2 in selNav.label">
                        <div class="lottery-wf-t nb vip">
                            {{playNav2.gtitle}}
                        </div>
                        <div class="lottery-wf">
                          <a href="javascript:;" ng-repeat="item in playNav2.label"
                             class="{{ item.methodid == selPlay.methodid ? 'active' : ''}} bacfff"
                             ng-click="changeSelPlay(item); hideA();">{{item.desc}}</a>
                        </div>
                      </div>
            		</div>
        		</div>
           </div>

          </div>
      <ion-nav-view name="menuContent">
    <div class="wrapOpenTime clearfix">
        <div class="brw50">
              <div class="middleArea">
                 <div ng-show="isIssueNeedFlag" class="font7em issueOpen">
                     <font class="assertive"> {{lastIssueDisplay}} </font>
                     期
                     <i class="icon ion-chevron-down icon-accessory downArr"></i>
                 <%--<span ng-show="!isIssueNeedFlag" class="openNumnum">开奖号码</span>--%>
				 <span class="openNumnum">开奖号码</span>
			</div>
                  <div class="ballArea">
                      <!-- <font ng-repeat="small in lastResultShow" class="{{small.class}} showopenNo">{{small.no}}</font> -->
                      <div class="wrapCount">
                          <font class="ball-small ballPlus count0"></font>
                          <font class="ball-small ballPlus count1"></font>
                          <font class="ball-small ballPlus count2"></font>
                          <font class="ball-small ballPlus count3"></font>
                          <font class="ball-small ballPlus count4"></font>
                      </div>
                  </div>
              </div>
        </div>
        <div class="brtime">
            <a href="javascript:;" class="item" ng-show="isIssueNeedFlag">
                <font class="assertive font7em">{{currentTempIssue}}</font> 期投注截止<div id="clock">00:00:00</div>
            </a>
        </div>
    </div>
    <div class="wrap_lotteryNo clearfix">
        <div class="lotteryNo_title clearfix">
            <div>期号</div>
            <div>开奖号码</div>
            <div>开奖时间</div>
        </div>
        <div class="lottery_number clearfix" ng-repeat="result in lotteryResults.top10History">
            <div class="Separate">{{result.issue}}</div>
            <div>{{result.resultDisplay}}</div>
            <div>{{result.createDate}}</div>
        </div>
    </div>
    <ion-content>
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

      <%-- <a href="javascript:;" ng-click="playList.show()" class="item item-icon-right lottery-choose">
        {{selNav.title}} / {{selPlay.desc}}
        <i class="icon ion-chevron-right icon-accessory"></i>
      </a> --%>
      <div class="lottery-tip pull-left" ng-bind-html="(selPlay.methoddesc)+(selPlay.prizeDesc)">{{selPlay.methoddesc}} {{selPlay.prizeDesc}}</div>
      <div class="betrecord_btn pull-right">
        <a href="../../pro/betCenter/bet?pageGameId=${game.id}&playId=${playId}">
          <img src="/theme/wap/img/betrecord_ssc.png" alt="">
          <p>投注记录</p>
        </a>
      </div> 
      <div class="clearfix" style="background-color:rgb(245, 241, 228);"></div>
			<label class="item item-input" ng-if="selPlay.selectarea.type == 'input'">
            <textarea id="inputNumber" ng-model="betContent.inputNumber" placeholder="
                {{
                    (gameId == 'BJPK
' || gameId == 'JX11X5' || gameId == 'GD11X5' || gameId == 'SD11X5' || gameId == 'SH11X5' || gameId == 'HLJ11X5' || gameId == 'XJ11X5' || gameId == 'JS11X5')?'每注的号码之间使用空格分隔，注与注之间使用逗号或者分号或者回车换行分隔，注意：不足2位要在前面加0。':'每1个号码之间请用空格( )、逗号(,)、分号(;)隔开'
                }}">
            </textarea>
      	</label>
	</div>
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
      <div class="ball-list" ng-if="selPlay.selectarea.type != 'input'" ng-style="">
     <%-- ng if 0413  ng-if="selPlay.selectarea.type != 'input' --%>
        <!-- <div ng-repeat="layout in selPlay.selectarea.layout" ng-class="methodnameNow = 'ZXHZ' ? '' :'p10p'"> -->
        <div ng-repeat="layout in selPlay.selectarea.layout" class="p10p">
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
          <%-- <div class="line"></div> --%>
        </div>
      </div>
      <div style="height:120px; background:rgb(245, 241, 228); margin-top: -15px;"> </div>
    </ion-content>
      </ion-nav-view>
    </ion-side-menu-content>

    <ion-side-menu side="left" is-enabled="false">
      <%@ include file="../layout/left.jsp"%>
    </ion-side-menu>

    <ion-side-menu side="right" is-enabled="false">
      <%@ include file="../layout/right.jsp"%>
    </ion-side-menu>

    <footer ng-class="selBetCount > 0 ? 'bar bar-footer has-tabs showBlock disB' : 'bar bar-footer has-tabs showBlock disN'">
      <div class="bottom-button-g" ng-if="selRebate != null">
        <!-- <c:choose>
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
        </c:choose> -->
        <!-- <a class="b-left" on-touch="changeRebate(${subVal})" on-hold="initChangeRebateEvent(${subVal})" on-release="clearValidClick()"><i class="icon ion-minus"></i></a>
        奖金<input id="iRebateInput" readonly="readonly" type="text" style="width: 120px; ${rebateColor}"  value="{{selRebate.displayValue}}">
        <a class="b-right" on-touch="changeRebate(${addVal})" on-hold="initChangeRebateEvent(${addVal})" on-release="clearValidClick()"><i class="icon ion-plus"></i></a>
      </div>
      <div class="bottom-button-letter" ng-if="specialRebateShow()">
        赔率
      </div> -->
      <div class="wrapbetRate clearfix">
           <div class="bottom-button-g fl" style="color: black;">
                <a ng-click="(betContent.times = (betContent.times - 1) || 1);refreshBetMoney();_restTotalMoney();" class="b-left">
                    <i class="icon ion-minus" style="color:#a3a3a3;"></i>
                </a>
                    <input type="tel" ng-model="betContent.times" style="width:70px" ng-blur="blurCheckTimes();" class="ng-pristine ng-untouched ng-valid">
                <a ng-click="(betContent.times = (betContent.times + 1) || 1);refreshBetMoney();_restTotalMoney();" class="b-right">
                    <i class="icon ion-plus" style="color:#a3a3a3;"></i>
                </a>
                <span>倍</span>
            </div>
      <!-- <div class="bottom-button-g" ng-if="specialRebateShow()">
        <a href="javascript:;" ng-repeat="rebate in specialRebet"
           ng-click="setSpecialRebetNum(rebate.show)"
           style="padding:0 6px;"
           class="{{ specialRebetNum == rebate.real ? 'active' : ''}}"> {{ rebate.show }} </a>
      </div> -->

          <div class="bottom-button-g fr">
            <a style="border:1px solid #ddd; border-left:none;" href="javascript:;" ng-repeat="mode in selPlay.modes"
               id="mode{{mode.modeid}}"
               ng-click="changeSelMode(mode)"
               class="{{ selMode == mode ? 'active' : ''}}"> {{ mode.name }} </a>
          </div>
        </div>
    </footer>

	<%-- footer --%>
        <nav class="tabs tabs-icon-top tabs-dark pt0 footBet">
          <div class="bottom-bar flFoot clearfix">
                <button id="btnCR" class="button button-energized button-outline bottom-button bottom-button-l" ng-click="randomBetSelect()">机选</button>
                <div ng-class="selBetCount > 0 ? 'wrapFootBet redLight moneyLeft clearfix' : 'wrapFootBet blackLight moneyLeft clearfix'" ng-click="saveSelBet()">
                    <div ng-class="selBetCount > 0 ? 'wrapil op1' : 'wrapil op0'">
                        <i class="icon ion-plus plusIcon"></i>
                    </div>
                    <div class="wrapFootBet">
                        <div class="wrapBet">
                        共<span class="selBetCount">{{selBetCount}}</span>注 ,{{selBetMoney}}元
                            <div ng-class="selBetCount > 0 ? 'selectedNo disB' : 'selectedNo disN'">
                             {{displaySelStr}}
                            {{betContent.inputNumber}}
                            </div>
                        </div>
                    </div>
                    <span ng-class="selBetCount > 0 ? 'blackTran redBor' : 'blackTran blackBor'"></span>
                </div>
                <div class="wrapBucket">
                    <span class="garbage">
                        <!-- <span ng-class="selBetCount > 0 ? 'noRed disB' : 'noRed disN'"> -->
                   <!-- <img src="/theme/wap/img/yingjia/bucket.png">  -->
				<i data-v-38d0f610="" class="iconfont"><em data-v-38d0f610="" style="display: none;">0</em></i>
                        <span ng-show="betContent.count > 0" ng-class="betContent.count > 0 ? 'noRed disB' : 'noRed disN'">
                            <span ng-if="betContent.items.length < 10">{{  betContent.items.length }}</span>
                            <span ng-if="betContent.items.length >= 10" style="font-size:8px;left:5px;">{{ betContent.items.length }}</span>
                        </span>
 					<button class="button button-assertive transparent numberbusket" ng-click="betList.show()">
                        	号码篮
                    </button>
                    </span>

                </div>
            </div>
        </nav>
  </ion-side-menus>
</script>

<!-- body content -->
<script id="templates/home.html" type="text/ng-template">
<ion-view>
  </ion-view>
</script>

<%--历史开奖记录 --%>
<script id="templates/numbersListSSC.html" type="text/ng-template">
  <ion-modal-view>
    <ion-header-bar class="bar bar-header bar-light">
      <button class="button button-icon button-clear ion-ios-arrow-back" ng-click="numbersList.hide()">
          </button>
      <h1 class="title">往期开奖号码</h1>
    </ion-header-bar>
    <ion-content>
        <button id="datePick" class="button button-positive button-block" style="border-radius: 4px; margin: 14px 0 14px 14px;width: 144px; height: 42px; background: #e71516; border: none" ng-click="openDatePickerOne()"> {{ selectedDate1 }} </button>
      <div class="list">
        <div class="lottery-kj" ng-show="isIssueNeedFlag">
          <div class="lottery-qs">{{lotteryResults.current.issue}} 期<em></em><i></i></div>
          <div class="lottery-num">预计{{lotteryResults.current.remain}}分钟后开奖</div>
        </div>
        <div class="lottery-kj" ng-repeat="item in lotteryResults.top10History">
          <div class="lottery-qs">{{item.issue}} 期<em></em><i></i></div><div class="lottery-num"> {{ item.result | lresult }} </div><div class="lottery-num"> {{ item.createDate}} </div>
        </div>
        <button class="button button-full button-light mt10" ng-click="numbersList.hide()">收起</button>
      </div>
    </ion-content>
  </ion-modal-view>
</script>

<%-- 所有采种列表 --%>
<script id="templates/lotteryListSSC.html" type="text/ng-template">
  <ion-modal-view>
    <ion-header-bar class="bar bar-header bar-light">
      <button class="button button-icon button-clear ion-ios-arrow-back" ng-click="lotteryList.hide()">
      </button>
      <h1 class="title">选择彩种</h1>
    </ion-header-bar>
    <ion-content>
      <ion-list>
<!--
        <ion-item ng-repeat="item in allGames">
			<a href="/wap/lottery/{{item.id}}/bet" style="color: #555;display:block;" ng-if="item.playId == playType">{{item.gameName}}</a>
        </ion-item> -->

        <ion-item ng-repeat="item in sameTypeGames">
			<a href="/wap/lottery/{{item.id}}/bet" style="color: #555;display:block;" ng-if="item.playId == playType">{{item.gameName}}</a>
        </ion-item>
      </ion-list>
    </ion-content>
  </ion-modal-view>
</script>

<%-- 彩种玩法列表 --%>
<script id="templates/playListSSC.html" type="text/ng-template">
  <ion-modal-view class="wrapPlayNav">
    <!-- <ion-header-bar class="bar bar-header bar-light">
      <h1 class="title">选择玩法</h1>
    </ion-header-bar> -->
    <ion-content class="scrollForSSC">
          <div class="lottery-wf boxsh">
            <a href="javascript:;" class="{{ selNav.title == playNav.title ? 'active' : ''}}"
               ng-click="changeSelNav(playNav)"
               ng-repeat="playNav in betPlays">{{playNav.title}}</a>
          </div>
		<div class="wrap_playtype">
          <div class="betType" ng-repeat="playNav2 in selNav.label">
            <div class="lottery-wf-t nb vip">
                {{playNav2.gtitle}}
            </div>
            <div class="lottery-wf">
              <a href="javascript:;" ng-repeat="item in playNav2.label"
                 class="{{ item.methodid == selPlay.methodid ? 'active' : ''}} bacfff"
                 ng-click="changeSelPlay(item); playList.hide();">{{item.desc}}</a>
            </div>
          </div>
		</div>
		</div>
    </ion-content>
  </ion-modal-view>
</script>

<%-- 注单 --%>
<script id="templates/betListSSC.html" type="text/ng-template">
  <ion-modal-view class="modal_full h_100">
    <ion-header-bar class="bar bar-header bar-light bucketHead">
        <span class="backArr" ng-click="betList.hide()">
            <i class="icon ion-chevron-left"></i>
        </span>
      <h1 class="title">号码篮</h1>
    </ion-header-bar>
    <div class="button-bar bar-light bar_btn">
        <div class="wrapA">
            <%-- <a class="button top_btn" ng-click="randomBetSelect()" ng-if="selPlay.selectarea.type != 'input'"><i class="icon ion-plus topPlus"></i> 机选1注</a>--%>
              <a class="button top_btn" ng-click="randomBetSelect()"><i class="icon ion-plus topPlus"></i> 机选1注</a>
        </div>
        <div class="wrapA">
            <%--<a class="button top_btn" ng-click="randomFiveBetSelect()" ng-if="selPlay.selectarea.type != 'input'"><i class="icon ion-plus topPlus"></i> 机选5注</a>--%>
            <a class="button top_btn" ng-click="randomFiveBetSelect()"><i class="icon ion-plus topPlus"></i> 机选5注</a>
        </div>
        <div class="wrapA">
            <a class="button top_btn" ng-click="backToBetSelect()"><i class="icon ion-plus topPlus"></i>继续选号</a>
        </div>
    </div>
    <ion-content class="padding">


<div class="lottery-note" ng-if="betContent.count > 0">
    <div class="lottery-note-list" ng-if="betContent.count > 0">
        <ion-scroll zooming="true" direction="y" overflow-scroll="true" class="listHeight" style="height:{{betListScH}}px;">
        <div class="forboxsh">
        <dl ng-if="betContent.items.length < 1">
            <dt>
                <font class="assertive font16" style="text-align: center;"></font>
            </dt>
        </dl>
        <dl ng-repeat="item in betContent.items">
            <dt>

                <font class="assertive font16 redText" style="word-break: break-all;">{{ item.betText.length > 70 ? item.betText.substring(0, 70) + '...' : item.betText}}</font>
                <span class="uc_width">{{ item.title }} {{ item.nums }}注x{{item.rate*2}}元x{{item.times}}倍 = {{item.money}}元</span>

            </dt>
            <dd><a href="javascript:;" ng-click="delBetContent($index)"><i class="icon ion-minus-circled minus"></i></a></dd>
        </dl>
        <div class="lottery-note-bottom clearfix" ng-if="betContent.count > 0">
            <div class="chaseNo">
                <label class="checkLabel">
                    <input type="checkbox" ng-model="betContent.traceClicked" name="" value="" class="checkClass" ng-click="traceHandle()">&nbsp追号
                </label>
            </div>
            <div class="clearNo" ng-click="clearBetContent()">
                <span class="ion-trash-a clearOut" aria-hidden="true" ng-click="clearBetContent();">清空</span>
            </div>
            <!-- <a href="javascript:;"></a> -->
        </div>
        </div>
        </ion-scroll>
    </div>


</div>
    </ion-content>


      <div class="bar bar-stable has-tabs winStop traceArea clearfix" style=" font-size:12px;display:none">

        <div class="bottom-button-g btn_g" style="flex: none; color: black;">
        <c:choose>
            <c:when test='${pubSiteGame.multipleBet}'>
                <!-- <a ng-click="betContent.times = (betContent.times - 1) || 1 " class="b-left"><i class="icon ion-minus"></i></a> -->
                 投<input class="borderInput" type="tel" ng-model="betContent.times" style="width:50px" ng-blur="blurCheckTimes()">倍
                <!-- <a ng-click="betContent.times = (betContent.times + 1) || 1" class="b-right"><i class="icon ion-plus"></i></a> -->
            </c:when>
            <c:otherwise>
                <!-- <a class="b-left" style="color: #A4A4A4"><i class="icon ion-minus"></i></a> -->
                投<input class="borderInput" type="tel" style="width: 60px" readonly="readonly" value="1">倍
                <!-- <a class="b-right" style="color: #A4A4A4"><i class="icon ion-plus"></i></a> -->
            </c:otherwise>
        </c:choose>
        </div>
        <div class="bottom-button-g btn_g" style="flex: none; color: black;" ng-show="isIssueNeedFlag && playType != 'LHC'">
        <c:choose>
            <c:when test='${pubSiteGame.purseNumber}'>
                  <!-- <a ng-click="betContent.trace = (betContent.trace - 1) || 1" class="b-left"><i class="icon ion-minus"></i></a> -->
                  追<input class="borderInput" type="tel" ng-model="betContent.trace" min="1" ng-blur="blurCheckTrace()">期
                  <!-- <a ng-click="betContent.trace = (betContent.trace + 1) || 1" class="b-right"><i class="icon ion-plus"></i></a> -->
            </c:when>
            <c:otherwise>
                  <!-- <a><i class="icon ion-minus"></i></a> -->
                  追<input class="borderInput" type="tel" ng-model="betContent.trace" min="1" ng-blur="blurCheckTrace()" readonly="readonly">期
                  <!-- <a class="b-right"><i class="icon ion-plus"></i></a> -->
            </c:otherwise>
        </c:choose>
        </div>
        <div class="bottom-ck float_right" ng-show="isIssueNeedFlag && playType != 'LHC'">
          <label class="checkbox checkbox-assertive checkpor uc_btn_width" style=" font-size:12px">
            <input type="checkbox" ng-model="betContent.traceStop" class="nomalcheck">
            中奖追停
         </label>
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
      <div class="bottom-bar wrap_btm">
        <div class="btn_fl">
            <span class="span_bet">
                方案{{ betContent.count }}注 ,{{ betContent.totalMoney }}元
            </span>
            <div ng-show="!betContent.traceClicked">
                普通投注
            </div>
            <div ng-show="betContent.traceClicked">
                投{{betContent.times}}倍，追{{betContent.trace}}期
            </div>
            <span class="blackTran"></span>
        </div>
        <div class="btn_fr">
            <button id="btnPaySubmit" ng-show="isIssueNeedFlag" class="button uc_position" ng-click="checkSubmit()">立即投注</button>
            <button id="btnNoIssueSubmit" ng-show="!isIssueNeedFlag" class="button button-assertive bottom-button bottom-button-r" ng-click="checkSubmit()">马上开奖</button>
        </div>
      </div>
      </div>

  </ion-modal-view>
</script>
