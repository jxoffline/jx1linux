--ÄÏ·½½â·Å¼ÍÄîÈÕ»î¶¯
--byĞ¡ÀË¶à¶à
--2007-04-13
XINGYUNLIBAO = 2556 --Byte:1.Äê 2.ÔÂ 3.ÈÕ 4.´ÎÊı

function nanfangjiefangri_main()
	local aryTalk = {
		"<dec><npc>Nh÷ng n¨m gÇn ®©y, chiÕn sù Tèng Kim ngµy cµng kŞch liÖt. Vâ l©m nh©n sü c¸c n¬i ®· héi tô tham chiÕn. Hä ®· hi sinh th©n m×nh ®Ó ®¸nh ®uæi kÎ thï b¶o vÖ tæ quèc. §Ó ca ngîi tinh thÇn hiÖp nghÜa nµy, Vâ l©m minh chñ quyÕt ®Şnh tÆng th­ëng cho nh÷ng anh hïng lËp ®­îc nhiÒu c«ng tr¹ng trªn chiÕn tr­êng Tèng Kim.",
		"Ta muèn t×m hiÓu ho¹t ®éng nµy./about",
		"Ta muèn nhËn C«ng tr¹ng lÖnh./getGongLaoLin",
		"Ta muèn nhËn phÇn th­ëng anh hïng chiÕn tr­êng./getXingYunLiBao",
		"ThËt ng¹i qu¸, ta sÏ quay l¹i sau./no",
	}
	CreateTaskSay(aryTalk)
	
end
function getGongLaoLin()
	if (GetCash()<300000) then
		CreateTaskSay({"<dec><npc>CÇn ph¶i nép vµo 30 v¹n l­îng lÖ phİ ®¨ng kı, ®¹i hiÖp kh«ng ®ñ tiÒn råi!","BiÕt råi/no"});
		return 0;
	end
	if (GetExtPoint(0) == 0) then
		CreateTaskSay({"<dec><npc>ChØ cã ng­êi ch¬i ®· n¹p thÎ míi cã thÓ nhËn.","BiÕt råi/no"});
		return 0;
	end
	if ( GetLevel()< 50 ) then
		CreateTaskSay({"<dec><npc>ChØ cã ng­êi ch¬i cÊp tõ 50 trë lªn míi cã thÓ nhËn.","BiÕt råi/no"});
		return 0;
	end
	if ( CalcFreeItemCellCount() < 1 ) then
		CreateTaskSay({"<dec><npc>H·y chuÈn bŞ 1 « trèng ®Ó ®Æt vµo 1 <color=yellow>C«ng tr¹ng lÖnh<color>.","BiÕt råi/no"});
		return 0;
	end
	Pay(300000);
	local nidx = AddItem(6,1,1411,1,0,0);
	WriteLog(format("[GetZhanGongXunZhang]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s\t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	CreateTaskSay({"<dec><npc>B¹n ®· nhËn thµnh c«ng 1 <color=yellow>C«ng tr¹ng lÖnh<color>.","BiÕt råi/no"});
end

function getXingYunLiBao()
	if (GetExtPoint(0) == 0) then
		CreateTaskSay({"<dec><npc>ChØ cã ng­êi ch¬i ®· n¹p thÎ míi cã thÓ nhËn.","BiÕt råi/no"});
		return 0;
	end
	if ( GetLevel()< 50 ) then
		CreateTaskSay({"<dec><npc>ChØ cã ng­êi ch¬i cÊp tõ 50 trë lªn míi cã thÓ nhËn.","BiÕt råi/no"});
		return 0;
	end
	if ( CalcFreeItemCellCount() < 1 ) then
		CreateTaskSay({"<dec><npc>H·y chuÈn bŞ 1 « trèng ®Ó ®Æt vµo 1 <color=yellow>C«ng tr¹ng lÖnh<color>.","BiÕt råi/no"});
		return 0;
	end
	local ndate = tonumber(tonumber(GetLocalDate("%y"))..tonumber(GetLocalDate("%m"))..tonumber(GetLocalDate("%d")));
	local nlibao = GetTask(XINGYUNLIBAO);
	local olddate = tonumber(GetByte(nlibao,1)..GetByte(nlibao,2)..GetByte(nlibao,3));
	local num = GetByte(nlibao,4);
	if num == nil then
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),2,0));
		num = 0;
	end
	if ndate == olddate then 
		CreateTaskSay({"<dec><npc> Mçi ngµy chØ cã thÓ nhËn tèi ®a 50 c¸i, ngµy mai h·y ®Õn nhĞ.","BiÕt råi/no"});
		return 0;
	end
	local ngonglao = CalcEquiproomItemCount(6,1,1411,-1)
	local nxunzhang = CalcEquiproomItemCount(6,1,1412,-1)
	if ngonglao < 1 then
		CreateTaskSay({"<dec><npc> §¹i hiÖp kh«ng mang theo <color=yellow>C«ng tr¹ng lÖnh<color>.","BiÕt råi/no"});
		return 0;
	end
	if nxunzhang < 1 then
		CreateTaskSay({"<dec><npc> §¹i hiÖp kh«ng mang theo <color=yellow>Huy ch­¬ng Tèng Kim<color>. H·y dïng ®iÓm tİch lòy ®Ó ®æi lÊy Huy ch­¬ng Tèng Kim ","BiÕt råi/no"});
		return 0;
	end	
	num = num + 1;
	if num >= 50 then
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),1,tonumber(GetLocalDate("%y"))));
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),2,tonumber(GetLocalDate("%m"))));
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),3,tonumber(GetLocalDate("%d"))));
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),4,0));
	else
		SetTask(XINGYUNLIBAO,SetByte(GetTask(XINGYUNLIBAO),4,num));
	end
	ConsumeEquiproomItem(1, 6, 1, 1411, -1)
	ConsumeEquiproomItem(1, 6, 1, 1412, -1)
	local nidx = AddItem(6,1,1413,1,0,0);
	WriteLog(format("[XINGYUNLIBAO]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	CreateTaskSay({"<dec><npc>§· nhËn thµnh c«ng 1 <color=yellow>Tói quµ may m¾n<color>.","BiÕt råi/no"});
end

function about()
	CreateTaskSay({"<dec><npc>Tõ ngµy 28/4/2007 ®Õn 13/5/2007, ng­êi ch¬i cÊp 50 ®· n¹p thÎ cã thÓ ®Õn chç ta dïng 1 <color=yellow>C«ng tr¹ng lÖnh<color> (®ãng 30 v¹n phİ ®¨ng kı cho ta ®Ó nhËn) vµ 1 <color=yellow>Huy ch­¬ng Tèng Kim<color> (dïng 500 ®iÓm tİch lòy ®Ó ®æi t¹i Qu©n Nhu Quan) ®Ó ®æi lÊy ","BiÕt råi/no"})
end