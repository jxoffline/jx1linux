--ÖÖ×Ó¡¢±ù¾§¡¢Ê¥µ®Ê÷
--renbin



seed_name	={
		"May m¾n",
		"Hoa Hång",
		"Thñy Tinh",
		"Hoµng Kim"
		}

crystal_name	={
		"phiÕn",
		"Phæ th«ng",
		"Hoa",
		"Hoµn mü "
		}

seed_sow	={0,0,0,0,0,0}



function main()

	Say("Gi¸ng Sinh vui vÎ! Ta tõ ph­¬ng B¾c xa x«i ®Õn ®©y mang theo nhiÒu lÔ vËt rÊt ®Æc biÖt. ChØ cÇn Ng­¬i kiªn tr× nu«i d­ìng ®Ó c©y lín kháe m¹nh. Toµn bé lÔ vËt ta ®Òu treo trªn c¸c c©y ®ã! H·y mau ®i thu thËp <color=red>B¨ng Tinh<color> vµ <color=red> h¹t Gi¸ng Sinh<color> ®i, nÕu kh«ng sÏ kh«ng kŞp thêi gian!",4,"Ta muèn tinh luyÖn B¨ng tinh/upg_crystal","Ta muèn ­¬m h¹t Gi¸ng Sinh/sow_seed","Hay qu¸! Xin h·y nãi chi tiÕt cho ta biÕt ®i!/christ_help","Ha! Ha! Ta chØ ®Õn ®Ó xem 'dung nhan' cña «ng th«i!/no")

end


function christ_help()

	Say("ChØ cÇn b¹n trÎ thu thËp ®­îc nh÷ng<color=red> phiÕn B¨ng Tinh<color> vµ <color=red>H¹t Gi¸ng Sinh<color> mang ®Õn ®©y, l·o cã thÓ gióp b¹n <color=red>tinh luyÖn B¨ng tinh<color> vµ <color=red>­¬m h¹t Gi¸ng Sinh<color>.",3,"Liªn quan 'Thu thËp vµ tinh luyÖn B¨ng tinh'/bingjing","Liªn quan ' H¹t vµ c¸ch ­¬m'/zhongzi","Ta hiÓu råi! C¶m ¬n «ng nhiÒu!/no")

end

function bingjing()
	Say("B¨ng tinh gåm cã 4 lo¹i: <color=red> phiÕn B¨ng Tinh<color>, <color=red> B¨ng tinh phæ th«ng <color>, <color=red>Hoa B¨ng tinh<color> vµ <color=red> Hoµn mü B¨ng tinh<color>. Ng­¬i chØ cÇn thu thËp ®­îc <color=red>To¸i phiÕn B¨ng Tinh<color>, l·o sÏ gióp tinh luyÖn thµnh 3 lo¹i cßn l¹i",2,"Thu thËp B¨ng tinh/bjcj","Tinh luyÖn B¨ng tinh/bjtl")

end


function bjcj()

	Talk(2,""," <color=red>PhiÕn B¨ng tinh<color> gåm:\n <color=red>§á<color>: Ph­îng T­êng, VÜnh L¹c trÊn, Nh¹n §·ng s¬n\n  <color=red>Vµng<color> Thµnh §«, Giang T©n th«n, B¹ch Thñy ®éng\n <color=red>Tİm<color>: T­¬ng D­¬ng, Ba L¨ng huyÖn, Vò L¨ng s¬n","<color=red>Tr¾ng<color>: D­¬ng Ch©u, §¹o H­¬ng th«n, La Tiªu s¬n\n <color=red>Lôc<color>: BiÖn Kinh, Chu Tiªn trÊn, KiÕm C¸c T©y Nam\n <color=red>Lam<color>: §¹i Lı, Th¹ch Cæ trÊn, Phôc L­u ®éng.")
	
end

function bjtl()

	Talk(3,"","Thø tù tinh luyÖn B¨ng tinh nh­ sau: tõ <color=red> phiÕn B¨ng tinh<color> -> <color=red> Phæ Th«ng B¨ng tinh<color> -> <color=red> Hoa b¨ng tinh<color> -> <color=red>Hoµn Mü b¨ng tinh<color>","B¹n trÎ cÇn ph¶i thu thËp <color=red> mét bé 6 viªn ®ång ®¼ng cÊp (Hång, Hoµng, Lam, Tö, Lôc, B¹ch)<color>,l·o sÏ gióp tinh luyÖn thµnh mét viªn ®¼ng cÊp cao h¬n","§¼ng cÊp B¨ng tinh cµng cao th× ­¬m h¹t sÏ cµng hiÖu nghiÖm. Sau khi trång thµnh c«ng sÏ nhËn ®­îc nhiÒu b¶o vËt ngoµi sù mong ®îi!")
	
