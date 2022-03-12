-- ÎÄ¼þÃû¡¡£ºnpctree.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2008-01-16 14:27:13
--ÖÖÊ÷·½·¨: ÓÒ½¡µã»÷À´ÖÖÊ÷
--Ìõ¼þ: 
--- Ê÷ÃçÖ»¿ÉÖÖÔÚ³ÇÊÐ, ´åÕò
--³É³¤Ê±¼ä: 120 Ãë
-- 1 ÃëÖÁ40Ãë: Ê÷ÃçÐÎ×´
--41ÃëÖÁ60Ãë: Ê÷Ãç³¤´ó 
--61ÃëÖÁ90Ãë: ´óÊ÷ÓÐ»¨
--91ÃëÖÁ120Ãë: ´ýÁìÈ¡½±Æ·
--ÁìÈ¡ÀñÎïÊ±¼ä: 120 Ãë
--121ÃëÖÁ240Ãë: ÓÒ½¡µã»÷´óÊ÷¿É»ñµÃ½±Æ·
--241Ãë¿ªÊ¼´óÊ÷×Ô¶¯ÏûÊ§.

--¿É»ñµÃËæ»ú¾­Ñé£¬ÓÐ¸ÅÂÊ
--ÐòºÅ	¾­Ñé	¸ÅÂÊ
--1	500,000	35%
--2	1,000,000	30%
--3	1,500,000	25%
--4	2,000,000	10%
--- ¿É»ñµÃ½±ÀøÎïÆ·£¬ÓÐ¸ÅÂÊ
--ÐòºÅ	ÎïÆ·	¸ÅÂÊ
--1	ÖÐ¸£ÔµÂ¶	75%
--2	´ó¸£ÔµÂ¶	20%
--3	ÏÉ²ÝÂ¶	5%

Include("\\script\\event\\springfestival08\\luckplanting\\treehead.lua")
--Include("\\script\\event\\springfestival08\\luckplanting\\head.lua")
--Include("\\script\\event\\springfestival08\\lib\\addaward.lua")
Include("\\script\\lib\\awardtemplet.lua")
function isTree0801Master(nNpcIdx, ntask)

	
	local nMaster = GetNpcParam(nNpcIdx, PRM_TREE_0801_PLAYID);
	local nGameTime = GetNpcParam(nNpcIdx, PRM_TREE_0801_GAMETIME);
	
	if (nMaster < 0) then
		nMaster = nMaster + 4294967296;	-- id+2^32
	end;
	if (FileName2Id(GetName()) == nMaster and GetRoleCreateTimeData() == nGameTime) then
		return 1;
	end;
	return nil
end;

function main()	--¶Ô»°Èë¿Ú
	local nNpcIdx = GetLastDiagNpc();
	
	if (isTree0801Master(nNpcIdx)) then
		local nEvent = GetNpcParam(nNpcIdx, PRM_TREE_0801_EVENT);
		if nEvent == 1 then
			Msg2Player("C©y con ®ang lín.")
		elseif nEvent == 2 then
			Msg2Player("C©y ®ang ®©m chåi n¶y léc.")
		elseif nEvent == 3 then
			Msg2Player("C©y b¾t ®Çu ra hoa.")
		elseif nEvent == 4 then
			Msg2Player("ThËt hay qu¸,hoa th¬m ngµo ng¹t, c¸c vÞ ®¹i hiÖp ®õng nãng lßng rÊt nhanh sÏ nhËn ®­îc phÇn th­ëng.")
		elseif nEvent == 5 then
			Msg2Player("§¸p t¹ sù ch¨m chØ vun trång, xin nhËn phÇn th­ëng nµy.")
			SetNpcParam(nNpcIdx, PRM_TREE_0801_EVENT, 6);
			luckplanting_0801_GiveAward()
		elseif nEvent == 6 then
			Msg2Player("C©y nµy ta ®· nhËn phÇn th­ëng, nhÊp chän kh«ng cã t¸c dông g×! Sau kú vËy kµ?")
		end
	else
		Msg2Player("C©y nµy kh«ng ph¶i b¹n trång.")
	end;
end;

