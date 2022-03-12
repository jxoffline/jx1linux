EVENT_LOG_TITLE = "LOGEVENT_CTC_Thang9_TrungThu"

DATE_END = 20150925

ITEM_LD_ONG								= {szName="Lång ®Ìn èng", tbProp={6,1,30309,1,0,0},nExpiredTime=DATE_END}
ITEM_LD_TRON								= {szName="Lång ®Ìn trßn", tbProp={6,1,30310,1,0,0},nExpiredTime=DATE_END}
ITEM_LD_NGOISAO							= {szName="Lång ®Ìn ng«i sao", tbProp={6,1,30311,1,0,0},nExpiredTime=DATE_END}
ITEM_LD_CACHEP							= {szName="Lång ®Ìn c¸ chÐp", tbProp={6,1,30312,1,0,0},nExpiredTime=DATE_END}
ITEM_LD_BUOM_BUOM					= {szName="Lång ®Ìn b­¬m b­ím", tbProp={6,1,30307,1,0,0},nExpiredTime=DATE_END}
ITEM_LD_KEOQUAN						= {szName="Lång ®Ìn kÐo qu©n", tbProp={6,1,30308,1,0,0},nExpiredTime=DATE_END}

ITEM_HOP_LD_KEOQUAN			= {szName="Hép lång ®Ìn kÐo qu©n", tbProp={6,1,30314,1,0,0},nExpiredTime=DATE_END}
ITEM_HOP_LD_BUOMBUOM			= {szName="Hép lång ®Ìn b­¬m b­ím", tbProp={6,1,30303,1,0,0},nExpiredTime=DATE_END}
ITEM_BANH_TT_MINHNGUYET		= {szName="B¸nh Trung Thu Minh NguyÖt", tbProp={6,1,30304,1,0,0},nExpiredTime=DATE_END}
ITEM_BANH_TT_VIENNGUYET		= {szName="B¸nh Trung Thu Viªn NguyÖt", tbProp={6,1,30305,1,0,0},nExpiredTime=DATE_END}
ITEM_BANH_TT_HOANGNGUYET	= {szName="B¸nh Trung Thu Hoµng NguyÖt", tbProp={6,1,30306,1,0,0},nExpiredTime=DATE_END}

MAP_HOASON = 2

MONEY = {szName="Ng©n l­îng",nJxb=1}

MONEY_1Van = 10000 --1 Van luong

--Moc su dung
MOC_500   = 500
MOC_1000 = 1000
MOC_2000 = 2000

--Task 2708
tbBITTSK_LIMIT_USE_BTT_MinhNguyet = {nTaskID = 2708,nStartBit = 0,nBitCount = 12,nMaxValue = MOC_2000} -- su dung 2000 
tbBITTSK_LIMIT_USE_BTT_VienNguyet = {nTaskID = 2708,nStartBit = 13,nBitCount = 10,nMaxValue = MOC_1000} --Su dung 1000

tbBITTSK_RECV_MOC_500_BTT_VienNguyet = {nTaskID = 2708,nStartBit = 27,nBitCount = 1,nMaxValue = 1} --Nhan Moc 1000
tbBITTSK_RECV_MOC_1000_BTT_VienNguyet = {nTaskID = 2708,nStartBit = 28,nBitCount = 1,nMaxValue = 1} --Nhan Moc 2000

tbBITTSK_RECV_MOC_500_BTT_HoangNguyet = {nTaskID = 2708,nStartBit = 29,nBitCount = 1,nMaxValue = 1} --Nhan Moc 500
tbBITTSK_RECV_MOC_1000_BTT_HoangNguyet = {nTaskID = 2708,nStartBit = 30,nBitCount = 1,nMaxValue = 1} --Nhan Moc 1000 

--Task 2709
tbBITTSK_LIMIT_USE_BTT_HoangNguyet = {nTaskID = 2709,nStartBit = 0,nBitCount = 12,nMaxValue = MOC_1000} --Su dung 1000