end

function zhongzi()

	Say("C¸c h¹t gåm cã 5 lo¹i: <color=red>h¹t Gi¸ng sinh<color>, <color=red>h¹t Gi¸ng Sinh may m¾n<color>, <color=red>h¹t Hoa Hång Gi¸ng Sinh<color>, <color=red>h¹t Thñy Tinh Gi¸ng Sinh<color> vµ <color=red>h¹t Hoµng Kim Gi¸ng Sinh<color>. B¹n trÎ luyÖn c«ng chØ cã thÓ thu thËp ®­îc <color=red>h¹t Gi¸ng Sinh<color>, c¸c h¹t kh¸c ph¶i do l·o gióp ®ì ­¬m mÇm",2,"Thu thËp c¸c lo¹i h¹t/zzcj","¦¬m c¸c lo¹i h¹t/zzjg")

end

function zzjg()

	Talk(3,"","Bèn lo¹i <color=red>B¨ng tinh<color> khi t­íi lªn <color=red>H¹t Gi¸ng Sinh<color> sÏ trång nªn 4 lo¹i c©y Gi¸ng Sinh","C¸ch ­¬m h¹t: \n\n <color=red>6 PhiÕn B¨ng tinh tïy ı<color>?<color=red>H¹t gi¸ng sinh<color>?<color=red>H¹t May m¾n<color>\n <color=red>6 Phæ B¨ng Tinh tïy ı<color>?<color=red>H¹t gi¸ng sinh<color>?<color=red> H¹t Hoa hång","\n\n <color=red>6 Hoa B¨ng Tinh tïy ı<color>?<color=red>H¹t gi¸ng sinh<color>?<color=red>H¹t Thñy tinh<color>\n <color=red>6 Hoµn Mü B¨ng Tinh tïy ı<color>?<color=red>H¹t gi¸ng sinh<color>?<color=red>H¹t Hoµng Kim<color>.")

end

function zzcj()

	Talk(1,"","N¬i thu thËp <color=red>H¹t Gi¸ng Sinh<color>: L©m An phñ, Nam Nh¹c trÊn, Long TuyÒn th«n, ThËp ®¹i m«n ph¸i, Hoa S¬n, §µo Hoa nguyªn")
	
end


-----------------------ÌáÁ¶±ù¾§-----------------------

function upg_crystal()

	Say("B¹n trÎ muèn tinh luyÖn B¨ng tinh ph¶i kh«ng? L·o sÏ gióp! Nh­ng nÕu lì thÊt b¹i, b¹n sÏ chØ nhËn l¹i ®­îc <color=red>1 viªn<color> mµ th«i! §ång ı chø?",2,"Tinh luyÖn Phæ Th«ng B¨ng tinh (2000 l­îng) /crystal_medi","§Ó ta suy nghÜ kü l¹i xem/no")

end

