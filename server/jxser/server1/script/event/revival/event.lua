Include ("\\script\\event\\eventhead.lua")
TSK_REVIVAL_AWARD = 2306
TSK_REVIVAL_Nmsg = 2307
function onRevival_Player()
	local tbOpp = {"<#> T×m hiÓu ho¹t ®éng giang hå /OnHelp_Revival", "<#> Ta chØ ®Õn ch¬i th«i/OnCancel"}
	if (GetTask(TSK_REVIVAL_AWARD) > 0) then
		tinsert(tbOpp, 1, "<#> NhËn quµ ho¹t ®éng giang hå /revival_want2takegift")
	end
	Say("<#> §éc C« minh chñ muèn tri ©n c¸c hiÖp kh¸ch giang hå, ®· chuÈn bŞ nhiÒu tÆng phÈm nhê ta ®i tÆng. Néi dung chi tiÕt cã thÓ xem trªn trang chñ <color=yellow>www.volam.com.vn<color>.", getn(tbOpp), tbOpp)
end

function revival_want2takegift()
	if (GetTask(TSK_REVIVAL_AWARD) == 1) then
		Say("<#> §éc C« minh chñ muèn tÆng ng­¬i <color=yellow>t¨ng ®«i ®iÓm kinh nghiÖm trong 48 giê<color>, nhËn b©y giê chø?",2, "§óng, Ta muèn lÊy./revival_sure2takegift", "Ch­a nhËn! SÏ quay l¹i sau!/OnCancel")
	elseif (GetTask(TSK_REVIVAL_AWARD) == 2) then
		Say("<#> §éc C« minh chñ ®· chuÈn bŞ cho ng­¬i <color=yellow>mét thÇn bİ hång bao, 200 v¹n kinh nghiÖm, nh©n ®«i ®iÓm kinh nghiÖm trong 48 giê<color>, nhËn b©y giê chø?",2, "§óng, Ta muèn lÊy./revival_sure2takegift", "Ch­a nhËn! SÏ quay l¹i sau!/OnCancel")
	elseif (GetTask(TSK_REVIVAL_AWARD) == 3) then
		Say("<#> §éc C« minh chñ ®· chuÈn bŞ cho ng­¬i <color=yellow>mét m¶nh trang bŞ Hoµng Kim, 500 v¹n kinh nghiÖm, nh©n ®«i ®iÓm kinh nghiÖm trong 48<color>, nhËn b©y giê chø?",2, "§óng, Ta muèn lÊy./revival_sure2takegift", "Ch­a nhËn! SÏ quay l¹i sau!/OnCancel")
	else
		print("task error!! revival_player event")
	end
end

function revival_sure2takegift()
	if (GetTask(TSK_REVIVAL_AWARD) == 1) then
		SetTask(TSK_REVIVAL_AWARD, 0)
		AddSkillState(440, 1, 1, 48 * 60 * 60 * 18)
	elseif (GetTask(TSK_REVIVAL_AWARD) == 2) then
		SetTask(TSK_REVIVAL_AWARD, 0)
		AddSkillState(440, 1, 1, 48 * 60 * 60 * 18)
		AddItem(6,1,402,1,0,0,0)	--ÉñÃØ´óºì°ü
		AddOwnExp(2000000)
	elseif (GetTask(TSK_REVIVAL_AWARD) == 3) then
		SetTask(TSK_REVIVAL_AWARD, 0)
		AddSkillState(440, 1, 1, 48 * 60 * 60 * 18)
		AddEventItem(random(540, 942))	--»Æ½ğËéÆ¬
		AddOwnExp(5000000)
	end
	Say("<#> Quµ cña ng­¬i h·y cÊt kü, xin tiÕp tôc t×m hiÓu c¸c ho¹t ®éng kh¸c trªn trang chñ!", 0)
end

function OnHelp_Revival()
	revival_onhelp_1()
