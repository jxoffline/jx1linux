--ÎäÁÖÁî»î¶¯
--By Ğ¡ÀË
--2007-03-29
Include( "\\script\\event\\wulinling\\head.lua" )

function wulinling_main()
	local aryTalk = {}
	tinsert(aryTalk,"<dec><npc>Nh©n dŞp Sinh nhËt <color=yellow>Vâ l©m TruyÒn Kú trßn 2 n¨m<color> (11/06/2005 - 11/06/2007), hoan nghªnh mäi ng­êi ®Õn tham gia ho¹t ®éng thu thËp Vâ l©m lÖnh bµi!");
	tinsert(aryTalk,"Ta muèn t×m hiÓu ho¹t ®éng nµy/wulinling_about");
	
	if wulinling_date() == 1  then
		tinsert(aryTalk,"Ta ®Õn giao lÖnh bµi!/wulinling_give");
	end
	tinsert(aryTalk,"Ta muèn xem sè l­îng Vâ l©m lÖnh cña c¸c bang héi ®· giao/wulinling_query");
	tinsert(aryTalk,"Ta sÏ quay l¹i sau!/OnCancel");
	
	CreateTaskSay(aryTalk);
end

function wulinling_query()
	local szary = "<dec><npc>Lóc 00:00 sÏ cËp nhËt sè l­îng lÖnh bµi cña tõng bang héi giao n¹p trong ngµy vµ thèng kª xÕp h¹ng. \n\n";
	local nDate = tonumber(WULINLING_DATE[2]..date("%M"))
	if tonumber(GetLocalDate("%Y%m%d%H%M")) > (nDate + 5) then --ÍÆ³Ù10·ÖÖÓ.·ÀÖ¹RelayÑÓ³ÙÎÊÌâ
		checkwulinlingPh();
		if WULINLING_PHTB[1][1] ~= nil then
			szary = format("Ho¹t ®éng %s ®· kÕt thóc, chóc mõng bang héi <color=red>%s<color> ®· nhËn ®­îc t­ c¸ch tham dù cuéc thi <color=yellow> Thiªn H¹ §Ö NhÊt Bang <color> vµo th¸ng 5. \n",szary,WULINLING_PHTB[1][1][1]);
		end
	end
	CreateTaskSay({ szary,
			 "Ta muèn xem sè l­îng Vâ l©m lÖnh ®· ®­îc bang héi thu thËp/wulinling_queryMy",
			 "Ta muèn xem sè l­îng Vâ l©m lÖnh cña 10 bang héi xÕp h¹ng ®Çu tiªn/wulinling_queryFirst",
			 "KÕt thóc ®èi tho¹i/OnCancel"
		 });
end

function wulinling_queryFirst()
	if tonumber(GetLocalDate("%Y%m%d%H")) < ( tonumber(WULINLING_DATE[1]) + 100 ) then
		CreateTaskSay({"<dec><npc>HiÖn ch­a c«ng bè sè l­îng Vâ l©m lÖnh cña 10 bang héi xÕp h¹ng ®Çu tiªn","KÕt thóc ®èi tho¹i/OnCancel"});
		return 0;
	end
	checkwulinlingPh();
	local szary = "<dec><npc>XÕp h¹ng Bang héi thu thËp Vâ l©m lÖnh\n";
	for szkey,szName in WULINLING_PHTB[1] do
		szary = format("%s H¹ng <color=yellow>%2s<color>: <color=red>%-25s<color> <color=yellow>%d<color><enter>",
							szary, tostring(szkey),szName[1],szName[2]);
	end
	CreateTaskSay({szary,"KÕt thóc ®èi tho¹i/OnCancel"});
end

function wulinling_queryMy()
	
	if checkwulinlingLimit() == 0 then
		CreateTaskSay({"Xin lçi! §¹i hiÖp ch­a gia nhËp bang héi nµo c¶!", "KÕt thóc ®èi tho¹i/OnCancel"});
		return 0;
	end
	local szlgname = GetTongName();
	--****ÅĞ¶ÏÊÇ·ñ´´½¨ÁË¸ÃÉçÍÅ
	checkCreatLG(szlgname);
	
	--**ÅĞ¶ÏÊÇ·ñ¼ÓÈëÁË¸ÃÉçÍÅ
	checkJoinLG(szlgname);
	
	local nLgTaskSum = LG_GetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASK)
	local nLgTaskPh = LG_GetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASKPH) --ÅÅÃû
	--local nLgMemberTaskSum = LG_GetMemberTask(WULINLING_LGTYPE, szlgname,GetName(), WULINLING_LGMEMTASK); --³ÉÔ±Ìá½»Á¿
	local szPh = "";
	if nLgTaskPh == 0 or nLgTaskPh == nil then
		szPh = "<color=yellow>hiÖn ch­a<color>";
	else
		szPh = format("<color=yellow>%d<color>", nLgTaskPh);
	end
	CreateTaskSay({format("<dec><npc> KÕt qu¶ tham gia thu thËp<enter>Bang nµy xÕp h¹ng: %s<enter>Tæng sè thu ®­îc: <color=yellow>%d<color><enter> ", szPh, nLgTaskSum),"KÕt thóc ®èi tho¹i/OnCancel"});
	
