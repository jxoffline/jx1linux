NEWDOGGIFT_BANK = 1

function newdoggift_card()
	if (GetExtPoint(6) >= 1) then
		Say("<#>礼官：为回报新老玩家一直以来对《剑网》的支持和厚爱，至此佳节来临之际，倾情献上“银行卡充值，送狗年吉祥旺旺包”活动。凡在2006年1月24日—2006年2月14日期间，每购买1张15元的点卡（现特价14元），即可到我这里领取1个狗年吉祥旺旺包。", 2, "我要领取/sure2getNewDog_Card", "我稍候再来/OnCancel")
	else
		Say("<#>礼官：很抱歉，您并没有领取这项礼物的资格喔！凡在<color=yellow>2006年1月24日—2006年2月14日<color>期间，每购买1张15元的点卡（现特价14元），即可到我这里领取1个<color=yellow>狗年吉祥旺旺包<color>。详情请见官方网站jx.kingsoft.com。", 0)
	end
end

function sure2getNewDog_Card()
	if (GetExtPoint(6) >= 1) then
		if(GetExtPoint(6) > 32767) then
			Say( "礼官：数据出现错误，您不能领取赠送物品，请向GM反映情况，我们会妥善解决您的问题。多谢支持！", 0 );
		else
			PayExtPoint(6, 1);
			AddItem(6,1,1057,1,0,0,0)
			LiguanLog("<#>获得一个狗年吉祥旺旺包")
			Msg2Player("<#>您获得一个狗年吉祥旺旺包")
			curextpoint = GetExtPoint(6)
			if (curextpoint >= 1) then
				Say("<#>礼官：送您一个<color=yellow>狗年吉祥旺旺包<color>，你的点数未用完，还可领<color=red>"..curextpoint.."<color>次哦。", 0 );
			else
				Say("<#>礼官：送您一个<color=yellow>狗年吉祥旺旺包<color>，祝您在剑侠世界愉快的游戏，不要浪费了哦。", 0)
			end
		end
	else
	end
end