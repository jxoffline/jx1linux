-- Ï´PKµÄÑÃÒÛ.lua
-- By Dan_Deng(2003-11-10)

Include("\\Script\\Global\\TimerHead.lua")
Include("\\Script\\Global\\FuYuan.lua")

function default_talk()
	if (GetFightState() ~= 0) then
		SetFightState(0)
	end
	Say("Quèc cã quèc ph¸p. Gia cã gia quy!  Ng­êi hai tay dÝnh ®Çy m¸u ®i ®Õn ch©n trêi gãc bÓ th× còng kh«ng thÓ tho¸t khái luËt ph¸p! ",3,"Ta ®Õn ®Çu thó /atone","Ta ®Õn th¨m tï /visit","Kh«ng hái n÷a!/no")
	LeaveTeam();
end

function atone()				-- ×ÔÊ×Ï´PK
	local PK_value = GetPK()
	local my_money = GetCash()
	local ExpPer = GetExpPercent()
	local Uworld96 = GetTask(96)
	local Uworld94 = GetTask(94)
	if (Uworld96 > 0) then		-- ÈÝ´í´¦Àí£ºÈç¹ûÔÚÀÎ·¿Íâ·¢ÏÖ´¦ÓÚ×øÀÎ×´Ì¬£¬ÏÈ»¹Ô­ÁËÔÙËµ
		SetTask(96,0)
		StopTimer()
		if (Uworld94 > 0) then	-- Èç¹û»¹ÓÐ±£´æµÄ¼ÆÊ±Æ÷£¬Í¬Ê±»¹Ô­(Èç¹ûÊÇ×øÀÎ¼ÆÊ±Æ÷ÔòÖ±½Ó¹Ø¼ÆÊ±Æ÷)
			if (Uworld94 ~= 9) then
				SetTimer(GetTask(95),GetTask(94));
			end
			SetTask(94,0)
			SetTask(95,0)
		end
	end
	if (PK_value == 0) then			-- ÎÞ×ï
		Talk(2,"","Ta v« t×nh lµm bÞ th­¬ng ng­êi kh¸c nay ®Õn tù thó! ","Bæn phñ ®· ®iÒu tra, ng­¬i chØ lµ phßng vÖ chÝnh ®¸ng mµ th«i! Sau nµy cÈn thËn mét chót!  Ng­¬i ®i ®i! ")
	elseif (Uworld94 > 0) and (Uworld94 ~= 9) then		-- ÒÑ¾­ÓÐ±£´æµÄ¼ÆÊ±Æ÷£¬²»ÔÊÐíÔÙ±£´æ£¨Èç¹ûÒÑ±£´æµÄÊÇ×øÀÎ¼ÆÊ±Æ÷£¬ÈÝ´í´¦Àíµô£©
		Talk(1,"","Ng­¬i mang nhiÒu träng tr¸ch ch­a hoµn thµnh, sao cã thÓ tù ý l·ng phÝ thêi gian, ®em th©n h÷u dông cña m×ng vµo ngôc lao nh­ thÕ sao?")
		Msg2Player("Trªn ng­êi cßn nhiÒu nhiÖm vô quan träng, kh«ng cho phÐp ®Õn tù thó ")
	elseif (ExpPer < -50) then			-- ¸º¾­Ñé³Í·£ÖÐ£¬²»ÔÊÐíÏ´PK
		Talk(1,"","Téi ng­¬i chÊt chång nh­ nói, Ngåi lao còng v« dông!  Ha!  Ha!  §îi bÞ ng­êi ta ®å s¸t ®i! ")
		Msg2Player("Ph¸p luËt quy ®Þnh: Nh©n vËt ®iÓm ©m qu¸ 50%, kh«ng ®­îc tù thó chuéc téi!")
	else
		Say(GetName()..": Tr­íc ®©y ta lì tay s¸t th­¬ng ng­êi kh¸c, nay ®Õn tù thó", 1, "TiÕp tôc ®èi tho¹i /want_atone")
	end
end

function want_atone()
	local PK_value = GetPK();
	local my_money = GetCash();
	Say("Ngay ng­¬i ®· nhuèm m¸u, ph¶i ngåi ®¹i lao ®Ó s¸m hèi téi lçi, tu t©m d­ìng t¸nh. <enter>….<enter>Téi tr¹ng nh­ sau <enter>  Cai ph¹m <color=red> "..GetName().." <color> hiÖn ®iÓm PK lµ <color=red>"..PK_value.."<color>, ®Þnh hèi lé quan sai <color=red>"..my_money.."<color> l­îng. Céng gép 2 téi, nhèt vµo ®¹i lao <color=red>"..PK_value.."<color> ngµy.", 2, "Vµo ®¹i lao /go_atone", "Hay lµ ta ch¹y trèn th«i /no")
end;

function go_atone()

	SetTask(96,100+GetPK())
	i = GetTimerId()
	if (i > 0) and (i ~= 9) then		-- Èç¹ûÉíÉÏÔ­ÓÐ¼ÆÊ±Æ÷²¢ÇÒ²»ÊÇ×øÀÎ¼ÆÊ±Æ÷£¬ÏÈ±£´æ
		SetTask(94,i)
		SetTask(95,GetRestTime(i))
	else
		SetTask(94,0)
		SetTask(95,0)
		StopTimer()
	end
	local my_money = GetCash();
	Pay(my_money);
	Msg2Player("Quan sai tÞch thu toµn bé"..my_money.." ng©n l­îng cña b¹n. B¹n bÞ ®­a vµo ®¹i lao")
	WriteLog(date().."\tName:"..GetName().."\tAccount:"..GetAccount().."\t bÞ tÞch thu hÕt tiÒn trong ng­êi vµ ®­a vµo ®¹i"..my_money.." l­îng")
	FuYuan_Pause();
	SetTimer(12 * CTime * FramePerSec, 9)				-- Ã¿120·ÖÖÓÍ¨¹ý¼ÆÊ±Æ÷¸üÐÂ½µµÍPKÖµ
	DisabledTeam(1);
	NewWorld(208,1785,3062)
end

function visit()			-- Ì½¼à
	Say("Mau ®i chç kh¸c!  Nh×n c¸i g×? Cã ph¶i lµ ®ång bän kh«ng! ",2,"Hèi lé 5000 l­îng b¹c /go_visit","§i ra /no")
end

function go_visit()
	if (GetCash() >= 5000) then
		Talk(1,"","Sao? B¹n ng­¬i trong tï ph¸t bÖnh? NÕu vËy ng­¬i ®i th¨m h¾n còng trän t×nh!  Nhí ®õng lµm g× gian dèi ®Êy")
		Msg2Player("Hèi lé Nha DÞch 5000 l­îng b¹c, vµo ®¹i lao ®Ó th¨m tï nh©n ")
		Pay(5000)
		SetTask(96,1)
		DisabledTeam(1);
		NewWorld(208,1785,3062)
	else
		Talk(1,"","§i ra! Cã ph¶i muèn ta b¾t ng­¬i vµo cïng ®ång ®¶ng míi võa lßng kh«ng?")
	end
end

function no()
end
