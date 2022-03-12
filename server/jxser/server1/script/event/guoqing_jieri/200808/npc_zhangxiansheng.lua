-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÒ»×·Ñ°ÃØÆ×ÕÅÏÈÉúNPC¶Ô»°½Å±¾

-- Edited by ×Ó·Çô~
-- 2008/07/24 13:43

-- ======================================================

Include("\\script\\task\\system\\task_string.lua");				-- ¶Ô»°´¦ÀíÍ·ÎÄ¼þ
Include("\\script\\event\\guoqing_jieri\\200808\\head.lua");	-- »î¶¯Ïà¹ØÐÅÏ¢ÎÄ¼þ
Include("\\script\\lib\\common.lua");							-- 
Include("\\script\\lib\\awardtemplet.lua")						-- ½±Àø¹²ÓÃº¯Êý¼¯


function main()
	zxmp_reset_vertsk();
	
	-- ²»ÔÚ»î¶¯ÆÚ¼äÄÚ
	if (zxmp_200808_checkdate() ~= 1) then
		CreateTaskSay({format("<dec><npc>Chµo %s!", GetName()), "KÕt thóc ®èi tho¹i/OnCancel"});
		return 
	end
	
	local sz_msg = "";
	
	for i = 1, getn(TB_ZHUIXUNMIPU_COMPLIST) do
		if (TB_ZHUIXUNMIPU_COMPLIST[i].n_type == 1) then
			sz_msg = sz_msg.."<enter>"..TB_ZHUIXUNMIPU_COMPLIST[i].sz_name.." "..TB_ZHUIXUNMIPU_COMPLIST[i].n_count.."c¸i";
		elseif (TB_ZHUIXUNMIPU_COMPLIST[i].n_type == 4) then
			sz_msg = sz_msg.."<enter>"..TB_ZHUIXUNMIPU_COMPLIST[i].sz_name.." "..TB_ZHUIXUNMIPU_COMPLIST[i].n_money.." l­îng";
		else
			print("ZXMP TB_ZHUIXUNMIPU_COMPLIST Invalid");
			return 0;
		end
	end
	
	CreateTaskSay({format("<dec><npc>Hîp thµnh D­ìng sinh bÝ phæ cÇn ph¶i chuÈn bÞ: <enter>%s<enter>, nÕu kh«ng ®ñ nguyªn liÖu th× ta kh«ng thÓ gióp ng­¬i.", sz_msg), 
					format("Hîp thµnh %s/zxmp_compound", "D­ìng sinh bÝ phæ"), 
					"KÕt thóc ®èi tho¹i/OnCancel"});
end

function OnCancel()
end

-- CalcItemCount
-- ConsumeItem

function zxmp_compound()
	for i = 1, getn(TB_ZHUIXUNMIPU_COMPLIST) do
		
		if (TB_ZHUIXUNMIPU_COMPLIST[i].n_type == 1) then
			local ng, nd, np, nl =  unpack(TB_ZHUIXUNMIPU_COMPLIST[i].tb_itemid);
			local n_count, sz_name =	TB_ZHUIXUNMIPU_COMPLIST[i].n_count,
										TB_ZHUIXUNMIPU_COMPLIST[i].sz_name;
			
			local n_curcnt = CalcItemCount(3, ng, nd, np, nl);
			
			if (n_curcnt < n_count) then
				CreateTaskSay({format("<dec><npc>%s mang trªn ng­êi kh«ng ®ñ %d, h·y kiÓm tra l¹i.", sz_name, n_count), "KÕt thóc ®èi tho¹i/OnCancel"});
				return
			end
			
		elseif (TB_ZHUIXUNMIPU_COMPLIST[i].n_type == 4) then
			local n_money = TB_ZHUIXUNMIPU_COMPLIST[i].n_money;
			local n_curmon = GetCash();
			
			if (n_curmon < n_money) then
				CreateTaskSay({format("<dec><npc>TiÒn mang trªn ng­êi kh«ng ®ñ, h·y kiÓm tra l¹i.", n_money), "KÕt thóc ®èi tho¹i/OnCancel"});
				return
			end
		else
			print("ZXMP TB_ZHUIXUNMIPU_COMPLIST Invalid");
			return 0;
		end
	end
	
	local b_succeed = 0;
	
	for i = 1, getn(TB_ZHUIXUNMIPU_COMPLIST) do
		
		if (TB_ZHUIXUNMIPU_COMPLIST[i].n_type == 1) then
			local ng, nd, np, nl =  unpack(TB_ZHUIXUNMIPU_COMPLIST[i].tb_itemid);
			local n_count, sz_name =	TB_ZHUIXUNMIPU_COMPLIST[i].n_count,
										TB_ZHUIXUNMIPU_COMPLIST[i].sz_name;
			b_succeed = ConsumeItem(3, n_count, ng, nd, np, nl);
			
			if (b_succeed ~= 1) then
				return
			end
			
		elseif (TB_ZHUIXUNMIPU_COMPLIST[i].n_type == 4) then
			local n_money = TB_ZHUIXUNMIPU_COMPLIST[i].n_money;
			
			b_succeed = Pay(n_money);
			
			if (b_succeed ~= 1) then
				return
			end
		else
			print("ZXMP TB_ZHUIXUNMIPU_COMPLIST Invalid");
			return 0;
		end
	end
	
	local nItemIdx = AddItem(6, 1, 1791, 1, 1, 0);
	-- tbAwardTemplet:ITEM_SetExpiredTime(nItemIdx, 20080827);
	-- SyncItem(nItemIdx);
	Msg2Player(format("NhËn ®­îc %s", "D­ìng sinh bÝ phæ"));
end
