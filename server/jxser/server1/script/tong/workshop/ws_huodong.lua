Include("\\script\\tong\\workshop\\workshop_head.lua")

HUODONG_TASKID = {{1015, 1016}, {1017, 1018}, {1019, 1020}};

TK_GUANGHUAN = 2349;--¼ÇÂ¼Íæ¼Ò°ï»á¹â»·µÄ±àºÅ
TK_SHIJIAN = 2350;--¼ÇÂ¼Íæ¼Ò°ï»á¹â»·µÄÓĞĞ§Ê±¼ä
TK_ISCANCEL = 1757;--¼ÇÂ¼ÊÇ·ñÒÑ¾­È¡ÏûÁË¹â»·

aLevelCoef = {}
aLevelLingPaiPrice = {}
aLevelDiziCoef = {}
aLevelDiziDouble = {}
aLevelNianshouCoef = {}
aLevelNianshouDouble = {}
aLevelAuraPrice = {}

SEC_OF_DAY = 86400;


function LoadLevelData()
	local b1 = TabFile_Load("\\settings\\tong\\workshop\\huodong_level_data.txt", "huodongLevelData")
	if b1~=1 then
		print("§äc tÖp config ho¹t ®éng t¸c ph­êng thÊt b¹i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("huodongLevelData")
	for y = 2, nRowCount do
		local nLevel = tonumber(TabFile_GetCell("huodongLevelData", y, "LEVEL"))
		aLevelCoef[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "OUTPUT_COEF"))
		aLevelLingPaiPrice[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "LINGPAI_PRICE"))
		aLevelDiziCoef[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "COUNT_DZLIM"))
		aLevelDiziDouble[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "PRISE_DZDOU"))
		aLevelNianshouCoef[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "COUNT_NSLIM"))
		aLevelNianshouDouble[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "PRISE_NSDOU"))
		aLevelAuraPrice[nLevel] = tonumber(TabFile_GetCell("huodongLevelData", y, "PRISE_AURA"))
	end
	--TabFile_UnLoad("huodongLevelData")
end
LoadLevelData()

if MODEL_GAMESERVER == 1 or MODEL_RELAY == 1 then
--------------------Èç¹û·Ç¿Í»§¶Ë---------------------------

function ws_main(nTongID, nWorkshopID)
	-- TODO: liaozhishan 
	-- 11/7 ´Ë´¦Á÷³ÌĞèÒªĞŞ¸Ä£¬ÏÖÔÚRelayÖ»ÄÜ´¦ÀíCallBossÁîÅÆ£¬µ¼ÖÂ»î¶¯±¨Ãû»á²úÉú¿Û½¨Éè»ù½ğµÄÒì³£ÏÖÏó¡£ĞèÒª¸ÄÎªÄÜ´¦Àí¶àÖÖÇé¿ö¡£
	if SVR_CheckUse(nTongID, nWorkshopID, "Tæng qu¶n Ho¹t ®éng ph­êng") ~= 1 then
		return 0
	end
	local aryszContent = {
			"Bang vËt/#use_g_4_ok("..nTongID..","..nWorkshopID..")", 
			"Ho¹t ®éng chiªu mé ®Ö tö/#use_g_2_ok("..nTongID..","..nWorkshopID..")", 
			"Ho¹t ®éng ®¸nh niªn thó/#use_g_3_ok("..nTongID..","..nWorkshopID..")", 
			--"°ï»áÊÕ¼¯ÎïÆ·»î¶¯/#use_g_5_ok("..nTongID..","..nWorkshopID..")", 	
			};
			
	if (GetProductRegion() == "cn") then
		tinsert(aryszContent, "NhËn lÖnh bµi gäi Boss/#use_g_1_ok("..nTongID..","..nWorkshopID..")");
	end;
	
	tinsert(aryszContent, "Kh«ng cÇn ®©u/cancel");
	
	Say("<#>Tæng qu¶n Ho¹t ®éng ph­êng: Ta phô tr¸ch c¸c ho¹t ®éng chung cña toµn thÓ bang, lµm h­ng phÊn kh«ng khİ bang héi vµ tinh thÇn bang chóng, mäi ng­êi h·y cïng nhau tham gia ho¹t ®éng!",
		getn(aryszContent),
		aryszContent);
	return 1;
end

----------------------------------------------------------------------------------------------------
function MAINTAIN_R(nTongID, nWorkshopID) --ÈÕ³£»î¶¯
	if nWorkshopID <= 0 then
		return 0
	end	
	local eType = TWS_GetType(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	local nTotal = floor(aLevelCoef[nLevel]*(TONG_GetMemberCount(nTongID)) * 100)
	TWS_ApplyAddDayOutput(nTongID, nWorkshopID, nTotal) --³õÊ¼»¯¿ÉÁìÈ¡ÈÎÎñÊı
	return 1
end

function USE_R(nTongID, nWorkshopID)
	local nLinPaiLeft = TWS_GetDayOutput(nTongID, nWorkshopID)
	if (TWS_IsOpen(nTongID, nWorkshopID) ~= 1 or nLinPaiLeft < 100) then
		return 0
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if nLevel < 1 then
		return 0
	end
	if (TONG_GetBuildFund(nTongID) < aLevelLingPaiPrice[nLevel]) then
		return 0
	end
	if (TONG_ApplyAddBuildFund(nTongID, -aLevelLingPaiPrice[nLevel]) == 1) then
		TWS_ApplyAddDayOutput(nTongID, nWorkshopID,  -100)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_WSCONSUME, 2688)
		TONG_ApplyAddTaskValue(nTongID, TONGTSK_WEEK_BFCONSUME, aLevelLingPaiPrice[nLevel])	
		return 1
	end
	return 0	
