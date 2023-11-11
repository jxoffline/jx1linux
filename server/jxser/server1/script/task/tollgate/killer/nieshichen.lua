--BossÉ±ÊÖÈÎÎñ½ÓÒınpc½Å±¾
--By LiuKuo 2005.3.25
Include ("\\script\\class\\ktabfile.lua")
Include ("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\missions\\challengeoftime\\npc\\dragonboat_main.lua")
Include("\\script\\event\\birthday_jieri\\200905\\chuangguan\\chuangguan.lua");
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\common.lua");
Include("\\script\\lib\\log.lua")
-- ´³¹Ø»î¶¯Ã¿ÈÕÅÅĞĞ°ñ
Include("\\script\\missions\\challengeoftime\\rank_perday.lua");
---- DescribÍ¼Æ¬ÃèÊö
--DescLink_NieShiChen = "<#><link=image[147,167]:\\spr\\npcres\\enemy\\enemy154\\enemy154_pst.spr>Äôß±³¾£º<link>";
--TSKID_KILLTASKID = 1082;	-- ½ÓÊÜµÄÄÄ¸öÈÎÎñ
--TSKID_KILLERDATE	= 1192;	--½ÓÈÎÎñÊ±µÄÈÕÆÚ
--TSKID_KILLERMAXCOUNT	= 1193;	--Ã¿ÌìÉ±ÈË´ÎÊı
--KILLER_MAXCOUNT		= 8;	--Ã¿ÌìÉ±ÈËÉÏÏŞ8ÈË

--Thªm dßng kiÓm tra ®iÒu kiÖn tham gia khiªu chiÕn cña tæ ®éi - Modified by DinhHQ - 20110504
Include("\\script\\vng_feature\\challengeoftime\\npcNhiepThiTran.lua")

