Include("\\script\\activitysys\\playerfunlib.lua")
function PlayerFunLib:VnCheckInCity (strFail)
	local strMessage
	if not strFail or strFail == "default" then
		strMessage = "Thao t¸c nµy kh«ng thÓ thùc hiÖn t¹i ®©y! Xin h·y vÒ c¸c thµnh thŞ vµ th«n trÊn råi thö l¹i."
	else
	 strMessage = strFail
	end
	if GetFightState() ~= 0 then
		lib:ShowMessage(strMessage)
		return nil
	end
	return self:CheckInMap("53,20,99,100,101,121,153,174,11,78,1,162,37,80,176", strMessage)
end