--gioi han hai toi da 5 hoa dang/ngay
tbBITTSK_LIMIT_GET_HOADANG_DAILY =  {nTaskID = 2709,nStartBit = 13,nBitCount = 4,nMaxValue = 5} 

TSK_EXP_DAILY_LongDenKeoQuan = 2710
MAX_EXP_DAILY_LDKQ = 100 --gioi han 5tr exp : 100*50,000 exp

--task daily th¶ hoa ®¨ng
TSK_DAILY_THAHOADANG = 2711
MAX_COUNT_THAHOADANG = 5 --gioi han 5 lan 1 ngay
--Bang tra loi cau hoi
TB_QUEST = {
						{"PK 9 vµo tï tèn bao nhiªu v¹n","a.	81 v¹n","b.	18 v¹n","c.	Kh«ng tèn ®ång nµo"},
						{"1 ngµy ¨n ®­îc bao nhiªu kinh nghiÖm tõ ThiÕt La H¸n","a.	150 triÖu","b.	175 triÖu","c.	125 triÖu"},
						{"Level d­íi 90 ¨n Vâ l©m mËt TÞch ®­îc bao nhiªu ®iÓm","a.	1","b.	2","c.	3 "},
						{"1 acc cã thÓ ¨n ®­îc bao nhiªu b¸nh t¨ng kü n¨ng vµ tiÒm n¨ng","a.	3","b.	4","c.	5"},
						{"Nh©n vËt ch÷ tr¾ng cã thÓ bÞ ®¸nh chÕt hay kh«ng","a.	Kh«ng","b.	Cã","c.	BiÕt chÕt liÒn"},
						{"Nh©n vËt ch÷ tr¾ng cã thÓ c­íi nh©n vËt kh¸c kh«ng","a.	Kh«ng","b.	Cã","c.	Ch­a thö nªn ch¼ng biÕt"},
						{"Trang bÞ may m¾n cao nhÊt hiÖn t¹i lµ bao nhiªu %","a.	10%","b.	20%","c.	25%"},
						{"Chiªu thøc B¸ch §éc Xuyªn T©m kh«ng cã vò khÝ §ao th× cã ®¸nh ®­îc kh«ng","a.	Cã","b.	Kh«ng ch¬i Ngò §éc nªn ch¾c lµ kh«ng."},
						{"D©y chuyÒn Kh¸ng TÊt C¶ cao nhÊt lµ bao nhiªu","a.	18","b.	20","c.	24"},
						{"Ngùa Phi V©n hÖ g×","a.	Thæ","b.	Kim","c.	V« HÖ"},
						{"Tö Thñy Tinh cã chøc n¨ng g×","a.	N©ng CÊp trang bÞ","b.	§æi hÖ trang bÞ","c.	TÈy Tñy"},
						{"Bao nhiªu ph¸i cã thÓ dïng kiÕm","a.	4","b.	6","c.	10"},
						{"§µo Hoa Nguyªn L­u R­¬ng ë ®©u","a.	Ba l¨ng HuyÖn","b.	Nam Nh¹c TrÊn","c.	T­¬ng D­¬ng"},
						{"Ph¹m vi hiÖu qu¶ cña chiªu Khinh C«ng","a.	300","b.	400","c.	500"},
						{"§å Hoµng Kim b¸n shop ®­îc bao nhiªu tiÒn","a.	12400","b.	12499","c.	12500"},
						{"Khi bÞ qu¸i ®¸nh chÕt b¹n sÏ nhÆt l¹i ®­îc bao nhiªu tiÒn ","a.	mét nöa sè tiÒn mÊt","b.	mét phÇn ba sè tiÒn mÊt","c.	mét phÇn t­ sè tiÒn mÊt"},
						{"Trang bÞ chiÕm nhiÒu « nhÊt lµ bao nhiªu","a.	6","b.	7","c.	8"},
						{"Bé trang bÞ Nhu T×nh cã bao nhiªu mãn","a.	3","b.	4","c.	5"},
}
TB_ANSWER = {3,1,1,3,2,2,3,1,3,2,3,3,2,2,2,1,3,2}