ContentList = {
	"<#>NÕu ai cã ®ñ 160  s¸t thñ gi¶n trong tay th× giÊc méng trë thµnh ®Ö nhÊt s¸t thñ ®· xem nh­ hoµn thµnh. Mçi ngµy chØ cÇn hoµn thµnh <color=yellow>8nhiÖm vô<color>lµ ®­îc. <enter>H·y tiÕp nhËn nhiÖm vô “th¸ch thøc thêi gian” ®Ó thÓ nghiÖm søc m¹nh ®ång ®éivµ kh¶ n¨ng s¸t thñ cña m×nh.",
	"<#> NhiÖm vô s¸t thñ cÊp 20/killer20",
	"<#> NhiÖm vô s¸t thñ cÊp 30/killer30",
	"<#> NhiÖm vô s¸t thñ cÊp 40/killer40",
	"<#> NhiÖm vô s¸t thñ cÊp 50/killer50",	--5
	"<#> NhiÖm vô s¸t thñ cÊp 60/killer60",
	"<#> NhiÖm vô s¸t thñ cÊp 70/killer70",
	"<#> NhiÖm vô s¸t thñ cÊp 80/killer80",
	"<#> NhiÖm vô s¸t thñ cÊp 90/killer90",
	"<#> Ta ®¸nh kh«ng muèn giÕt ng­êi ®©u, hñy bá nhiÖm vô./cancel",	--10
	"<#> M¸u ch¶y ®Çu r¬i, tèt nhÊt lµ ta nªn tr¸nh xa/no",
	"<#> Ng­¬i ®· hñy bá nhiÖm vô. Lµm s¸t thñ tr­íc tiªn ph¶i cã thñ ph¸p siªu phµm, hai lµ h¹ thñ v« t×nh, xem ra ng­¬i kh«ng thİch hîp, kh«ng ®i còng kh«ng sao.",
	"<#> Ng­êi lÇn tr­íc ta nãi ng­¬i ®i h¹ thñ vÉn cßn sèng, h·y chøng minh thùc lùc cña m×nh tr­íc ®i ®·.",
	"<#> §¼ng cÊp cña ng­¬i kh«ng phï hîp, ph¶i giao ®Êu cïng víi ng­êi cã ®¼ng cÊp t­¬ng øng míi ®­îc.",
	"<#> §ãng/no",	--15
	"<#> §¼ng cÊp nh­ thÕ cã 20 s¸t thñ, tay mçi ng­êi ®Òu nhuèm ®Çy m¸u, ng­¬i muèn ®¸nh víi ng­êi nµo?",
	"<#> Hîp thµnh s¸t thñ gi¶n/compose",
	"<#> S¸t thñ gi¶n b¹n ®Ó kh«ng ®óng, viÖc quan s¸t vµ cÆp m¾t tinh t­êng lµ rÊt quan träng.",
	"<#> S¸t thñ lÖnh b¹n ®Ó qu¸ nhiÒu, s¸t thñ còng ph¶i cã nghÖ thuËt cña nã, kh«ng thÓ nµo mµ ngay c¶ sinh mÖnh cña b¶n th©n m×nh còng kh«ng biÕt.",
	"<#> S¸t thñ lÖnh b¹n ®Ó qu¸ İt, s¸t thñ còng ph¶i cã nghÖ thuËt cña nã, kh«ng thÓ nµo mµ ngay c¶ sinh mÖnh cña b¶n th©n m×nh còng kh«ng biÕt.",	--20
	"<#> Hîp l¹i mét lÇn n÷a/compose",
	"<#> B¹n ®· hîp thµnh mét<color=",
	"<#> Thuéc tİnh<color> s¸t thñ gi¶n, s¸t thñ gi¶n lµ mét s¸t thñ phi phµm. B¹n cã thÓ dïng mét s¸t thñ cïng cÊp ®Ó so tµi víi s¸t thñ gi¶n, quy t¾c th¾ng thua ®­îc ¸p dông theo quy t¾c t­¬ng kh¾c cña ngò hµnh. ",
	"<#> Thö luyÖn s¸t thñ /annealofkiller",
	"<#> Tham gia khiªu chiÕn/want_playboat",	--25
	"<#> S¸t thñ luyÖn thøc tr­íc tiªn ph¶i b¾t ®Çu tõ viÖc tham gia khiªu chiÕn, ng­¬i d¸m tiÕp nhËn nhiÖm vô chø?",
	"<#> Liªn quan ®Õn khiªu chiÕn/aboutchallenge",
	"<#> Cø mçi giê hÖ thèng sÏ th«ng b¸o 1 lÇn. Thêi gian b¸o danh lµ 5 phót, thùc hiÖn chØ trong 30 phót. Mçi ng­êi chØ tèi ®a 2 lÇn/ngµy. Ph¶i ®o ®éi tr­ëng ®Õn b¸o danh. <enter>”NhiÖm vô th¸ch thøc thêi gian” gåm 2 khu vùc tham gia. S¬ cÊp: ng­êi ch¬i tõ cÊp 50 ®Õn 89, do ®éi tr­ëng mang 2 s¸t thñ gi¶n d­íi cÊp 90 (ngò hµnh bÊt kú) ®i b¸o danh. Cao cÊp: ng­êi ch¬i tõ cÊp 90, do ®éi tr­ëng mang 2 s¸t thñ gi¶n cÊp 90 (ngò hµnh bÊt kú) ®i b¸o danh. <enter>Néi trong thêi gian quy ®Şnh, nÕu v­ît qua hÕt 28 ¶i sÏ hoµn thµnh. Mçi ¶i phÇn th­ëng kinh nghiÖm sÏ kh¸c nhau. NÕu hoµn thµnh nhiÖm vô tr­íc thêi gian h¹n ®Şnh, phÇn th­ëng kinh nghiÖm sÏ cµng cao <enter>NÕu tr­íc thêi h¹n ®· hoµn thµnh, cã thÓ sÏ xuÊt hiÖn thªm 1 ¶i, trong ®ã cã nhiÒu phÇn th­ëng bÊt ngê (vËt phÈm ngÉu nhiªn, trang bŞ Hoµng Kim…). ChØ nh÷ng ®éi ®· v­ît 28 ¶i ®óng thêi gian quy ®Şnh míi cã tªn trong b¶ng xÕp h¹ng.",
	"<#> NhiÖm vô \"Qu¸ quan tÇm b¶o\"/guoguan_xunbao",
	"<#> Ta ®Õn nhËn th­ëng/rank_award",
	"<#> Ta ®Õn xem xÕp h¹ng 5 ®éi cao nhÊt cña h«m nay./get_top5team"
}

killertabfile = new(KTabFile,"/settings/task/tollgate/killer/killer.txt","KILLER")

