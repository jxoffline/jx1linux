-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏÊÕ·Ñ°æÒ» 2009ÄêÐÂÄê-ÊÙÉñ¶Ô»°

-- Edited by ×Ó·Çô~
-- 2009/01/07 16:50
-- 
-- ======================================================


Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua");

tbChunjie_Jieri_2009 = {};
tbChunjie_Jieri_2009.szClassName = "tbChunjie_Jieri_2009";

TB_CHUNJIE0901_FINDNPC = {
	tbFuLuShouNpc	= {
			{	nNpcId = 455, nLevel = 1, nMapId = 1, szName = "Phóc ThÇn", 
				tbPos = {{197,192}, {204,195}, {196,203}, {187,198}, {204,205}}, 
				szScriptPath = "\\script\\event\\chunjie_jieri\\200901\\fulushou\\npc_fushen.lua"},
				
			{	nNpcId = 455, nLevel = 1, nMapId = 176, szName = "Léc ThÇn", 
				tbPos = {{179,211}, {174,201}, {184,192}, {207,189}, {203,202}}, 
				szScriptPath = "\\script\\event\\chunjie_jieri\\200901\\fulushou\\npc_lushen.lua"},
				
			{	nNpcId = 455, nLevel = 1, nMapId = 37, szName = "Thä ThÇn", 
				tbPos = {{210,196}, {222,191}, {228,193}, {208,188}, {220,187}}, 
				szScriptPath = "\\script\\event\\chunjie_jieri\\200901\\fulushou\\npc_shoushen.lua"},
		},
	tbLine			= {	
					[1] = {{1,2},{2,3},{3,1}},	-- ¸£Â»ÊÙ
					[2] = {{1,3},{3,2},{2,1}},	-- ¸£ÊÙÂ»
	},
	tbArry			= {
		-- ¹æÔò1
		-- 	µÚÒ»ÁÐ£º¸£Â»ÊÙ
		-- 	µÚ¶þÁÐ£ºÂ»ÊÙ¸£
		-- 	µÚÈýÁÐ£ºÊÙ¸£Â»
		-- ¹æÔò2£º
		-- 	µÚÒ»ÁÐ£º¸£ÊÙÂ»
		-- 	µÚ¶þÁÐ£ºÊÙÂ»¸£
		-- 	µÚÈýÁÐ£ºÂ»¸£ÊÙ
		-- 1:·­±¶£»2:¼õ°ë£»3:²»±ä
		{1, 2, 3},
		{1, 3, 2},
		{2, 1, 3},
		{2, 3, 1},
		{3, 1, 2},
		{3, 2, 1},
	},
	
	nNpcParam_selfid	= 1,
	nNpcParam_nextid	= 2,
	nNpcParam_ntimed	= 3,
	nNpcParam_ladder	= 4,
	nNpcParam_ntype		= 5,
	
	TSK_CHUNJIE2009_VERSION = 1937,
	TSK_CHUNJIE2009_FLS_NTIMEID = 1938,
	TSK_CHUNJIE2009_FLS_STAGE = 1939,
	TSK_CHUNJIE2009_FLS_MAXEXP = 1940,
	
	nDate_Start = 09011612,
	nDate_Close = 09021520,
	
	nMaxExp = 360000000,
}


function reset_task_version()
	if (GetTask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_VERSION) ~= TB_CHUNJIE0901_FINDNPC.nDate_Start) then
		SetTask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_VERSION, TB_CHUNJIE0901_FINDNPC.nDate_Start);
		SetTask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_MAXEXP, 0);
		SetTask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_NTIMEID, 0);
		SetTask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_STAGE, 0);
	end
end


function OnCancel()
end


function tbChunjie_Jieri_2009:fulushounpc_settask(ntaskid, nvalue, nbyte)
	local nTskValue = GetTask(ntaskid);
	
	if (nbyte) then
		nTskValue = SetByte(nTskValue, nbyte, nvalue);
		SetTask(ntaskid, nTskValue);
	else
		SetTask(ntaskid, nvalue);
	end
end


function tbChunjie_Jieri_2009:fulushounpc_gettask(ntaskid, nbyte)
	local nTskValue = GetTask(ntaskid);
	if (nbyte) then
		return GetByte(nTskValue, nbyte);
	else
		return nTskValue;
	end
end




