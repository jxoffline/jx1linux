ONECARDACTIVITY_OPEN = nil	--一卡通促销开关

---------------- 领取赠送物品 ---------------------------------
function onGift()
	-- Say("礼官：今天没有物品赠送，改天再来吧！", 0)	
	-- Say("礼官：剑网最新活动，2004年9月22日-10月1日早上系统维护前，充35元卡即送<color=blue>10个仙草露<color>(1小时内经验翻倍)。领取前请整理好你的背包，以防放不下(10个格)。", 2, "我要领取/get_gift_XianCaoLu", "等会再来/onCancel")
	-- Say( "礼官：剑网最新活动<color=yellow>\"水晶风暴\"<color>，2004年10月13日-10月21日早上系统维护前，充35元卡即可从我这里领取到1颗<color=yellow>水晶<color>。领取前请整理好你的背包，以防放不下。", 2, "我要领取/get_gift_Crystal", "等会再来/onCancel" );
	-- Say("礼官：剑网最新活动，2004年10月22日-11月1日早上系统维护前，充35元卡即送<color=yellow>5个大福缘露<color>。领取前请整理好你的背包，以防放不下(5个格)。", 2, "我要领取/get_gift_FuYuanLu", "等会再来/onCancel");
	-- Say( "礼官：剑网最新活动，2004年11月11日-11月19日早上系统维护前，每充值2张35元卡或6张10元卡即可从我这里领取一个<color=yellow>奉月果蓉月饼（武功技能点增加1点）<color>或<color=yellow>贡月芙蓉月饼（潜能点增加5点）<color>。领取前请整理好你的背包，以防放不下。", 2, "我要领取/get_gift_MoonCake", "等会再来/onCancel" );
	--Say( "<#>礼官：为庆祝一卡通开通，剑网为广大玩家准备了丰盛的大礼。自12月12日-12月26日早上系统维护前，充值3张30元一卡通或6张15元一卡通即可领取一本<color=yellow>武林秘籍（武功技能点加1点）<color>，充值1张30元一卡通或2张15元一卡通即可领取一个<color=yellow>大白驹丸（离线托管功能）<color>。领取前请整理好你的背包，以防放不下。", 2, "我要领取/get_gift_Passport", "等会再来/onCancel" );
	--Say("<#>礼官：剑网一卡通促销活动，2005年1月11日早11：00开始至2005年1月21日早8：00止，充值1张30元一卡通或2张15元一卡通就可以领取一本<color=yellow>般若心经（服用后可消除身上的负经验）<color>。领取前请整理好你的背包，以防放不下。", 2, "我要领取/get_gift_Passport", "等会再来/onCancel")
	 Say( "礼官：剑网再过黄金周，充卡水晶大派送。2005年05月11日早10：00至5月18日日早8：00，充值一卡通可以在我这里领取水晶。充15元一卡通送一颗水晶，充30元一卡通送二颗水晶，充值48元一卡通送三颗水晶。", 2, "我要领取/get_gift_Crystal_050511", "等会再来/onCancel" );
end



function get_gift_Crystal()
	if (GetExtPoint(3) >= 1) then
 		if(GetExtPoint(3) > 32767) then
			Say( "礼官：数据出现错误，您不能领取赠送物品，请向GM反映情况，我们会妥善解决您的问题。多谢支持！", 0 );
		else
			local aryszCrystal = { "兰水晶", "紫水晶", "绿水晶" };
			local nCrystalIdx = mod( random( 31 ) + random( 101 ), 3 ) + 1;
			AddItem(4, 237 + nCrystalIdx, 1, 1, 0, 0);			
			LiguanLog("获得1个"..aryszCrystal[nCrystalIdx]);
			PayExtPoint(3, 1);
			Say( "礼官：送您1颗<color=yellow>" .. aryszCrystal[nCrystalIdx] .. "<color>，祝您在剑侠的世界中快乐地游戏，不要浪费了哦。", 0 );
			Msg2Player( "您得到1颗" .. aryszCrystal[nCrystalIdx] );
	
			local nCurEPValue = GetExtPoint(3);
			if (nCurEPValue > 0) then
				Say( "礼官：你的点数未用完，还可领<color=yellow>"..nCurEPValue.."<color>次哦。", 0 );
			end
		end
	else
		Talk(1, "", "礼官：您在这个活动期间尚未充卡(或者已领过了)，抓紧时间去充卡吧，不要错过了这次<color=yellow>\"水晶风暴\"<color>的献礼哦。(冲卡时须暂时退出游戏)");
	end	
