-------------------------------------------------------------------------
-- FileName		:	rename_func.lua
-- Author		:	lailigao
-- CreateTime	:	2006-07-02 16:38:37
-- Desc			:	ÔÚÏß¸ÄÃû¹¦ÄÜ
-- Include("\\script\\misc\\rename\\rename_func.lua")
---------------------------------------------------------------------------

Include("\\script\\global\\rename_head.lua")
Include("\\script\\vng_event\\item\\rename_func.lua")

-- ÖØÃûÍæ¼Ò¸ü¸Ä½ÇÉ«Ãû¶Ô»°
function func_online_rename_role(strInfo, strError)
	if (check_renamerole() == 1) then
		Say(strInfo,
			3,
			"<#> T×m hiÓu tªn nh©n vËt cßn sö dông ®­îc kh«ng/query_rolename",
			"<#> Thay ®æi tªn nh©n vËt cña m×nh/change_rolename",
			"<#> §Ó lÇn sau ta thay ®æi vËy/cancel");
	else
		deny(strError)
	end
end

-- ²éÑ¯½ÇÉ«Ãû
function query_rolename()
	AskClientForString("on_query_rolename", "", 1, 20, "<#> Xin nhËp tªn nh©n vËt cÇn t×m hiÓu");
end

function on_query_rolename(new_name)
	QueryRoleName(new_name);
end

-- ÖØÃûÍæ¼Ò¸ü¸Ä½ÇÉ«Ãû
function change_rolename()
	Say("<#> C¸c b­íc cô thÓ: Rêi Bang Héi nÕu cã, ®èi tho¹i víi NPC, nhËp tªn nh©n vËt cÇn thay ®æi vµo, b¹n sÏ tù ®éng rêi m¹ng. Sau 3 phót ®¨ng nhËp l¹i, nÕu tªn nh©n vËt ®· thay ®æi th× ®­îc xem ®æi tªn thµnh c«ng; nÕu ch­a thay ®æi, mêi b¹n thùc hiÖn l¹i c¸c b­íc trªn. NÕu xuÊt hiÖn mét sè hiÖn t­îng l¹ xin liªn hÖ GM gi¶i quyÕt.",
		2,
		"<#> B¾t ®Çu thay ®æi tªn nh©n vËt/change_rolename2",
		"<#> §Ó ta suy nghÜ l¹i/cancel")
end

function change_rolename2()
	local _, nTongId = GetTongName()
	if (nTongId ~= 0) then
		Msg2Player(" <color=green>§¹i hiÖp ®· cã Bang Héi kh«ng thÓ tiÕn hµnh thao t¸c nµy!<color>")
		return
	end
	AskClientForString("on_change_rolename", "", 1, 20, "<#> Xin nhËp tªn nh©n vËt míi vµo");
end

function on_change_rolename(new_name)
	if (check_renamerole() == 1) then
		if (GetName() == new_name) then
			Talk(1, "", "<#> B¹n muèn ®æi tªn g×?")
		else
			--Giíi h¹n sö dông item Tİnh Danh Chi LÖnh - modified by DinhHQ - 20130701
			SetTask(TSK_RENAME_FUNC_LIMIT, GetCurServerTime())
			RenameRole(new_name);
		end
	end
end

-- ÖØÃû°ï»á¸ü¸Ä°ï»áÃû
function online_rename_tong(strInfo, strError)
	if (check_renametong() == 1) then
		Say(strInfo,
			3,
			"<#> KiÓm tra tªn Bang héi cßn sö dông ®­îc kh«ng?/query_tongname",
			"<#> Söa ®æi tªn Bang héi cña m×nh/change_tongname",
			"<#> §Ó lÇn sau ta thay ®æi vËy/cancel")
	else
		deny(strError)
	end
end

-- ²éÑ¯°ï»áÃû
function query_tongname()
	AskClientForString("on_query_tongname", "", 1, 20, "<#> Xin nhËp tªn Bang héi muèn t×m hiÓu");
end

function on_query_tongname(new_tong)
	if (check_renametong() == 1) then
		QueryTongName(new_tong)
	end
end

-- ¸ü¸Ä°ï»áÃû
function change_tongname()
	Say("<#> C¸c b­íc cô thÓ: §èi tho¹i víi NPC, nhËp tªn bang héi cÇn thay ®æi vµo, b¹n sÏ tù ®éng rêi m¹ng. Sau 3 phót ®¨ng nhËp l¹i, nÕu tªn bang héi ®· thay ®æi th× ®­îc xem ®æi tªn thµnh c«ng; nÕu ch­a thay ®æi, mêi b¹n thùc hiÖn l¹i c¸c b­íc trªn. NÕu xuÊt hiÖn mét sè hiÖn t­îng l¹ xin liªn hÖ GM gi¶i quyÕt.", 
		2,
		"<#> B¾t ®Çu thay ®æi tªn Bang héi/change_tongname2",
		"<#> §Ó ta suy nghÜ l¹i/cancel");
end

function change_tongname2()
	AskClientForString("on_change_tongname", "", 1, 20, "<#> Xin nhËp tªn Bang héi míi vµo");
end

function on_change_tongname(new_tong)
	if (GetTongMaster() ~= GetName()) then
		Talk(1, "", "<#> ChØ cã bang chñ míi cã thÓ thay ®æi tªn Bang héi")
	elseif (check_renametong() == 1) then
		old_tong, res = GetTong()
		if (res == 1 and old_tong ~= "") then
			if (old_tong == new_tong) then
				Say("<#> Kh«ng thÓ thay ®æi tªn Bang héi gièng nhau", 1, "<#> BiÕt råi!/cancel")
			else
				RenameTong(old_tong, new_tong)
			end
		end
	end
end

function deny(strError)
	Say(strError,
		1,
		"<#> BiÕt råi!/cancel")
end
