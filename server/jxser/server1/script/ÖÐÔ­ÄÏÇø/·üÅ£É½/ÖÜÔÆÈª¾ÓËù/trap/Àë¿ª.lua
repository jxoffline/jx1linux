-- ÖÜÔÆÈª¾ÓËù ´«ËÍµã Àë¿ª.lua
-- By: Dan_Deng(2004-04-08)
-- »Øµ½·üÅ£É½Î÷£¨ÌìĞÄ¶´Èë¿Ú£©

function main()
	if (GetSex() == 0) then
		Talk(1,"","B¹n mau chãng ®i xuèng nói, phİa sau vÉn vang lªn tiÕng chöi m¾ng cña L«i QuyÕt: 'TiÓu tö thèi! §õng cã ch¹y'! ")
	else
		Talk(1,"","B¹n mau chãng ®i xuèng nói, phİa sau vÉn vang lªn tiÕng chöi m¾ng cña L«i QuyÕt: 'TiÓu tö thèi! §õng cã ch¹y'! ")
	end
	i = random(0,99)
	if (i < 33) then
		NewWorld(41, 1951, 2989)
	elseif (i < 67) then
		NewWorld(41, 1685, 3268)
	else
		NewWorld(41, 1788, 3085)
	end
end
