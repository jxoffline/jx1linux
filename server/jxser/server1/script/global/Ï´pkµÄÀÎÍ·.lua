-- ´óÀÎÀÎÍ·.lua¡¡£¨Ï´µãÈÎÎñ£©
-- By Dan_Deng(2003-11-12)

Include("\\script\\global\\timerhead.lua")
Include("\\Script\\Global\\FuYuan.lua")
Include("\\script\\nationalwar\\head.lua")

function main(sel)
	local Uworld96 = GetTask(96)
	local PK_value = GetPK();
	if (Uworld96 == 1) then			-- Ì½¼àµÄ
		Say("Th¨m xong ch­a vËy? Mau ®i ®i! ",2,"C¶m ¬n vŞ ®¹i ca nµy, ta ®i ®©y /visit_leave","Xin ®¹i ca th­ th¶ cho chót ®·! Ta sÏ ®i ngay th«i /no")
--	elseif (Uworld96 == 0) then		-- ³ö´íÁË
--		Talk(1,"","ÀÎÍ·£ºÎ¹£¡ÄãÊÇÔõÃ´»ì½øÌìÀÎÖØµØÀ´µÄ£¿ÓĞÊ²Ã´»°È¥ÕÒGM½âÊÍ°É£¡")
	elseif (PK_value <= 0) then		-- Ï´ÇåÁËPKµÄ
		Talk(2,"PKclear","Mau thu xÕp hµnh lı ®i!  Ng­¬i cã thÓ ra khái ®©y råi! ","§a t¹ ®ai ca, vËy ta ®i ®©y! ")
	else									-- Ï´PKµÄ
		-- Ìì×ÓÏµÍ³£º´óÉâÌìÏÂ
		local absolve_time = NW_GetTask(NW_TASKNO_ABSOLVE)
		local current_time = GetCurServerTime()
		if (absolve_time ~= 0 and current_time < absolve_time + SECONDS_ONEHOUR) then
			Say("Thiªn tö nh©n tõ, ®¹i x¸ thiªn h¹. Ng­¬i sau nµy ®õng ph¹m téi n÷a nha.",
				2,
				"Trë vÒ nhµ/nw_absolve",
				"Ta muèn ë l¹i tï/Cancel")
		else
			local n_timerid = GetTimerId();
			if (n_timerid ~= 9) then
				SetTask(96,100 + PK_value);
				SetTimer(12 * CTime * FramePerSec, 9)
				return
			end
			Say("§¹i ngôc thiªn lao, kh«ng ®­îc tïy ı ®i l¹i! ",3,"Hái thêi gian /ask_timer","Nép tiÒn ®Ó t¹i ngo¹i/pay_money","D¹! D¹! NÕu vËy ta sÏ trë vµo trong ®ã /no")
		end
	end
end

-- Ìì×ÓÏµÍ³£º´óÉâÌìÏÂ
function nw_absolve()
	SetPK(0)
	leave_prison()
end

function ask_timer()
	if (GetCash() >= 1000) then		-- ÓĞ500Á½Òø×Ó²ÅÈÃÎÊ
		Pay(1000)
		Talk(2,"","VŞ ®¹i ca nµy. §©y lµ 1000 l­îng b¹c xin cÇm ®Ó uèng trµ. Ta chØ lµ muèn hái thö b©y giê lµ mÊy giê th«i. ","Lao §Çu: Téi ®å nghiÖt sóc, ®õng kiÕm chuyÖn n÷a "..GetRestCTime(9).."Mau ®i v« trong ®ã ®i ")
	else
		Talk(2,"","VŞ ®¹i ca nµy! Ta chØ muèn hái b©y giê lµ mÊy giê th«i! ","Hái g× mµ hái! Muèn ¨n ®ßn h¶! Cßn kh«ng mau quay vÒ chç ngåi! ")
	end
end

function pay_money()
	PK_PayMoney = GetPK() * GetPK() * 10000
	Talk(1,"pay_money2","Lao ®Çu ®¹i ca, ë ®©y "..PK_PayMoney.."Cã chót ng©n l­îng, xem nh­ İt lßng thµnh. ChØ lµ v× ta ë trong nµy ®· sinh träng bÖnh kh«ng thÓ kh¸ng cù ®­îc n÷a. Xin ®¹i ca h·y khai ©n cho ra ngoµi t×m ®¹i phu. ")
end

function pay_money2()
	Say("Xem ng­¬i r¸ch r­íi vËy,sao l¹i cã nhiÒu tiÒn vËy thÕ! ",2,"§Æt tiÒn vµo tay h¾n /pay_yes","TiÕp tôc thØnh cÇu /pay_no")
end

function pay_yes()
	PK_PayMoney = GetPK() * GetPK() * 10000
	if (GetCash() >= PK_PayMoney) then
		Pay(PK_PayMoney)
		Msg2Player("Lao §Çu cho phĞp ®i t×m ®¹i phu. B¹n cã thÓ rêi khái ®¹i lao råi. ")
		Talk(1,"leave_prison","LuËt ph¸p v« t×nh, nh©n h÷u t×nh!  BÖnh ng­¬i nÆng nh­ vËy nªn ®i t×m thÇy thuèc ch÷a!  Nhí r»ng ng­¬i chØ ra ngoµi ch÷a bÖnh th«i, th©n phËn tï téi ch­a röa s¹ch ®õng t¸i ph¹m n÷a! ")
	else
		pay_no()
	end
end

function pay_no()
	Talk(1,"","Quû ®ãi!  Cót ngay!  Kh«ng ta quÊt cho 1 roi b©y giê! ")
end

function PKclear()
	Msg2Player("Sau mét håi xem xĞt th× ng­¬i bŞ ®uæi ra khái nhµ lao ")
	leave_prison()
end

function leave_prison()
	StopTimer()
	if (GetTask(94) == 9) then		-- ÉíÉÏ´íÎóµØ±£´æÁË×øÀÎ¼ÆÊ±Æ÷£¬²»×öÆäËü´¦ÀíÖ±½ÓÇåµô
		SetTask(94,0)
		SetTask(95,0)
	elseif (GetTask(94) > 0) then		-- »Ö¸´ÉíÉÏÔ­ÓĞµÄ¼ÆÊ±Æ÷
		Msg2Player("Trªn m×nh ng­¬i vÉn cßn mang nhiÖm vô! H·y lËp tøc ®i lµm nhiÖm vô ®i ")
		SetTimer(GetTask(95),GetTask(94))
		SetTask(94,0)
		SetTask(95,0)
	end
	FuYuan_Resume();
	leave2()
end

function visit_leave()
	leave2()
end

function leave2()
	SetTask(96,0)
	leave_pos = GetTask(93)
	DisabledTeam(0);
	if (leave_pos == 1) then		-- ÁÙ°²
		NewWorld(176,1473,3245)
	else								-- ãê¾©
		NewWorld(37,1781,3044)
	end
--	NewWorld(57,1592,3195)		-- ÈÓµ½ºâÉ½´óÌü
end

function no()
end