function crystal_medi()

	local on_pay = 2000
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,468,1,1)>=1) and CalcEquiproomItemCount(4,469,1,1)>=1 and CalcEquiproomItemCount(4,470,1,1)>=1 and CalcEquiproomItemCount(4,471,1,1)>=1 and CalcEquiproomItemCount(4,472,1,1)>=1 and CalcEquiproomItemCount(4,473,1,1)>=1) then
			ConsumeEquiproomItem(1,4,468,1,1)
			ConsumeEquiproomItem(1,4,469,1,1)
			ConsumeEquiproomItem(1,4,470,1,1)
			ConsumeEquiproomItem(1,4,471,1,1)
			ConsumeEquiproomItem(1,4,472,1,1)
			ConsumeEquiproomItem(1,4,473,1,1)
			i_medi = random(1,12000)
			if ( i_medi < 1000 ) then
				AddEventItem(474)
				Msg2Player("B¹n nhËn ®­îc 1 'Hång Phæ Th«ng b¨ng tinh'")
				Pay(on_pay)
			elseif ( i_medi < 2000 ) then
				AddEventItem(475)
				Msg2Player("B¹n nhËn ®­îc 1 'Hoµng Phæ Th«ng b¨ng tinh'")
				Pay(on_pay)
			elseif ( i_medi < 3000 ) then
				AddEventItem(476)
				Msg2Player("B¹n nhËn ®­îc 1 'Lam Phæ Th«ng b¨ng tinh'")
				Pay(on_pay)
			elseif ( i_medi < 4000 ) then
				AddEventItem(477)
				Msg2Player("B¹n nhËn ®­îc 1 'Tö Phæ Th«ng b¨ng tinh'")
				Pay(on_pay)
			elseif ( i_medi < 5000 ) then
				AddEventItem(478)
				Msg2Player("B¹n nhËn ®­îc 1 'Lôc Phæ Th«ng b¨ng tinh'")
				Pay(on_pay)
			elseif ( i_medi < 6000 ) then
				AddEventItem(479)
				Msg2Player("B¹n nhËn ®­îc 1 'B¹ch Phæ Th«ng b¨ng tinh'")
				Pay(on_pay)
			else
				Msg2Player("Xin lçi! ThÊt b¹i råi!B¹n trÎ ®õng n¶n chİ! LÇn sau nhÊt ®Şnh sÏ thµnh c«ng!!")
				Pay ( on_pay )
				i_back=random(1,7000)
				if (i_back < 2000) then
					AddEventItem(468)
				elseif (i_back < 3000) then
					AddEventItem(469)
				elseif (i_back < 4000) then
					AddEventItem(470)
				elseif (i_back < 5000) then
					AddEventItem(471)
				elseif (i_back < 6000) then
					AddEventItem(472)
				else
					AddEventItem(473)
				end
			end
			check_again(468)	--Is there enough crystals
		
		else
			Talk(1,"","Xin lçi! KiÓm tra kü l¹i xem! CÇn 1 bé PhiÕn B¨ng tinh 6 mµu.")
		end
	else
		Talk(1,"","Xin lçi! TiÒn kh«ng ®ñ! Mau trë vÒ lÊy ®i!.")
	end

end


function crystal_high()

	local on_pay = 10000
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,474,1,1)>=1) and CalcEquiproomItemCount(4,475,1,1)>=1 and CalcEquiproomItemCount(4,476,1,1)>=1 and CalcEquiproomItemCount(4,477,1,1)>=1 and CalcEquiproomItemCount(4,478,1,1)>=1 and CalcEquiproomItemCount(4,479,1,1)>=1) then
			ConsumeEquiproomItem(1,4,474,1,1)
			ConsumeEquiproomItem(1,4,475,1,1)
			ConsumeEquiproomItem(1,4,476,1,1)
			ConsumeEquiproomItem(1,4,477,1,1)
			ConsumeEquiproomItem(1,4,478,1,1)
			ConsumeEquiproomItem(1,4,479,1,1)
			i_high = random(1,18000)
			if ( i_high < 1000 ) then
				AddEventItem(480)
				Msg2Player("B¹n nhËn ®­îc 1 'Hång Hoa B¨ng tinh'")
				Pay(on_pay)
			elseif ( i_high < 2000 ) then
				AddEventItem(481)
				Msg2Player("B¹n nhËn ®­îc 1 'Hoµng Hoa B¨ng tinh'")
				Pay(on_pay)
			elseif ( i_high < 3000 ) then
				AddEventItem(482)
				Msg2Player("B¹n nhËn ®­îc 1 'Lam Hoa B¨ng tinh'")
				Pay(on_pay)
			elseif ( i_high < 4000 ) then
				AddEventItem(483)
				Msg2Player("B¹n nhËn ®­îc 1 'Tö Hoa B¨ng tinh'")
				Pay(on_pay)
			elseif ( i_high < 5000 ) then
				AddEventItem(484)
				Msg2Player("B¹n nhËn ®­îc 1 'Lôc Hoa B¨ng tinh'")
				Pay(on_pay)
			elseif ( i_high < 6000 ) then
				AddEventItem(485)
				Msg2Player("B¹n nhËn ®­îc 1 'B¹ch Hoa B¨ng tinh'")
				Pay(on_pay)
			else
				Msg2Player("Xin lçi! ThÊt b¹i råi!B¹n trÎ ®õng n¶n chİ! LÇn sau nhÊt ®Şnh sÏ thµnh c«ng!!")
				Pay ( on_pay )
				i_back=random(1,7000)
				if (i_back < 2000) then
					AddEventItem(474)
				elseif (i_back < 3000) then
					AddEventItem(475)
				elseif (i_back < 4000) then
					AddEventItem(476)
				elseif (i_back < 5000) then
					AddEventItem(477)
				elseif (i_back < 6000) then
					AddEventItem(478)
				else
					AddEventItem(479)
				end
			end
			check_again(474)	--Is there enough crystals
		
		else
			Talk(1,"","Xin lçi! KiÓm tra kü l¹i xem! CÇn 1 bé Phæ B¨ng Tinh 6 mµu.")
		end
	else
		Talk(1,"","Xin lçi! TiÒn kh«ng ®ñ! Mau trë vÒ lÊy ®i!.")
	end

