Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\titlefuncs.lua")
Include("\\script\\task\\task_addplayerexp.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\task\\system\\task_string.lua")

MONEY		=	2000000
id_KML		=	{4090,4091,4092,4093,4094,4095,4096}
T_KML 		=	2005
T_DAY_KML	=	2006
T_NHANTHUONG	=	5000
T_NHANTHUONG_HN	=	5001
T_DAY			= 	5002

function main()
	--dofile("script/global/nhmnghia/item/kimmalenh.lua")
	dialog()
	return 1
end

function dialog()
	local img = "<link=image[0,0]:\\spr\\item\\script\\other\\jinmajinnang.spr>Kim M· CÈm Nang<link>"
	local strTitle = ""..img..": "..GetName().." h·y nhanh chãng hoµn thµnh nh÷ng kh¶o nghiÖm trong CÈm Nang ®Ó cã thÓ nhËn ®­îc nh÷ng phÇn th­ëng hÊp dÉn."
	local tbOpt =
	{
		{"NhËn th­ëng hµng ngµy",NhanThuongHN},
		{"Ta ®· thu thËp ®ñ 7 Kim M· LÖnh",KML},
		{"Ta muèn t×m hiÓu ho¹t ®éng",Info},
		{"Tho¸t"},
	}
	CreateNewSayEx(strTitle, tbOpt)
end

function NhanThuongHN()
	local nDate = tonumber(GetLocalDate("%d"))
	if ( GetTask(T_DAY) ~= nDate ) then
		SetTask(T_DAY, nDate);
		SetTask(T_NHANTHUONG_HN,0)
	end
	
	local EMPTY	= 10
	if (CalcFreeItemCellCount() < EMPTY) then
		Msg2Player(""..GetName().." h·y thu dän hµnh trang "..EMPTY.." « trèng!")
		return
	end
	
	if GetTask(T_NHANTHUONG_HN) > 0 then
		Talk(1,"","Mçi ngµy chØ cã thÓ nhËn th­ëng 1 lÇn duy nhÊt.")
	else
		local TAB_BONUS = {
				{szName="<color=yellow>S¸t Thñ Gi¶n", tbProp={6,1,400,90,0,0}, nCount = 1, nExpiredTime = 1440, nBindState = -2},
				{szName="<color=yellow>Viªm §Õ LÖnh", tbProp={6,1,1617}, nCount = 1, nExpiredTime = 1440, nBindState = -2},
				--{szName="<color=yellow>Phong V©n Chiªu Binh LÖnh", tbProp={6,1,30083,1,0,0}, nCount = 1, nExpiredTime = 1440, nBindState = -2},
				{szName="<color=yellow>LÖnh Bµi Phong L¨ng §é", tbProp={4,489}, nCount = 1, nExpiredTime = 1440,},
				{szName="<color=yellow>LÖnh Bµi Vi S¬n §¶o", tbProp={6,1,2432}, nCount = 1, nExpiredTime = 1440,},
				--{szName="<color=yellow>ThuyÒn Rång", tbProp={6,1,423}, nCount = 1, nExpiredTime = 1440, nBindState = -2},
		}
	
		for i = 1,getn(TAB_BONUS) do
			tbAwardTemplet:GiveAwardByList(TAB_BONUS[i], "PhÇn th­ëng");
		end
		SetTask(T_NHANTHUONG_HN,GetTask(T_NHANTHUONG_HN)+100)
	end
end


function CheckKML()
	local nCount = 0
	for i=1,getn(id_KML) do
		local isOK = CalcEquiproomItemCount(6,1,id_KML[i],-1)
		if (isOK > 0) then
			nCount = nCount + 1
		end
	end
	
	if ( nCount == getn(id_KML) ) then
		return 1
	end
	return 0
end

function DelKML()
	for i=1,getn(id_KML) do
		ConsumeEquiproomItem(1,6,1,id_KML[i],-1)
	end
end

function KML()
	local nDate = tonumber(GetLocalDate("%d"))
	local str = GetName()
	if ( GetTask(T_DAY_KML) ~= nDate ) then
		SetTask(T_DAY_KML, nDate);
		SetTask(T_KML,0)
	end
	
	if ( GetTask(T_KML) > 0 ) then
		Say("<color=yellow>Mçi ngµy chØ cã thÓ sö dông 1 lÇn Kim M· LÖnh",0)
		return
	end
	
	local isOK = CheckKML()
	local nMoney = GetCash()
	
	if (isOK == 0) then
		Msg2Player("Hµnh trang cña "..GetName().." kh«ng mang ®ñ <color=yellow>7 Kim M· LÖnh<color> vui lßng kiÓm tra l¹i.")
	elseif (nMoney < MONEY) then
		Msg2Player(""..GetName().." kh«ng mang ®ñ <color=yellow>200 v¹n l­îng<color>.")
	else
		Pay(MONEY)
		DelKML()
		local EXP = 3000000000
		tl_addPlayerExp(EXP)
		SetTask(T_KML,1)
		Msg2SubWorld(" <color=yellow>"..GetName().."<color> thu thËp ®ñ <color=yellow>7 Kim M· LÖnh<color> nhËn ®­îc <color=red>3 tû EXP<color>.ThËt kh«ng thÓ tin ®­îc.")
	end
end

function Info()
	local tb_Info = {
			"Hoµn Thµnh <color=yellow>Th¸ch Thøc Thêi Gian<color> sÏ nhËn ®­îc : <color=yellow>Kim M· LÖnh - 1<color>.",
			"Hoµn Thµnh <color=yellow>V­ît ¶i Viªm §Õ<color> sÏ nhËn ®­îc : <color=yellow>Kim M· LÖnh - 2<color>.",
			"Hoµn Thµnh <color=yellow>Tin Sø<color> sÏ nhËn ®­îc : <color=yellow>Kim M· LÖnh - 3<color>.",
			"CËp bÕn bê B¾c <color=yellow>Phong L¨ng §é<color> sÏ nhËn ®­îc : <color=yellow>Kim M· LÖnh - 4<color>.",
			"Tham gia <color=yellow>Tèng Kim ®¹t 500 ®iÓm trë lªn<color> sÏ nhËn ®­îc : <color=yellow>Kim M· LÖnh - 5<color>.",
			"Hoµn Thµnh <color=yellow>Khai Ph¸ Vi S¬n §¶o<color> sÏ nhËn ®­îc : <color=yellow>Kim M· LÖnh - 6<color>.",
			"Hoµn Thµnh 10 nhiÖm vô <color=yellow>D· TÈu<color> sÏ nhËn ®­îc : <color=yellow>Kim M· LÖnh - 7<color>.",
			"Giao nép <color=yellow>7 Kim M· LÖnh<color> vµ 200 v¹n l­îng sÏ nhËn ®­îc <color=yellow>3 tû EXP<color>.",
		}
	for i=1,getn(tb_Info) do
		Msg2Player(tb_Info[i])
	end
end