end

function USE_G_1(nTongID, nWorkshopID)
	ws_main(nTongID, nWorkshopID)
end

function use_g_1_ok(nTongID, nWorkshopID)
	local nTongLevel = TONG_GetBuildLevel(nTongID)
	if (nTongLevel < 2)then
		Say("<#>Tæng qu¶n Ho¹t ®éng ph­êng: LÖnh bµi gäi Boss ®ßi hái ®¼ng cÊp kiÕn thiÕt ph¶i ®¹t cÊp <color=red>2<color> míi cã thÓ chÕ t¹o, tr­íc m¾t cÇn ph¶i ra søc x©y dùng bang ®·!", 0)
		return
	end
	if (TONGM_CheckRight(nTongID, GetName(), RIGHTID_WORKSHOP) ~= 1) then
		Say("<#>Tæng qu¶n Ho¹t ®éng ph­êng: Ng­¬i kh«ng cã quyÒn h¹n qu¶n lı t¸c ph­êng, kh«ng thÓ nhËn LÖnh bµi gäi Boss!", 0)
		return
	end
	_dbgMsg("Sè lÇn nhËn cßn l¹i * 100: "..TWS_GetDayOutput(nTongID, nWorkshopID))
	if (TWS_GetDayOutput(nTongID, nWorkshopID) < 100) then
		Say("<#>Tæng qu¶n Ho¹t ®éng ph­êng: H«m nay lÖnh bµi gäi Boss ®· ph©n ph¸t hÕt råi, ngµy mai h·y ®Õn nhĞ!", 0)
		return 0;
	end
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	Say("<#>Tæng qu¶n Ho¹t ®éng ph­êng: Ph¶i tiªu tèn <color=water>"..aLevelLingPaiPrice[nLevel].."<color> v¹n ng©n s¸ch kiÕn thiÕt bang ®Ó nhËn 1 lÖnh bµi gäi Boss, ng­¬i ®ång ı kh«ng?", 2,
		"TiÕp nhËn/#use_g_1_ok2".."("..nTongID..","..nWorkshopID..")", "Hñy bá /cancel")
end

function use_g_1_ok2(nTongID, nWorkshopID)
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
	if (TONG_GetBuildFund(nTongID) < aLevelLingPaiPrice[nLevel]) then
		Say("<#>Tæng qu¶n Ho¹t ®éng ph­êng: Kh«ng ®­îc råi, ng©n s¸ch kiÕn thiÕt bang kh«ng ®ñ!", 0)
		return
	end
	TWS_ApplyUse(nTongID, nWorkshopID, 1)
end

function use_g_2_ok(nTongID, nWorkshopID)
	USE_G_2(nTongID, nWorkshopID, 2)
end

function use_g_3_ok(nTongID, nWorkshopID)
	USE_G_2(nTongID, nWorkshopID, 3)
end

function use_g_4_ok(nTongID, nWorkshopID)
	USE_G_2(nTongID, nWorkshopID, 4)
end

function use_g_5_ok(nTongID, nWorkshopID)
	USE_G_2(nTongID, nWorkshopID, 5)
end

function USE_G_2(nTongID, nWorkshopID, nUse)
	if (nUse == 1)then
		local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		local szMsg = GetName().." tiªu tèn "..aLevelLingPaiPrice[nLevel].." v¹n ng©n s¸ch kiÕn thiÕt bang ®Ó ®æi lÊy 1 lÖnh bµi gäi Boss cÊp "..nLevel.."!"
		Msg2Tong(nTongID, szMsg)
		TONG_ApplyAddEventRecord(nTongID, szMsg)
		AddItem(6, 1, 1022, nLevel, 0, 0, 0);
	elseif (nUse == 2)then	
		Sel_ZhaoDizhi(nTongID, nWorkshopID)	--ÕĞÄ¼µÜ×Ó
	elseif (nUse == 3)then
		Sel_DaNianShou(nTongID, nWorkshopID)	--´òÄêÊŞ
	elseif (nUse == 4)then
		Sel_techan(nTongID, nWorkshopID)		--ÌØ²ú
	elseif (nUse == 5) then
		Sel_shoujiwupin(nTongID, nWorkshopID);	--ÊÕ¼¯ÎïÆ·
	end	
end

function cancel()
end