function tbChunjie_Jieri_2009:fulushounpc_main()
	
	reset_task_version();
	
	local nSvrTimeId = tonumber(GetLocalDate("%y%m%d%H"));
	
	if (nSvrTimeId < 09011612 or nSvrTimeId > 09021520) then
		CreateTaskSay({"<dec><npc>".."Xin chµo ng­êi phµm trÇn.", "KÕt thóc ®èi tho¹i/OnCancel"});
		return 0;
	end
	
	local nNpcIndex = GetLastDiagNpc();
	local nTimeid = GetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_ntimed);
	--Msg2Player(nTimeid, nSvrTimeId)
	if (nTimeid ~= nSvrTimeId) then
		CreateTaskSay({"<dec><npc>".."Ho¹t ®éng ®· kÕt thóc.", "KÕt thóc ®èi tho¹i/OnCancel"});
		return 0;
	end
	
	local nnpc_selfid = GetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_selfid);
	local nnpc_nextid = GetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_nextid);
	
	local nmy_nextid = self:fulushounpc_gettask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_STAGE, 1);
	
	local nMyTimeId = self:fulushounpc_gettask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_NTIMEID);
	local nMyStage = self:fulushounpc_gettask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_STAGE, 2);
	
	--print(nMyTimeId, nMyStage, nnpc_nextid, nnpc_selfid)
	
	if (nMyTimeId ~= nTimeid) then
		CreateTaskSay({"<dec><npc>".."H·y t×m gióp 2 vÞ b»ng h÷u cña ta, chóng ta cÇn ph¶i lªn Thiªn §×nh ®Ó b¸i kiÕn Ngäc Hoµng.", 
				format("%s/#%s:fulushounpc_start(%d, %d, %d, %d, %d)", "Ta muèn t×m vÞ thø nhÊt", self.szClassName, nTimeid, nnpc_selfid, nnpc_nextid, 1, nNpcIndex),
				"<#> L¸t n÷a ta sÏ quay l¹i!/OnCancel"});
	elseif (nMyTimeId == nTimeid and nmy_nextid == nnpc_selfid and nMyStage == 1) then
		CreateTaskSay({"<dec><npc>".."C¸m ¬n ®¹i hiÖp ®· chuyÓn tin, ta sÏ ®Õn chç hä ngay!", 
				format("%s/#%s:fulushounpc_start(%d, %d, %d, %d, %d)", "Ta muèn tiÕp tôc t×m vÞ thø 2", self.szClassName, nTimeid, nnpc_selfid, nnpc_nextid, 2, nNpcIndex),
				"<#> L¸t n÷a ta sÏ quay l¹i!/OnCancel"});
	elseif (nMyTimeId == nTimeid and nmy_nextid == nnpc_selfid and nMyStage == 2) then
		CreateTaskSay({"<dec><npc>".."C¸m ¬n ®¹i hiÖp ®· chuyÓn tin! Ta ban cho ng­¬i chót quµ män mõng n¨m míi!", 
				format("%s/#%s:fulushounpc_start(%d, %d, %d, %d, %d)", "NhËn lÊy lÔ vËt", self.szClassName, nTimeid, nnpc_selfid, nnpc_nextid, 3, nNpcIndex),
				"<#> L¸t n÷a ta sÏ quay l¹i!/OnCancel"});
	elseif (nMyTimeId == nTimeid and nmy_nextid == nnpc_nextid and nMyStage == 3) then
		CreateTaskSay({"<dec><npc>".."C¸m ¬n ®¹i hiÖp ®· chuyÓn tin, ta sÏ ®Õn chç hä ngay!", 
				"KÕt thóc ®èi tho¹i/OnCancel"});
	else
		CreateTaskSay({"<dec><npc>".."Xin chµo ng­êi phµm trÇn.", "KÕt thóc ®èi tho¹i/OnCancel"});
	end
end

