-- Ð¡ºì°ü¹¦ÄÜ		ºì°üÊ¹ÓÃ
-- By Spe(2004-01-01)

NUM20E = 2000000000;

function main(nItemIdx)
	if GetLevel() == 200 then
		Msg2Player("§¹i hiÖp cÊp 200 kh«ng thÓ sö dông«Bµn Nh­îc T©m Kinh».")
		return 1
	end
	local ng, _, np = GetItemProp(nItemIdx);
	
	local exp=GetExp();
	
	if (exp < 0) then
		exp = exp*-1;
		if (ng == 6 and np == 12) then
			if (exp >= NUM20E) then
				exp = NUM20E;
			end
		elseif (ng == 6 and np == 2392) then
			exp = floor (exp / 2);
--		elseif (ng == 6 and np == 2393) then		-- ´ó°ãÈôÐÄ¾­ ¸ø 100%¾­Ñé
		end
		
		sutra_addexp(exp)
		Msg2Player("Sau khi nghiªn cøu kü B¸t Nh­îc T©m Kinh, b¹n c¶m thÊy toµn th©n khoan kho¸i, kinh nghiÖm thùc chiÕn håi phôc kh«ng Ýt. ")
		return 0
	end 
	
	Msg2Player("B¹n nghiªn cøu B¸t Nh­îc T©m Kinh ®­îc nöa ngµy, nh­ng vÉn ch­a lÜnh ngé ®­îc g×. ")
	return 1;
end


function sutra_addexp(n_exp)
	local n_count = 100;
	while (n_exp > 0) do
		if (n_exp >= 20e8) then
			AddOwnExp(20e8);
			n_exp = n_exp - 20e8;
		else
			AddOwnExp(n_exp);
			n_exp = 0;
			break
		end
	end
end
