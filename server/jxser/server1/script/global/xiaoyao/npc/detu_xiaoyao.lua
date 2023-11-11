function main()
	local szTitle = "Xin chµo <color=red>"..GetName().."<color> ! BÊt kÓ ng­¬i thuéc ngò hµnh nµo, ng­¬i cã muèn gia nhËp <color=fire>Tiªu Dao<color> kh«ng?"
	local tbOpt=
	{
		"VÒ ph¸i/go_tieudao",
		"Vµo ph¸i Tiªu Dao vµ lµm nhiÖm vô ph¸i/TieuDaoPhai",
		"Vµo ph¸i Tiªu Dao vµ häc ®Õn skill 150/join_tieudao",
		"KÕt thóc ®èi tho¹i./no",
	}
	Say(szTitle, getn(tbOpt), tbOpt)
end

function go_tieudao()
	Msg2Player("Ngåi yªn, chóng ta ®Õn <color=yellow>Tiªu dao ph¸i")
	NewWorld(1046, 1641, 3288)
end


function TieuDaoPhai()
	local FactionNumber = GetLastFactionNumber()
	if FactionNumber >= 0 then
		Talk(1, "", "Ng­¬i ®· gia nhËp m«n ph¸i.")
		return
	end
	if GetLevel()<10 then
		Talk(1, "", "H·y tù luyÖn tËp thªm ®Õn cÊp 10 råi quay l¹i ®©y.")
		return
	end
	SetSeries(3);
	SetFaction("xiaoyao");
	SetCamp(3);
	SetCurCamp(4);
	SetRank(98);
	SetLastFactionNumber(12);
	AddMagic(1881,0)-- level 10
	AddMagic(1905,0)-- level 10
	SetTask(12,10*256);
	---AddItem(0,0,7,1,0,0) AddItem(0,0,8,1,0,0)
	Talk(1, "KickOutSelf", "Ng­¬i ®· gia nhËp thµnh c«ng ph¸i <color=fire>Tiªu Dao")
	Msg2Player("Chóc Mõng Ng­êi §· Gia NhËp Ph¸i Tiªu Dao §­îc Trë Thµnh Tiªn §¶o C­ SÜ")
end

function join_tieudao()
	local FactionNumber = GetLastFactionNumber()
	if FactionNumber >= 0 then
		Talk(1, "", "Ng­¬i ®· gia nhËp m«n ph¸i.")
		return
	end
	local szTitle = "<color=red>"..GetName().."<color> ng­¬i cã ch¾c ch¾n muèn gia nhËp ph¸i <color=fire>Tiªu Dao<color> bän ta kh«ng?"
	local tbOpt ={
			"X¸c nhËn!/join_tieudao_sure",
			"Kh«ng./no",
		}
	Say(szTitle, getn(tbOpt), tbOpt)
end

-----------------------------------------------------------------------------------------------------------
function join_tieudao_sure()
	SetFaction("xiaoyao");
	SetCamp(3);
	SetCurCamp(4);
	SetRank(98);
	SetSeries(4);
	SetLastFactionNumber(12);
	AddMagic(1881,20)-- level 10
	AddMagic(1905,20)-- level 10

	AddMagic(1882,20)-- level 20
	AddMagic(1906,20)-- level 20

	AddMagic(1883,20)-- level 30

	AddMagic(1885,20)-- level 40
	AddMagic(1907,20)-- level 40

	AddMagic(1887,20)-- level 50
	AddMagic(1909,20)-- level 50

	AddMagic(1888,20)-- level 60

	AddMagic(1890,20)-- level 70
	AddMagic(1889,20)-- level 70

	AddMagic(1891,20)---- level 90
	AddMagic(1910,20)---- level 90

	AddMagic(1894,20)---- level 120

	AddMagic(1896,20)---- level 150
	AddMagic(1911,20)---- level 150

	AddMagic(1901,20)---- level 180
	Talk(1, "KickOutSelf", "Ng­¬i ®· gia nhËp thµnh c«ng ph¸i <color=fire>Tiªu Dao")
end