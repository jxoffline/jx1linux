-- ÁúÈª´å¡¡Â·ÈË¡¡ËÕºìĞä
-- by£ºDan_Deng(2003-09-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(203) == 1 then
		allbrother_0801_FindNpcTaskDialog(203)
		return 0;
	end
	Talk(1,"","Ta lóc nhá th©n thÓ gÇy yÕucha ta mêi vâ s­ vÒ d¹y vâ cho ta. B©y giß ta ®· häc thµnh vâ c«ng, kh«ng cßn sî bŞ ai khinh rÎ n÷a")
end;