end
	


function crystal_perfect()

	local on_pay = 100000
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,480,1,1)>=1) and CalcEquiproomItemCount(4,481,1,1)>=1 and CalcEquiproomItemCount(4,482,1,1)>=1 and CalcEquiproomItemCount(4,483,1,1)>=1 and CalcEquiproomItemCount(4,484,1,1)>=1 and CalcEquiproomItemCount(4,485,1,1)>=1) then
			Pay ( on_pay )
			ConsumeEquiproomItem(1,4,480,1,1)
			ConsumeEquiproomItem(1,4,481,1,1)
			ConsumeEquiproomItem(1,4,482,1,1)
			ConsumeEquiproomItem(1,4,483,1,1)
			ConsumeEquiproomItem(1,4,484,1,1)
			ConsumeEquiproomItem(1,4,485,1,1)
			i_perfect = random(1,30000)
			if ( i_perfect < 6000 ) then
				AddEventItem(486)
				WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName()..", ®­îc 1 Hoµn Mü B¨ng Tinh.")
				Msg2Player("Chóc mõng! B¹n nhËn ®­îc 1 viªn Hoµn Mü b¨ng tinh! H·y t­íi lªn h¹t Gi¸ng Sinh ®Ó nhËn ®­îc h¹t Hoµng Kim!")
			else
				Msg2Player("Xin lçi! ThÊt b¹i råi! B¹n trÎ ®õng n¶n chİ! LÇn sau nhÊt ®Şnh sÏ thµnh c«ng!")
				i_back=random(1,7000)
				if (i_back < 2000) then
					AddEventItem(480)
				elseif (i_back < 3000) then
					AddEventItem(481)
				elseif (i_back < 4000) then
					AddEventItem(482)
				elseif (i_back < 5000) then
					AddEventItem(483)
				elseif (i_back < 6000) then
					AddEventItem(484)
				else
					AddEventItem(485)
				end
			end
			check_again(480)	--Is there enough crystals
			
		else
			Talk(1,"","Xin lçi! KiÓm tra kü l¹i xem! CÇn 1 bé Hoa B¨ng Tinh 6 mµu.")
		end
	else
		Talk(1,"","Xin lçi! TiÒn kh«ng ®ñ! Mau trë vÒ lÊy ®i!.")
	end

end

function check_again(i_item)

	local on_pay = 2000
	if ( i_item == 474 )	then
		on_pay = 10000
	elseif ( i_item == 480 )	then
		on_pay = 100000
	end
	if ( GetCash() >= on_pay ) then
		if ((CalcEquiproomItemCount(4,i_item,1,1)>=1) and CalcEquiproomItemCount(4,i_item + 1,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 2,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 3,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 4,1,1)>=1 and CalcEquiproomItemCount(4,i_item + 5,1,1)>=1)	then
			if ( i_item == 468 )	then
				Say("B¹n trÎ cã muèn tiÕp tôc tinh luyÖn Phæ Th«ng B¨ng tinh kh«ng?",2,"§­îc!/crystal_medi","Kh«ng cÇn!/no")
			elseif ( i_item == 474 )	then
				Say("B¹n trÎ cã muèn tiÕp tôc tinh luyÖn Hoa B¨ng tinh kh«ng?",2,"§­îc!/crystal_high","Kh«ng cÇn!/no")
			else
				Say("B¹n trÎ cã muèn tiÕp tôc tinh luyÖn Hoµn Mü B¨ng tinh kh«ng?",2,"§­îc!/crystal_perfect","Kh«ng cÇn!/no")
			end
		end
	end
end




-----------------------ÌáÁ¶±ù¾§½áÊø-----------------------


------------------------½½¹àÖÖ×Ó-------------------------

function sow_seed()

	Say("Ng­¬i muèn ­¬m h¹t nµo? ChØ cÇn cã ®ñ tiÒn vµ nguyªn liÖu, l·o sÏ gióp hÕt m×nh",3,"¦¬m h¹t Gi¸ng Sinh May m¾n (3000 l­îng) /do_sow_seed","¦¬m h¹t Hoa Hång Gi¸ng Sinh (1 v¹n l­îng) /do_sow_seed","§Ó ta suy nghÜ l¹i!/no")

end

