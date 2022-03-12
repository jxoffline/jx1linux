-- 西山居十周年活动 关闭活动时赋值为nil
--50级及以上玩家可以在礼官处领取一次经验（50W）
--By FireFox 2005.06.16
ANNIVERSARY_TEN = nil -- 关闭此功能
TaskID_Anniversary = 1506

function ANNIVERSARY_AwardExp()
	Say( "礼官：值此西山居10年庆典之际，特开放50级以上玩家50万经验狂送活动。在2005年06月18日至2005年06月20日期间，50级以上玩家（包括50级）可以在我这里领取赠送的50万经验。注意，每位玩家只能领取<color=red>一次<color>经验。你想现在就领取么？", 2, "我要领取，谢谢啦/want_takeanniversary", "恩，等一下再来/OnCancel" )
end

function want_takeanniversary()
	if( GetTask( TaskID_Anniversary ) == 1 ) then
		Say( "礼官：你已经参加过了50万经验狂送活动，每一位玩家只能参加一次，请继续关注剑网的其他线上活动。", 0 )
		return
	end
	
	if( GetLevel() < 50 ) then
		Say( "礼官：庆西山居十周年经验赠送活动仅能50级以上玩家参加，你的级别不够，请继续关注剑网的其他线上活动。", 0 )
		return
	end
	Say( "礼官：如果你离升到下一级只有不到50W经验的差距,领到的50万经验只能是升一级,然后经验变零。你确定要现在领取么？" , 2, "没问题，我准备好了/sure_takeexp", "这样啊，稍等一下/OnCancel")
end

function sure_takeexp()
	if( GetTask( TaskID_Anniversary ) == 1 ) then
		Say( "礼官：你已经参加过了50万经验狂送活动，每一位玩家只能参加一次，请继续关注剑网的其他线上活动。", 0 )
		return
	end
	
	if( GetLevel() < 50 ) then
		Say( "礼官：庆西山居十周年经验赠送活动仅能50级以上玩家参加，你的级别不够，请继续关注剑网的其他线上活动。", 0 )
		return
	end

	SetTask( TaskID_Anniversary, 1 )
	AddOwnExp(500000)
	Say( "礼官：谢谢你参与庆西山居十周年50万经验狂送活动，50万经验已经给你了，请继续关注剑网的其他活动。", 0 )
end

function OnCancel()
end