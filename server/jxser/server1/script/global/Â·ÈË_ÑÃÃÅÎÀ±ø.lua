if (not __GOVERM_SOLDIER_H__) then
    __GOVERM_SOLDIER_H__ = 1;
Include("\\script\\missions\\springfestival\\dialog.lua");

function gsoldier_entance()
	local aryszContent = {	"T×m hiÓu th«ng tin kh¸c/main_former",
							"D¹o nµy ta bËn qu¸, t×m ng­êi kh¸c ®i!/OnCancel"};
							
	if (sf06_isactive() == 1) then
		tinsert(aryszContent, 1, "Ho¹t ®éng ngµy Xu©n/sf06_mainentrance");
	end;
	
	if (getn(aryszContent) > 2) then
		Say("<color=yellow>VÖ binh nha m«n<color>: Quèc gia ®ang chiªu mé ng­êi tµi, xem ra ng­¬i còng lµ mét ng­êi häc vâ, cã muèn gióp ®ì hay kh«ng?", getn(aryszContent), aryszContent);
	else
		main_former();
	end;
	
end;

function OnCancel()
	
end;
end; --// end of __GOVERM_SOLDIER_H__