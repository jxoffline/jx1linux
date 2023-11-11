function main()
	Say("<#>Tæng qu¶n khu vùc chiÕn ®Êu: §Ó néi bé bang héi vµ c¸c bang héi tû thÝ vâ nghÖ víi nhau, ta cã thÓ gióp mäi ng­êi thay ®æi phe ph¸i, nh­ng khi ra khái khu chiÕn ®Êu th× sÏ kh«i phôc l¹i nh­ cò, ng­¬i muèn t¹m thêi ®æi phe ph¸i kh«ng." ,5, "Phe ChÝnh/camp1", "Phe Tµ ph¸i/camp2", "Phe Trung lËp/camp3", "Kh«i phôc l¹i phe ph¸i ban ®Çu/retorecamp", "Ta vÉn ch­a muèn ®æi./cancel");
end

function camp1()
	SetCurCamp(1);
	Msg2Player("T¹m thêi ®æi sang chÝnh ph¸i.");
end

function camp2()
	SetCurCamp(2);
	Msg2Player("T¹m thêi ®æi sang tµ ph¸i.");
end

function camp3()
	SetCurCamp(3);
	Msg2Player("T¹m thêi ®æi sang trung lËp.");
end

function retorecamp()
	SetCurCamp(GetCamp())
end

function cancel()
end

