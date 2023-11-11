
-- ËÎ½ğ±¨Ãûµã	ËÎ¾ü¾üĞè¹Ù
-- lixin 2004-12-13
IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\weeklyrank.lua")
Include("\\script\\task\\system\\task_string.lua");

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\global\\ÌØÊâÓÃµØ\\ËÎ½ğ±¨Ãûµã\\npc\\head.lua")
Include("\\script\\global\\ÌØÊâÓÃµØ\\ËÎ½ğ±¨Ãûµã\\npc\\songjin_shophead.lua")

Include("\\script\\global\\global_tiejiang.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\battles\\vngbattlesign.lua")

--§iÒu chØnh ®iÓm kinh nghiÖm giíi h¹n khi ®æi ®iÓm tİch luü - Modified by DinhHQ - 20110810
--Limit_Exp = 550000
--Limit_Exp = 700000
tbLimit_Exp = {
						[0] = 1000000,
						[3] = 1500000,
						[4] = 2000000, 
						[5] = 2000000,
						[6] = 2000000, 
					};
YUEWANGHUN_STONECOUNT = 100
nState = 0;

function main(sel)
	local nWorld, _, _ = GetWorldPos()
	-- if nWorld ~= 162 then
	-- 	Talk(1, "", "Chøc n¨ng ®· ®ãng.")
	-- 	return
	-- end
	nOldSW = SubWorld
	SubWorld = SubWorldID2Idx(325)
	if (nState == 0) then
		bt_setnormaltask2type()
		nState = 1;
	end
	battlemapid = BT_GetGameData(GAME_MAPID);
	
	--µ±Ç°Ã»ÓĞÈÎºÎÕ½ÒÛ´òÏì
	if (battlemapid <= 0) then
			maintalk()
			return 
	end
	SyncTaskValue(747);--Í¬²½Íæ¼ÒµÄ×Ü»ı·Ö¸ø¿Í»§¶Ë£¬ÓÃÓÚ»ı·Ö¹ºÂò¹¦ÄÜ
	battlemap = SubWorldID2Idx(BT_GetGameData(GAME_MAPID));
	if (battlemap < 0) then
		Msg2Player("error"..battlemap)
		return
	end
	
	tempSubWorld = SubWorld;
	SubWorld = battlemap
	state = GetMissionV(MS_STATE);
	
	if (state == 0 or state == 1) then
		maintalk()
		SubWorld = tempSubWorld;
		return
	else
		Talk(1,"","Qu©n Nhu quan: ChiÕn tranh ®ang diÔn ra ¸c liÖt phİa tr­íc, c¸c vŞ nªn t¹m l¸nh mét chót!")
		SubWorld = tempSubWorld;
		return
	end;
	SubWorld = nOldSW;	
end;

function no()
end;

function songshop_sell()
		Sale(98, 4);			
end;

--str1 = "ËÎ¾ü¾üĞè¹Ù£º´ó¼ÒÍ¬Îª´óËÎ×ÓÃñ£¬Äã¼ÈÈ»¾ö¶¨±¨Ğ§¹ú¼Ò£¬¿¹»÷½ğ¿Ü£¬±ã¿ÉÒÔÔÚÎÒÕâÀïÓÃËÎ½ğ»ı·Ö<color=yellow>»»È¡¾­Ñé¡¢ÔÀÍõ»êÖ®Ê¯<color>£¬»¹¿ÉÒÔ¹ºÂò<color=yellow>ËÎ½ğ×¨ÓÃµÀ¾ß<color>¡£"
--str2 = "Èç¹û£¬ÄãÓĞÔÀÍõ»êÖ®Ê¯µÄ»°£¬»¹ÄÜÔÚÎÒÕâÀïÁ¶ÔìÔÀÍõ½£Å¶£¡"
function maintalk()
	
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	--µ¯³ö¶Ô»°¿ò
	tbDailog.szTitleMsg = format("Qu©n Nhu Quan: HiÖn t¹i ng­¬i cã <color=yellow>%d<color> ®iÓm tİch lòy, cã muèn mua g× kh«ng?", GetTask(747))
	tbDailog:AddOptEntry("Ta muèn mua ®¹o cô", songshop_sell)
	--tbDailog:AddOptEntry("Ta muèn ®æi ®iÓm kinh nghiÖm", exp_exchange)
	tbDailog:AddOptEntry("Sö dông Nh¹c V­¬ng Hån Th¹ch ®Ó ®óc luyÖn Nh¹c V­¬ng KiÕm", yuewang_want)
	--tbDailog:AddOptEntry("ChiÕn tr­êng v« song m·nh t­íng",wushuangmengjiang)--ÎŞË«ÃÍ½«
	--tbDailog:AddOptEntry("Cöa hµng tinh lùc", energy_sale)
	--tbDailog:AddOptEntry("§æi Bİ B¶o", duihuangmibao)
	--T¹m ®ãng kiÕm gia mª cung - Modified by DinhHQ - 20110810
	--tbDailog:AddOptEntry("Dïng Nh¹c V­¬ng Hån Th¹ch ®æi lÊy Ngäc Long Anh Hïng ThiÕp", talk_yulongtie)
	--tbDailog:AddOptEntry("B¶ng Tèng Kim Long Hæ", sj_GetRankTop10)
	
	tbDailog:Show()
