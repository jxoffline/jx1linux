Include("\\script\\event\\teacher_day_200711\\head.lua");
Include("\\script\\lib\\compose.lua");
function composeCard_TeacherDay200711 ()
	--{Material, Award, Result_su, Result_er, Result_fa}
	--Material = {nAmount, tbProp, [strName]}
	--Award = {type, detail, amount}
	if ( GetLevel() < 50 ) then
		Say("Xin lçi!  Ph¶i <color=yellow>trªn cÊp 50<color> míi cã thÓ hîp thµnh S¸ch gia truyÒn!",0)
		return 0;
	end
	local tbMaterial = 
	{
		{1, {6,1,1599,nil,nil,nil}, "T«n"},
		{1, {6,1,1600,nil,nil,nil}, "“S­”"},
		{1, {6,1,1601,nil,nil,nil}, "Träng"},
		{1, {6,1,1602,nil,nil,nil}, "§¹o"},
		{15, {6,0,20,nil,nil,nil}, "Mai Kh«i Hoa Vò "},
	}
	local tbAward = {1,{6,1,1603,1,0,0},1}
	local tb_compose ={tbMaterial, tbAward, "GhÐp ch÷ thµnh c«ng","Nguyªn liÖu kh«ng ®óng","GhÐp ch÷ thÊt b¹i"}
	material_compose(tb_compose, "Ho¹t ®éng ghÐp ch÷")
end