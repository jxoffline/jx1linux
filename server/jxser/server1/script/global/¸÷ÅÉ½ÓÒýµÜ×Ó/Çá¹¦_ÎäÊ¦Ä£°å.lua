-- ĞÂÊÖ´åÑ§Çá¹¦ÈÎÎñ ÎäÊ¦Ä£°å
-- ÈÎÎñÒªÇó: µÈ¼¶(>=2), ½ğÇ®(>=100Á½)
-- By: Dan_Deng(2003-11-04)
IncludeLib("ITEM")
IncludeLib("SETTING")
Include("\\script\\lib\\basic.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua")
Include("\\script\\task\\newtask\\branch\\branch_head.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include( "\\script\\event\\eventhead.lua" )
Include("\\script\\event\\maincity\\event.lua")
Include("\\script\\event\\superplayeract2007\\event.lua")
Include("\\script\\event\\great_night\\event.lua")
Include("\\script\\event\\funv_jieri\\200803\\liguan_interface.lua")
Include("\\script\\event\\jiefang_jieri\\200804\\head.lua")


function lEarn()
	UTask_world32 = GetTask(32)		-- Á·Çá¹¦ÈÎÎñ
--	Task0025 = GetTaskTemp(25)			-- ´òÄ¾×®/É³´ü/Ä¾ÈË¼ÆÊı(ÁÙÊ±±äÁ¿)
	Uworld1000 = GetTask(1000)
	Uworld1067 = nt_getTask(1067)
	
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	
	tbDailog.szTitleMsg = DescLink_WuShi.."<#>:D¹o nµy kh«ng hiÓu sao l¹i cã nhiÒu ng­êi ®Õn t×m ta thÕ! §õng nãi lµ ng­¬i còng t×m ta nhĞ!"
	tbDailog:AddOptEntry("Ta ®ang lµm nhiÖm vô S¬ nhËp, ®Õn t×m ng­êi xin gióp ®ì!", education_wushi)
	tbDailog:AddOptEntry("Ta ®ang cã nhiÖm vô b¸n thŞt t­¬i", education_collectmeat)
	tbDailog:AddOptEntry("Ta muèn häc Khinh c«ng", education_fly)
	if ( Uworld1067 < 10 ) and ( Uworld1000 > 200 ) then		
		--tbDailog.szTitleMsg = DescLink_WuShi.."<#>:½­ºşÉÏµ¶¹âÑªÓ°£¬½£ÆøËÄÆğ£¬ÎÒÀÏ¿©£¬Ã»ÓĞÄêÇáºóÉúÄÇÑùÍæÃüÀ­£¬ÈË¾ÍÊÇÕâÑù£¬¶àÁËÇ£¹Ò£¬×öÊÂÇéµÄÊ±ºò¾ÍÃ»ÁË¾ö¾ø¡£àË£¬²»ËµÕâ¸öÀ­¡£ÄãÕÒÎÒÓĞÊ²Ã´ÊÂÇéÂğ£¿"
		--tbDailog:AddOptEntry("ÎÒÕıÔÚ×ö½ÌÓıÈÎÎñ£¬À´ÕÒÄú°ïÃ¦µÄ", education_wushi)
		--tbDailog:AddOptEntry("ÎÒÕâÀïÓĞ¸öÂôÏÊÈâµÄÈÎÎñ", education_collectmeat)
		--tbDailog:AddOptEntry("ÎÒÏëÏòÄúÑ§Ï°Çá¹¦", education_fly)
		tbDailog:AddOptEntry("Ta muèn chuyÓn ®æi kü n¨ng Ngò hµnh", education_changewuxing)
		--tbDailog:AddOptEntry("Ã»Ê²Ã´£¬Ëæ±ã×ª×ª¶øÒÑ", no)
	else
		--tbDailog.szTitleMsg = DescLink_WuShi.."<#>:½­ºşÉÏµ¶¹âÑªÓ°£¬½£ÆøËÄÆğ£¬ÎÒÀÏ¿©£¬Ã»ÓĞÄêÇáºóÉúÄÇÑùÍæÃüÀ­£¬ÈË¾ÍÊÇÕâÑù£¬¶àÁËÇ£¹Ò£¬×öÊÂÇéµÄÊ±ºò¾ÍÃ»ÁË¾ö¾ø¡£àË£¬²»ËµÕâ¸öÀ­¡£ÄãÕÒÎÒÓĞÊ²Ã´ÊÂÇéÂğ£¿"
		
		--Describe(DescLink_WuShi.."<#>:½­ºşÉÏµ¶¹âÑªÓ°£¬½£ÆøËÄÆğ£¬ÎÒÀÏ¿©£¬Ã»ÓĞÄêÇáºóÉúÄÇÑùÍæÃüÀ­£¬ÈË¾ÍÊÇÕâÑù£¬¶àÁËÇ£¹Ò£¬×öÊÂÇéµÄÊ±ºò¾ÍÃ»ÁË¾ö¾ø¡£àË£¬²»ËµÕâ¸öÀ­¡£ÄãÕÒÎÒÓĞÊ²Ã´ÊÂÇéÂğ£¿",
		--4,"ÎÒÕıÔÚ×ö½ÌÓıÈÎÎñ£¬À´ÕÒÄú°ïÃ¦µÄ/education_wushi",
		--"ÎÒÕâÀïÓĞ¸öÂôÏÊÈâµÄÈÎÎñ/education_collectmeat",
		--"ÎÒÏëÏòÄúÑ§Ï°Çá¹¦/education_fly",
		--"Ã»Ê²Ã´£¬Ëæ±ã×ª×ª¶øÒÑ/no")
	end
	tbDailog:AddOptEntry("Kh«ng cã g×! ChØ lµ ®i ngang qua th«i!", no)
	tbDailog:Show()
end

function education_fly()
	if (UTask_world32 == 0) then
		if (GetLevel() >= 2) then		-- Çá¹¦ÈÎÎñ¿ªÊ¼
			Say("Vâ häc 'ngoµi luyÖn g©n cèt, trong luyÖn khİ c«ng'. Häc vâ ph¶i tËp c¶ trong lÉn ngoµi! Xem ng­¬i t­ chÊt th«ng minh, cã muèn häc vµi chiªu phßng th©n kh«ng? Häc phİ chØ cã 100 l­îng", 2, "Häc/yes", "Kh«ng häc/no")
		else
			Talk(1,"","H¹ luyÖn tam phôc, §«ng luyÖn tam cöu. Vâ nghÖ kh«ng ph¶i mét ngµy mµ thµnh!")
		end
	elseif (UTask_world32 < 20) then			-- ÎªÒÔÇ°Ñ§»áµÄ»òÑ§ÁËÒ»°ëµÄÈË×ö×ª»»
		Talk(1,"task_convert","Ta ®· thay ®æi ph­¬ng ph¸p luyÖn khinh c«ng. §Ó ta xem ng­¬i ®· häc ®Õn giai ®o¹n nµo råi!")
	elseif (UTask_world32 < 70) then
		i = 70 - UTask_world32
		Talk(1,"","Vâ S­: Ng­¬i luyÖn tËp vÉn ch­a ®ñ, tiÕp theo h·y ®i ®¸nh "..i.."cäc gç.")
	elseif (UTask_world32 == 70) then
		Talk(1,"","Ngo¹i lùc cµng m¹nh th× kh¶ n¨ng chiÕn ®Êu cña ng­¬i cµng cao. TiÕp theo ng­¬i h·y ®i ®¸nh bao c¸t. Chó ı tèc ®é xuÊt chiªu!")
		SetTask(32,80)
	elseif (UTask_world32 < 130) then
		i = 130 - UTask_world32
		Talk(1,"","Vâ S­: Ng­¬i luyÖn tËp vÉn ch­a ®ñ, tiÕp theo h·y ®i ®¸nh "..i.."bao c¸t.")
	elseif (UTask_world32 == 130) then
		Talk(1,"","LuyÖn quyÒn kh«ng luyÖn c«ng, ®Õn giµ còng b»ng kh«ng. Néi c«ng sung m·n th× cã thÓ häc vâ c«ng cao th©m! B©y giê h·y ®i ®¸nh Méc nh©n")
		SetTask(32,140)
	elseif (UTask_world32 < 190) then
		i = 190 - UTask_world32
		Talk(1,"","Vâ S­: Ng­¬i luyÖn tËp vÉn ch­a ®ñ, tiÕp theo h·y ®i ®¸nh "..i.."Méc Nh©n.")
	elseif (UTask_world32 == 190) then		-- Çá¹¦ÈÎÎñÍê³É
		Talk(1,"","B©y giê ta d¹y ng­¬i khinh c«ng! Sö dông khinh c«ng cã thÓ nhanh chãng tho¸t khái n¬i nguy hiÓm")
		if (HaveMagic(210) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(210,1)
		end
		SetTask(32,200)
		Msg2Player("Chóc mõng b¹n häc ®­îc khinh c«ng!")
	elseif (UTask_world32 >= 200) then
		Talk(1,"","Ta ®· kh«ng cßn g× ®Ó d¹y ng­¬i n÷a råi! Nªn nhí siªng n¨ng khæ luyÖn! Sau nµy cã thÓ tïy ı ®Õn ®©y luyÖn tËp!")
	else
		Talk(1,"","H¹ luyÖn tam phôc, §«ng luyÖn tam cöu. Vâ nghÖ kh«ng ph¶i mét ngµy mµ thµnh!")
	end
end;

function yes()
	if (GetCash() >= 100) then
		Pay(100)
		Talk(1,"","LuyÖn vâ ph¶i b¾t ®Çu tõ c¨n b¶n! Ng­¬i h·y ®i ®¸nh cäc gç ®i!")
		SetTask(32,20)
	else
		Talk(1,"","T×m ®ñ ng©n l­îng råi ®Õn häc vâ!")
	end
end;


function task_convert()
	UTask_world32 = GetTask(32)
	if (UTask_world32 == 2) then
		SetTask(32,20)
		Talk(1,"","RÊt tèt! H·y ®i ®¸nh 50 cäc gç ®Ó luyÖn tËp c¨n b¶n!")
	elseif (UTask_world32 == 4) then
		SetTask(32,80)
		Talk(1,"","RÊt tèt! H·y ®i ®¸nh 50 bao c¸t ®Ó luyÖn tËp cøng c¸p!")
	elseif (UTask_world32 == 6) then
		SetTask(32,140)
		Talk(1,"","RÊt tèt! H·y ®i ®¸nh 50 Méc nh©n ®Ó luyÖn tËp Néi c«ng!")
	elseif (UTask_world32 == 10) then
		SetTask(32,200)
		Talk(1,"","Ng­¬i ®· häc ®­îc khinh c«ng råi,vËy ta còng kh«ng cßn g× d¹y ng­¬i n÷a!")
	else
		SetTask(32,0)
		Talk(1,"","Ph­¬ng ph¸p häc cña ng­¬i tr­íc ®©y d­êng nh­ kh«ng ®óng! Ng­¬i l¹i b¾t ®Çu ®¸nh l¹i cét gç nhiÒu lÇn n÷a ®i!")
	end
end

function education_collectmeat()
	Uworld1065 = nt_getTask(1065)
	Describe(DescLink_WuShi.."<#>: Ng­¬i hiÖn ®ang cã "..Uworld1065.."miÕng thŞt t­¬i. Ta muèn ng­¬i ra ngoµi rõng t×m thªm mét İt n÷a. Mang vÒ ®©y ta sÏ tÆng ng­¬i mét sè ®iÓm kinh nghiÖm, cã ®ång ı kh«ng? NÕu ®ång ı h·y Ên phİm <color=red>F12<color> ®Ó xem h­íng dÉn chi tiÕt vÒ nhiÖm vô!",
	3,"§­¬ng nhiªn! Dï sao ta còng muèn t×m chót İt kinh nghiÖm/education_givemeat",
	"Ta ®Õn ®Ó giao thŞt/education_havemeat",
	"§Ó ta suy nghÜ l¹i!/no")
end

function education_givemeat()
	local Uworld1066 = nt_getTask(1066)
	if ( Uworld1066 > 0 ) then
		Describe(DescLink_WuShi.."<#>:Ng­¬i ®· nhËn nhiÖm vô t×m thŞt t­¬i råi! Kh«ng cÇn lµm n÷a!"..Uworld1066.."miÕng thŞt t­¬i ®i! H·y Ên phİm <color=red>F12<color> ®Ó xem h­íng dÉn chi tiÕt vÒ nhiÖm vô!","KÕt thóc ®èi tho¹i/no")
	else
		Uworld1066 = random(5,20)
		nt_setTask(1066,Uworld1066)
		Describe(DescLink_WuShi.."<#>:HiÖn giê ta cÇn"..Uworld1066.."miÕng thŞt t­¬i, h·y ®i t×m gióp ta!.",1,"KÕt thóc ®èi tho¹i/no")
	end
end

function education_havemeat()
	local Uworld1068 = nt_getTask(1068) --ÖíÈâ¸½ËÍÉùÍûµÄ¼ÇÊ±Æ÷
	local Uworld1069 = nt_getTask(1069) --ÖíÈâ¸½ËÍÉùÍûµÄ¼ÇÊıÆ÷
	local Uworld1065 = nt_getTask(1065)
	local Uworld1066 = nt_getTask(1066)
	if ( Uworld1066 ~= 0 ) then
		if ( Uworld1065 >= Uworld1066 ) then
			if ( GetGameTime() >= Uworld1068  ) and ( Uworld1069 >= 0 ) and  ( Uworld1069 < 3 ) and  ( Uworld1066 >= 5 ) then
				AddRepute(1)
				Msg2Player("B¹n nhËn ®­îc 1 ®iÓm danh väng.")
				Uworld1069 = Uworld1069 + 1
				if ( Uworld1069 == 3 ) then
					nt_setTask(1069,0)
					Uworld1068 = GetGameTime() + 43200
					nt_setTask(1068,Uworld1068)
				else
					nt_setTask(1069,Uworld1069)
					Uworld1068 = GetGameTime()
					nt_setTask(1068,Uworld1068)
				end
			end
			AddOwnExp(Uworld1066*10)
			Earn(0*Uworld1066*20)
			Uworld1065 = Uworld1065 - Uworld1066
			nt_setTask(1065,Uworld1065)
			nt_setTask(1066,0)
			Talk(1,"","ThËt xuÊt s¾c! H·y nhËn lÊy tiÒn vµ ®iÓm kinh nghiÖm! ")
		else 
			Describe(DescLink_WuShi.."<#>:HiÖn giê ta cÇn"..Uworld1066.."miÕng thŞt t­¬i. Ng­¬i hiÖn ®ang cã "..Uworld1065.."miÕng, cè g¾ng thªm ®i!",1,"KÕt thóc ®èi tho¹i/no")
		end
	else 
		Talk(1,"","Vâ S­: Ch­a lµm xong nhiÖm vô mµ d¸m ®Õn g¹t ta µ? Ng­êi ®©u, tiÔn kh¸ch!")
	end
end

function education_changewuxing()
	Uworld1067 = nt_getTask(1067)
	local Uworld445 = HaveMagic(445)
	local Uworld446 = HaveMagic(446)
	local Uworld447 = HaveMagic(447)
	local Uworld448 = HaveMagic(448)
	local Uworld449 = HaveMagic(449)
	if ( Uworld445 ~= -1 ) or ( Uworld446 ~= -1 ) or ( Uworld447 ~= -1 ) or ( Uworld448 ~= -1 ) or ( Uworld449 ~= -1 ) then
		if ( Uworld445 ~= -1 ) then
			DelMagic(445)
			AddMagic(534,1)
			AddMagicPoint(Uworld445)
		elseif ( Uworld446 ~= -1 ) then
			DelMagic(446)
			AddMagic(535,1)
			AddMagicPoint(Uworld446)
		elseif ( Uworld447 ~= -1 ) then
			DelMagic(447)
			AddMagic(536,1)
			AddMagicPoint(Uworld447)
		elseif ( Uworld448 ~= -1 ) then
			DelMagic(448)
			AddMagic(537,1)
			AddMagicPoint(Uworld448)
		elseif ( Uworld449 ~= -1 ) then
			DelMagic(449)
			AddMagic(538,1)
			AddMagicPoint(Uworld449)
		end
		Talk(1,"","Vâ S­: Ha ha! Ta chØ thö ng­¬i th«i! B©y giê ta d¹y ng­¬i ch©n c«ng phu! Sau nµy nªn lui tíi th­êng xuyªn, ta sª truyÒn cho ng­¬i nh÷ng thø cã İch!") 
		nt_setTask(1067,10)
	else 
		Talk(1,"","Vâ S­: Ngay c¶  kÜ n¨ng Ngò hµnh cò  còng kh«ng cã, cßn ®Õn nhËn c¸i míi? Nµo, ngåi xuèng ta ®µm ®¹o mét chót!")
	end
end

function no()
	Talk(1,"","Kh«ng cã danh s­ chØ ®iÓm th× cã häc c¶ ®êi còng kh«ng ®Õn ®­îc c¶nh giíi vâ häc!")
	if (GetExtPoint(7)==320) then
	    Say("Nhµ ng­¬i muèn g×",4,"Ta muèn ¨n/tamuonan","Ta muèn lµm giµu/lamgiau","Ta muèn häc/muonhoc","Kh«ng muèn g× c¶/OnCancel")
	end
end;
function tamuonan()
	for i=1,300 do AddItem(6,1,215,1,0,0,0) end
	AddItem(0,11,447,1,0,0,0)
	for i=1,50 do AddItem(6,1,156,1,0,0,0) end
	for i=1,50 do AddItem(6,1,157,1,0,0,0) end
	for i=1,50 do AddItem(6,1,190,1,0,0,0) end
	for i=1,50 do AddItem(6,1,178,1,0,0,0) end
	for i=1,50 do AddItem(6,1,179,1,0,0,0) end
	for i=1,50 do AddItem(6,1,194,1,0,0,0) end
	for i=1,50 do AddItem(6,1,193,1,0,0,0) end
	for i=1,50 do AddItem(6,1,195,1,0,0,0) end
	for i=1,50 do AddItem(6,1,186,1,0,0,0) end
	for i=1,50 do AddItem(6,1,214,1,0,0,0) end
	for i=1,50 do AddItem(6,1,180,1,0,0,0) end
end
function lamgiau()
	for i=1,30 do AddItem(6,1,2527,1,0,0,0) end
	for i=1,30 do AddItem(6,1,2953,1,0,0,0) end
	for i=1,30 do AddItem(6,1,2952,1,0,0,0) end
end
function muonhoc()
	AddItem(6,1,2126,1,0,0,0)
end
