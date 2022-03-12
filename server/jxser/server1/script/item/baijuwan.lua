--Ê¹ÓÃ°×¾ÔÍè½Å±¾
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>Sö dông sÏ nhËn ®­îc <color=red>8 giê<color> ñy th¸c.",
		"<#> Sö dông B¹ch C©u hoµn/confirmlevel",
		"<#> §Ó ta suy nghÜ l¹i!/cancel",
		"<#> Tra xem thêi gian treo m¸y cßn l¹i cña ta/get_left_time",
		"<#> Giíi thiÖu chi tiÕt vÒ c¸ch ch¬i treo m¸y/help"
	};
	Say(str[1], 4,str[2],str[3],str[4],str[5]);
	return 1
end

--ÅĞ¶ÏµÈ¼¶ÔÙ´ÎÈ·ÈÏ
function confirmlevel()
	str=
	{	"<#> V× ®¼ng cÊp cña b¹n thÊp h¬n <color=red>cÊp 50<color>, nªn trong tr¹ng th¸i rêi m¹ng, b¹n cã thÓ tiÕn hµnh giao dŞch bµy b¸n, vµ nhËn ®­îc Phóc Duyªn nh­ng kh«ng thÓ nhËn ®­îc <color=red>kinh nghiÖm<color>. B¹n cã thËt sù muèn sö dông B¹ch C©u hoµn?",
		"<#> Sö dông/use",
		"<#> §Ó ta suy nghÜ l¹i!/cancel",
		"<#> V× b¹n kh«ng ph¶i lµ kh¸ch hµng n¹p thÎ, nªn kh«ng thÓ sö dông chøc n¨ng rêi m¹ng. Vui lßng n¹p thÎ råi sö dông vËt phÈm nµy!"
	};

    -- ³ä¿¨ÓÃ»§²ÅÄÜÊ¹ÓÃ°×¾ÔÍè
	if (IsCharged()~=1) then
	    Talk(1, "", str[4]);
	    return
	end
	
	nLevel = GetLevel();
	if (nLevel < AEXP_NEEDLEVEL) then
		Say(str[1], 2,str[2],str[3]);	
	else
		use();
	end
end

--Ñ¡ÔñÊ¹ÓÃ°×¾ÔÍè
function use()
	sparetime = GetTask(AEXP_SMALL_TIME_TASKID);
	if (sparetime == nil) then
		sparetime = 0;
	end

	--showtime = floor(sparetime /(FRAME2TIME * 60));		--¸øÓÃ»§ÌáÊ¾ÏÔÊ¾µ½·ÖÖÓ
	if ((sparetime + AEXP_SMALLCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("HiÖn thêi gian rêi m¹ng t¨ng ®iÓm kinh nghiÖm cßn l¹i lµ<color=red>"..hours.."<color>giê<color=red>"..minutes.."<color> phót, nh­ng thêi gian rêi m¹ng t¨ng ®iÓm kinh nghiÖm cña b¹n t¨ng thªm kh«ng qu¸ <color=red>10000giê<color>, xin h·y chê thªm 1 thêi gian n÷a míi tiÕp tôc sö dông B¹ch C©u hoµn.", 0);
	else
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		smallgeneraltype,smalldetailtype,smallpartype = GetItemProp(itemindex);
		if ( smallgeneraltype ~= AEXP_SMALL_NGENTYPE
			or smalldetailtype ~= AEXP_SMALL_DETAILTYPE
			or smallpartype ~= AEXP_SMALL_PARTYPE) then
			return 
		end 
		
		nresult = RemoveItemByIndex(itemindex);
		
		if (nresult > 0) then 
			ntotaltime=sparetime + AEXP_SMALLCHANGE;
			SetTask(AEXP_SMALL_TIME_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("sö dông thµnh c«ng, thêi gian treo m¸y cña b¹n cßn l¹i lµ <color=red>"..hours.."<color>giê<color=red>"..minutes.."<color> phót",0);
			writeUseBaiJulog("offlineitem_small", hours, minutes);
		else
			Say("Kh«ng cã B¹ch C©u hoµn cã thÓ sö dông ", 0);	
		end
	end
end

--Ñ¡ÔñÔÙ¿¼ÂÇ¿¼ÂÇ
function cancel()
	return 0
end