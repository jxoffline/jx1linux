function main()
	local szTitle = "Xin chµo <color=red>"..GetName().."<color> ! BÊt kÓ ng­¬i thuéc ngò hµnh nµo, ng­¬i cã muèn gia nhËp <color=fire>Vò Hån<color> kh«ng?"
	local tbOpt=
	{
	"VÒ ph¸i/go_vuhon",
	"Vµo Vò Hån vµ häc ®Õn skill 150/join_vuhon",
	"KÕt thóc ®èi tho¹i./no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end

function go_vuhon()
	Msg2Player("Ngåi yªn, chóng ta ®Õn <color=yellow>Vò hån ®­êng")
	NewWorld(1042, 1625, 3130)
end

function join_vuhon()
	local FactionNumber = GetLastFactionNumber()
	if FactionNumber >= 0 then
		Talk(1, "", "Ng­¬i ®· gia nhËp m«n ph¸i.")
		return
	end
	local szTitle = "<color=red>"..GetName().."<color> ng­¬i cã ch¾c ch¾n muèn gia nhËp ph¸i <color=fire>Vò Hån<color> bän ta kh«ng?"
	local tbOpt ={
			"X¸c nhËn!/join_vuhon_sure",
			"Kh«ng./no",
		}
	Say(szTitle, getn(tbOpt), tbOpt)
end

-----------------------------------------------------------------------------------------------------------
function join_vuhon_sure()
	SetSeries(3);
	SetFaction("wuhun");
	SetCamp(1);
	SetCurCamp(1);
	SetRank(97);
	SetLastFactionNumber(11);
	AddMagic(1963,0)
	AddMagic(1964,0)
	AddMagic(1965,0)
	AddMagic(1971,0)
	AddMagic(1972,0)
	AddMagic(1974,0)
	AddMagic(1975,0)
	AddMagic(1976,0)
	AddMagic(1977,0)
	AddMagic(1979,0)
	AddMagic(1980,0)
	AddMagic(1981,0)
	AddMagic(1982,0)
	AddMagic(1967,20)--
	AddMagic(1969,20)--
	AddMagic(1983,20)--
	AddMagic(1984,20)--
	AddMagic(1985,20)--
	--AddMagic(1986,20)--180
	Talk(1, "KickOutSelf", "Ng­¬i ®· gia nhËp thµnh c«ng ph¸i <color=fire>Vò Hån")
end