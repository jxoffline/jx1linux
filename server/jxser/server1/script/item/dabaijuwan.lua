--Ê¹ÓÃ´ó°×¾ÔÍè½Å±¾
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>Mét viªn ®¹i b¹ch c©u hoµn, sau khi sö dông ®­îc <color=red>8 tiÕng<color> ñy th¸c rêi m¹ng.  D­íi cÊp 130 thu ®­îc kinh nghiÖm gÊp 1.5 lÇn b¹ch c©u hoµn th­êng, cÊp 130 trë lªn thu ®­îc kinh nghiÖm gÊp 2.5 lÇn.",
		"<#> Sö dông B¹ch C©u hoµn lín/confirmlevel",
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
	{	"<#> V× ®¼ng cÊp cña b¹n thÊp h¬n <color=red>cÊp 50<color>, nªn trong tr¹ng th¸i treo m¸y, b¹n cã thÓ tiÕn hµnh giao dŞch bµy b¸n, h¬n n÷a nhËn ®­îc Phóc Duyªn nh­ng kh«ng thÓ nhËn ®­îc <color=red>®iÓm kinh nghiÖm<color>. B¹n cã muèn sö dông B¹ch C©u hoµn lín kh«ng?",
		"<#> Sö dông/use",
		"<#> §Ó ta suy nghÜ l¹i!/cancel",
		"<#> V× b¹n kh«ng ph¶i lµ kh¸ch hµng n¹p thÎ, nªn kh«ng thÓ sö dông chøc n¨ng rêi m¹ng. Vui lßng n¹p thÎ råi sö dông vËt phÈm nµy!"
	};

    -- ³ä¿¨ÓÃ»§²ÅÄÜÊ¹ÓÃ´ó°×¾ÔÍè
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

--Ñ¡ÔñÊ¹ÓÃ´ó°×¾ÔÍè
function use()
	sparetime = GetTask(AEXP_TASKID);
	if (sparetime == nil) then
		sparetime = 0;	
	end

	--showtime = floor(sparetime / (FRAME2TIME * 60));		--¸øÓÃ»§ÌáÊ¾ÏÔÊ¾µ½·ÖÖÓ
	if ((sparetime + AEXP_BIGCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("Thêi gian ñy th¸c rêi m¹ng B¹ch C©u Hoµn cßn l¹i lµ: <color=red>"..hours.."<color>giê<color=red>"..minutes.."<color>phót, nh­ng thêi gian rêi m¹ng t¨ng ®iÓm kinh nghiÖm cña b¹n t¨ng thªm kh«ng qu¸<color=red>10000giê<color>. Vui lßng sau 1 thêi gian h·y sö dông B¹ch C©u hoµn lín!", 0);
    else	
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		biggeneraltype,bigdetailtype,bigpartype = GetItemProp(itemindex);
		
		if ( biggeneraltype ~= AEXP_BIG_NGENTYPE
			or bigdetailtype ~= AEXP_BIG_DETAILTYPE
			or bigpartype ~= AEXP_BIG_PARTYPE) then
			return 
		end 
		
		nresult = RemoveItemByIndex(itemindex);

		if (nresult == 1) then 
			ntotaltime = sparetime + AEXP_BIGCHANGE;
			SetTask(AEXP_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("Sö dông thµnh c«ng! Thêi gian ñy th¸c rêi m¹ng B¹ch C©u Hoµn cßn l¹i lµ: <color=red>"..hours.."<color>giê<color=red>"..minutes.."<color> phót",0);
			writeUseBaiJulog("offlineitem_normal", hours, minutes);
		else
			Say("kh«ng cã B¹ch C©u hoµn lín cã thÓ sö dông", 0);	
		end
	end
end

--Ñ¡ÔñÔÙ¿¼ÂÇ¿¼ÂÇ
function cancel()
	return 0
end