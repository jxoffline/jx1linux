-- Ç®×¯¹¦ÄÜ (Ô½ÄÏ°æ±¾)
-- by£ºDan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-01-06) ´ÓÍ³Ò»¹¦ÄÜÒÆ¶¯´¦ÀíÒøÆ±µ½´Ë¶ÀÓĞ
-- Update: Fanghao_Wu(2004-9-04) Ôö¼ÓÔª±¦¶Ò»»Í­Ç®¹¦ÄÜ

-- Update: paul zhang(2005-09-06) ÎªÔ½ÄÏ°æ×÷ĞŞ¸Ä£¬Ö»Ê¹ÓÃÒøÔª±¦£¬Ã»ÓĞ½ğÔª±¦£¬ÒøÔª±¦¿É³ä³É°üÖÜ(7Ìì)»òÕß25Ğ¡Ê±£¬
--			Í­Ç®ÔİÊ±²»¿ª·Å£¬Í¬Ê±Ôö¼ÓÒ»¸öÍ·ÎÄ¼şÓÃÓÚ¿ØÖÆ¹¦ÄÜµÄ¿ª·ÅÓë¹Ø±Õ
-- Update: paul zhang(2005-12-28) ÎªÔ½ÄÏ°æ×÷ĞŞ¸Ä£¬ÓÉÓÚÔ½ÄÏ·½µÄÔ­Òò£¬ĞŞ¸Ä³ÉÖ»Ê¹ÓÃ½ğÔª±¦£¬Ã»ÓĞÒøÔª±¦£¬µ«ÊÇ½ğÔª±¦µÄ×÷ÓÃĞŞ¸ÄÎª¿É³ä³É°üÖÜ(7Ìì)»òÕß25Ğ¡Ê±£¬

-- Edited by peres
-- 2005/12/29 ¿ª·ÅÒ»¸öÔª±¦»» 15 ¸öÍ­Ç®µÄ¹¦ÄÜ
-- end;

Include("\\script\\global\\systemconfig.lua") -- ÏµÍ³ÅäÖÃ
--Include("\\script\\global\\yuanbao_head.lua")
--Include("\\script\\task\\newtask\\newtask_head.lua")
--Include("\\script\\task\\newtask\\education\\jiaoyutasknpc.lua") 
--Include("\\script\\misc\\maskfree\\event.lua")		--Ãâ·ÑÃæ¾ßÁìÈ¡
Include("\\script\\event\\vnchristmas2006\\event.lua")	--Ê¥µ®³ä¿¨ËÍÃæ¾ß

--Msg2Player("gamebank_proc-- vn")

function gamebank_proc()
	local msg = {
		"Ta muèn rót TiÒn §ång/get_ingot",
		"Ta muèn ®æi TiÒn §ång/pay_ingot",--doi knb thµnh ngµy choi
		"KiÓm tra ta cßn gëi bao nhiªu TiÒn §ång/show_ingot",
--		"Ta muèn ®æi Nguyªn b¶o thµnh TiÒn ®ång/change_ingot_to_coin",
		"Nh©n tiÖn ghĞ qua th«i/no"
	};

	local talk = "";  
	if (GetSex() == 0) then
		talk = "§óng råi! ThiÕu hiÖp cÇn g×?";
	else
		talk = "§óng råi! N÷ hiÖp cÇn g×?";
	end
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20061223 and nDate <= 20070114) then
		tinsert(msg, 1, "NhËn quµ tÆng: MÆt n¹ /takeMaskFree");
	end;
	
	Say(talk, getn(msg), msg)
end
------------- ²éÑ¯Ôª±¦ --------------------
function show_ingot()
	local nMoney = GetExtPoint(1)
	if (nMoney >= 32768) then
		nMoney = 0
		Msg2Player("§· x·y ra lçi trong ng©n khè cña b¹n, t¹m thêi kh«ng thÓ rót ®­îc TiÒn §ång. Xin vui lßng liªn hÖ víi nhµ ph¸t hµnh ®Ó ®­îc gi¶i quyÕt !")
		return
	end
	if (nMoney <= 0) then
		Say("¤ng chñ tiÒn trang: Kh¸ch quan ch­a hÒ göi kú tr©n b¶o vËt g× ë ®©y",1,"BiÕt råi/no")
		return
	else
		local nCurVar = nMoney *20
		Say("<#> Kh¸ch quan ®· göi t¹i bæn tiÖm tæng céng <color=green>"..nCurVar.."<color> TiÒn §ång.",1,"BiÕt råi/no")
	end