end


function get_gift_XianCaoLu()
	if (GetExtPoint(3) >= 1) then
 		if(GetExtPoint(3) > 32767) then
			Talk(1, "", "礼官：数据出现错误，您不能领取赠送物品，请向GM反映情况，我们会妥善解决您的问题。多谢支持！")
		else
			local nCount = 10;
			local strObj = "10个仙草露";
			for i = 1, nCount do
				AddItem(6, 1, 71, 1, 0, 0) -- 仙草露
			end
			LiguanLog("获得"..strObj);
			PayExtPoint(3, 1)
			Talk(1, "", "礼官：送您<color=red>" .. strObj .. "<color>，祝您在剑侠的世界中快乐地游戏，不要浪费了哦。")
			Msg2Player("您得到" ..strObj)
	
			local nCurEPValue = GetExtPoint(3);
			if (nCurEPValue > 0) then
				Talk(1, "", "礼官：你的点数未用完，还可领"..nCurEPValue.."次哦。")
			end
		end
	else
		Talk(1, "", "礼官：你在这个活动期间还未充过35元卡哦(或者已领过了)。快快去冲张35元卡，体验<color=red>经验翻倍<color>的成就感吧。(冲卡时须暂时退出游戏)");
	end	
end



function get_gift_FuYuanLu()
	local nObjCount = 5;
	local strObj = "大福缘露";
	
	if (GetExtPoint(3) >= 1) then
 		if(GetExtPoint(3) > 32767) then
			Say( "礼官：数据出现错误，您不能领取赠送物品，请向GM反映情况，我们会妥善解决您的问题。多谢支持！", 0 );
		else
			for i = 1, nObjCount do
				AddItem( 6, 1, 124, 1, 0, 0 );
			end
			LiguanLog( "获得"..nObjCount.."个"..strObj );
			PayExtPoint(3, 1);
			Say( "礼官：送您<color=yellow>"..nObjCount.."个"..strObj.."<color>，祝您在剑侠的世界中快乐地游戏，不要浪费了哦。", 0 );
			Msg2Player( "您得到"..nObjCount.."个"..strObj );
	
			local nCurEPValue = GetExtPoint(3);
			if (nCurEPValue > 0) then
				Say( "礼官：你的点数未用完，还可领<color=yellow>"..nCurEPValue.."<color>次哦。", 0 );
			end
		end
	else
		 Say( "礼官：您在这个活动期间尚未充卡(或者已领过了)，抓紧时间去充卡吧，不要错过了这次<color=yellow>"..strObj.."<color>的赠送哦。(充卡时须暂时退出游戏)", 0 );
	end	
end