--¹â»·µÄ±í
tc_detail = {[5] = {"Vßng s¸ng Th­¬ng D¨ng", "Tæng qu¶n Ho¹t ®éng ph­êng: Muèn tr¶i nghiÖm c¶m gi¸c ®µn ruåi qu©y quanh kh«ng? Tr­íc ®©y chØ cã ®Ö tö C¸i Bang míi hiÓu ®­îc c¶m gi¸c nµy. NhËn vßng Th­¬ng D¨ng cÇn bá ra <color=yellow>50<color> ®iÓm cèng hiÕn, thêi gian sö dông lµ 1 tuÇn."},
			[6] = {"Vßng s¸ng H­¬ng Tiªu", "Tæng qu¶n Ho¹t ®éng ph­êng: §©y lµ vßng danh hiÖu mang s¾c th¸i ph­¬ng Nam. NhËn vßng H­¬ng Tiªu cÇn bá ra <color=yellow>65<color> ®iÓm cèng hiÕn, thêi gian sö dông lµ 1 tuÇn."},
			[7] = {"Vßng s¸ng Th­¬ng ¦ng", "Tæng qu¶n Ho¹t ®éng ph­êng: Ng­¬i thİch bay l­în kh«ng? vßng danh hiÖu nµy mang l¹i c¶m gi¸c mét con chim ¦ng bay ë phİa sau. Muèn nhËn vßng danh hiÖu nµy cÇn bá ra <color=yellow>80<color> ®iÓm cèng hiÕn, thêi gian sö dông lµ 1 tuÇn."},
			[8] = {"Vßng s¸ng Háa DiÖm", "Tæng qu¶n Ho¹t ®éng ph­êng: Nghe ®ån cã mét sè cao nh©n vâ l©m khi vËn c«ng th× toµn th©n sÏ táa ra lµn khãi tr¾ng. vßng danh hiÖu nµy sÏ gióp ng­¬i thÓ nghiÖm ®­îc c¶m gi¸c mµ c¸c cao nh©n ®· tr¶i qua. Muèn nhËn vßng danh hiÖu nµy cÇn bá ra <color=yellow>100<color> ®iÓm cèng hiÕn, thêi gian sö dông lµ 1 tuÇn."},
			[9] = {"Vßng s¸ng ¸m ¶nh", "Tæng qu¶n Ho¹t ®éng ph­êng: Vßng danh hiÖu nµy sÏ cho ng­¬i mét c¶m gi¸c th©m s©u huyÒn ¶o. Muèn nhËn vßng danh hiÖu nµy cÇn bá ra <color=yellow>115<color> ®iÓm cèng hiÕn, thêi gian sö dông lµ 1 tuÇn."},
			[10] = {"Vßng s¸ng ThÊt KiÕm", "Tæng qu¶n Ho¹t ®éng ph­êng: Vßng danh hiÖu nµy lµ biÓu tr­ng cña nh÷ng bang héi danh tiÕng. Muèn nhËn vßng danh hiÖu nµy cÇn bá ra <color=yellow>130<color> ®iÓm cèng hiÕn, thêi gian sö dông lµ 1 tuÇn."}
};

function Sel_techan(nTongID, nWorkshopID)--°ï»áÌØ²ú¹¦ÄÜ
	local nLevel = TWS_GetUseLevel(nTongID, nWorkshopID);
	
	Say("Ng­¬i muèn t×m hiÓu <color=yellow>Vßng danh hiÖu bang héi<color> ®éc nhÊt v« nhŞ nµy hay kh«ng?", 2,
	"Vßng danh hiÖu bang héi/#enter_guanghuan("..nLevel..")",
	"KÕt thóc ®èi tho¹i/oncancel");
end;


function enter_guanghuan(nLevel)
	if (nLevel < 5) then
		Say("Ho¹t ®éng ph­êng vÉn ch­a ®¹t ®Õn cÊp <color=yellow>5<color>, khi ®¹t ®Õn cÊp 5 h·y quay l¹i nhĞ.", 0);
		return
	end;
	local tab_gh_content = {};
	tinsert(tab_gh_content, "T×m hiÓu Vßng danh hiÖu/tong_gh_about");
	tinsert(tab_gh_content, "NhËn vßng danh hiÖu ®· cã/#tong_gh_getagain(0, 1)");
	for i = 5, nLevel do
		tinsert(tab_gh_content, "Ta muèn mua "..tc_detail[i][1].."/#tong_gh_get("..i..")");
	end;
	tinsert(tab_gh_content, "Hñy bá vßng danh hiÖu/#delguanghuan( 1 )");
	tinsert(tab_gh_content, "Ta biÕt råi!/oncancel");
	Say("Ho¹t ®éng ph­êng ®ang ph©n ph¸t c¸c lo¹i vßng danh hiÖu, ng­¬i muèn lµm g×?", getn(tab_gh_content), tab_gh_content);
end;

function delguanghuan(IsWantCancel)--È¥µô¹â»·Ğ§¹û
	if (IsWantCancel == 1) then	--Èç¹ûÏëÈ¡Ïû¹â»·£¬Èç¹ûÏëÈ¡Ïû¹â»·ÔòÉèÉÏÈ¡ÏûµÄÈÎÎñ±äÁ¿
		SetTask(TK_ISCANCEL, 1);
	end;
	
	for i = 726, 731 do
		AddSkillState(i, 1, 0, 0);
	end;
end;

