IncludeLib("TONG")
Include("\\script\\tong\\tong_header.lua")

function main()
	local _, nTongID = GetTongName();
	if (nTongID == 0) then
		Msg2Player("§©y h×nh nh­ lµ ng­êi r¬m (ch­a gia nhËp bang kh«ng thÓ tham gia ho¹t ®éng Phong Háa Anh Hïng LÖnh)");
	else
		if (TONG_GetTaskValue(nTongID, TONGTSK_HEROLING) < 120) then
			Msg2Player("Phong Háa Anh Hïng LÖnh cña bang héi tÝch lòy kh«ng ®ñ 120 c¸i, kh«ng thÓ kiÓm tra ng­êi r¬m.");
		else
			Msg2Player("KiÓm tra xong ng­êi r¬m, cÇn kho¶ng 5 phót");
		end;
	end;
end;