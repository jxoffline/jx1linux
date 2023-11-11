--Á½ºşÇø ÄÏÔÀÕò Â·ÈË2ÌïÌ«ÆÅ¶Ô»°
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
if allbrother_0801_CheckIsDialog(201) == 1 then
		allbrother_0801_FindNpcTaskDialog(201)
		return 0;
	end
	if ( GetTask(1256) == 1 ) then
		 SetTaskTemp(111,GetTaskTemp(111)+1)

		 if ( GetTaskTemp(111) > 3 ) then
		 	Talk(1,"","Nghe nãi cã mét vŞ s­ th¸i kh«ng biÕt tõ miÕu nµo ®Õn, ph¸p lùc v« biªn ng­¬i ®i hái thö xem sao.")
		 	SetTask(1256, 2);
		 else
			 Talk(1,"","Khôkhô……khôkhô…, ch¾c ta kh«ng ®­îc råi, kh«ng biÕt bŞ sao n÷a s¸ng thøc dËy c¶m thÊy ®Çu nhøc d÷ déi. Khôkhô, kh«ng biÕt bÖnh nµy l©y kh«ng n÷a, ng­êi mau rêi khái ®i!")	 
		 end
		 return
	elseif ( GetTask(1256) == 2 ) then
		Talk(1,"","Nghe nãi cã mét vŞ s­ th¸i kh«ng biÕt tõ miÕu nµo ®Õn, ph¸p lùc v« biªn ng­¬i ®i hái thö xem sao.")
		return
	end

Say("Con ta cßn sèng còng lín gièng nh­ ng­¬i, råi chØ ®¸ng tiÕc lóc nã 15 tuæi ®· bŞ bÖnh chÕt ®Ó mét m×nh l·o sèng c« ®éc thÕ nµy",0)

end;