function tong_gh_getagain(bExchangeIn, bPlayer)	--µÃµ½Ô­ÓĞµÄ¹â»·£»
	local nRemainSec = getremaintime();
	if (nRemainSec == 0) then
		if (bPlayer == 1 and bExchangeIn ~= 1) then	--ÊÇ·ñÒªÌáÊ¾
			Say("Ch­a së h÷u vßng danh hiÖu nµo.", 0);
			Msg2Player("Ch­a së h÷u vßng danh hiÖu nµo.");
		end;
		return
	end;
	
	if (bPlayer == 1 or GetTask(TK_ISCANCEL) ~= 1) then
		local nSkillID = GetTask(TK_GUANGHUAN);
		AddSkillState(nSkillID, 1, 0, nRemainSec * 18);
		SetTask(TK_ISCANCEL, 0);
	end;
end;


tab_Level = {[5] = 5, [6] = 6, [7] = 7, [8] = 8, [9] = 9, [10] = 10}
function tong_gh_get(nLevel)
	Say(tc_detail[nLevel][2], 2, "Ta muèn mua /#tong_gh_buy("..tab_Level[nLevel]..")", "Rêi khái/oncancel");
end;

function tong_gh_buy(nLevel)
	local nPrice = aLevelAuraPrice[nLevel];
	if (GetContribution() < nPrice) then
		Say("§iÓm cèng hiÕn kh«ng ®ñ <color=yellow>"..nPrice.."<color> ®iÓm, kh«ng thÓ ®æi lÊy vßng danh hiÖu.");
		Msg2Player("§iÓm cèng hiÕn cña b¹n kh«ng ®ñ.");
		return
	end;
	SetTask(TK_ISCANCEL, 0);
	AddContribution(-1 * nPrice);--¼õÉÙ¹±Ï×¶È¡£
	Msg2Player(format("B¹n dïng <color=yellow>%d<color> ®iÓm cèng hiÕn ®æi lÊy 1 <color=yellow>%s<color>.", nPrice, tc_detail[nLevel][1]));

	local nSkillID = nLevel + 726 - 5;
	SetTask(TK_GUANGHUAN, nSkillID);
	local nLimitDate = GetCurrentTime() + SEC_OF_DAY * 7;--¹â»·Ê±¼äÎª7Ìì
	SetTask(TK_SHIJIAN, nLimitDate)

	delguanghuan();
	AddSkillState(726 + nLevel - 5, 1, 0, SEC_OF_DAY * 7 * 18);
end;

function getremaintime()	--µÃµ½¹â»·»¹Ê£¶àÉÙÊ±¼ä,·µ»Ø»¹ÓĞ¶àÉÙ¸öĞ¡Ê±
	local nRemainTime = GetTask(TK_SHIJIAN) - GetCurrentTime();
	if (nRemainTime < 0) then
		nRemainTime = 0;
	end;
	return nRemainTime;
end;

function tong_gh_about()
	Say("<#>Tæng qu¶n Ho¹t ®éng ph­êng: KÓ tõ cÊp 5 trë ®i, Ho¹t ®éng ph­êng sÏ cung cÊp c¸c lo¹i vßng danh hiÖu (<color=green>cÊp 5: vßng th­¬ng d¨ng, cÊp 6: vßng h­¬ng tiªu, cÊp 7: vßng th­¬ng ­ng, cÊp 8: vßng háa diÖm, cÊp 9: vßng ©m ¶nh, cÊp 10: vßng thÊt kiÕm.<color>). Vßng danh hiÖu cã thêi h¹n sö dông lµ 1 tuÇn, trong vßng 1 tuÇn, nÕu vßng danh hiÖu bŞ mÊt th× cã thÓ ®Ó ®Ó nhËn l¹i bÊt cø lóc nµo.", 0);
end;

if (MODEL_GAMESERVER == 1) then --Èç¹ûÊÇGameServer
---------------Ò»ÏÂÓÉĞ¡É½¼Ó------------------------
Include([[\script\missions\tong\tong_disciple\head.lua]]);
Include([[\script\missions\tong\tong_disciple\dis_gmscript.lua]]);
Include([[\script\missions\tong\tong_disciple\award.lua]]);
Include([[\script\missions\tong\tong_springfestival\head.lua]]);
Include([[\script\missions\tong\tong_springfestival\sf_gmscript.lua]]);
Include([[\script\missions\tong\tong_springfestival\award.lua]]);

Include([[\script\missions\tong\collectgoods\head.lua]]);
Include([[\script\missions\tong\collectgoods\collg_gmscript.lua]]);
Include([[\script\missions\tong\collectgoods\award.lua]]);
end

--ÕĞİëµÜ×Ó
function Sel_ZhaoDizhi(nTongID, nWorkshopID)
	Describe("<#>Tæng qu¶n Ho¹t ®éng ph­êng: Ho¹t ®éng chiªu mé ®Ö tö b¾t ®Çu vµo mçi 0h, 3h, 6h…21h vµ b¾t ®Çu cho b¸o danh vµo phót thø 15, 30, 45. Còng ®Õn lóc bang héi chóng ta ph¶i chiªu mé thªm nh©n tµi råi.", 
		4, 
		"Tham gia ho¹t ®éng chiªu mé ®Ö tö/#wantjoin_disciple("..nTongID..","..nWorkshopID..")",
--		 "¿ªÆô°ï»áÕĞÄ¼µÜ×Ó»î¶¯/#tong_opendisciple(821)", 
		"NhËn phÇn th­ëng/#disciple_aword("..nTongID..","..nWorkshopID..")",
		"T×m hiÓu ho¹t ®éng chiªu mé ®Ö tö/disciple_about", "Nh©n tiÖn ghĞ qua th«i/festival06_Cancal");
