
Include("\\script\\task\\task_addplayerexp.lua");

function main(nItemIdx)
	--Æ£ÀÍ×´Ì¬
	local nDate = (GetItemParam(nItemIdx, 2)+2000) * 10000 + GetItemParam(nItemIdx, 3);
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nCurDate > nDate) then
		Say("VËt phÈm nµy ®· qu¸ h¹n sö dông!", 0);
		return 0;
	else
		if (GetTiredDegree() == 2) then
			Say("§ang ë tr¹ng th¸i mÖt mái, kh«ng thÓ sö dông vËt phÈm nµy.", 0);
			return 1;
		else
			local nExp= GetItemParam(nItemIdx, 1) * 1000;
			tl_addPlayerExp(nExp);
			Msg2Player(format("B¹n nhËn ®­îc %d ®iÓm kinh nghiÖm", nExp));
			WriteLog(format("[TÝch lòy D· TÈu]\t%s\tName:%s\tAccount:%s\t nhËn ®­îc %d ®iÓm kinh nghiÖm.",
					GetLocalDate("%Y%m%d %X"),
					GetName(),
					GetAccount(),
					nExp));
			return 0;
		end;
	end;
	return 1;
end;

function GetDesc(nItemIdx)
	local nExp= GetItemParam(nItemIdx, 1) * 1000;
	local nYear = (GetItemParam(nItemIdx, 2)+2000)
	local nMMDD = GetItemParam(nItemIdx, 3)
	local nMonth = floor(nMMDD / 100);
	local nDate = mod(nMMDD , 100);
	
	return format("§iÓm kinh nghiÖm: %d<enter>Thêi h¹n sö dông: %d-%d-%d", nExp, nYear, nMonth,nDate);
end;