function OnTimer(nNpcIdx, nTimeOut)
	if (nTimeOut == nil or nTimeOut > 0 ) then
		DelNpc(nNpcIdx)
		return 0;
	end;
	local nPlayerId = GetNpcParam(nNpcIdx, PRM_TREE_0801_PLAYID);
	if (nPlayerId < 0) then
		nPlayerId = nPlayerId + 4294967296;	-- id+2^32
	end;
	
	local nEvent = GetNpcParam(nNpcIdx, PRM_TREE_0801_EVENT);
	if nEvent >= 5 then		
		if nEvent == 5 then			
			local strOwnerName = gsub(GetNpcName(nNpcIdx), "C©y cña ", "")
			local nOwnerIndex = SearchPlayer(strOwnerName)
			local nOldPlayer = PlayerIndex
			if nOwnerIndex > 0 then
				PlayerIndex = nOwnerIndex
			end
			local nPosX, nPosY = GetNpcPos(nNpcIdx)
			tbLog:PlayerActionLog("EventUomMamMayMan","CayBienMat", "ChuaThuHoach", SubWorld, nPosX, nPosY)
			PlayerIndex = nOldPlayer
		end
		DelNpc(nNpcIdx)
		return
	end
	
	
	local nGameTime = GetNpcParam(nNpcIdx, PRM_TREE_0801_GAMETIME);
	
	local nX, nY = GetNpcPos(nNpcIdx);	--Ê÷×ø±ê
	local szName = GetNpcName(nNpcIdx);
	if plantTree_0801(nEvent+1, SubWorld, nX, nY, szName, nPlayerId, nGameTime) == 0 then
		SetNpcTimer(nNpcIdx, 18);
	else
		DelNpc(nNpcIdx)
	end
end;

function luckplanting_0801_GiveAward()
	local tbAward = 
		{
			{szName="§å Phæ Tö M·ng Kh«i",tbProp={6,1,2714,1,0,0},nCount=1,nRate=0.4},
			{szName="§å Phæ Tö M·ng Y",tbProp={6,1,2715,1,0,0},nCount=1,nRate=0.4},
			{szName="§å Phæ Tö M·ng Yªu §¸i",tbProp={6,1,2717,1,0,0},nCount=1,nRate=0.4},
			{szName="§å Phæ Tö M·ng Hé UyÓn",tbProp={6,1,2718,1,0,0},nCount=1,nRate=0.4},
			{szName="§å Phæ Tö M·ng H¹ng Liªn",tbProp={6,1,2719,1,0,0},nCount=1,nRate=0.4},
			{szName="§å Phæ Tö M·ng Béi",tbProp={6,1,2720,1,0,0},nCount=1,nRate=0.4},
			{szName="§å Phæ Tö M·ng Hµi",tbProp={6,1,2716,1,0,0},nCount=1,nRate=0.4},
			{szName="§å Phæ Tö M·ng Th­îng Giíi ChØ",tbProp={6,1,2721,1,0,0},nCount=1,nRate=0.01},
			{szName="§å Phæ Tö M·ng H¹ Giíi ChØ",tbProp={6,1,2722,1,0,0},nCount=1,nRate=0.01},
			{szName="§å Phæ Tö M·ng KhÝ Giíi",tbProp={6,1,2723,1,0,0},nCount=1,nRate=0.01},
			{szName="Tö M·ng LÖnh",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.01},
			{szName="HuyÒn Viªn LÖnh",tbProp={6,1,2351,1,0,0},nCount=1,nRate=1},
			{szName = "§iÓm Kinh NghiÖm", nExp=6000000,nRate=31.86},
			{szName = "§iÓm Kinh NghiÖm", nExp=8000000,nRate=25},
			{szName = "§iÓm Kinh NghiÖm", nExp=10000000,nRate=10},
			{szName = "§iÓm Kinh NghiÖm", nExp=15000000,nRate=5},
			{szName = "§iÓm Kinh NghiÖm", nExp=20000000,nRate=3},
			{szName = "§iÓm Kinh NghiÖm", nExp=30000000,nRate=2},
			{szName = "§iÓm Kinh NghiÖm", nExp=50000000,nRate=1},
			{szName="CÈm nang thay ®æi trêi ®Êt",tbProp={6,1,1781,1,0,0},nCount=1,nRate=15,tbParam={60}},
			{szName="Hoµng Kim Ên (C­êng hãa)",tbProp={0,3209},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=10080,},
			{szName="Hoµng Kim Ên (C­êng hãa)",tbProp={0,3210},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=10080,},
			{szName="Hoµng Kim Ên (C­êng hãa)",tbProp={0,3211},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
			{szName="Hoµng Kim Ên (Nh­îc hãa)",tbProp={0,3219},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=10080,},
			{szName="Hoµng Kim Ên (Nh­îc hãa)",tbProp={0,3220},nCount=1,nRate=0.5,nQuality = 1,nExpiredTime=10080,},
			{szName="Hoµng Kim Ên (Nh­îc hãa)",tbProp={0,3221},nCount=1,nRate=0.1,nQuality = 1,nExpiredTime=10080,},
			{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.1,nExpiredTime=43200},
			{szName="B¾c §Èu truyÒn c«ng thuËt",tbProp={6,1,1672,1,0,0},nCount=1,nRate=1},
		}
	tbAwardTemplet:Give(tbAward, 1, {"EventUomMamMayMan", "ThuHoach"})
end