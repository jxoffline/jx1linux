-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÒ» 120¼¶´ó³ËÃØ¼®
-- ÓÒ¼üµã»÷Ê¹ÓÃ£¬¿ÉÌáÉı120¼¶ÊìÁ·¶È¼¼ÄÜµ½20¼¶¡£

-- Edited by ×Ó·Çô~
-- 2010/06/29 15:21

-- ======================================================


Include("\\script\\task\\system\\task_string.lua")

function main(nItemIdx)
	local n_fac = GetLastFactionNumber();
	if (n_fac < 0) then
		Talk(1, "", "H×nh nh­ quyÓn s¸ch nµy miªu t¶ vâ c«ng cao cÊp cña c¸c ®¹i m«n ph¸i, ng­¬i kh«ng thÓ hiÓu sù huyÒn c¬ cña nã.");
		return 1;
	end
	
	local tb_90skill = {
		[0] = {709},
		[1] = {708},
		[2] = {710},
		[3] = {711},
		[4] = {712},
		[5] = {713},
		[6] = {714},
		[7] = {715},
		[8] = {716},
		[9] = {717},
		[10] = {1365},
		[11] = {1984},
	};
	
	local tb_Desc = {};
	for i = 1, getn(tb_90skill[n_fac]) do
		local skill = HaveMagic(tb_90skill[n_fac][i]);
		if (skill ~= -1 and skill ~= 20) then
			tinsert(tb_Desc, format("N©ng cÊp ".."%s/#upgrade_skilllevel(%d)", GetSkillName(tb_90skill[n_fac][i]), tb_90skill[n_fac][i]));
		end
	end
	
	if (getn(tb_Desc) == 0) then
		Talk(1, "", "Kü n¨ng ®¹t ®Õn cÊp cao nhÊt hoÆc vÉn ch­a häc.");
		return 1;
	end
	
	tinsert(tb_Desc, 1, "Chän kü n¨ng cÇn n©ng cÊp:");
	tinsert(tb_Desc, "KÕt thóc ®èi tho¹i/OnCancel");
	CreateTaskSay(tb_Desc);
	return 1;
end

function upgrade_skilllevel(n_skillid)
	if (HaveMagic(n_skillid) == -1 or HaveMagic(n_skillid) >= 20) then
		return	
	end
	
	if (ConsumeItem(3, 1, 6, 1, 2425, -1) == 1) then
		AddMagic(n_skillid, 20);
		WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\tUpGrade Skill:%d", 
				"§¹i Thµnh Bİ Kİp 120", 
				GetLocalDate("%Y-%m-%d %X"),
				GetAccount(),
				GetName(),
				n_skillid	));
	end
end


function OnCancel()
end
