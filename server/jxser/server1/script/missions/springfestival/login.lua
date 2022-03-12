Include([[\script\missions\springfestival\head.lua]]);


function springfestival06_login()
	if (sf06_isactive() ~= 0) then
		Msg2Player("Nh÷ng ngµy gÇn ®©y, quan phñ ®· tæ chøc ho¹t ®éng <color=yellow>§uæi ¤ng Ba M­¬i<color>. Trong thêi gian <color=yellow>19:00 ®Õn 23:00<color> c¸c nh©n sü cã thÓ ®Õn Nha m«n c¸c thµnh thÞ ®Ó b¸o danh tham gia ho¹t ®éng.")
	end
end

if login_add then login_add(springfestival06_login, 2) end

