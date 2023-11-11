-- ÁÙ°²¡¡Â·ÈË¡¡Ð»´óÒ¯
-- by£ºDan_Deng(2003-09-16)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(192) == 1 then
		allbrother_0801_FindNpcTaskDialog(192)
		return 0;
	end
	Talk(1,"","Con d©u cña ta thËt ngoan. Cßn h¬n c¶ con ruét. H«m qua ta bÞ tróng giã, nã lo l¾ng cho ta mäi thø,b©y giê l¹i ®i mua thuèc råi. ")
end;
