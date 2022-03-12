--Ê¹ÓÃ¼¼ÄÜ´ó°×¾ÔÍè½Å±¾
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>B¹ch C©u Hoµn kü n¨ng, sö dông sÏ nhËn ®­îc <color=red>8 giê<color> ñy th¸c.",
		"<#>Sö dông B¹ch C©u Hoµn kü n¨ng /use",
		"<#> §Ó ta suy nghÜ l¹i!/cancel",
		"<#> Tra xem thêi gian treo m¸y cßn l¹i cña ta/get_left_time",
		"<#> Chän kü n¨ng rêi m¹ng vÉn treo m¸y/#selectofflineskill('cancel')",
		"<#> Giíi thiÖu chi tiÕt vÒ c¸ch ch¬i treo m¸y/help"
	};
	Say(str[1], 4,str[2],str[3],str[4],str[5]);
	return 1
end

--Ñ¡ÔñÊ¹ÓÃ¼¼ÄÜ°×¾ÔÍè
function use()
	local sparetime = GetTask(AEXP_SMALL_SKILL_TASKID);
	if (sparetime == nil) then
		sparetime = 0;	
	end

	if ((sparetime + AEXP_SKILLCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("Thêi gian rêi m¹ng vÉn treo m¸y cßn l¹i cña b¹n lµ <color=red>"..hours.."<color>giê<color=red>"..minutes.."<color> phót. Thêi gian tÝch lòy ñy th¸c kü n¨ng kh«ng ®­îc v­ît qu¸ <color=red>10000 giê<color>.", 0);
    else	
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		nresult = RemoveItemByIndex(itemindex);

		if (nresult == 1) then 
			ntotaltime = sparetime + AEXP_SKILLCHANGE;
			SetTask(AEXP_SMALL_SKILL_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("Thµnh c«ng sö dông, thêi gian rêi m¹ng vÉn treo m¸y cña b¹n lµ <color=red>"..hours.."<color>giê<color=red>"..minutes.."<color> phót",0);
			writeUseBaiJulog("skillofflineitem_small", hours, minutes);
		else
			Say("Kh«ng cã B¹ch C©u Hoµn kü n¨ng, cã thÓ sö dông ", 0);	
		end
	end
end

--Ñ¡ÔñÔÙ¿¼ÂÇ¿¼ÂÇ
function cancel()
	return 0
end