end;

function wantjoin_disciple(nTongID, nWorkshopID)
	Describe("Tæng qu¶n Ho¹t ®éng ph­êng:  Tham gia ho¹t ®éng chiªu m« ®Ö tö tiªu hao <color=yellow>800<color> ®iÓm cèng hiÕn bang héi, ng­¬i muèn tham gia kh«ng?", 2, 
	"Tham gia ho¹t ®éng chiªu mé ®Ö tö/#joindisciple("..nTongID..","..nWorkshopID..")",
	"§Ó ta suy nghÜ kü l¹i xem/festival06_Cancal");
end;

function disciple_about()
	Describe("Tæng qu¶n Ho¹t ®éng ph­êng: Mét ®ît ho¹t ®éng chiªu mé ®Ö tö sÏ mÊt <color=yellow>15<color> phót, trong ®ã bao gåm <color=yellow>5<color> phót ®Ó chuÈn bŞ, "..
		"sau khi b¸o danh ng­¬i sÏ ®­îc ®­a ®Õn khu vùc chuÈn bŞ, khi ho¹t ®éng b¾t ®Çu sÏ tiÕp tôc ®­îc chuyÓn ®Õn n¬i c¸c ®Ö tö tô tËp. "..
			"Trong thêi gian nµy, nÕu tr«ng thÊy <color=yellow>®Ö tö<color> nµo nãi chuyÖn chØ cÇn nhÊp tr¸i chuét<color=yellow>"..
			" <color>vµo ng­êi ®Ö tö Êy lµ ®­îc, dÜ nhiªn ng­¬i còng sÏ bŞ nh÷ng ng­êi ch¬i kh¸c ng¨n c¶n. "..
			"Lóc nµy ng­¬i cã thÓ dïng ®¹o cô ®Ó chèng tr¶, chØ cÇn t×m thÊy ®ñ sè <color=yellow>"..
			"®Ö tö<color> th× sÏ nhËn ®­îc nh÷ng lÔ vËt xøng ®¸ng.", 1,
			"Ta muèn thö mét chuyÕn./oncancel");
end;

--´òÄêÊŞ
function Sel_DaNianShou(nTongID, nWorkshopID)
	Describe("<#>Tæng qu¶n Ho¹t ®éng ph­êng: Ho¹t ®éng ®¸nh niªn thó sÏ diÔn ra lóc 1h, 4h, 7h…22h vµ b¾t ®Çu cho b¸o danh vµo phót thø 14, 30 vµ 45. N¨m nay qu¶ thËt lµ n¨m niªn thó xuÊt hiÖn nhiÔu h¹i d©n lµnh.", 4, 
		"Ho¹t ®éng ®¸nh niªn thó/#wantjoin_springfestival("..nTongID.. ","..nWorkshopID..")",
--		"¿ªÆô°ï»á´òÄêÊŞ»î¶¯/#tong_openspringfestival(823)", 
		"NhËn phÇn th­ëng/#springfestival_aword("..nTongID..","..nWorkshopID..")", 
		"T×m hiÓu ho¹t ®éng ®¸nh niªn thó/springfestival_about", "Nh©n tiÖn ghĞ qua th«i/festival06_Cancal");
end;

function wantjoin_springfestival(nTongID, nWorkshopID)
	Describe("Th¸ng giªng còng ®· qua ®i, niªn thó g©y h¹i ®· bŞ b¾t nhèt t¹i nha m«n, nh÷ng ng­êi bŞ h¹i ®· dÇn kh«i phôc tinh thÇn vµ søc kháe. ThÕ nh­ng, nh÷ng tµ niÖm mµ niªn thó ®Ó l¹i trªn ng­êi hä vÉn cßn tiÒm Èn. Mét ngµy kia, mét thiÕu phô tõng bŞ niªn thó b¸m vµo ng­êi ®· ®Õn n¬i niªn thó xuÊt hiÖn ®Ó mÆc niÖm ng­êi chång vµ anh em trong cuéc chiÕn kinh hoµng ®ã...Vµo thêi kh¾c ®au buån nµy, bµ ®· ph¸t hiÖn nh÷ng dÊu ch©n niªn thó ®an xen thµnh nh÷ng h×nh thï kú l¹, tr«ng nh­ lµ tµ ", 2, "sau ®ã th× sao /#wantjoin_springfestival_next("..nTongID..","..nWorkshopID..")",
	"kh«ng muèn nh¾c l¹i chuyÖn x­a/festival06_Cancal");
end;

function wantjoin_springfestival_next(nTongID, nWorkshopID)
	Describe("chó. Theo c©u niÖm cña thiÕu phô, bïa chó khiÕn cho tµ niÖm mµ niªn thó ®Ó l¹i trªn ng­êi bµ tho¸t ra...T¹i nha m«n, tõ chç tæng qu¶n ®ang ngñ, ®ét nhiªn cã mét bµn tay ngäc thñ thß vµo chiÕc ch×a khãa ngôc giam cÇm niªn thó....Buæi chiÒu h«m sau, mét sè ®øa trÎ ngoµi thµnh bŞ mÊt tİch kh«ng râ nguyªn do, chØ chõa l¹i sîi d©y v¶i vµ chiÕc b«ng vô n»m ®ã. Vµ mét giÊc méng trÎ th¬...<enter>Tham gia ho¹t ®éng ®¸nh niªn thó cÇn tiªu phİ <color=yellow>500<color> ®iÓm cèng hiÕn, ng­¬i muèn tham gia kh«ng?", 2, "Ho¹t ®éng ®¸nh niªn thó/#joinspringfestival("..nTongID..","..nWorkshopID..")",
	"§Ó ta suy nghÜ kü l¹i xem/festival06_Cancal");
