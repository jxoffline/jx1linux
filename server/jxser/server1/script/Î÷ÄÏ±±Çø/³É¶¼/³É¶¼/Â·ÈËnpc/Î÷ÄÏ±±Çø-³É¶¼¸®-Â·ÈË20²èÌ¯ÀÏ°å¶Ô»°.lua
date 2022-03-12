--Î÷ÄÏ±±Çø ³É¶¼¸® Â·ÈË20²èÌ¯ÀÏ°å¶Ô»°
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(185) == 1 then
		allbrother_0801_FindNpcTaskDialog(185)
		return 0;
	end
Say("Muèn uèng trµ g×? Mét Êm trµ Mao Tiªm nhÐ?",0)

end;
