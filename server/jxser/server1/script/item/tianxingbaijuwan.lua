--Ê¹ÓÃÌØĞ§´ó°×¾ÔÍè½Å±¾
--2006.08.29
--80Ğ¡Ê±ÀëÏßÍĞ¹ÜÊ±¼ä
--¾­ÑéÎªÔ­°×¾ÔµÄ2±¶

Include("\\script\\global\\baijuwanhead.lua")

function main(itemindex)
	SetTaskTemp(AEXP_TEMPOFFLINETASKID, itemindex)
	str=
	{	"<#>Thiªn tinh b¹ch c©u hoµn, sau khi sö dông thu ®­îc <color=red>8 tiÕng<color> ñy th¸c rêi m¹ng. NhËn ®­îc kinh nghiÖm gÊp 5 lÇn b¹ch c©u hoµn th­êng.",
		"<#>Sö dông thiªn tinh b¹ch c©u hoµn/confirmlevel",
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
	{	"<#>§¼ng cÊp cña b¹n thÊp h¬n <color=red>50<color>. V× thÕ, ë tr¹ng th¸i ñy th¸c trªn m¹ng, b¹n cã thÓ tiÕn hµnh bµy b¸n giao dŞch vµ nhËn ®iÓm phóc duyªn, nh­ng kh«ng thÓ nhËn ®­îc <color=red>®iÓm kinh nghiÖm<color>. B¹n thËt sù muèn sö dông B¹ch C©u Hoµn ®Æc biÖt kh«ng#¿",
		"<#> Sö dông/use",
		"<#> §Ó ta suy nghÜ l¹i!/cancel",
		"<#> V× b¹n kh«ng ph¶i lµ kh¸ch hµng n¹p thÎ, nªn kh«ng thÓ sö dông chøc n¨ng rêi m¹ng. Vui lßng n¹p thÎ råi sö dông vËt phÈm nµy!",
		"<#>Ng­êi ch¬i ph¶i cÊp 50 trë lªn vµ ®· chuyÓn sinh míi cã thÓ sö dông vËt phÈm nµy."
	};

    -- ³ä¿¨ÓÃ»§²ÅÄÜÊ¹ÓÃ´ó°×¾ÔÍè
	if (IsCharged()~=1) then
	    Talk(1, "", str[4]);
	    return
	end

	nLevel = GetLevel();

	if (nLevel < AEXP_NEEDLEVEL or ST_IsTransLife() ~= 1) then
		Talk(1, "", str[5]);
		return 
	end
	if (nLevel < AEXP_NEEDLEVEL) then
		Say(str[1], 2,str[2],str[3]);	
	else
		use();
	end
end

--Ñ¡ÔñÊ¹ÓÃÌìĞÇ°×¾ÔÍè
function use()
	local sparetime = GetTask(AEXP_TIANXING_TIME_TASKID);
	if (sparetime == nil) then
		sparetime = 0;	
	end

	--showtime = floor(sparetime / (FRAME2TIME * 60));		--¸øÓÃ»§ÌáÊ¾ÏÔÊ¾µ½·ÖÖÓ
	if ((sparetime + AEXP_BIGCHANGE) > AEXP_MAXTIME) then
		local hours, minutes = getFrame2MinAndSec(sparetime);
		Say("Thêi gian ñy th¸c cßn l¹i cña thiªn tinh b¹ch c©u hoµn lµ  <color=red>"..hours.."<color>giê<color=red>"..minutes.."<color> phót. Thêi gian ñy th¸c kinh nghiÖm tİch lòy kh«ng ®­îc v­ît qu¸ <color=red>10000 giê<color>.", 0);
	else	
		itemindex = GetTaskTemp(AEXP_TEMPOFFLINETASKID);
		if (IsMyItem(itemindex) ~= 1) then
			return
		end
		
		local g, d, p = GetItemProp(itemindex);
		
		if ( g ~= 6
			or d ~= 1
			or p ~= 2183) then
			return --²»ÊÇÌØĞ§´ó°×¾Ô
		end 
		
		nresult = RemoveItemByIndex(itemindex);

		if (nresult == 1) then 
			ntotaltime = sparetime + AEXP_BIGCHANGE;
			SetTask(AEXP_TIANXING_TIME_TASKID, ntotaltime);
			local hours, minutes = getFrame2MinAndSec(ntotaltime);
			Say("Sö dông thµnh c«ng, thêi gian ñy th¸c cña thiªn tinh b¹ch c©u hoµn lµ <color=red>"..hours.."<color>giê<color=red>"..minutes.."<color> phót",0);
			writeUseBaiJulog("offlineitem_special", hours, minutes);
		else
			Say("Kh«ng cã thiªn tinh b¹ch c©u hoµn cã thÓ sö dông", 0);	
		end
	end
end

--Ñ¡ÔñÔÙ¿¼ÂÇ¿¼ÂÇ
function cancel()
	return 0
end