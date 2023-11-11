--2007ÈıÔÂ³õÈı--ÉÕ±ı
--ÍêÃÀµÄÉÕ±ı	6,1,1395,1,0,0
--ÆÕÍ¨µÄÉÕ±ı	6,1,1396,1,0,0
--Î´ÊìµÄÉÕ±ı	6,1,1397,1,0,0

Include("\\script\\event\\cookies2007\\head.lua");

function main(nItemIdx)
	if (checkcookies2007Date(20070506) ~= 1) then
		Say("B¸nh nµy ®· qu¸ h¹n sö dông, h·y nhanh chãng vøt bá.", 0);
		return 0;
	end;
	
	if (checkcookies2007Limit() ~= 1) then
		Say("ThËt ng¹i qu¸, chØ cã ng­êi ch¬i <color=yellow>cÊp trªn 50 ®· n¹p thÎ<color> míi cã thÓ ¨n b¸nh.", 0);
		return 1;
	end;
	
	local ng, nd, np = GetItemProp(nItemIdx);
	local nexp = 1;
	if (np == 1395) then
		nexp = 800000;
	elseif (np == 1396) then
		nexp = 500000;
	elseif (np == 1397) then
		nexp = 300000;
	else
		print("Error!! It's not Rose for Valentine 2007!!");
		return 1;
	end;
	
	local ncurexp = GetTask(TSK_33_COOKIES_ADDEXP);
	if (ncurexp >= 300000000) then
		Say("B¹n ®· ¨n qu¸ nhiÒu b¸nh, kh«ng thÓ ¨n ®­îc n÷a.", 0);
		Msg2Player("Mçi ng­êi chØ nhËn ®­îc tèi ®a 300 triÖu ®iÓm kinh nghiÖm khi ¨n b¸nh.");
		return 1;
	elseif ((ncurexp + nexp) > 300000000) then
		nexp = 300000000 - ncurexp
	end;
	
	AddOwnExp(nexp);
	SetTask(TSK_33_COOKIES_ADDEXP, ncurexp + nexp)
	Msg2Player(format("B¹n nhËn ®­îc %d ®iÓm kinh nghiÖm", nexp));
	local szlog = format("[2007Mïng 3 th¸ng 3]\t%s\tName:%s\tAccount:%s\t Sö dông %s nhËn ®­îc %d ®iÓm kinh nghiÖm",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),GetName(),GetAccount(),GetItemName(nItemIdx),nexp);
	WriteLog(szlog);
end;