end;

function springfestival_about()
	Describe("Tæng qu¶n Ho¹t ®éng ph­êng: Mét ®ît ho¹t ®éng ®¸nh niªn thó lµ <color=yellow>15<color>phót, trong ®ã bao gåm <color=yellow>5<color> phót ®Ó chuÈn bŞ. "..
		"Sau khi b¸o danh tham gia, ng­¬i sÏ ®­îc ®­a ®Õn khu vùc chuÈn bŞ. Khi ho¹t ®éng b¾t ®Çu sÏ tiÕp tôc ®­îc ®­a ®Õn n¬i niªn thó th­êng xuÊt hiÖn."..
		"color=yellow>15<color> gi©y sau khi ho¹t ®éng b¾t ®Çu, trong sè nh÷ng ng­êi tham gia sÏ cã 1 ®Õn 2 ng­êi bŞ niªn thó b¸m vµo ng­êi "..
		"vµ biÕn thµnh niªn thó. Hä sÏ ®i quanh khu vùc ®Ó b¾t nh÷ng '<color=yellow>®øa trÎ mÊt tİch<color>'.", 2, 
		"Trang kÕ /festival06_next", "KÕt thóc ®èi tho¹i./festival06_Cancal");
end;

function festival06_next()
    Describe("Tæng qu¶n Ho¹t ®éng ph­êng: Trong khi nh÷ng ng­êi kh¸c sÏ sö dông '<color=yellow>ph¸o hoa<color>' ®Ó ®¸nh ®uæi niªn thó, "..
    	"®ång thêi ng¨n c¶n niªn thó b¾t nh÷ng ®øa trÎ. Sau khi ho¹t ®éng kÕt thóc, '<color=yellow>Tæng qu¶n Ho¹t ®éng ph­êng<color>' "..
    	"sÏ dùa trªn b¶ng xÕp h¹ng sè lÇn nĞm tróng <color=yellow>ph¸o hoa<color> vµo niªn thó ®Ó ph¸t th­ëng.", 1,  
    	"Ta ®· biÕt råi. /festival06_Cancal");
end

function Sel_shoujiwupin(nTongID, nWorkshopID)	--°ï»áÊÕ¼¯ÎïÆ·»î¶¯
	local tab_gh_content = {
			"Tham gia ho¹t ®éng thu thËp vËt phÈm/#wantjoin_collection("..nTongID..","..nWorkshopID..")",
--			"¿ªÆô°ï»áÊÕ¼¯ÎïÆ·»î¶¯/#collg_opencellectgoods( 827 )", 
			"NhËn phÇn th­ëng/#collg_aword("..nTongID..","..nWorkshopID..")",
			"T×m hiÓu ho¹t ®éng thu thËp vËt phÈm/collg_about",
			"Nh©n tiÖn ghĞ qua th«i/festival06_Cancal"
	};

	Say("<#>Tæng qu¶n Ho¹t ®éng ph­êng:  Ho¹t ®éng thu thËp vËt phÈm b¾t ®Çu lóc 2h, 5h, 8h…22h vµ b¾t ®Çu cho b¸o danh vµo phót thø 15, 30, 45. Mong mäi ng­êi h·y gãp søc tham gia ho¹t ®éng.", getn(tab_gh_content), tab_gh_content);
end;

function wantjoin_collection(nTongID, nWorkshopID)
	Say("Tæng qu¶n Ho¹t ®éng ph­êng: Ng­¬i ®ång ı gióp ®ì thËt qu¸ tèt råi, cã ®iÒu ta nghe nh÷ng th­¬ng nh©n cßn sèng sãt nãi lµ t¹i n¬i cÊm ®Şa Êy cã mét c¬ quan bİ hiÓm, tr«ng nh­ mét viªn ph¸o, chóng sÏ b¸m chÆt vµo th©n ng­êi, trõ khi ng­¬i nĞm nã vµo ng­êi kh¸c th× th«i, kh«ng th× nã cø b¸m vµo ng­êi kh«ng døt ra ®­îc, xin h·y hÕt søc cÈn thËn.", 2, 
	"Ta sÏ cÈn thËn, h·y mau ®­a ta ®Õn n¬i Êy./#collg_joindisciple("..nTongID..","..nWorkshopID..")", 
	"NÕu ®· nh­ thÕ, ta cÇn cã thêi gian ®Ó chuÈn bŞ./OnCancel");
end;

