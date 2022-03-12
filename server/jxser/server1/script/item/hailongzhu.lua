Include("\\script\\event\\jiefang_jieri\\200904\\taskctrl.lua")
function main()
	local ndate = tonumber(GetLocalDate("%y%m%d"));
	if (ndate ~= GetTask(jf0904_TSK_hailongzhu_ndate)) then
		SetTask(jf0904_TSK_hailongzhu_ndate, ndate);
		SetTask(jf0904_TSK_hailongzhu_UseTime, 0);
		if (ndate~= GetTask(jf0904_TSK_denggao_ndate)) then
			SetTask(jf0904_TSK_denggao_ndate, ndate);
			SetTask(jf0904_TSK_shuizei_FulfilTaskTime, 1);
		end
	end
	
	if (GetTask(jf0904_TSK_hailongzhu_UseTime) >= 2) then
		Say("Mçi ngµy chØ cã thÓ sö dông 2 H¶i Long Ch©u", 0);
		return 1
	end
	
	SetTask(jf0904_TSK_hailongzhu_UseTime, GetTask(jf0904_TSK_hailongzhu_UseTime)+1);
	SetTask(jf0904_TSK_shuizei_FulfilTaskTime, GetTask(jf0904_TSK_shuizei_FulfilTaskTime)+1);
	Say("Thu ®­îc c¬ héi thªm mét lÇn tham gia Tiªu diÖt thñy tÆc!", 0);
end

