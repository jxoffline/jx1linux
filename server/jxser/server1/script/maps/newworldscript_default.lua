-------------------------------------------------------------------------
-- FileName		:	NewWorldScript_H.lua
-- Author		:	LuoBaohang
-- CreateTime	:	2005-09-02
-- Desc			:  	µØÍ¼ÇÐ»»´¥·¢½Å±¾
-------------------------------------------------------------------------
Include("\\script\\lib\\string.lua")
Include("\\script\\maps\\newworldscript_h.lua")
Include("\\script\\maps\\maplimit.lua")
Include("\\script\\item\\tianziyuxi.lua");	-- Ìì×ÓÓñçô

Include("\\script\\misc\\eventsys\\type\\map.lua")
aryChangeWorldExec = {}
W,X,Y =0

function PraseParam(szParam)
	if (szParam == nil) then
		return nil
	end
	if (aryChangeWorldExec[SubWorld] == nil) then	--»¹Ã»ÓÐº¯ÊýÁ´£¬·ÖÎö²ÎÊý
		aryChangeWorldExec[SubWorld] = {}
		local aryFuns = split(szParam, '|')
		local j=1;
		for i = 1,getn(aryFuns) do
			local ExecFun = aryFuncStore[aryFuns[i]]
			if (ExecFun == nil)then
				print("Error: (Ne v¹n v¹norld:%d) Ch­a ®Þnh nghÜ hµm sè%s", SubWorld, aryFuns[i])
			else
				aryChangeWorldExec[SubWorld][j] =  ExecFun;
				j = j+1;
			end	
		end
	end
	return 1;
end

function OnNewWorldDefault(szParam)
	-- nW,nX,nY = GetWorldPos()

	-- if CheckMapEnter() < 1 then
	-- 	print("Map enter Vuot cap !!!!!")
	-- 	if (W == nil or X == nil or Y ==nil )then
	-- 		print("Map enter is Nil Value")
	-- 		--NewWorld(53, 1626, 3179)--phï ba l¨ng huyÖn
	-- 	elseif (nW == W) then
	-- 		print("Gia tri map bang nhau")
	-- 		--NewWorld(53, 1626, 3179)--phï ba l¨ng huyÖn
	-- 	else
	-- 		print("Ok,Phu ve noi truoc do")
	-- 		print(W)
	-- 		print(X)
	-- 		print(Y)
	-- 		--NewWorld(W, X, Y)--phï vÒ n¬i tr­íc ®ã
	-- 	end
	-- 	Talk(1,"","N¬i ®¹i hiÖp võa b­íc ch©n tíi cùc kú nguy hiÓm. Ta ®· may m¾n ®­a ®­îc ®¹i hiÖp vÒ ®©y !")
	-- 	Msg2Player("N¬i ®¹i hiÖp võa b­íc ch©n tíi cùc kú nguy hiÓm. Ta ®· may m¾n ®­a ®­îc ®¹i hiÖp vÒ ®©y !")
	-- end


	-- if CheckMapEnter() < 1 then
	-- 	NewWorld(53, 1626, 3179)--phï ba l¨ng huyÖn
	-- 	Talk(1,"","N¬i ®¹i hiÖp võa b­íc ch©n tíi cùc kú nguy hiÓm. Ta ®· may m¾n ®­a ®­îc ®¹i hiÖp vÒ ®©y !")
	--     Msg2Player("N¬i ®¹i hiÖp võa b­íc ch©n tíi cùc kú nguy hiÓm. Ta ®· may m¾n ®­a ®­îc ®¹i hiÖp vÒ ®©y !")
	-- end

	--print("OnNewWorldDefault invoked!!!")
	if (PraseParam(szParam) == 1) then
		for i = 1,getn(aryChangeWorldExec[SubWorld]) do	--Ö´ÐÐº¯ÊýÁ´
			aryChangeWorldExec[SubWorld][i](1)
		end
	end
	
	YuXiChangeMapMsg();
	EventSys:GetType("EnterMap"):OnPlayerEvent(SubWorldIdx2ID(SubWorld), PlayerIndex)
	EventSys:GetType("EnterMap"):OnPlayerEvent("ALL", PlayerIndex)
end

function OnLeaveWorldDefault(szParam)
	 W,X,Y = GetWorldPos(); --l­u l¹i vÞ trÝ tr­íc khi trêi map

	print("OnLeaveWorldDefault invoked!!!")
	if (PraseParam(szParam) == 1) then
		for i = 1,getn(aryChangeWorldExec[SubWorld]) do	--Ö´ÐÐº¯ÊýÁ´
			aryChangeWorldExec[SubWorld][i](0)
		end
	end
	EventSys:GetType("LeaveMap"):OnPlayerEvent(SubWorldIdx2ID(SubWorld), PlayerIndex)
	EventSys:GetType("LeaveMap"):OnPlayerEvent("ALL", PlayerIndex)
end