else
-----------------Èç¹ûÊÇ¿Í»§¶Ë---------------
function GET_DESC(nTongID, nWorkshopID, nType)
	if (nTongID == 0) then
		return "<color=water>Kh«ng cã bang héi"	
	end
	local bOpen	--ÊÇ·ñ¿ªÆô
	local bPause --ÊÇ·ñÔİÍ£
	local nCurLevel --µ±Ç°µÈ¼¶
	local nUseLevel --µ±Ç°Ê¹ÓÃµÈ¼¶
	local nOpenFund --µ±Ç°¿ªÆôÏûºÄ
	local nMaintainFund --µ±Ç°Î¬»¤ÏûºÄ
	local nPrice  --µ±Ç°»»È¡bossÕÙ»½·ûµÄ½¨Éè»ù½ğ
	local dTokenCount	--µ±Ç°Ã¿ÈÕbossÕÙ»½·û²ú³ö×ÜÁ¿Ìá¸ß
	local nDoubleOdds  --µ±Ç°ÕÙ»½³ö2¸ö»Æ½ğBossµÄ¼¸ÂÊ
	local dDiziCount	--µ±Ç°Ã¿ÈÕ²Î¼ÓÕĞÄ¼µÜ×Ó»î¶¯ÈË´ÎÌá¸ß
	local nDiziDoubleOdds	--µ±Ç°ÕĞÄ¼µÜ×Ó»î¶¯¸øÓëË«±¶½±ÀøµÄ¼¸ÂÊ
	local dNianshouCount	--µ±Ç°Ã¿ÈÕ²Î¼Ó°ï»á´òÄêÊŞ»î¶¯ÈË´ÎÌá¸ß
	local nNianshouDoubleOdds		--µ±Ç°°ï»á´òÄêÊŞ»î¶¯¸øÓëË«±¶½±ÀøµÄ¼¸ÂÊ
	if (nWorkshopID ~= 0)then
		bOpen = TWS_IsOpen(nTongID, nWorkshopID) 
		bPause = TONG_GetPauseState(nTongID) 
		nCurLevel = TWS_GetLevel(nTongID, nWorkshopID) 
		nUseLevel = TWS_GetUseLevel(nTongID, nWorkshopID)
		nOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel) 
		nMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel, bOpen)  
		if(nUseLevel > 0)then		
			nPrice = aLevelLingPaiPrice[nUseLevel]
			dTokenCount = format("%.2f", aLevelCoef[nUseLevel] / aLevelCoef[1])	
			nDoubleOdds = 160 - (nUseLevel - 1) * 10
			dDiziCount = format("%.2f", aLevelDiziCoef[nUseLevel] / aLevelDiziCoef[1])	
			nDiziDoubleOdds = floor(aLevelDiziDouble[nUseLevel] * 100)
			dNianshouCount = format("%.2f", aLevelNianshouCoef[nUseLevel] / aLevelNianshouCoef[1])	
			nNianshouDoubleOdds = floor(aLevelNianshouDouble[nUseLevel] * 100)
		else
			nPrice = "--"
			dTokenCount = "--"
			nDoubleOdds = "--"
			dDiziCount = "--"
			nDiziDoubleOdds = "--"
			dNianshouCount = "--"
			nNianshouDoubleOdds = "--"
		end
	else	--×÷·»Î´½¨Á¢Ê±Ö»ÏÔÊ¾ÏÂÒ»¼¶ĞÅÏ¢
		nCurLevel = 0
		bOpen = 1
		nUseLevel = 0
	end
	--ÏÂ¼¶ĞÅÏ¢
	local nUpgradeCostFund, nNextMaintainFund, nNextPrice, nNextOpenFund, dNextTokenCount,nNextDoubleOdds,dNextDiziCount,nNextDiziDoubleOdds,dNextNianshouCount,nNextNianshouDoubleOdds
	if (nCurLevel < wsGetMaxLevel(nTongID, nType))then
		nUpgradeCostFund = wsGetUpgradeCostFund(nTongID, nType, nCurLevel)  --Éı¼¶ÏûºÄ
	else
		nUpgradeCostFund = "--"
	end
	if (nUseLevel < wsGetMaxLevel(nTongID, nType))then		
		nNextMaintainFund = wsGetMaintainCost(nTongID, nType, nUseLevel+1, bOpen)  --ÏÂ¼¶Î¬»¤ÏûºÄ
		nNextOpenFund = wsGetOpenCost(nTongID, nType, nUseLevel+1) 	--ÏÂ¼¶¿ªÆôÏûºÄ
		nNextPrice = aLevelLingPaiPrice[nUseLevel + 1] --ÏÂ¼¶»»È¡bossÕÙ»½·ûµÄ½¨Éè»ù½ğ
		dNextTokenCount = format("%.2f", aLevelCoef[nUseLevel + 1] / aLevelCoef[1]) --ÏÂ¼¶Ã¿ÈÕbossÕÙ»½·û²ú³ö×ÜÁ¿Ìá¸ß
		nNextDoubleOdds = 160 - nCurLevel * 10 --ÏÂ¼¶ÕÙ»½³ö2¸ö»Æ½ğBossµÄ¼¸ÂÊ
		dNextDiziCount = format("%.2f", aLevelDiziCoef[nUseLevel + 1] / aLevelDiziCoef[1])	
		nNextDiziDoubleOdds = format(aLevelDiziDouble[nUseLevel + 1] * 100)
		dNextNianshouCount = format("%.2f", aLevelNianshouCoef[nUseLevel + 1] / aLevelNianshouCoef[1])	
		nNextNianshouDoubleOdds = format(aLevelNianshouDouble[nUseLevel + 1] * 100)
	else		
		nNextMaintainFund = "--"
		nNextOpenFund = "--"
		nNextPrice = "--"
		dNextTokenCount = "--"
		nNextDoubleOdds = "--"
		dNextDiziCount = "--"
		nNextDiziDoubleOdds = "--"
		dNextNianshouCount = "--"
		nNextNianshouDoubleOdds = "--"
	end	
	if (nWorkshopID ~= 0)then
		local state 
		if bPause == 1 then state="<color=yellow>T¹m ngõng" elseif bOpen == 1 then state="<color=green>Khai më" else state="<color=red>§ãng cöa" end
		local szMsg = "Tr¹ng th¸i t¸c ph­êng: "..state.."<color>\n"..
			"§¼ng cÊp t¸c ph­êng: <color=gold>"..nCurLevel.."<color>\n"..
			"§¼ng cÊp sö dông hiÖn t¹i: <color=gold>"..nUseLevel.."<color>\n"..
			--"BossÕÙ»½·ûÈÕ²úÁ¿ÉÏÏŞÌá¸ß£º<color=gold>"..dTokenCount.."<color>±¶\n"..	
			--"ÕÙ»½·ûÕÙ³öµÚ2¸öBossµÄ¼¸ÂÊ£º<color=gold>1/"..nDoubleOdds.."<color>\n"..		
			--"»»È¡BossÕÙ»½·ûËùĞè½¨Éè»ù½ğ£º<color=gold>"..nPrice.."Íò<color>\n"..
			"L­ît ng­êi mçi ngµy cã thÓ tham gia ho¹t ®éng t¨ng: <color=gold>"..dDiziCount.."<color> lÇn\n"..
			"X¸c suÊt bang héi nhËn ®­îc phÇn th­ëng nh©n ®«i: <color=gold>"..nDiziDoubleOdds.."%<color>\n"..
			"Ng©n s¸ch chiÕn bŞ chi cho phİ b¶o tr× bang mçi ngµy: <color=gold>"..nMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=gold>"..nOpenFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ®Ó n©ng cÊp: <color=gold>"..nUpgradeCostFund.." v¹n<color>\n"..
			"<color=green>§¼ng cÊp sö dông kÕ tiÕp <color>\n"..
			--"<color=water>BossÕÙ»½·ûÈÕ²úÁ¿ÉÏÏŞÌá¸ß£º<color=Violet>"..dNextTokenCount.."<color>±¶\n"..
			--"ÕÙ»½·ûÕÙ³öµÚ2¸öBossµÄ¼¸ÂÊ£º<color=Violet>1/"..nNextDoubleOdds.."<color>\n"..	
			--"»»È¡BossÕÙ»½·ûËùĞè½¨Éè»ù½ğ£º<color=Violet>"..nNextPrice.."Íò<color>\n"..
			"<color=water>L­ît ng­êi mçi ngµy cã thÓ tham gia ho¹t ®éng t¨ng: <color=Violet>"..dNextDiziCount.."<color> lÇn\n"..
			"X¸c suÊt ho¹t ®éng bang héi nhËn ®­îc phÇn th­ëng nh©n ®«i: <color=Violet>"..nNextDiziDoubleOdds.."%<color>\n"..
			"Ng©n s¸ch chiÕn bŞ chi cho phİ b¶o tr× bang mçi ngµy: <color=Violet>"..nNextMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=Violet>"..nNextOpenFund.." v¹n<color>\n"

		return szMsg
	else
		local szMsg = "Tr¹ng th¸i t¸c ph­êng: <color=water>Ch­a thµnh lËp<color>\n"..
			"Ng©n s¸ch kiÕn thÕt cÇn ®Ó x©y dùng: <color=gold>"..nUpgradeCostFund.." v¹n<color>\n"..
			"<color=green>§¼ng cÊp kÕ tiÕp <color>\n"..
			--"<color=water>BossÕÙ»½·ûÈÕ²úÁ¿ÉÏÏŞÌá¸ß£º<color=Violet>"..dNextTokenCount.."<color>±¶\n"..
			--"ÕÙ»½·ûÕÙ³öµÚ2¸öBossµÄ¼¸ÂÊ£º<color=Violet>1/"..nNextDoubleOdds.."<color>\n"..
			--"»»È¡BossÕÙ»½·ûËùĞè½¨Éè»ù½ğ£º<color=Violet>"..nNextPrice.."Íò<color>\n"..
			"<color=water>L­ît ng­êi mçi ngµy cã thÓ tham gia ho¹t ®éng t¨ng: <color=Violet>"..dNextDiziCount.."<color> lÇn\n"..
			"X¸c suÊt ho¹t ®éng bang héi nhËn ®­îc phÇn th­ëng nh©n ®«i: <color=Violet>"..nNextDiziDoubleOdds.."%<color>\n"..
			"Ng©n s¸ch chiÕn bŞ chi cho phİ b¶o tr× bang mçi ngµy: <color=Violet>"..nNextMaintainFund.." v¹n<color>\n"..
			"Ng©n s¸ch kiÕn thiÕt ban ®Çu: <color=Violet>"..nNextOpenFund.." v¹n<color>\n"
		return szMsg
	end
end
----------------------------------------------
end