end
function revival_onhelp_1()
	Say("<#> §¼ng cÊp ng­êi ch¬i d­íi cÊp 80, mét tuÇn kh«ng lªn m¹ng, sau khi lªn m¹ng ®Õn Vâ l©m minh chñ nhËn quµ t¨ng ®«i ®iÓm kinh nghiÖm trong 48 giê.", 2, "Trang kÕ /revival_onhelp_2", "HiÓu råi/OnCancel")
end
function revival_onhelp_2()
	Say("<#> §¼ng cÊp ng­êi ch¬i tõ 80~120, mét th¸ng kh«ng lªn m¹ng, sau khi lªn m¹ng cã thÓ ®Õn Vâ l©m minh chñ nhËn mét thÇn bİ hång bao, 200 v¹n kinh nghiÖm, nh©n ®«i kinh nghiÖm trong 48 giê.", 2,"Trang kÕ /revival_onhelp_3", "HiÓu råi/OnCancel")
end
function revival_onhelp_3()
	Say("<#> §¼ng cÊp ng­êi ch¬i trªn 120 cÊp, trong mét th¸ng kh«ng lªn m¹ng, sau khi lªn m¹ng cã thÓ ®Õn Vâ l©m minh chñ nhËn quµ tÆng ngÉu nhiªn mét m¶nh trang bŞ Hoµng Kim, 500 v¹n kinh nghiÖm, nh©n ®«i ®iÓm kinh nghiÖm trong 48 giê.",1, "HiÓu råi/OnCancel")
end

function revival_login()
	local nday = tonumber(date("%d"))
	local pre_login_day = GetByte(GetTask(1075), 2)
	if (nday ~= pre_login_day) then
		SetTask(TSK_REVIVAL_Nmsg, 0)
	end
	if (GetTask(TSK_REVIVAL_Nmsg) > 3) then
		return
	end
	SetTask(TSK_REVIVAL_Nmsg, GetTask(TSK_REVIVAL_Nmsg) + 1)
	
	if (GetTask(TSK_REVIVAL_AWARD) == 1) then
		Msg2Player("§éc C« minh chñ muèn tri ©n c¸c hiÖp kh¸ch giang hå, tÆng <color=yellow>t¨ng ®«i ®iÓm kinh nghiÖm trong 8 giê<color>. Xin nhanh chãng t¹i<color=yellow>LÔ Quan<color> ®Ó nhËn!")
	elseif (GetTask(TSK_REVIVAL_AWARD) == 2) then
		Msg2Player("§éc C« minh chñ muèn tri ©n c¸c hiÖp kh¸ch giang hå, tÆng <color=yellow>mét thÇn bİ hång bao, 200 v¹n kinh nghiÖm, nh©n ®«i kinh nghiÖm trong 48 giê<color>. Xinh nhanh chãng ®Õn <color=yellow>LÔ Quan<color> ®Ó nhËn!")
	elseif (GetTask(TSK_REVIVAL_AWARD) == 3) then
		Msg2Player("§éc C« minh chñ muèn tri ©n c¸c hiÖp kh¸ch giang hå, tÆng <color=yellow>mét m¶nh trang bŞ Hoµng Kim, 500 v¹n kinh nghiÖm, t¨ng ®«i ®iÓm kinh nghiÖm trong 48 giê<color>. Xin nhanh chãng t¹i<color=yellow>LÔ Quan<color> ®Ó nhËn!")
	end
end

function revival_player(key)
	if REVIVAL_PLAYER then
		if (key >= 7 and GetLevel() < 80) then
			SetTask(TSK_REVIVAL_AWARD, 1)
		elseif (key >= 30 and GetLevel() >= 80 and GetLevel() <= 120) then
			SetTask(TSK_REVIVAL_AWARD, 2)
		elseif (key >= 30 and GetLevel() > 120) then
			SetTask(TSK_REVIVAL_AWARD, 3)
		end
	else
		SetTask(TSK_REVIVAL_AWARD, 0)
	end
end
function OnCancel()
end

if REVIVAL_PLAYER then
	if login_add then login_add(revival_login, 2) end
end