function get_gift_MoonCake()
	local aryMoonCake = { { "奉月果蓉月饼", { 6, 1, 127, 1, 0, 0 } },
						  { "贡月芙蓉月饼", { 6, 1, 128, 1, 0, 0 } },
						};
	local nCurEPValue = GetExtPoint( 3 );
	
	if( nCurEPValue >= 6 ) then
 		if( nCurEPValue > 32767 ) then
			Say( "礼官：数据出现错误，您不能领取赠送物品，请向GM反映情况，我们会妥善解决您的问题。多谢支持！", 0 );
		else		
			local nMoonCakeIdx = mod( random( 31 ) + random( 101 ), 2 ) + 1;
			AddItem( aryMoonCake[nMoonCakeIdx][2][1], aryMoonCake[nMoonCakeIdx][2][2], aryMoonCake[nMoonCakeIdx][2][3], aryMoonCake[nMoonCakeIdx][2][4], aryMoonCake[nMoonCakeIdx][2][5], aryMoonCake[nMoonCakeIdx][2][6] );
			LiguanLog( "获得1个"..aryMoonCake[nMoonCakeIdx][1] );
			PayExtPoint( 3, 6 );
			Say( "礼官：送您一个<color=yellow>"..aryMoonCake[nMoonCakeIdx][1].."<color>，祝您在剑侠的世界中快乐地游戏，不要浪费了哦。", 0 );
			Msg2Player( "您得到1个"..aryMoonCake[nMoonCakeIdx][1] );
			
			nCurEPValue = GetExtPoint( 3 );			
			if( nCurEPValue >= 6 ) then
				Say( "礼官：您的点数未用完，还可领<color=yellow>"..floor( nCurEPValue / 6 ).."<color>个月饼哦。", 0 );
			elseif( nCurEPValue > 0 ) then
				local nHighCardCount = floor( ( 6 - nCurEPValue ) / 3 );
				local nLowCardCount = mod( 6 - nCurEPValue, 3 );
				local szInfo = "";
				if( nHighCardCount > 0 ) then
					szInfo = szInfo..nHighCardCount.."张35元卡";
				end
				if( nLowCardCount > 0 ) then
					if( nHighCardCount > 0 ) then
						szInfo = szInfo.."和";
					end
					szInfo = szInfo..nLowCardCount.."张10元卡";
				end
				Say( "礼官：您的点数未用完，再充<color=yellow>"..szInfo.."<color>就可再领取一个月饼哦。", 0 );
			end
		end
	else	
		local nHighCardCount = floor( ( 6 - nCurEPValue ) / 3 );
		local nLowCardCount = mod( 6 - nCurEPValue, 3 );
		local szInfo = "";
		if( nHighCardCount > 0 ) then
			szInfo = szInfo..nHighCardCount.."张35元卡";
		end
		if( nLowCardCount > 0 ) then
			if( nHighCardCount > 0 ) then
				szInfo = szInfo.."和";
			end
			szInfo = szInfo..nLowCardCount.."张10元卡";
		end
		 Say( "礼官：您在这个活动期间尚未充够卡，再充<color=yellow>"..szInfo.."<color>就可领取月饼了。抓紧时间去充卡吧，不要错过了这次<color=yellow>"..aryMoonCake[1][1].."和"..aryMoonCake[2][1].."<color>的赠送哦。(充卡时须暂时退出游戏)", 0 );
	end	
end

-- 一卡通促销活动2004-12-12
--function get_gift_Passport()
--	local gift_Big = { "武林秘籍", { 6, 1, 26, 1, 0, 0, 0 } };
--	local gift_Small = { "大白驹丸", { 6, 1, 130, 1, 0, 0, 0 } };
--	local nCurEPValue = GetExtPoint( 3 );
--	if( nCurEPValue >= 2 ) then
--		if( nCurEPValue > 32767 ) then
--			Say( "礼官：数据出现错误，您不能领取赠送礼品，请向GM反映情况，我们会妥善解决您的问题。多谢支持！", 0 );
--		else
--			local gift = nil;
--			if( nCurEPValue >= 6 ) then
--				gift = gift_Big;
--				PayExtPoint( 3, 6 );
---			else
--				gift = gift_Small;
--				PayExtPoint( 3, 2 );
---			end
--			if( gift ~= nil ) then
--				AddItem( gift[2][1], gift[2][2], gift[2][3], gift[2][4], gift[2][5], gift[2][6], gift[2][7] );
--				LiguanLog( "获得1个"..gift[1] );
--				Msg2Player( "您获得1个" .. gift[1] );
--				nCurEPValue = GetExtPoint( 3 );
--				if( nCurEPValue >= 2 ) then
--					Say( "礼官：送您1个<color=yellow>"..gift[1].."<color>，祝您在剑侠的世界中快乐地游戏，不要浪费了哦。您还有礼品可以领取，我只能替您保管到这周周末，不要忘了领哦。", 2, "继续领取礼品/get_gift_Passport", "先替我保管吧/onCancel" );
--				else
--					Say( "礼官：送您1个<color=yellow>"..gift[1].."<color>，祝您在剑侠的世界中快乐地游戏，不要浪费了哦。", 0 );
--				end
--			else
--				Say( "礼官：数据出现错误，您不能领取赠送礼品，请向GM反映情况，我们会妥善解决您的问题。多谢支持！", 0 );
--			end
--		end
--	else
--		Talk( 1, "", "礼官：您在这个活动期间一卡通尚未充够(或者已领过了)，充值1张30元一卡通或2张15元一卡通即可领取到礼品了，不要错过了这次<color=yellow>"..gift_Big[1].."<color>和<color=yellow>"..gift_Small[1].."<color>的献礼哦。" );
--	end
--end