function tbChunjie_Jieri_2009:fulushounpc_start(ntimeid, nnpc_selfid, nnpc_nextid, nstage, nNpcIndex)
	self:fulushounpc_settask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_STAGE, nnpc_nextid, 1);
	self:fulushounpc_settask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_STAGE, nstage, 2);
	
	self:fulushounpc_settask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_NTIMEID, ntimeid);
	
	-- ÕÒµ½×îºóÒ»¸öÈËÔò·¢½±
	if (nstage == 3) then
		local ntype = GetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_ntype);
		local nladder = GetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_ladder) + 1;
		SetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_ladder, nladder);
		--Msg2Player("ÄãÊÇµÚ"..nladder)
		
		local nladder = GetNpcParam(nNpcIndex, TB_CHUNJIE0901_FINDNPC.nNpcParam_ladder);
		local coef = 100;
		if (nladder >= 1 and nladder <= 3) then
			coef = 300;
		elseif (nladder >= 4 and nladder <= 10) then
			coef = 200;
		end
		
		-- local nrand = random();		-- ÔËÆøºÃ¾Í·­±¶
		if (nladder <= 10 and ntype == 1) then
			coef = coef * 2;
			--Msg2Player("ÔËÆøºÃ·­±¶")
		elseif (ntype == 2) then						-- ²»ºÃ¾Í¼õ°ëà¶
			coef = coef * 0.5;
			--Msg2Player("ÔËÆø²»ºÃ¼õ°ë")
		else
			--Msg2Player("²»·­±¶");
		end
		
		-- ÏÈ¿´ÊÇ²»ÊÇµÚÒ»Ãû¸øµÀ¾ß½±Àø
		if (nladder == 1) then
			tbItem = {
				{szName="§éng S¸t B¹ch Kim §iªu Long Giíi", nQuality=1, tbProp={0, 143},nRate = 0.5},
				{szName="§éng S¸t B¹ch Ngäc Cµn Kh«n Béi", nQuality=1, tbProp={0, 144},nRate = 0.5},
				{szName="§éng S¸t B¹ch Kim Tó Phông Giíi", nQuality=1, tbProp={0, 145},nRate = 0.5},
				{szName="§éng S¸t PhØ Thóy Ngäc H¹ng Khuyªn", nQuality=1, tbProp={0, 146},nRate = 0.5},
				{szName="ThÇn bÝ kho¸ng th¹ch", tbProp={6,1,398,1,1,0},nRate = 0.5},
				{szName="Vâ L©m MËt TÞch", tbProp={6,1,26,1,1,0},nRate = 1},
				{szName="TÈy Tñy Kinh", tbProp={6,1,22,1,1,0},nRate = 1},
--				{szName="¶´²ìÖ®°×½ðµñÁú½ä", nQuality=1, tbProp={0, 143},nRate = 20},
--				{szName="¶´²ìÖ®°×ÓñÇ¬À¤Åå", nQuality=1, tbProp={0, 144},nRate = 20},
--				{szName="¶´²ìÖ®°×½ðÐâ·ï½ä", nQuality=1, tbProp={0, 145},nRate = 20},
--				{szName="¶´²ìÖ®ôä´äÓñÏîÈ¦", nQuality=1, tbProp={0, 146},nRate = 10},
--				{szName="ÉñÃØ¿óÊ¯", tbProp={6,1,398,1,1,0},nRate = 10},
--				{szName="ÎäÁÖÃØ¼®", tbProp={6,1,26,1,1,0},nRate = 10},
--				{szName="Ï´Ëè¾­", tbProp={6,1,22,1,1,0},nRate = 10},
			};
			tbAwardTemplet:GiveAwardByRate(tbItem, "chunjie_jieri2009_fulushou")
			
		end
				
		local nLevel = GetLevel();
		local naddexp = nLevel * nLevel * coef;
		local nmycurexp = self:fulushounpc_gettask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_MAXEXP);
		if (nmycurexp >= TB_CHUNJIE0901_FINDNPC.nMaxExp) then
			Msg2Player("§· nhËn kinh nghiÖm giíi h¹n cao nhÊt.");
			return 0;
		elseif (nmycurexp + naddexp >= TB_CHUNJIE0901_FINDNPC.nMaxExp) then
			naddexp = TB_CHUNJIE0901_FINDNPC.nMaxExp - nmycurexp;
		end
		
		self:fulushounpc_settask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_MAXEXP, nmycurexp + naddexp);
		AddOwnExp(naddexp);
		Msg2Player(format("NhËn ®­îc kinh nghiÖm ——%d", naddexp));
		
		self:fulushounpc_settask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_STAGE, nstage, 0);
		
		-- self:fulushounpc_settask(TB_CHUNJIE0901_FINDNPC.TSK_CHUNJIE2009_FLS_NTIMEID, ntimeid);
	else
		Msg2Player("NhËn nhiÖm vô vµ t×m nh÷ng vÞ b»ng h÷u kh¸c.");
	end
end