function do_sow_gold()

	local on_pay = 1000000
	if ( GetCash() >= on_pay ) then
		if ( CalcEquiproomItemCount(4,486,1,1)>=6 and CalcEquiproomItemCount(4,487,1,1)>=1 ) then
			ConsumeEquiproomItem(6,4,486,1,1)
			ConsumeEquiproomItem(1,4,487,1,1)
			Pay( on_pay )
			i_goldseed = random(1,18000)
			if ( i_goldseed < 20000 ) then		--100%rate
				AddItem(6,1,145,1,0,0,0)
				Talk(1,"","Chóc mõng b¹n ­¬m h¹t thµnh c«ng! Mau cïng víi b»ng h÷u nu«i d­ìng h¹t quı nµy! SÏ nhËn ®­îc nhiÒu quµ tÆng Gi¸ng sinh!")
				Msg2Player("B¹n nhËn ®­îc 1 h¹t"..seed_name[4].."H¹t ")
				WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName()..", nhËn ®­îc 1 h¹t Hoµng Kim gi¸ng sinh")
				AddGlobalNews(GetName().."NhËn ®­îc *H¹t Hoµng Kim*, chóng ta cïng chóc b¹n Êy sím trång thµnh c«ng c©y 'Hoµng Kim Gi¸ng Sinh' ®Ó nhËn ®­îc trang bŞ Hoµng Kim!")
			else
				Talk(1,"","ThÊt b¹i råi! §õng n¶n chİ nhĞ!")
			end
		else
			Talk(1,"","Xin lçi! KiÓm tra kü l¹i xem! CÇn 6 viªn Hoµn Mü B¨ng Tinh vµ 1 h¹t gi¸ng sinh míi cã thÓ ­¬m")
		end
	else
		Talk(1,"","Xin lçi! TiÒn kh«ng mang ®ñ! H·y vÒ lÊy thªm nhĞ!")
	end
			

end


function do_sow_seed(nsel)

	nsel1 = nsel
	nsel = nsel * 6
	local on_pay = 2000
	if ( nsel1 == 0 ) then
		on_pay = 3000
	elseif ( nsel1 == 1 ) then
		on_pay = 10000
	else
		on_pay = 100000
	end
	seed_sow[1] = CalcEquiproomItemCount(4,nsel + 468,1,1)
	seed_sow[2] = CalcEquiproomItemCount(4,nsel + 469,1,1)
	seed_sow[3] = CalcEquiproomItemCount(4,nsel + 470,1,1)
	seed_sow[4] = CalcEquiproomItemCount(4,nsel + 471,1,1)
	seed_sow[5] = CalcEquiproomItemCount(4,nsel + 472,1,1)
	seed_sow[6] = CalcEquiproomItemCount(4,nsel + 473,1,1)
	nTotal = seed_sow[1] + seed_sow[2] + seed_sow[3] + seed_sow[4] + seed_sow[5] + seed_sow[6]
	if ( GetCash() >= on_pay ) then
		if ( nTotal >= 6 and CalcEquiproomItemCount(4,487,1,1)>=1 ) then
			Pay ( on_pay )
			nTimes = 6
			for s = 1, 6 do
				if ( seed_sow[s] >= nTimes ) then
						ConsumeEquiproomItem(nTimes,4,nsel + 467 + s,1,1)
					break
				else
					nTimes = nTimes - seed_sow[s]
						ConsumeEquiproomItem(seed_sow[s],4,nsel + 467 + s,1,1)
				end
			end
			ConsumeEquiproomItem(1,4,487,1,1)
			AddItem(6,1,nsel1 + 142,1,0,0,0)
			Talk(1,"","Chóc mõng b¹n ­¬m h¹t thµnh c«ng! Mau cïng víi b»ng h÷u nu«i d­ìng h¹t quı nµy! SÏ nhËn ®­îc nhiÒu quµ tÆng Gi¸ng sinh!")
			Msg2Player("B¹n nhËn ®­îc 1 h¹t"..seed_name[nsel1 + 1].."H¹t ")
		else
			Talk(1,"","Xin lçi! KiÓm tra l¹i kü xem! CÇn 6 viªn "..crystal_name[nsel1 + 1].."B¨ng tinh vµ 1 h¹t Gi¸ng Sinh míi cã thÓ ­¬m")
		end
	else
		Talk(1,"","Xin lçi! TiÒn kh«ng ®ñ! H·y vÒ lÊy thªm ®i!")
	end

end





------------------------½½¹àÖÖ×Ó½áÊø-------------------------


function no()

	Talk(1,"","C¶m ¬n ng­¬i cßn nhí ®Õn ta! Chóc gi¸ng sinh vui vÎ!")

end