-----------一卡通促销活动2005-01-11---------------------------
function get_gift_Passport()
	local gift_banruo={"般若心经",{6,1,12,1,0,0,0}};
	local nCurEPValue=GetExtPoint( 3 );
	if (nCurEPValue>=2) then
		if (nCurEPValue>=32767) then
			Say("礼官：数据出现错误，您不能领取赠送礼品，请向GM反映情况，我们会妥善解决您的问题。多谢支持！", 0 )
		else
				PayExtPoint(3,2)
				AddItem(6,1,12,1,0,0,0)
				LiguanLog("获得1个般若心经")
				Msg2Player("您获得1个般若心经")
				nCurEPValue=GetExtPoint(3);
				if(nCurEPValue>=2) then
					Say( "礼官：送您1个<color=yellow>般若心经<color>，祝您在剑侠的世界中快乐地游戏，不要浪费了哦。您还有礼品可以领取，我只能替您保管到2005年1月21日，不要忘了领哦。", 2, "继续领取礼品/get_gift_Passport", "先替我保管吧/onCancel" );
				else
					Say( "礼官：送您1个<color=yellow>般若心经<color>，祝您在剑侠的世界中快乐地游戏，不要浪费了哦。", 0 );
				end
		end
	else
		Talk( 1, "", "礼官：您在这个活动期间一卡通尚未充够(或者已领过了)。充值1张30元一卡通或2张15元一卡通即可领取到礼品了，不要错过了这次<color=yellow>般若心经<color>的献礼哦。" );
	end
end

---------------  一卡通促销活动  2005-05-09修改-----START----------------
function get_gift_Crystal_050511()
	if (GetExtPoint(5) >= 1) then
 		if(GetExtPoint(5) > 32767) then
			Say( "礼官：数据出现错误，您不能领取赠送物品，请向GM反映情况，我们会妥善解决您的问题。多谢支持！", 0 );
		else
			local aryszCrystal = { "蓝水晶", "紫水晶", "绿水晶" };
			local nCrystalIdx = mod( random( 31 ) + random( 101 ), 3 ) + 1;
			AddItem(4, 237 + nCrystalIdx, 1, 1, 0, 0);			
			LiguanLog("获得1个"..aryszCrystal[nCrystalIdx]);
			PayExtPoint(5, 1);
			Msg2Player( "您得到1颗" .. aryszCrystal[nCrystalIdx] );
			local nCurEPValue = GetExtPoint(5);
			if (nCurEPValue > 0) then
				Say( "礼官：送您1颗<color=yellow>" .. aryszCrystal[nCrystalIdx] .. "<color>，你的点数未用完，还可领<color=yellow>"..nCurEPValue.."<color>次哦。", 0 );
			else
				Say( "礼官：送您1颗<color=yellow>" .. aryszCrystal[nCrystalIdx] .. "<color>，祝您在剑侠的世界中快乐地游戏，不要浪费了哦。", 0 );
			end
		end
	else
		Talk(1, "", "礼官：您在这个活动期间尚未充卡(或者已领过了)，抓紧时间去充卡吧，不要错过了这次<color=yellow>充卡水晶大派送<color>的献礼哦。(冲卡时须暂时退出游戏)");
	end	
end

---------------  一卡通促销活动  2005-05-09修改---END------------------