end

function xunzhang_exchange()
	if( GetLevel() < 40 ) then
		Talk( 1, "", "Qu©n Nhu Quan: ChØ cã ng­êi ch¬i cÊp tõ 50 trë lªn míi cã thÓ nhËn Huy ch­¬ng .");
		return 0
	elseif ( GetExtPoint(0)==0 ) then
		Talk( 1, "", "Qu©n Nhu Quan: ChØ cã ng­êi ch¬i ®· n¹p thÎ míi cã thÓ nhËn Huy ch­¬ng .");
		return 0
	elseif ( CalcFreeItemCellCount() < 1 ) then
		Talk( 1, "", "H·y chuÈn bŞ 1 « trèng ®Ó ®Æt vµo 1 Huy ch­¬ng");
		return 0;
	else
		Say("Qu©n Nhu Quan: Ng­êi cã muèn dïng 500 ®iÓm tİch lòy ®Ó ®æi lÊy Huy ch­¬ng kh«ng?", 2,"§æi lÊy Huy ch­¬ng/xunzhang_do", "HiÖn t¹i kh«ng muèn ®æi/no");
	end
end

function xunzhang_do()
	if nt_getTask(747) < 500 then
		Say("§iÓm tİch lòy kh«ng ®ñ 500, kh«ng thÓ nhËn Huy ch­¬ng",0);
		return 0;
	end
	nt_setTask(747, floor(nt_getTask(747) - 500));
	local nidx = AddItem(6,1,1412,1,0,0) --»ñµÃËÎ½ğÑ«ÕÂ
	WriteLog(format("[GetZhanGongXunZhang]\t date:%s \t Account:%s \t Name:%s \t GetItem:%s Del:500SongJinJiFen\t",GetLocalDate("%Y-%m-%d %H:%M:%S"),GetAccount(),GetName(),GetItemName(nidx)));
	Say("§· nhËn thµnh c«ng 1 Huy ch­¬ng",0);
end

function exp_exchange()
	--Say("±¾¹¦ÄÜÔİ²»¿ª·Å£¬¾´ÇëÆÚ´ı£¡", 0 )
	if( GetLevel() < 40 ) then
		Talk( 1, "", "Qu©n Nhu quan: B¹n ch­a ®¹t ®­îc cÊp 40, kh«ng thÓ tham gia chiÕn tr­êng, sao cã thÓ lÊy ®iÓm tİch lòy ®æi ®iÓm kinh nghiÖm?");
	else
		if (GetTiredDegree() == 2) then
			Say("Qu©n Nhu Quan: §ang ë tr¹ng th¸i mÖt mái, kh«ng thÓ ®æi ®iÓm kinh nghiÖm.",0);
		else
			local tbOpt = 
			{
				"500 ®iÓm tİch lòy/#wantpay(500)", 
				"1000 ®iÓm tİch lòy/#wantpay(1000)",
				 "2000 ®iÓm tİch lòy/#wantpay(2000)",
				  "5000 ®iÓm tİch lòy/#wantpay(5000)",
				   "TÊt c¶ ®iÓm tİch lòy/#wantpay(9999)",
				   "HiÖn t¹i kh«ng muèn ®æi/no"
			}
			local nDate = tonumber(GetLocalDate("%Y%m%d"))
			local nHM	= tonumber(GetLocalDate("%%H%M"))
			
			
			if  20090925 <= nDate and  nDate <= 20091101 then
			--	tinsert(tbOpt, 5, format("%dµã»ı·Ö/#wantpayex(%d,%d)",80000,80000,0))
			end
			--»î¶¯ÆÚ¼ä(2009/09/25ÖÁ2009/11/01)´Ó12h30 ÖÁ 23h30
			
			Say("Qu©n Nhu quan: B¹n muèn tèn bao nhiªu ®iÓm tİch lòy ®Ó ®æi ®iÓm kinh nghiÖm?", getn(tbOpt), tbOpt);
		end;
	end