end

------------- È¡Ôª±¦ -----------------------
function get_ingot()

	if (SYSCFG_GAMEBANK_GOLDSILVER_OPEN ~= 1) then
		Talk(1,"","Xin lçi! TiÒn trang hiÖn ®ang s÷a ch÷a! 2 ngµy n÷a kh¸ch quan quay l¹i nhĞ! ")
		return
	end

	local nMoney = GetExtPoint(1)	
	if (nMoney >= 32768) then
		nMoney = 0
		Msg2Player("§· x·y ra lçi trong ng©n khè cña b¹n, t¹m thêi kh«ng thÓ rót ®­îc TiÒn §ång. Xin vui lßng liªn hÖ víi nhµ ph¸t hµnh ®Ó ®­îc gi¶i quyÕt !")
		return
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "Hµnh trang kh«ng ®ñ 5 « trèng.");
			return 1
	end
	if (nMoney <= 0) then					-- Ã»ÓĞÀ©Õ¹µãÊı
		Talk(1,"","Xin lçi! Kh¸ch quan kh«ng cã gëi TiÒn ®ång t¹i bæn trang !")
		return
	else
		local nCurVar = nMoney *20
		Say("<#> Kh¸ch quan ®· göi t¹i bæn trang  tæng céng <color=green>"..nCurVar.."<color> TiÒn §ång. Cã muèn lÊy ra kh«ng?", 2, "Ta muèn lÊy ra 20 TiÒn §ång/get_ingot10", "Kh«ng lÊy/no")
	end
end

function get_ingot10()
	if (SYSCFG_GAMEBANK_SILVER_GET == nil) then -- ³ö´íÁË~~
		print("get_silver have close, but something is wrong...");
		Msg2Player("Chøc n¨ng bŞ lçi!");
		return
	end
	
	if (GetExtPoint(1) < 1) then
		Talk(1,"","§· x·y ra lçi trong ng©n khè cña b¹n, t¹m thêi kh«ng thÓ rót ®­îc TiÒn §ång. Xin vui lßng liªn hÖ víi nhµ ph¸t hµnh ®Ó ®­îc gi¶i quyÕt !")
		return
	end
	Say("Kh¸ch quan x¸c ®Şnh muèn rót  TiÒn §ång chø? (Sau khi x¸c nhËn xin ®õng tho¸t khái trß ch¬i!) ", 2, "X¸c nhËn/get_ingot10ok", "Hñy bá /no");
end

function get_ingot10ok()
	PayExtPoint(1,1)
	Msg2Player("HiÖn ®ang lÊy TiÒn §ång cho quı kh¸ch! Xin l­u ı ®õng tho¸t khái trß ch¬i!")
end;

------------- ¶ÒÏÖÔª±¦ ---------------------
function pay_ingot()

	if (SYSCFG_GAMEBANK_SILVER_PAY ~= 1) then
		Talk(1,"","Xin lçi! TiÒn trang hiÖn ®ang s÷a ch÷a! 2 ngµy n÷a kh¸ch quan quay l¹i nhĞ! ")
		return
	end

	-- Ô½ÄÏµÄÒøÔª±¦ÎïÆ·IDÓë´óÂ½°æ±¾µÄ½ğÔª±¦ÎïÆ·IDÒ»ÖÂ
	local nCurTD = CalcEquiproomItemCount(4,417,1,1)
	if (nCurTD >= 20) then
		Say("¤ng chñ tiÒn trang: Kh«ng thµnh vÊn ®Ò! Kh¸ch quan muèn ®æi <color=green>TiÒn §ång<color> sang h×nh thøc nµo?", 3,"Ta muèn dïng 20 TiÒn §ång ®æi  thµnh 10 ngµy ch¬i/pay_ingot_10a","Ta muèn dïng 20 TiÒn §ång ®æi thµnh 20 giê ch¬i/pay_ticket_10b","Kh«ng ®æi n÷a/no")
	else
		Say("Kh¸ch quan kh«ng mang ®ñ TiÒn §ång ­?",1,"§óng råi! Ta quªn mang theo/no")
	end

