Include("\\script\\skill\\lvlup150_l21_limit.lua")

SOSkillLevelUp={}
MESSAGES={
	"V× c¨n b¶n cña [%s] b¹n qu¸ thÊp, h¹n chÕ [%s] luyÖn cÊp.",
	"V× c¨n b¶n cña [%s] b¹n qu¸ thÊp, h¹n chÕ [%s] t¨ng cÊp.",
	"CÊp ®é tu luyÖn cña b¹n ®· ®¹t ®Ønh råi, kh«ng thÓ n©ng cao h¬n n÷a.",
	"Ng­¬i vÉn ch­a lÜnh héi ®­îc ?%s? kÜ x¶o tu luyÖn cÊp cao h¬n, kh«ng thÓ tu luyÖn kÜ n¨ng nµy"
}

--¶ëáÒÆÕ¶ÉÖÚÉúÉý¼¶ÏÞÖÆ
function SOSkillLevelUp.Pudu_zhongsheng()
	local perSkills={{93,"Tõ Hµng Phæ D"},{89,"Méng §iÖp "},{86,"L­u Thñy "},{92,"PhËt T©m Tõ H÷u"},{282,"Thanh ¢m Ph¹n X­íng"}}
	local mainSkill = {332,"Phæ §é Chóng Sinh "}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--ÌÆÃÅÂÒ»·»÷Éý¼¶ÏÞÖÆ
function SOSkillLevelUp.Luanhuan_ji()
	local perSkills={{347,"§Þa DiÖm Háa "},{303,"§éc ThÝch Cèt "},{343,"Xuyªn T©m ThÝch "},{345,"Hµn B¨ng ThÝch "},{349,"L«i KÝch ThuËt "}}
	local mainSkill = {351,"Lo¹n Hoµn KÝch"}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--ÌÆÃÅÅùö¨ÂÒ»·»÷Éý¼¶ÏÞÖÆ
function SOSkillLevelUp.Pililuanhuan_ji()
	local perSkills={{45,"TÝch LÞch ®¬n"},{351,"Lo¹n Hoµn KÝch"}}
	local mainSkill = {1110,"TÝch LÞch Lo¹n Hoµn KÝch"}
	local nMaxLevel = GetSkillMaxLevel(mainSkill[1])
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>=nMaxLevel) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	if mlvl == 20 and tbLvUp150L21Limit:IsAvailable(mainSkill[1]) == 0 then
		Msg2Player(format(MESSAGES[4],mainSkill[2]))
		return 0
	end
	
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--Îå¶¾¶Ï½î¸¯¹ÇÉý¼¶ÏÞÖÆ
function SOSkillLevelUp.Duanjin_fugu()
	local perSkills={{67,"Cöu Thiªn Cuång L«i "},{70,"XÝch DiÖm Thùc Thiªn"},{64,"B¨ng Lam HuyÒn Tinh"},{356,"Xuyªn Y Ph¸ Gi¸p "},{72,"Xuyªn T©m §éc ThÝch"}}
	local mainSkill = {390,"§o¹n C©n Hñ Cèt "}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--ÌìÈÌÉã»êÂÒÐÄÉý¼¶ÏÞÖÆ
function SOSkillLevelUp.Shehun_luanxin()
	local perSkills={{136,"Háa PhÇn Liªn Hoa"},{137,"¶o ¶nh Phi Hå "},{140,"Phi Hång V« TÝch "},{364,"Bi T« Thanh Phong "},{143,"LÞch Ma §o¹t Hån"}}
	local mainSkill = {391,"NhiÕp Hån Lo¹n T©m "}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end

--À¥ÂØ×íÏÉ´í¹ÇÉý¼¶ÏÞÖÆ
function SOSkillLevelUp.Zuixian_cuogu()
	local perSkills={{392,"Thóc Ph­îc Chó "},{174,"Ki B¸n phï "},{393,"B¾c Minh §¸o H¶i"},{175,"Khi Hµn Ng¹o TuyÕt"},{90,"Mª Tung ¶o ¶nh"}}
	local mainSkill = {394,"Tóy Tiªn T¸ Cèt"}
	local mlvl = HaveMagic(mainSkill[1]),plvl
	local i
	if(mlvl>19) then
		Msg2Player(format(MESSAGES[3],mainSkill[2]))
		return 0
	end
	for i=1,getn(perSkills) do
		plvl = HaveMagic(perSkills[i][1])
		if(plvl < 5) then
			Msg2Player(format(MESSAGES[1],perSkills[i][2],mainSkill[2]))
			return 0
		end
		if(mlvl > 15) then
			AddMagic(mainSkill[1],mlvl+1)
			AddMagicPoint(-1)
			return 1
		end
		if(plvl<mlvl+5) then
			Msg2Player(format(MESSAGES[2],perSkills[i][2],mainSkill[2]))
			return 0
		end
	end
	AddMagic(mainSkill[1],mlvl+1)
	AddMagicPoint(-1)
	return 1
end
