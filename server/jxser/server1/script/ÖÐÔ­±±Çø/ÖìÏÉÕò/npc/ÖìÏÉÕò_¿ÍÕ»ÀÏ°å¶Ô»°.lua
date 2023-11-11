--ÖĞÔ­±±Çø ÖìÏÉÕò ¿ÍÕ»ÀÏ°å¶Ô»°
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(202) == 1 then
		allbrother_0801_FindNpcTaskDialog(202)
		return 0;
	end
Say("Kh¸ch quan muèn nghØ ng¬i kh«ng?",0)

end;