end

function pay_ingot_10a()
	if (SYSCFG_GAMEBANK_SILVER_PAY == nil) then -- ³ö´íÁË~~
		print("pay_silver10 have close, but something is wrong...");
		Msg2Player("Chøc n¨ng bŞ lçi!");
		return
	end
	local nCurTD = CalcEquiproomItemCount(4,417,1,1)
	if (nCurTD >= 20) then
		if (ConsumeEquiproomItem(20,4,417,1,1)~= 1) then
			Msg2Player("Trõ tiÒn ®ång thÊt b¹i !")
			WriteLog(date("%Y%m%d %H%M%S").."\t".."§æi 10 ngµy ch¬i"..GetAccount().."\t"..GetName().."\t".."dïng 20 TiÒn §ång ®æi  thµnh 10 ngµy ch¬i thÊt b¹i")
			return
		end
		UseSilver(1,1,1)
		SaveNow(); -- Á¢¼´´æÅÌ
		WriteLog(date("%Y%m%d %H%M%S").."\t".."§æi 10 ngµy ch¬i"..GetAccount().."\t"..GetName().."\t".."dïng 20 TiÒn §ång ®æi  thµnh 10 ngµy ch¬i thµnh c«ng")
		WriteGoldLog( GetAccount().."("..GetName()..") USE a 343 SILVER for 10 DAY CHARGE", 0, -1, 0 );
		Say("¤ng chñ tiÒn trang: <color=green>Sö dông 20 TiÒn §ång<color> ®æi sang <color=red>10 ngµy ch¬i<color> thµnh c«ng. Xin kh¸ch quan kiÓm tra l¹i!", 0)
	end
end

function pay_ticket_10b()
	if (SYSCFG_GAMEBANK_SILVER_PAY == nil) then -- ³ö´íÁË~~
		print("pay_silver10 have close, but something is wrong...");
		Msg2Player("Chøc n¨ng bŞ lçi!");
		return
	end
	local nCurTD = CalcEquiproomItemCount(4,417,1,1)
		if (nCurTD >= 20) then
			if (ConsumeEquiproomItem(20,4,417,1,1)~= 1) then
				Msg2Player("Trõ tiÒn ®ång thÊt b¹i !")
				WriteLog(date("%Y%m%d %H%M%S").."\t".."§æi 20 giê ch¬i"..GetAccount().."\t"..GetName().."\t".."dïng 20 TiÒn §ång ®æi  thµnh 20 giê ch¬i  thÊt b¹i")
				return
			end
			UseSilver(1,0,1)
			SaveNow(); -- Á¢¼´´æÅÌ
			WriteLog(date("%Y%m%d %H%M%S").."\t".."§æi 20 giê ch¬i"..GetAccount().."\t"..GetName().."\t".."dïng 20 TiÒn §ång ®æi  thµnh 20 giê ch¬i thµnh c«ng")
			WriteGoldLog( GetAccount().."("..GetName()..") USE a 343 SILVER for 20 HOURS CHARGE", 0, -1, 0 );
			Say("¤ng chñ tiÒn trang: <color=green>Sö dông 20 TiÒn §ång<color> ®æi sang <color=green>20 giê ch¬i<color> thµnh c«ng. Xin kh¸ch quan kiÓm tra l¹i!", 0)
		end
end

