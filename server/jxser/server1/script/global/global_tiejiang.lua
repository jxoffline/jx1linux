

Include("\\script\\global\\recoin_goldenequip.lua")
Include("\\script\\global\\equipenchase_help.lua") 
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\global\\×ÏÉ«¼°»Æ½ð×°±¸ÖýÔì.lua")
Include("\\script\\global\\shenmi_chapman.lua");	--ÐÞ×°±¸¹¦ÄÜ
Include("\\script\\global\\equip_system.lua"); -- TÝnh n¨ng: ChÕ t¹o ®å tÝm vµ hkmp
Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")



--------¹Ì¶¨¶Ô»° ³ÇÊÐ--------
function tiejiang_city(...)
	
	local nNpcIndex = GetLastDiagNpc();
	--local szNpcName = GetNpcName(nNpcIndex);
	--if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end
	local szNpcName = "Thî rÌn trong thµnh"
	local tbDailog = DailogClass:new(szNpcName);
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	
	local aryParam = arg;
	
	if (getn(aryParam) == 0) then
		tbDailog.szTitleMsg = TIEJIANG_DIALOG
	else
		for i = 1, getn(aryParam) do
			if (i == 1) then
				tbDailog.szTitleMsg = TIEJIANG_DIALOG
			else
				local _,_, szOpt, szFun = strfind(aryParam[i], "([^/]+)/([^/]+)")
				local fn = getglobal(szFun)
				if fn then
					tbDailog:AddOptEntry(szOpt, fn);	
				end
			end;
		end;
	end;
	
	
	tbDailog.szTitleMsg = gsub(tbDailog.szTitleMsg, "<dec>", "")
	tbDailog:AddOptEntry("Giao dÞch", yes);
	--tbDailog:AddOptEntry("Cöa hµng tinh lùc", energy_sale);
	tbDailog:AddOptEntry("VËt phÈm ®óc", onFoundry);
	--tbDailog:AddOptEntry("VËt phÈm kh¶m n¹m", jewel_yes);
	tbDailog:AddOptEntry("Xö lý <trang bÞ ®· bÞ háng>", deal_brokenequip);
	--tbDailog:AddOptEntry("Ta ®Õn nhËn nhiÖm vô S¬ nhËp", education_tiejiang);	
	--tbDailog:AddOptEntry("Nh©n tiÖn ghÐ qua th«i", no, {});
	tbDailog:Show()
end;
--------¹Ì¶¨¶Ô»° ÐÂÊÖ´å------
function tiejiang_village(...)
	local aryParam = arg;
	local aryDescribe = {
		--szDialog,		--Ìú½³µÄËµ»°£¬ÔÚ¸÷³ÇÊÐÌú½³´¦
		"Giao dÞch/yes",
		
		--Change request 04/06/2011, ®ãng chÕ t¹o trang bÞ b¹ch kim - Modified by DinhHQ - 20110605
		"VËt phÈm ®óc/onFoundry",
		
		--"Ta ®Õn nhËn nhiÖm vô S¬ nhËp/tboss",
		"Nh©n tiÖn ghÐ qua th«i/no",
	};
	
	if (getn(aryParam) == 0) then
		tinsert(aryDescribe, 1, TIEJIANG_DIALOG)
	else
		for i = 1, getn(aryParam) do
			if (i == 1) then
				tinsert(aryDescribe, 1, aryParam[i]);
			else
				tinsert(aryDescribe, 2, aryParam[i]);
			end;
		end;
	end;
	CreateTaskSay(aryDescribe);
end;

--------ÏâÇ¶--------
function jewel_yes()
	CreateTaskSay({"<dec><npc>Thñy tinh kh¶m n¹m liªn quan ®Õn sù c©n b»ng ngò hµnh, ph­¬ng ph¸p chuyÓn linh khÝ tuyÖt nhiªn kh«ng thÓ dïng søc ng­êi ®­îc, kh«ng h¼n nh­ ®¹i hiÖp hi väng thµnh vËt phÈm tuyÖt thÕ nh©n gian, mµ vò khÝ ®å phæ vµ vùc ngoµi kú tr©n chØ gióp chuyÓn ®æi ®¼ng cÊp cña trang bÞ. C¸c h¹ muèn kh¶m n¹m trang bÞ nµy kh«ng?", "B¾t ®Çu kh¶m n¹m/jewel_yes1", "Liªn quan kh¶m n¹m/help", "§Ó ta suy nghÜ kü l¹i xem/no"});
end

function jewel_yes1()
	EnchaseItem()
end

-------No--------
function no()
end;

------¾«Á¦-------
function energy_sale()
	CreateStores();
	AddShop2Stores(174, "Cöa hµng tinh lùc", 15, 100, "fBuyCallBack(%d,%d)");
	OpenStores();
end

function fBuyCallBack(nItemIdx, nPrice)
	local nCount = 1
	local itemgenre, itemdetail, itemParticular = GetItemProp(nItemIdx)
	if itemgenre == 6 and itemdetail == 1 and itemParticular == 2317 then
		-- ÊÔÁ¶Ìû
		AddStatData("jlxiaohao_shiliantiegoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2355 then
		-- ÐþÌì½õÄÒ
		AddStatData("jlxiaohao_xuantiangoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2369 then
		-- Çà¾ÔÁî
		AddStatData("jlxiaohao_qingjulinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2353 then
		-- ÔÆÂ¹Áî
		AddStatData("jlxiaohao_yunlulinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2352 then
		-- ²ÔÀÇÁî
		AddStatData("jlsxiaohao_canglanglinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2351 then
		-- ÐþÔ³Áî
		AddStatData("jlxiaohao_xuanyuanlinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2350 then
		-- ×ÏòþÁî
		AddStatData("jlxiaohao_zimanglinggoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 2744 then
		-- ÈçÒâÔ¿³×
		AddStatData("jlxiaohao_ruyiyaoshigoumai", nCount)
	elseif itemgenre == 6 and itemdetail == 1 and itemParticular == 1617 then
		-- Ñ×µÛÁî
		AddStatData("jlxiaohao_yandilinggoumai", nCount)
	end											
	return 1
end
