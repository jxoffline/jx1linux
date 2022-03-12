--ÖÐÔ­ÄÏÇø µ¾Ïã´å ²èµêÀÏ°å¶Ô»°
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(204) == 1 then
		allbrother_0801_FindNpcTaskDialog(204)
		return 0;
	end

Say("Uèng trµ lµm cho th©n thÓ khoÎ m¹nh, kh¸ch quan muèn uèng 1 ly kh«ng?",0)

end;
