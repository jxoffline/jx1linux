CP_MAXROUND = 40

CP_HELP_FRESHMAN = {
					"Thi ®Êu <color=yellow>Vâ L©m kiÖt xuÊt<color> môc ®İch lµ v× sù tiÕn bé cña c¸c T©n Thñ trong giang hå, t¹o c¬ héi trao ®æi vâ nghÖ víi ng­êi ch¬i kh¸c cïng m«n phµi, n©ng cao kü n¨ng vâ c«ng cña T©n Thñ, t¹o sù giao l­u gi÷a c¸c huynh ®Ö ®ång m«n, gióp T©n Thñ quen dÇn víi cuéc sèng giang hå.",
					"<color=yellow>§iÒu kiÖn b¸o danh<color>: §¼ng cÊp tõ 50 ®Õn 90, ®Õn gÆp Sø gi¶ kiÖt xuÊt ®Ó b¸o danh."..CP_MAXROUND.."trËn.",
					"<color=yellow>Thêi gian thi ®Êu<color>: Thi ®Êu Vâ l©m kiÖt xuÊt b¾t ®Çu tõ tõ ngµy 1 th¸ng 6 n¨m 2005 ®Õn ngµy 10 th¸ng 6 n¨m 2005 kÕt thóc. <color=yellow>20:00<color> b¾t ®Çu ®Õn <color=yellow>23:00<color> kÕt thóc. Mçi <color=yellow>3<color> giê cã tæng céng <color=yellow>9<color> trËn. Thêi gian b¸o danh thi ®Êu cña mçi vßng lµ 5 phót, thêi gian th× ®Êu lµ 15 phót.",
					"Thi ®Êu Vâ l©m kiÖt xuÊt c¨n cø vµo ®iÓm ®Ó chän ra 5 h¹ng. "..CP_MAXROUND.."Trong tr­êng ®Êu, th¾ng 1 trËn ®­îc 3 ®iÓm, hßa ®­îc 1 ®iÓm, thua kh«ng cã ®iÓm. §Õn khi kÕt thóc, sÏ do hÖ thèng tù x¸c ®Şnh chän ra 5 ng­êi ch¬i cao ®iÓm nhÊt cña 5 m«n ph¸i, phong tÆng danh hiÖu kiÖt xuÊt M«n ph¸i.",
					"Mçi ng­êi ch¬i tham gia b¸o danh trong qu¸ tr×nh tham gia nhËn ®­îc gi¶i th­ëng nhÊt ®Şnh. Mçi lÇn tham gia 1 vßng sÏ ®o¹t ®­îc gi¶i th­ëng nhÊt ®Şnh, ngoµi ra ng­êi ch¬i cßn nhËn ®­îc nh÷ng vËt phÈm nh­: Ph¸o hoa, HuyÒn Tinh Kho¸ng Th¹ch, Phóc Duyªn lé, Tiªn Th¶o Lé, Thñy Tinh) "
				}

function help_freshmanmatch()
	Talk( 2, "help_freshmanmatch2", CP_HELP_FRESHMAN[ 1 ], CP_HELP_FRESHMAN[ 2 ])
end

function help_freshmanmatch2()
	Talk( 2, "help_freshmanmatch3", CP_HELP_FRESHMAN[ 3 ], CP_HELP_FRESHMAN[ 4 ])
end

function help_freshmanmatch3()
	Talk( 1, "", CP_HELP_FRESHMAN[ 5 ])
end