end


function wulinling_give()
	if checkwulinlingLimit() == 0 then
		CreateTaskSay({"Xin lçi! §¹i hiÖp ch­a gia nhËp bang héi nµo c¶!", "KÕt thóc ®èi tho¹i/OnCancel"});
		return 0;
	end
	local szlgname = GetTongName();
	--****ÅĞ¶ÏÊÇ·ñ´´½¨ÁË¸ÃÉçÍÅ
	checkCreatLG(szlgname);
	
	--**ÅĞ¶ÏÊÇ·ñ¼ÓÈëÁË¸ÃÉçÍÅ
	checkJoinLG(szlgname);
	
	--**Ìá½»ÎäÁÖÁî
	wulinling_process(szlgname);
	
end

function wulinling_process(szlgname)
	local nSumCount = CalcEquiproomItemCount(6,1,WULINLING_ITEM,-1);
	--print(nSumCount);
	if nSumCount == 0 then
		CreateTaskSay({"<dec><npc>§¹i hiÖp ch­a cã lÖnh bµi nµo trong ng­êi!","KÕt thóc ®èi tho¹i/OnCancel"});
		return 0;
	end
	--É¾ÎïÆ·
	if ConsumeEquiproomItem(nSumCount,6,1,WULINLING_ITEM,-1) ~= 1 then
		WriteLog(format("[Vâ L©m lÖnh]\t%s\tAccount:%s\tName:%s\tXãa vËt phÈm thÊt b¹i: Vâ l©m lÖnh ",
			GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName() ));
		CreateTaskSay({"<dec><npc>Kh«ng thÓ giao Vâ l©m lÖnh !","KÕt thóc ®èi tho¹i/OnCancel"});
		return 0;
	end
	--ÉèÖÃ±äÁ¿
	local nLgTaskSum = LG_GetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASK)
	if nLgTaskSum == nil then
		LG_ApplySetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASK, 0 , "", "");
	end
	LG_ApplyAppendLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASK, nSumCount, "", "")
	LG_ApplySetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASKDATA, date("%m%d%H%M%S") , "", "");

	--LG_ApplyAppendMemberTask(WULINLING_LGTYPE, szlgname, GetName(), WULINLING_LGMEMTASK, nSumCount, "","");
	
	--LG_ApplySetLeagueTask(WULINLING_LGTYPE, szlgname, WULINLING_LGTASKPH, 1 , "", "");
	WriteLog(format("[Vâ L©m lÖnh]\t%s\tAccount:%s\tName:%s\t giao Vâ l©m lÖnh thµnh c«ng. Tæng sè: %d",
				GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(), nSumCount));
	CreateTaskSay({"<dec><npc>B¹n ®· giao thµnh c«ng " .. nSumCount .. " Vâ l©m lÖnh", "KÕt thóc ®èi tho¹i/OnCancel"});
end

function wulinling_about()
	CreateTaskSay({"<dec><npc>Tõ <color=yellow>ngµy 6 th¸ng 4<color> ®Õn <color=yellow>24h ngµy 26 th¸ng 4<color>, qu¸i vËt t¹i c¸c khu vùc luyÖn c«ng tõ cÊp 50 trë lªn sÏ ngÉu nhiªn r¬i ra Vâ l©m lÖnh. Bang héi nµo thu thËp vµ giao cho Vâ l©m TruyÒn nh©n t¹i c¸c thµnh thŞ nhiÒu nhÊt sÏ nhËn ®­îc t­ c¸ch tham gia cuéc thi ®Êu <color=yellow>Thiªn h¹ ®Ö nhÊt bang<color> (Xem th«ng tin chi tiÕt trªn trang chñ)!","KÕt thóc ®èi tho¹i/OnCancel"});
end


function OnCancel()
	
end
