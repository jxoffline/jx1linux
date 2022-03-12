--description: ÓÀÀÖÕò_Å£Å£Âè
--author: wangzg
--date: 2003/7/18
--modify 2003/7/21 wangzg
--update 2003/7/22 yuanlan
-- Update: Dan_Deng(2003-08-07)

function main(sel)
	UTask_world37=GetTask(65)
	if ((UTask_world37==0) and (GetLevel() >= 2)) then		-- ÒªÇóµÈ¼¶³¬¹ı2¼¶
		Say("Th»ng Ng­u Ng­u nhµ ta cø thİch lµm ®¹i hiÖp, b©y giê l¹i kh«ng biÕt ®· ch¹y ®i ®©u råi… ",2,"§õng lo l¾ng, ta gióp tÈu t×m /yes", "T×m kh«ng ra /no")
	elseif (UTask_world37==2) then
		Talk(1,"","§õng lo l¾ng, ta gióp tÈu t×m nã!")
	else
		Talk(1,"","Kh¾p n¬i ngµy cµng kh«ng yªn b×nh, con ta l¹i kh«ng nghe lêi, thËt lµ buån lßng!")
	end
end;

function yes()
	Talk(1,"","Ng­¬i thËt lµ ng­êi tèt, vËy th× lµm phiÒn gióp ta nhĞ!")
	SetTask(65,2)
	AddNote("NhËn nhiÖm vô: gióp mÑ Ng­u Ng­u t×m con trai ")
	Msg2Player("NhËn nhiÖm vô: gióp mÑ Ng­u Ng­u t×m con trai ")
end

function no()
end
