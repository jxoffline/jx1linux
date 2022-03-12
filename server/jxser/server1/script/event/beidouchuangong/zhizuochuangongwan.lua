-- ÎÄ¼þÃû¡¡£ºzhizuochuangongwan.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2008-02-22 17:16:36
--ÖÆ×÷´«¹¦ÍèµÄ½Å±¾
IncludeLib("SETTING");
Include("\\script\\event\\BeiDouChuanGong\\lib\\compose.lua");
Include("\\script\\event\\BeiDouChuanGong\\lib\\addaward.lua");
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\event\\BeiDouChuanGong\\head.lua")
function BeiDouChuanGong_main(nStep)
	local tbSay 
	if nStep == 1 then
		tbSay = 
		{
			"<dec><npc>§Õn t×m ta ®Ó luyÖn c¸c lo¹i TruyÒn c«ng tiªn ®¬n cã ph¶i kh«ng?",
			"Ta ®Õn luyÖn c¸c lo¹i tiªn ®an/#BeiDouChuanGong_main(2)",
			"VÒ B¾c §Èu truyÒn c«ng thuËt/#BeiDouChuanGong_main(3)",
			"Th«ng tin thêi gian sö dông/#BeiDouChuanGong_main(4)",
			"KÕt thóc ®èi tho¹i/OnCancel",
		}
	elseif nStep == 2 then
		tbSay = 
		{
			"<dec><npc>Ng­¬i muèn luyÖn lo¹i tiªn ®¬n nµo?",
			"B¹ch Ch©n §¬n/#BeiDouChuanGong_zuodan([[bai]])",
			"HuyÕt Ch©n §¬n/#BeiDouChuanGong_zuodan([[xue]])",
			"HuyÒn Ch©n §¬n/#BeiDouChuanGong_zuodan([[xuan]])",
			"Tö Kim Ch©n §¬n/#BeiDouChuanGong_zuodan([[zijin]])",
			"KÕt thóc ®èi tho¹i/OnCancel",
		}
	elseif nStep == 3 then
		tbSay = 
		{
			format("<dec><npc>§iÒu kiÖn cña tiªn ®¬n: lóc truyÒn c«ng cho c¸c lo¹i tiªn ®¬n trªn ng­êi ph¶i cã ®ñ 1 triÖu kinh nghiÖm. Tiªn ®¬n cÇn nguyªn liÖu nh­ sau.<enter>B¹ch Ch©n §¬n: 1 b¾c ®Èu truyÒn c«ng thuËt, 1 thÊt tinh th¶o<enter>HuyÕt Ch©n §¬n: 1 b¾c ®Èu truyÒn c«ng thuËt, 1 b¸ch niªn thÊt tinh th¶o <enter>HuyÒn Ch©n §¬n: 1 b¾c ®Èu truyÒn c«ng thuËt, 1 thiªn niªn thÊt tinh th¶o<enter>Tö Kim Ch©n §¬n: 1 b¾c ®Èu truyÒn c«ng thuËt, 1 v¹n niªn ngò th¸i hoa<enter>Hoµng Ch©n §¬n:  bÝ truyÒn<enter>3 lo¹i tiªn ®¬n ®Çu, chØ cÇn ®ñ cÊp 50 vµ ®· n¹p thÎ míi cã thÓ sö dông vµ chØ nhËn ®­îc tæng kinh nghiÖm lµ 3 tû, ®¹t ®Õn kinh nghiÖm cao nhÊt ph¶i ®îi %d ngµy míi cã thÓ sö dông l¹i. ChØ cã ng­êi ch¬i chuyÓn sinh míi cã thÓ sö dông Tö Kim Ch©n §¬n. Tö Kim Ch©n §¬n vµ Hoµng Kim Ch©n §¬n nhËn ®iÓm kinh nghiÖm cã thÓ céng dån vµ sö dông xong th× ph¶i ®îi 60 ngµy míi cã thÓ sö dông tiÕp",floor( TSKV_BeiDouChuanGong_UseLimit/(60*60*24) ) ),
			"KÕt thóc ®èi tho¹i/OnCancel",
		}
	elseif nStep == 4 then
		
		local nCurTime			= GetCurServerTime()
		local nTSKVExp			= GetBeiDouChuanGongExp();
		local nTSKVTime			= GetTask(TSK_BeiDouChuanGong_NIANYUE);
		local nTSKVTime_ZiJin	= GetTask(TSK_BeiDouChuanGong_USEDTIME_ZIJIN);
		local nTSKVTime_Huang	= GetTask(TSK_BeiDouChuanGong_USEDTIME_HUANG);
		
		local szMsg_Common = "Víi c«ng lùc hiÖn t¹i, ®¹i hiÖp cã thÓ sö dông phæ th«ng truyÒn c«ng tiªn ®¬n.";
		local szMsg_ZiJin  = "Víi c«ng lùc hiÖn t¹i, ®¹i hiÖp cã thÓ sö dông Tö Kim Ch©n §¬n.";
		local szMsg_Huang  = "Víi c«ng lùc hiÖn t¹i, ®¹i hiÖp cã thÓ sö dông Hoµng Ch©n §¬n.";
		
		-- ÆÕÍ¨Õæµ¤
		if nTSKVExp >= 30e8 and nTSKVTime + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
			local nTime = (nTSKVTime + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
			local nDay	= floor(nTime  / (24*60*60) );
				  nTime	= mod( nTime, 24*60*60);
			local nHour	= floor( nTime / (60*60) );
				  nTime	= mod(nTime, 60*60);
			local nMin	= floor(nTime / 60 );
			local nSec	= mod(nTime, 60);
			
			szMsg_Common = format("HiÖn t¹i c¸c h¹ cÇn ®îi thªm <color=yellow>%d ngµy %d giê %d phót %d gi©y<color> míi cã thÓ sö dông phæ th«ng truyÒn c«ng tiªn ®¬n.",nDay,nHour,nMin,nSec);
		end
		
		-- ×Ï½ðÕæµ¤
		if nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
			local nTime = (nTSKVTime_ZiJin + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
			local nDay	= floor(nTime  / (24*60*60) );
				  nTime	= mod( nTime, 24*60*60);
			local nHour	= floor( nTime / (60*60) );
				  nTime	= mod(nTime, 60*60);
			local nMin	= floor(nTime / 60 );
			local nSec	= mod(nTime, 60);
			
			szMsg_ZiJin = format("HiÖn t¹i c¸c h¹ cÇn ®îi thªm <color=yellow>%d ngµy %d giê %d phót %d gi©y<color> míi cã thÓ sö dông Tö Kim Ch©n §¬n.",nDay,nHour,nMin,nSec);
		end
		
		-- »ÆÕæµ¤
		if nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit >= nCurTime then
			
			local nTime = (nTSKVTime_Huang + TSKV_BeiDouChuanGong_UseLimit - nCurTime);
			local nDay	= floor(nTime  / (24*60*60) );
				  nTime	= mod( nTime, 24*60*60);
			local nHour	= floor( nTime / (60*60) );
				  nTime	= mod(nTime, 60*60);
			local nMin	= floor(nTime / 60 );
			local nSec	= mod(nTime, 60);
			
			szMsg_Huang = format("HiÖn t¹i c¸c h¹ cÇn ®îi thªm <color=yellow>%d ngµy %d giê %d phót %d gi©y<color> míi cã thÓ sö dông Hoµng Ch©n §¬n.",nDay,nHour,nMin,nSec);
		end		
		
		tbSay = 
		{
			format("<dec><npc>%s<enter>%s<enter>%s", szMsg_Common, szMsg_ZiJin, szMsg_Huang),
			"KÕt thóc ®èi tho¹i/OnCancel",
		}
	end
	CreateTaskSay(tbSay)
end

BeiDouChuanGong_tbItem = 
{
	[1] = {szName="B¾c §Èu truyÒn c«ng thuËt", tbProp={6, 1, 1672}, nCount = 1},      
	[2] = {szName="ThÊt tinh th¶o", tbProp={6, 1, 1673}, nCount = 1},          
	[3] = {szName="B¸ch niªn thÊt tinh th¶o", tbProp={6, 1, 1674}, nCount = 1},      
	[4] = {szName="Thiªn niªn thÊt tinh th¶o", tbProp={6, 1, 1675}, nCount = 1},      
	[5] = {szName="B¹ch Ch©n §¬n", tbProp={6, 1, 1676, 1, 0, 0}, nCount = 1},          
	[6] = {szName="HuyÕt Ch©n §¬n", tbProp={6, 1, 1677, 1, 0, 0}, nCount = 1},          
	[7] = {szName="HuyÒn Ch©n §¬n", tbProp={6, 1, 1678, 1, 0, 0}, nCount = 1},
	[8] = {szName="V¹n Niªn Ngò Th¸i Hoa", tbProp={6, 1, 2265, 1, 0, 0}, nCount = 1},
	[9] = {szName="Tö Kim Ch©n §¬n", tbProp={6, 1, 2263, 1, 0, 0}, nCount = 1},
}
BeiDouChuanGong_tbRecipe = 
{
	bai		= {tbItemList = {1,2}, nExp = 5e8, tbAwardItem = 5},
	xue		= {tbItemList = {1,3}, nExp = 10e8, tbAwardItem = 6},
	xuan	= {tbItemList = {1,4}, nExp = 15e8, tbAwardItem = 7},
	zijin	= {tbItemList = {1,8}, nExp = 20e8,tbAwardItem = 9},
}
function BeiDouChuanGong_zuodan(szDanType,nStep)
	local tbRecipe = BeiDouChuanGong_tbRecipe[szDanType]
	local tbAwardItem = BeiDouChuanGong_tbItem[tbRecipe.tbAwardItem]
	if nStep ~= 1 then
		local szTitle = format("C¸c h¹ cã ®ång ý luyÖn <color=yellow>%s<color> kh«ng? NÕu chÊp nhËn kinh nghiÖm hiÖn t¹i cña c¸c h¹ sÏ bÞ tæn hao.", tbAwardItem.szName)
		local tbOpt = {}
		tbOpt[1] = format("§ång ý!/#BeiDouChuanGong_zuodan([[%s]],1)", szDanType)
		tbOpt[2] = "Hñy bá /OnCancel"
		return Say(szTitle,getn(tbOpt),tbOpt);
	end
	
	if GetExp() < 1000000 then
		return Say("Xin lçi, kinh nghiÖm hiÖn t¹i vÉn ch­a ®ñ 1 triÖu, kh«ng thÓ luyÖn ®an.", 0)
	end
	
	local tbMaterial = {};
	for i=1, getn(tbRecipe.tbItemList) do
		tinsert(tbMaterial, i, BeiDouChuanGong_tbItem[tbRecipe.tbItemList[i]]);
	end
	BeiDouChuanGong_ComposeClass:Compose(tbMaterial,0,BeiDouChuanGong_zuodan_complished, tbRecipe.nExp, tbAwardItem)
	
end

function BeiDouChuanGong_zuodan_complished(nMaxExp, tbAwardItem)
	local nPlayerCurExp = GetExp();
	local nExp = nMaxExp;
	if nPlayerCurExp < nMaxExp then
		nExp = nPlayerCurExp
	end
	ReduceOwnExp(nExp);
	local nItemIndex = BeiDouChuanGong_lib_AddAward(tbAwardItem, "B¾c §Èu truyÒn c«ng")
	SetSpecItemParam(nItemIndex, 1, mod(nExp, 1e8));	--ÉèÖÃÎïÆ·ÄÜµÃµ½µÄ¾­Ñé
	SetSpecItemParam(nItemIndex, 2, nExp / 1e8);		--ÉèÖÃÎïÆ·ÄÜµÃµ½µÄ¾­Ñé
	SyncItem(nItemIndex);
end