end;

function wantpayex(mark, nStep)
	
	if GetLevel() < 120 then
		Talk(1, "", format("Yªu cÇu cÇn %d cÊp trë lªn míi cã thÓ ®æi.", 120))
		return 
	end
	
	if PlayerFunLib:CheckTaskDaily(2645, 1, "PhÇn th­ëng nµy mçi ngµy chØ cã thÓ nhËn 1 lÇn.", "<") ~= 1 then
		return
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
				
	if gb_GetTask("songjin butianshi2009", 1) ~= nDate then
		gb_SetTask("songjin butianshi2009", 1, nDate)
		gb_SetTask("songjin butianshi2009", 2, 0)
	end
	
	if gb_GetTask("songjin butianshi2009", 2) >= 10 then
		Talk(1, "", "Mçi ngµy mçi server, 10 ng­êi nhanh nhÊt míi cã thÓ ®æi phÇn th­ëng nµy.")
		return 
	end
	
	if( mark > nt_getTask(747) ) then
		Say("Qu©n Nhu quan: §iÓm tİch lòy cña b¹n kh«ng ®ñ, muèn nhËn ®­îc ®iÓm kinh nghiÖm", 1, "§ãng/no");
	elseif (mark == 0) then
		Say("Qu©n Nhu quan: Kh«ng cã ®iÓm tİch lòy mµ muèn ®æi ®iÓm kinh nghiÖm µh, ®óng lµ chuyÖn hoang ®­êng.", 1, "§ãng/no");
	else
		local level = GetLevel();
		local bonus = bt_exchangeexp(level, mark)
		
		local tbItem = {szName="M¶nh Bæ Thiªn Th¹ch (trung)", tbProp={6, 1, 1309, 1, 0, 0}}
		if nStep == 1 then
			if (expchange_limit(mark) == 1) then
				nt_setTask(747, floor(nt_getTask(747) - mark))
				AddOwnExp( bonus);
				--Add120SkillExp(bonus);
				
				tbAwardTemplet:GiveAwardByList(tbItem, "MidAutumn,GetItemFromSongjin")
				gb_AppendTask("songjin butianshi2009", 2, 1)
				PlayerFunLib:AddTaskDaily(2645, 1)	
				Msg2Player("<#>B¹n ®· tèn"..mark.."<#>®iÓm tİch lòy, ®æi lÊy"..bonus .."<#>®iÓm kinh nghiÖm.");
				WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: §· tèn"..mark.."®iÓm tİch lòy, ®æi lÊy"..bonus.."®iÓm kinh nghiÖm.");
			end
			
			
			
		elseif nStep == 0 then
			Say("Qu©n Nhu quan: B¹n cã thÓ ®æi ®­îc"..bonus.."§iÓm kinh nghiÖm, x¸c ®Şnh ®æi ph¶i kh«ng?", 2, "§óng, ta cÇn ®æi/#wantpayex("..mark..",1"..")", "Uhm, §Ó ta suy nghÜ l¹i!/no")	
		end
		
	end	
end
function wantpay(mark)
	if (mark == 9999) then		--»»È¡ËùÓĞ»ı·Ö
		mark = nt_getTask(747)
	end
	
	if( mark > nt_getTask(747) ) then
		Say("Qu©n Nhu quan: §iÓm tİch lòy cña b¹n kh«ng ®ñ, muèn nhËn ®­îc ®iÓm kinh nghiÖm", 1, "§ãng/no");
	elseif (mark == 0) then
		Say("Qu©n Nhu quan: Kh«ng cã ®iÓm tİch lòy mµ muèn ®æi ®iÓm kinh nghiÖm µh, ®óng lµ chuyÖn hoang ®­êng.", 1, "§ãng/no");
	else
		local level = GetLevel();
		local bonus = bt_exchangeexp(level, mark)
		Say("Qu©n Nhu quan: B¹n cã thÓ ®æi ®­îc"..bonus.."§iÓm kinh nghiÖm, x¸c ®Şnh ®æi ph¶i kh«ng?", 2, "§óng, ta cÇn ®æi/#paymark("..mark..")", "Uhm, §Ó ta suy nghÜ l¹i!/no")
	end	
