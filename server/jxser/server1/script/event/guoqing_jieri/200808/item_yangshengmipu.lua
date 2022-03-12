-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÒ»×·Ñ°ÃØÆ×µÀ¾ßÑøÉúÃØÆ×½Å±¾

-- Edited by ×Ó·Çô~
-- 2008/07/24 13:43

-- ======================================================

Include("\\script\\event\\guoqing_jieri\\200808\\head.lua");	-- »î¶¯Ïà¹ØĞÅÏ¢ÎÄ¼ş
Include("\\script\\lib\\pay.lua");

function main()
	zxmp_reset_vertsk();
	
	if (zxmp_200808_itemdate() ~= 1) then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0;
	end
	
	if (GetLevel() < 50 or IsCharged() == 0) then
			Say("ChØ cã ng­êi ch¬i cÊp trªn 50 ®· n¹p thÎ míi cã thÓ sö dông.", 0)
		return 1;
	end
	
	local n_ran = random(100*10000);
	local n_sum = 0;
	local n_idx = 0;
	local sz_msg = "";
	
	for i, tb in TB_ZHUIXUNMIPU_ITEMLIST do
		n_sum = n_sum + tb.n_rate * 10000;
		if (n_sum >= n_ran) then
			n_idx = i;
			
			if (tb.n_type == 2) then
				local ng, nd, sz_name = tb.tb_itemid[1], tb.tb_itemid[2], tb.sz_name;
				AddGoldItem(ng, nd);
				sz_msg = format("NhËn ®­îc trang bŞ Hoµng Kim %s", sz_name);
			elseif (tb.n_type == 1) then
				local ng, nd, np, nl, ns, nlk, sz_name = tb.tb_itemid[1], tb.tb_itemid[2], tb.tb_itemid[3], 
										tb.tb_itemid[4], tb.tb_itemid[5], tb.tb_itemid[6], tb.sz_name;
				AddItem(ng, nd, np, nl, ns, nlk);
				sz_msg = format("NhËn ®­îc %s", sz_name);
			elseif (tb.n_type == 3) then
				
				AddRepute(tb.n_repute);
				sz_msg = format("NhËn ®­îc %d ®iÓm danh väng", tb.n_repute);
			end
			if (sz_msg ~= "") then
				Msg2Player(sz_msg);
				WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\t %s¡£","D­ìng sinh bİ phæ",
							GetLocalDate("%Y-%m-%d,%X"),
							GetName(),
							GetAccount(),
							sz_msg	));
			end
			break
		end
	end
	
	if (n_idx == 0) then
		return 1;
	end
	
	local n_addexp = zxmp_200808_checkexp();
	
	if (n_addexp <= 0) then
		Msg2Player("§· ®¹t giíi h¹n 800 triÖu ®iÓm kinh nghiÖm, kh«ng thÓ tiÕp tôc nhËn n÷a.");
	else
		AddOwnExp(n_addexp);
		SetTask(TSK_ZXMP_MAXEXP, GetTask(TSK_ZXMP_MAXEXP) + n_addexp);
		Msg2Player(format("B¹n nhËn ®­îc %d ®iÓm kinh nghiÖm.",n_addexp));
		WriteLog(format("[Sö dông %s]\t%s\tName:%s\tAccount:%s\t t¨ng %s ®iÓm kinh nghiÖm.", "D­ìng sinh bİ phæ",
						GetLocalDate("%Y-%m-%d,%X"),
						GetName(),
						GetAccount(),
						n_addexp	));
	end
end

