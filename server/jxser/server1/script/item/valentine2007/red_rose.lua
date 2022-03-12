--2007ÄêÇéÈË½Ú--Ãµ¹å»¨
--ÍêÃÀµÄºìÃµ¹å	6,1,1362,1,0,0
--ÆÕÍ¨µÄºìÃµ¹å	6,1,1363,1,0,0
--ºìÃµ¹å»¨ÀÙ	6,1,1364,1,0,0

Include("\\script\\event\\valentine2007\\head.lua");

function main(nItemIdx)
	if (checkValentine2007Date(20070306) ~= 1) then
		Say("Hoa hång nµy ®Ó ®· l©u, b©y giê ®· kh« hĞo", 0);
		return 0;
	end;
	
	if (checkValentine2007Limit() ~= 1) then
		Say("ThËt ng¹i qu¸, chØ cã ng­êi ch¬i cÊp trªn 80 <color=yellow>®· n¹p thÎ<color> míi cã thÓ sö dông hoa hång.", 0);
		return 1;
	end;
	
	local ng, nd, np = GetItemProp(nItemIdx);
	local nexp = 1;
	if (np == 1362) then
		nexp = 1500000;
	elseif (np == 1363) then
		nexp = 1000000;
	elseif (np == 1364) then
		nexp = 500000;
	else
		print("Error!! It's not Rose for Valentine 2007!!");
		return 1;
	end;
	
	local ncurexp = GetTask(TSK_VALENTINE_ROSE_ADDEXP);
	if (ncurexp >= 100000000) then
		Say("B¹n ®· sö dông qu¸ nhiÒu hoa hång, kh«ng thÓ sö dông tiÕp tôc!", 0);
		Msg2Player("Mçi ng­êi sö dông hoa hång chØ nhËn ®­îc tèi ®a lµ 100 triÖu ®iÓm kinh nghiÖm.");
		return 1;
	elseif ((ncurexp + nexp) > 100000000) then
		nexp = 100000000 - ncurexp
	end;
	
	AddOwnExp(nexp);
	SetTask(TSK_VALENTINE_ROSE_ADDEXP, ncurexp + nexp)
	Msg2Player(format("B¹n nhËn ®­îc %d ®iÓm kinh nghiÖm", nexp));
	local szlog = format("[LÔ t×nh nh©n 2007]\t%s\tName:%s\tAccount:%s\t sö dông %s nhËn ®­îc %d ®iÓm kinh nghiÖm",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),GetName(),GetAccount(),GetItemName(nItemIdx),nexp);
	WriteLog(szlog);
end;