end

function paymark(mark)
	if (mark == 9999) then		--»»È¡ËùÓĞ»ı·Ö
		mark = nt_getTask(747)
	end
	
	if( mark > nt_getTask(747) ) then
		Say("Qu©n Nhu quan: §iÓm tİch lòy cña b¹n kh«ng ®ñ, muèn nhËn ®­îc ®iÓm kinh nghiÖm", 1, "§ãng/no");
	elseif (mark == 0) then
		Say("Qu©n Nhu quan: Kh«ng cã ®iÓm tİch lòy mµ muèn ®æi ®iÓm kinh nghiÖm µh, ®óng lµ chuyÖn hoang ®­êng.", 1, "§ãng/no");
	else
		local level = GetLevel();
		local bonus = bt_exchangeexp(level, mark)
		if (expchange_limit(mark) == 1) then
			nt_setTask(747, floor(nt_getTask(747) - mark))
			AddOwnExp( bonus);
		--	Add120SkillExp(bonus);
			Msg2Player("<#>B¹n ®· tèn"..mark.."<#>®iÓm tİch lòy, ®æi lÊy"..bonus .."<#>®iÓm kinh nghiÖm.");
			WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]: §· tèn"..mark.."®iÓm tİch lòy, ®æi lÊy"..bonus.."®iÓm kinh nghiÖm.");
		end
	end
end


function expchange_limit(cost)
	--local ww = tonumber(date("%W"))
	--local yy = tonumber(date("%Y")) - 2000
	local nNumber = tbVNG2011_ChangeSign:GetTransLife()	
	local Limit_Exp = tbLimit_Exp[nNumber]
	if((nt_getTask(1017) + cost) <= Limit_Exp) then
		nt_setTask(1017, nt_getTask(1017) + cost)
		return 1
	else
		Say("Qu©n Nhu quan: §õng tham lam nh­ vËy, trong mét tuÇn kh«ng thÓ ®æi qu¸<color=red>"..Limit_Exp.."<color>®iÓm kinh nghiÖm cña tİch lòy", 0)
		return -1
	end
end

function nt_setTask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- Í¬²½µ½¿Í»§¶Ë
end

-- »ñÈ¡ÈÎÎñ×´Ì¬
function nt_getTask(nTaskID)
	return GetTask(nTaskID)
end

function person_change()
	Say("Qu©n Nhu quan: T¹i<color=yellow> b¶ng b×nh phÈm xÕp h¹ng <color>xÕp h¹ng<color=yellow> 5 tªn<color> ng­êi ch¬i ®Çu tiªn sÏ nhËn ®­îc danh hiÖu ®Æc biÖt vµ h×nh t­îng oai phong", 3, "Xem h×nh t­îng nh©n vËt nam Tèng Kim/title_male","Xem h×nh t­îng nh©n vËt n÷ Tèng Kim/title_female","Kh«ng muèn xem ®©u!/no" )
end;

function title_male()
	Describe("<link=image:\\spr\\npcres\\enemy\\enemy208\\enemy208_at.spr>H×nh t­îng nh©n vËt nam Tèng Kim<link>B×nh phÈm nh©n vËt nam cã tªn 5 ng­êi trong b¶ng xÕp h¹ng sÏ nhËn ®­îc h×nh t­îng t­¬ng øng", 1, "§ãng/no" );
end

function title_female()
	Describe("<link=image:\\spr\\npcres\\enemy\\enemy207\\enemy207_at.spr>H×nh t­îng nh©n vËt n÷ Tèng Kim<link>B×nh phÈm nh©n vËt n÷ cã tªn 5 ng­êi trong b¶ng xÕp h¹ng sÏ nhËn ®­îc h×nh t­îng t­¬ng øng", 1, "§ãng/no" );
end

function effect_aura()
	Say("Qu©n Nhu quan: T¹i<color=yellow> b¶ng b×nh phÈm xÕp h¹ng <color>xÕp h¹ng <color=yellow>5 tªn<color> nh©n vËt ®Çu tiªn sÏ nhËn ®­îc ®Æc hiÖu vßng trßn ®Æc biÖt", 6, "Xem §Şnh Quèc Nguyªn So¸i §Æc HiÖu/aura_dingguo","Xem An Bang §¹i T­íng Qu©n §Æc HiÖu/aura_anbang","Xem Phiªu Kú T­íng Qu©n §Æc HiÖu/aura_biaoji","Xem Vò L©m Trung Lang §Æc HiÖu/aura_yulin","Xem Chiªu Vâ HiÖu óy §Æc HiÖu/aura_zhaowu","Kh«ng muèn xem ®©u!/no" );
