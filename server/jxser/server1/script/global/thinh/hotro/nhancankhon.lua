Include("\\script\\dailogsys\\dailogsay.lua");

tbCANKHON = {
		[1] = {szName = "Kh¸ng Háa - Thêi Gian Tróng §éc", id = 6578},
		[2] = {szName = "Kh¸ng B¨ng - Thêi Gian Tróng §éc", id = 6579},
		[3] = {szName = "Kh¸ng L«i - Thêi Gian Tróng §éc", id = 6580},
		[4] = {szName = "Kh¸ng §éc - Thêi Gian Tróng §éc", id = 6581},
		[5] = {szName = "PTVL - Thêi Gian Tróng §éc", id = 6582},
		[6] = {szName = "Kh¸ng Háa - Thêi Gian Lµm Cho¸ng", id = 6583},
		[7] = {szName = "Kh¸ng B¨ng - Thêi Gian Lµm Cho¸ng", id = 6584},
		[8] = {szName = "Kh¸ng L«i - Thêi Gian Lµm Cho¸ng", id = 6585},
		[9] = {szName = "Kh¸ng §éc - Thêi Gian Lµm Cho¸ng", id = 6586},
		[10] = {szName = "PTVL - Thêi Gian Lµm Cho¸ng", id = 6587},
		[11] = {szName = "Kh¸ng Háa - Thêi Gian Lµm ChËm", id = 6588},
		[12] = {szName = "Kh¸ng B¨ng - Thêi Gian Lµm ChËm", id = 6589},
		[13] ={szName = "Kh¸ng L«i - Thêi Gian Lµm ChËm", id = 6590},
		[14] ={szName = "Kh¸ng §éc - Thêi Gian Lµm ChËm", id = 6591},
		[15] = {szName = "PTVL - Thêi Gian Lµm ChËm", id = 6592},
		}
--------------------------------------------------------------------------------
function NhanCanKhon()
	local szTitle = "B¹n muèn nhËn trang bÞ nµo?"
	local tbOption = {
		"NhÉn gi¶m thêi gian tróng ®éc/#Cankhon(0)",
		"NhÉn gi¶m thêi gian lµm cho¸ng/#Cankhon(1)",
		"NhÉn gi¶m thêi gian lµm chËm/#Cankhon(2)",
		"Trë l¹i/main",
		"Tho¸t./no",
	}
	Say(szTitle, getn(tbOption), tbOption)	
end

function Cankhon(index)
	local szTitle = "B¹n muèn nhËn trang bÞ nµo?"
	local tbOption = {}
	for i = index*5+1, index*5+5 do 
		tinsert(tbOption, format("NhÉn %s/#AddGoldItem(0, %d)",  tbCANKHON[i].szName, tbCANKHON[i].id))
	end
	tinsert(tbOption, "Trë l¹i./NhanCanKhon")
	tinsert(tbOption, "KÕt thóc ®èi tho¹i./no")
	Say(szTitle, getn(tbOption), tbOption)	
end