------------- ¶Ò»»Í­Ç®---------------------
function change_ingot_to_coin()	
do return end
	local nSilverCount = GetItemCountEx( 343 );		-- Ôª±¦¸öÊı

	if (SYSCFG_GAMEBANK_SILVER_COIN ~= 1) then
		Talk(1,"","Xin lçi! TiÒn trang hiÖn ®ang s÷a ch÷a! 2 ngµy n÷a kh¸ch quan quay l¹i nhĞ! ")
		return
	end

	if (nSilverCount <= 0) then					-- Ã»ÓĞÔª±¦
		Say( "Kh¸ch quan kh«ng mang Kim Nguyªn B¶o theo ­?", 1, "§óng råi! Ta quªn mang theo/no");
		return
	end
	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "Hµnh trang kh«ng ®ñ 5 « trèng.");
			return 1
	end

	Say( "¤ng chñ tiÒn trang: Kh¸ch quan ®ång ı ®æi tiÒn §ång chø?", 2, "§æi Nguyªn b¶o thµnh"..COIN_CHANGE_COUNT_OF_SILVER.."<#> tiÒn ®ång/change_silver_to_coin", "Kh«ng ®æi n÷a/no");

end

function change_silver_to_coin()
	if (SYSCFG_GAMEBANK_SILVER_COIN == nil) then -- ³ö´íÁË~~
		print("coin_silver have close, but something is wrong...");
		Msg2Player("Chøc n¨ng bŞ lçi!");
		return
	end
	
	if (GetItemCountEx(343) > 0) then		
		DelItemEx( 343 );		
		AddStackItem( COIN_CHANGE_COUNT_OF_SILVER, 4, 417, 1, 1, 0, 0, 0 );
		UseSilver(1, 2, 1); -- ÒøÆ±¶Ò»»ÎªÍ­Ç®µÄÏûºÄÍ³¼Æ
		
		SaveNow(); -- Á¢¼´´æÅÌ
		WriteGoldLog( GetAccount().."("..GetName()..") CHANGE a SILVER into "..COIN_CHANGE_COUNT_OF_SILVER.." COINS", 0, -1, COIN_CHANGE_COUNT_OF_SILVER );
		--local nSilverCount = GetItemCountEx( 343 );		-- Ôª±¦¸öÊı
		--if( nSilverCount > 0 ) then
		--	Say( "Ç®×¯ÀÏ°å£ºÄúµÄÔª±¦ÒÑ³É¹¦¶Ò»»³É"..COIN_CHANGE_COUNT_OF_SILVER.."<#>¸öÍ­Ç®£¬Çë¿ÍÙÄºË²é¡£", 2, "ÖªµÀÁË/no", "ÔÙ¶Ò»»Ò»Ğ©Í­Ç®/change_coin" );
		--else
		Say( "¤ng chñ tiÒn trang: Kh¸ch quan ®æi Nguyªn b¶o ra"..COIN_CHANGE_COUNT_OF_SILVER.."<#> TiÒn ®ång! Xin kh¸ch quan kiÓm tra l¹i!",0);
		--end
	end
end

------------ ¹ØÓÚÍ­Ç® ------------------
function onAboutCoin()
	Talk( 2,"","¤ng chñ tiÒn trang: Cã thÓ mang Nguyªn b¶o ®Õn bæn tiÖm ®Ó ®æithµnh tiÒn §ång, 1 <color=yellow>Nguyªn B¶o<color> ®æi ®­îc <color=yellow>"..COIN_CHANGE_COUNT_OF_SILVER.."<color> tiÒn §ång.Nguyªn b¶o sau khi ®· ®æi ra tiÒn §ång th× kh«ng thÓ ®æi l¹i","TiÒn ®ång cã thÓ ®Õn c¸c thµnh thŞ n¬i Hµng Rong ®Ó mua Kú tr©n dŞ b¶o.","Ên gi÷ chuét tr¸i vµo mét tiÒn ®ång, kĞo chång lªn 1 ®ång tiÒn kh¸c, tèi ®a lµ <color=yellow>100 ®ång<color>. NhÊn gi÷ phİm <color=yellow>Shift<color> vµ nhÊn chuét tr¸i vµo mét ®èng tiÒn, nhËp sè tiÒn muèn t¸ch. NhÊp x¸c ®Şnh ®Ó hoµn thµnh!");
end
----------------------------------------
function no()
end