end

function aura_dingguo()
	Describe("<link=image:\\spr\\skill\\others\\title_dg.spr>§Şnh Quèc Nguyªn So¸i §Æc HiÖu<link>B×nh phÈm nh©n vËt xÕp h¹ng 1 trong b¶ng xÕp h¹ng sÏ nhËn ®­îc ®Æc hiÖu cña vßng trßn", 1, "§ãng/no" );
end

function aura_anbang()
	Describe("<link=image:\\spr\\skill\\others\\title_ab.spr>An Bang §¹i T­íng Qu©n §Æc HiÖu<link>B×nh phÈm nh©n vËt xÕp h¹ng 2 trong b¶ng xÕp h¹ng sÏ nhËn ®­îc ®Æc hiÖu cña vßng trßn", 1, "§ãng/no" );
end

function aura_biaoji()
	Describe("<link=image:\\spr\\skill\\others\\title_bj.spr>Phiªu Kú T­íng Qu©n §Æc HiÖu<link>B×nh phÈm nh©n vËt xÕp h¹ng 3 trong b¶ng xÕp h¹ng sÏ nhËn ®­îc ®Æc hiÖu cña vßng trßn", 1, "§ãng/no" );
end

function aura_yulin()
	Describe("<link=image:\\spr\\skill\\others\\title_yl.spr>Vò L©m Trung Lang §Æc HiÖu<link>B×nh phÈm nh©n vËt xÕp h¹ng 4 trong b¶ng xÕp h¹ng sÏ nhËn ®­îc ®Æc hiÖu cña vßng trßn", 1, "§ãng/no" );
end

function aura_zhaowu()
	Describe("<link=image:\\spr\\skill\\others\\title_zw.spr>Chiªu Vâ HiÖu óy §Æc HiÖu<link>B×nh phÈm nh©n vËt xÕp h¹ng 5 trong b¶ng xÕp h¹ng sÏ nhËn ®­îc ®Æc hiÖu cña vßng trßn", 1, "§ãng/no" );
end

function yuewang_want()
	Say("Qu©n Nhu quan: Tõ nh÷ng tinh hoa cã ®­îc trong Nh¹c V­¬ng Hån Th¹ch ta chÕ t¹o ra Nh¹c V­¬ng KiÕm, cÇn ph¶i tèn"..YUEWANGHUN_STONECOUNT.."Viªn Nh¹c V­¬ng Hån Th¹ch nµy x¸c ®Şnh ®æi ph¶i kh«ng?", 2, "Muèn/yuewang_change", "§Ó ta xem l¹i/no")
end

function yuewang_change()
	Say("Qu©n Nhu quan: Nh¹c V­¬ng KiÕm chiÕm kh«ng gian trong hµnh trang lµ <color=yellow>6 (2 X 3)<color>«, ng­¬i x¸c ®Şnh cßn chç trèng trong hµnh trang ch­a?", 2, "Muèn/yuewang_sure", "§Ó ta xÕp gän hµnh trang ®·/no")
end

function yuewang_sure()
	if (CalcEquiproomItemCount(4, 507, 1, -1) >= YUEWANGHUN_STONECOUNT) then
		ConsumeEquiproomItem(YUEWANGHUN_STONECOUNT, 4, 507, 1, -1)
		AddEventItem(195)
		Say("Qu©n Nhu quan: Thanh Nh¹c V­¬ng KiÕm nµy rÊt quı b¸u, ng­¬i ph¶i biÕt tËn dông tèt ®Êy!", 0)
		Msg2Player("B¹n nhËn ®­îc Nh¹c V­¬ng KiÕm")
	else
		Say("Qu©n Nhu quan: Ng­¬i kh«ng cã nhiÒu Nh¹c V­¬ng Hån Th¹ch, h·y kiÓm tra l¹i ®i! Thanh Nh¹c V­¬ng KiÕm kh«ng ph¶i ng­êi nµo còng cã ®­îc ®©u.", 0)
	end
end

function ore()
	Sale( 102, 4);
end

function goldenitem_menu()
	Sale( 103, 4);
end
