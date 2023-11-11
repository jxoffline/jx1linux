Include("\\script\\misc\\eventsys\\type\\player.lua")
IncludeLib("SETTING")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\login_head.lua")

if not tbVngMsgTVL2Player then
	tbVngMsgTVL2Player = {}
end
tbVngMsgTVL2Player.nStartDate = 201512180000
tbVngMsgTVL2Player.nEndDate = 201512202400
function tbVngMsgTVL2Player:OnLogin()
	--print("========tbVngMsgTVL2Player:OnLogin")
	if self:IsActive() ~= 1 then
		print("return het han")
		return
	end
	local szMsg = format("<color=green>Tr¶i nghiÖm nh÷ng tÝnh n¨ng hÊp dÉn vµ chinh phôc thö th¸ch kh¾c nghiÖt lu«n lµ niÒm kh¸t khao cña c¸c Anh Hïng.<color><color=yellow>Chi tiÕt t¹i: tvl.360game.vn<color>")
	
	Talk(1,"Talk2",szMsg)
	
--	Msg2Player(szMsg)
--	Msg2Player(szMsg1)	
	--print("========tbVngMsgTVL2Player:OnLogin Thong Bao")
end
function Talk2()
	local szMsg1 = format("<color=green>§¹i héi Vang Danh Thiªn H¹ chÝnh thøc diÔn ra tõ:<color> <color=yellow>14h00 ngµy 20/12/2015 t¹i nhµ v¨n hãa Thanh Niªn (TP HCM) <color><color=green>cïng nhiÒu tÆng phÈm vµ Code cùc VIP. H·y nhí mét cuéc hÑn, kh«ng gÆp kh«ng vÒ.<color>")
	Talk(1,"",szMsg1)
end
function tbVngMsgTVL2Player:IsActive()
	local nCurDate = nCurDate or tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nCurDate >= self.nStartDate  and nCurDate <= self.nEndDate  then
		return 1
	end	
	return 0
end
EventSys:GetType("OnLogin"):Reg(0, tbVngMsgTVL2Player.OnLogin, tbVngMsgTVL2Player)
