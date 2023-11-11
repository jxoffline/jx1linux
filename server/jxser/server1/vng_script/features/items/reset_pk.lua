--Change role name 1 -by thanhld 20150818
IncludeLib("ITEM")
IncludeLib("SETTING")
Include("\\script\\lib\\log.lua")
Include("\\vng_script\\vng_lib\\checkinmap.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

if not tbVngResetPK then
	tbVngResetPK = {}
end

tbVngResetPK.LOG_TITLE = "LOG_FEATURE_CTC"
function main(nItemIdx)	
	if VngPlayerFunLib:VnCheckInCity("default") ~= 1 then
		return 1
	end
	local nCurPK = GetPK()
	if nCurPK <= 0 then
		Talk(1,"","Ng­êi tèt th× kh«ng cÇn dïng vËt phÈm nµy!!!")
		return 1
	end	
	local szMsg = format("<npc>Sö dông vËt phÈm nµy sÏ gi¶m  <color=yellow>%d PK<color> hiÖn cã.",nCurPK)
	local tbOpt = {}	
	tinsert(tbOpt, {format("§ång ý"), tbVngResetPK.ResetPK, {tbVngResetPK, nItemIdx}})	
	tinsert(tbOpt, {"§Ó sau"})
	CreateNewSayEx(szMsg, tbOpt)	
	return 1	
end


function tbVngResetPK:ResetPK(nItemIdx)
	if IsMyItem(nItemIdx) ~=1 then
		return
	end	
	RemoveItemByIndex(nItemIdx)
	SetPK(0)
	Msg2Player("Sö dông §¹i X¸ LÖnh Bµi trÞ sè PK hiÖn thêi: 0")
	tbLog:PlayerActionLog(self.LOG_TITLE,"ResetAllPK" )
end