function main()
	UWorld1082 = nt_getTask(1082);
	local tbDialog = {ContentList[24],ContentList[17],ContentList[2],ContentList[3],ContentList[4],ContentList[5],ContentList[6],ContentList[7],ContentList[8],ContentList[9],ContentList[10],ContentList[15]};
	if (tbBirthday0905:IsActDate() == 1) then
		tinsert(tbDialog, 12, ContentList[29]);
	end
	Describe(DescLink_NieShiChen..ContentList[1], getn(tbDialog), unpack(tbDialog));
end

function annealofkiller()
--Thªm dßng kiÓm tra ®iÒu kiÖn tham gia khiªu chiÕn cña tæ ®éi - Modified by DinhHQ - 20110504
	--Describe(DescLink_NieShiChen..ContentList[26], 3, ContentList[25],ContentList[27],ContentList[11]);
	Describe(DescLink_NieShiChen..ContentList[26], 4, ContentList[25], "<#> KiÓm tra ®iÒu kiÖn tæ ®éi/#tbCOT_Party:CheckCondition()",ContentList[27],ContentList[11]);
end

function aboutchallenge()
	Describe(DescLink_NieShiChen..ContentList[28],1, ContentList[15]);
end

function killer20()
	if ( killerCoundTakedTask(20, 29) == 0) then
		return 0;
	end;
	showboss( 0 );
end

function killer30()
	if ( killerCoundTakedTask(30, 39) == 0) then
		return 0;
	end;
	showboss( 20 );
end

function killer40()
	if ( killerCoundTakedTask(40, 49) == 0) then
		return 0;
	end;
	showboss( 40 );
end

function killer50()
	if ( killerCoundTakedTask(50, 59) == 0) then
		return 0;
	end;
	showboss( 60 );
end

function killer60()
	if ( killerCoundTakedTask(60, 69) == 0) then
		return 0;
	end;
	showboss( 80 );
end

function killer70()
	if ( killerCoundTakedTask(70, 79) == 0) then
		return 0;
	end;
	showboss( 100 );
end

function killer80()
	if ( killerCoundTakedTask(80, 89) == 0) then
		return 0;
	end;
	showboss( 120 );
end

function killer90()
	if ( killerCoundTakedTask(90, 350) == 0) then
		return 0;
	end;
	showboss( 140 );
	tbLog:PlayerActionLog("TinhNangKey","NhanNhiemVuBossSatThu")
end

function cancel()
	if (nt_getTask(1082) == 0) then
		Talk(1, "", "Ng­¬i ch­a nhËn nhiÖm vô, kh«ng thÓ hñy bá!")
	return end
	nt_setTask(1082, 0);
	Describe(DescLink_NieShiChen..ContentList[12], 1,ContentList[15]);
end

function havetask()
	if ( UWorld1082 ~= 0 ) then
		Describe(DescLink_NieShiChen..ContentList[13], 1,ContentList[15]);
		return 0
	end
	return 1
end

function showboss(row)
	Describe(DescLink_NieShiChen..ContentList[16], 12, killertabfile:getCell("BossName",row+1).."/#givetask("..(row+1)..")", killertabfile:getCell("BossName",row+2).."/#givetask("..(row+2)..")", killertabfile:getCell("BossName",row+3).."/#givetask("..(row+3)..")", killertabfile:getCell("BossName",row+4).."/#givetask("..(row+4)..")", killertabfile:getCell("BossName",row+5).."/#givetask("..(row+5)..")", killertabfile:getCell("BossName",row+6).."/#givetask("..(row+6)..")", killertabfile:getCell("BossName",row+7).."/#givetask("..(row+7)..")", killertabfile:getCell("BossName",row+8).."/#givetask("..(row+8)..")", killertabfile:getCell("BossName",row+9).."/#givetask("..(row+9)..")", killertabfile:getCell("BossName",row+10).."/#givetask("..(row+10)..")", "Trang kÕ /#showbossnext("..row..")", ContentList[15]);
end

function showbossnext(row)
	Describe(DescLink_NieShiChen..ContentList[16], 12, killertabfile:getCell("BossName",row+11).."/#givetask("..(row+11)..")", killertabfile:getCell("BossName",row+12).."/#givetask("..(row+12)..")", killertabfile:getCell("BossName",row+13).."/#givetask("..(row+13)..")", killertabfile:getCell("BossName",row+14).."/#givetask("..(row+14)..")", killertabfile:getCell("BossName",row+15).."/#givetask("..(row+15)..")", killertabfile:getCell("BossName",row+16).."/#givetask("..(row+16)..")", killertabfile:getCell("BossName",row+17).."/#givetask("..(row+17)..")", killertabfile:getCell("BossName",row+18).."/#givetask("..(row+18)..")", killertabfile:getCell("BossName",row+19).."/#givetask("..(row+19)..")", killertabfile:getCell("BossName",row+20).."/#givetask("..(row+20)..")", "Trang tr­íc/#showboss("..row..")", ContentList[15]);
