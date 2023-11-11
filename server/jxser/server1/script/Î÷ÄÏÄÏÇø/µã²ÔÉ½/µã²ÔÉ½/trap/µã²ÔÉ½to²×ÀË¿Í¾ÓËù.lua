--Î÷ÄÏÄÏÇø µã²ÔÉ½to²×ÀË¿Í¾ÓËù
--Trap ID£º²×ÀË¿Í 1

function main(sel)
	Uworld42 = GetTask(42)
--	Msg2Player("²×ÀË¿Í¾ÓËù")
	if (Uworld42 == 60) then
		SetTask(42,70)
		Talk(15,"U42_go","Hi hi! ","Hi hi hi! ","Ch¸u ngoan! §Õn ®©y «ng câng nµo.....Ai cha, nÆng qu¸!","¤ng néi! Ch¸u muèn ¨n kÑo.","Con còng muèn.","¤ng néi! Tôi nã cã, cßn cña con th× sao?","§­îc råi! Ai còng cã phÇn.","Xin hái cã ph¶i Th­¬ng L·ng Kh¸ch trong phßng?","KÎ nµo bªn ngoµi?","V·n bèi xin b¸i kiÕn!","Ta ®ang vui vÇy víi con ch¸u, kh«ng r¶nh tiÕp ng­¬i, vÒ ®i!","ThËt kh«ng d¸m giÊu, mÑ cña mÊy ®øa trÎ nµy còng rÊt lo l¾ng, mÊt ¨n mÊt ngñ, xin TiÒn bèi tha cho bän chóng.","MÊy ®øa nµy ®Òu lµ ch¸u cña ta, ng­¬i nãi c¸i g× mÑ bän chóng chø? Th»ng nhãc nµy d¸m ®Õn ®©y trªu ta µ?","TiÒn bèi! §õng ®ïa víi ta n÷a. Th«ng c¶m giïm ®i!","Th«ng c¶m giïm! TiÓu tö to gan, tiÕp chiªu!")
	elseif (Uworld42 == 70) then
		Talk(1,"U42_go","TiÓu tö kh«ng biÕt sèng chÕt, cßn kh«ng chŞu ®i! ")
	end
end;

function U42_go()
	NewWorld(231,1611,3193)
end
