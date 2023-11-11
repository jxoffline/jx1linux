Include("\\script\\global\\login_head.lua")
Include("\\script\\global\\head_qianzhuang.lua")
TV_LAST_APPLY_TIME = 1571 -- ÉÏ´ÎÉêÇë´«¹¦Ê±¼ä
TBMONTH = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
strimg = "<link=image[0,1]:\\spr\\npcres\\enemy\\enemy111\\enemy111_pst.spr><link>"

function chuangong_login()
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		local nowday = tonumber(date("%y%m%d"))
		local applytime = GetTask(TV_LAST_APPLY_TIME)
		if (nowday >= applytime ) then
			Describe(strimg.."HiÖn ng­¬i <color=yellow>®· chuÈn bŞ xong truyÒn c«ng<color>, cã thÓ ®Õn chç ta truyÒn c«ng bÊt kú lóc nµo!", 2, "Ta biÕt råi!/cg_OnCancel", "Ta kh«ng muèn truyÒn c«ng!/cg_undo");
		else
			Describe(strimg.."B¹n hiÖn ®· <color=yellow>chuÈn bŞ hoµn tÊt"..(num2datestr(applytime)).." <color>, ®· cã thÓ lËp tøc truyÒn c«ng!", 2, "§a t¹ Minh chñ thøc tØnh! V·n bèi c¸o biÖt!/cg_OnCancel", "Ta kh«ng muèn truyÒn c«ng!/cg_undo");
		end
	end
end

function chuangong_msg()
	print("msgmsg")
	if (GetTask(TV_LAST_APPLY_TIME) > 0) then
		local nowday = tonumber(date("%y%m%d"))
		local applytime = GetTask(TV_LAST_APPLY_TIME)
		if (nowday >= applytime ) then
			Msg2Player("HiÖn t¹i <color=yellow>b¹n ®· ®¨ng kı thµnh c«ng truyÒn c«ng<color=>, cã thÓ ®Õn chç §éc C« KiÕm ®Ó truyÒn thô. TruyÒn c«ng cÇn 2 Ng©n phiÕu, xin h·y chuÈn bŞ!")
		else
			Msg2Player("HiÖn t¹i <color=yellow>b¹n ®· ®¨ng kı thµnh c«ng truyÒn c«ng, thêi gian truyÒn c«ng t¹i"..(num2datestr(applytime)).."<color>. TruyÒn c«ng cÇn 2 Ng©n phiÕu, xin h·y chuÈn bŞ!")
		end
	end
end

function num2datestr(nday)
	local year = floor(nday / 10000) + 2000
	local month = mod( floor(nday / 100) , 100)
	local day = mod(nday, 100)
	return year.."n¨m"..month.."nguyÖt "..day.."nhËt "
end

function cg_undo()
	local nowday = GetTask(TV_LAST_APPLY_TIME)
	if (nowday > 0) then
		Describe(strimg.."Ta ®Õn"..num2datestr(nowday).."lµ cã thÓ truyÒn c«ng cho ng­¬i, cã thËt ng­¬i kh«ng muèn truyÒn c«ng kh«ng?",2,"Kh«ng! Ta kh«ng muèn truyÒn c«ng!/cg_undo_sure", "V©ng! Ta muèn truyÒn c«ng./cg_OnCancel")
	else
		Describe(strimg.."Ng­¬i ch­a xin phĞp truyÒn c«ng, cÇn g× hñy bá!",1,"KÕt thóc ®èi tho¹i/cg_OnCancel")
	end
end

function cg_undo_sure()
	SetTask(TV_LAST_APPLY_TIME, 0)
	Describe(strimg.."§­îc! Nguyªn liÖu nµy ta t¹m gi÷ l¹i, nÕu lÇn sau muèn truyÒn c«ng th× ®Õn ®©y!",1,"C¶m ¬n Minh chñ!/cg_OnCancel")
end

function cg_OnCancel()
		
end

if (GetProductRegion() ~= "vn") then
	login_add(chuangong_msg, 2)
end