end

function givetask(taskid)
	nt_setTask(1082,taskid);
	Describe(DescLink_NieShiChen..killertabfile:getCell("BossName",taskid)..killertabfile:getCell("BossInfo",taskid), 1, ContentList[15]);
end

function compose()
	GiveItemUI("Giao diÖn hîp thµnh s¸t thñ gi¶n","5 s¸t thñ lÖnh cïng ®¼ng cÊp sÏ hîp thµnh 1 s¸t thñ gi¶n cÊp t­¬ng øng, thuéc tİnh cña s¸t thñ gi¶n ®­îc t¹o thµnh cã liªn quan ®Õn thu6äc tİnh cña 5 s¸t thñ lÖnh. B¹n cã thÓ dïng s¸t thñ gi¶n cña m×nh ®Ó so tµi víi s¸t thñ gi¶n ®ång cÊp cña ng­êi kh¸c, quy t¾c th¾ng thua ®­îc tİnh theo quy t¾c t­¬ng kh¾c cña ngò hµnh.","exchange_token", "no")
end

function exchange_token(ncount)
	local scrollidx = {}
	local scrollattr = {}
	local y = 0
	local compare_level = 0
	for i=1, ncount do
		local nItemIdx = GetGiveItemUnit(i);
		itemgenre, detailtype, parttype, level, attribute = GetItemProp(nItemIdx)
		if (itemgenre == 6 and detailtype == 1 and parttype == 399  ) then	
			if( y > 0 ) then
				if( level ~= compare_level ) then
					Describe(DescLink_NieShiChen..ContentList[18], 2, ContentList[21], ContentList[15]);
					return
				end
			end
			y = y + 1;
			scrollidx[y] = nItemIdx;
			scrollattr[y] = attribute;
			compare_level = level;
		end
	end
	if( y ~= ncount) then
		Describe(DescLink_NieShiChen..ContentList[18], 2, ContentList[21], ContentList[15]);
		return
	end
	if( y > 5 ) then
		Describe(DescLink_NieShiChen..ContentList[19], 2, ContentList[21], ContentList[15]);
		return
	end
	if( y < 5 ) then
		Describe(DescLink_NieShiChen..ContentList[20], 2, ContentList[21], ContentList[15]);
		return
	end
	if( y == 5 ) then
		for i = 1, y do
			RemoveItemByIndex(scrollidx[i]);
		end
		givesword(scrollattr,compare_level);
	end
end

function givesword(attr,level)
	series = {"metal>Kim", "wood>Méc", "water>Thñy", "fire>Háa", "earth>Thæ "};
	i = random( 1, 5 );
	AddItem( 6, 1, 400, level, attr[i], 0);
	j = attr[i] + 1;
	Describe(DescLink_NieShiChen..ContentList[22]..series[j]..ContentList[23], 1, ContentList[15]);
end

function no()
end

--Ã¿Ìì½ÓÈÎÎñµÄÏŞÖÆ
function killerCoundTakedTask(nLowLevel, nHighLevel)
	if ( havetask() == 0) then
		return 0;
	end;
	local myLevel = GetLevel();
	if( myLevel < nLowLevel or myLevel >  nHighLevel) then
		Describe(DescLink_NieShiChen..ContentList[14], 1,ContentList[15]);
		return 0;
	end;
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	local myDate = nt_getTask(TSKID_KILLERDATE);
	if (myDate == nDate and nt_getTask(TSKID_KILLERMAXCOUNT) >= KILLER_MAXCOUNT) then
		Describe(DescLink_NieShiChen.."S¸t thñ cã mét tè chÊt rÊt quan träng gäi lµ khinh kÎ b¹i trËn.  H«m nay ng­¬i ®· bŞ h¹"..KILLER_MAXCOUNT.."  ng­êi råi, ngµy mai h·y quay l¹i.", 1, ContentList[15]);
		return 0;
	elseif (myDate ~= nDate) then
		nt_setTask(TSKID_KILLERMAXCOUNT, 0);
		nt_setTask(TSKID_KILLERDATE, nDate);
	end;
	return 1;
end;
