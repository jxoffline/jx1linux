-- ¥Û¿Ì°°¬∑»À°°∂ŒÀº≥…
-- by£∫Dan_Deng(2003-09-16)
-- update by xiaoyang(2004\4\22) ¥‰—Ã90º∂»ŒŒÒ

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(14) == 1 then
		allbrother_0801_FindNpcTaskDialog(14)
		return 0;
	end
	Uworld126 = GetTask(126)
	Uworld36 = GetByte(GetTask(36),2)
	if (Uworld126 < 10) and (GetLevel() >= 90) and (Uworld36 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~="cuiyan") then
		Talk(6,"Uworld126_get","Hı.....","C´ng tˆ v◊ sao ph∂i thÎ ngæn thÎ dµi nh≠ vÀy?","TuÊi trŒ ph∂i nu´i ch› lÌn, y nh≠ Bπch hπc, Thu ThÒy qua rÂi.","Chºng lœ ˝ trung nh©n cÒa C∏c hπ Æ∑ m t.","Nµng sËng mµ tim nh≠ Æ∑ ch’t.","Chÿ c«n ng≠Íi thµnh t©m, chuy÷n g◊ cÚng thµnh. C∏c hπ c„ g◊ kh„ kh®n, xin c¯ n„i ra.")
	elseif (Uworld126 == 10) and (HaveItem(391) == 0) then
		AddEventItem(391)
		Msg2Player("NhÀn lπi th≠ cÒa ßoµn T≠ Thµnh ")
		if (GetSex() == 0) then
			Talk(1,"","MuËn g∆p m¸ nh©n cÚng kh´ng c«n ph∂i g p nh≠ th’? Th≠ cﬂn ch≠a c«m mµ.")
		else
			Talk(1,"","C´ n≠¨ng  y qu™n mang th≠ v“.")
		end
	elseif (Uworld126 == 40) then
		SetTask(126,45)
		Talk(8,"Uworld126_jump","Kh´ng c«n n„i n˜a!","ßoµn c´ng tˆ! Ng≠Íi Æ∑ cho L÷ Thu ThÒy cuÈc sËng giµu sang phÛ qu˝ tÀn h≠Îng kh´ng h’t, loπi Æµn bµ d˜ dªn nh≠ th’ c„ th” t◊m th™m 10 hay 100 ng≠Íi kh∏c n˜a, sao lπi chuËc khÊ vµo th©n.","Ng≠¨i n„i nh≠ th’ nµo cÚng v´ dÙng, xin c∏c hπ h∑y mau rÍi kh·i Æ©y Æi.","ßoµn T≠ Thµnh! Ng≠¨i r≠Óu mÍi kh´ng uËng mµ uËng r≠Óu phπt, l∑o kh´ng cﬂn nh…n nπi n˜a, n’u ng≠¨i v…n kh´ng tr∂ lÍi, th◊ h∑y Æ” mπng lπi Æ©y.","Hı! ","Hay cho t™n ti”u tˆ nhµ ng≠¨i! ","A.....","ßoµn c´ng tˆ!")
	elseif (Uworld126 == 45) then			-- √ª¥ÚÕÍµƒ
		Talk(1,"Uworld126_jump","Hı! Ng≠¨i tho∏t kh·i tay Hﬂa Th≠Óng th◊ cÚng kh´ng tho∏t kh·i mi’u nµy! Xem chi™u!")
	elseif (Uworld126 == 50) then
		Talk(8,"Uworld126_set","ßoµn c´ng tˆ ng≠Íi kh´ng ph∂i lµ ÆËi thÒ cÒa ´ng ta!","May nhÍ C∏c hπ Æ’n kﬁp thÍi, tπi hπ cﬂn ÆÏ nÊi.","ßËi phu¨ng tı Æ©u Æ’n?","Kh´ng r‚ n˜a! C„ lœ lµ kŒ thÔ cÒa Thu Thu˚ trong giang hÂ.",".....C„ rÂi! Ta sœ nËi dËi vÌi L÷ c´ n≠¨ng lµ ng≠Íi bﬁ tr‰ng th≠¨ng.","VÀy h◊nh nh≠ lµ kh´ng hay læm.","Hπnh phÛc c∂ ÆÍi, lœ nµo kh„ kh®n nµy kh´ng th” v≠Ót qua.","ßoµn T≠ Thµnh:.....ß≠Óc! C∏c hπ muËn th’ nµo cÚng Æ≠Óc ßoµn mÁ xin nghe theo.")
	elseif (Uworld126 == 70) then
		Talk(3,"U126_70","Th’ nµo! L÷ c´ n≠¨ng c„ Æ’n th®m huynh kh´ng?","C´  y c„ gh– th®m, chÛng ta n„i chuy÷n r t vui, ng≠Íi Æ∑ giÛp ta nhi“u rÂi, xin c∂m ¨n!","Hµ t t ph∂i bÀn t©m, chÿ c«n 2 ng≠Íi hπnh phÛc, chuy÷n nh· nµy c„ Æ∏ng lµ g◊.")
	elseif (Uworld126 > 10) and (Uworld126 < 50)then
		Talk(1,"","Tr≠Ìc Æ©y lµ do ta sai! ThÀt kh´ng bi’t l y g◊ c∂m ¨n ng≠¨i!...")
	else
		Talk(2,"","ßπi L˝ chÛng ta vµ TËng quËc, mÁi n®m Æ“u cËng nπp cho Thi™n tri“u tr©u, lÙa lµ, ng˘a, xπ h≠¨ng, bﬂ vµng.","B‰n ng≠Íi Kim tham lam tÈ cÔng, c„ cËng cho h‰ c∂ ÆÍi cÚng ch≠a lµm vıa lﬂng h‰!")
   end
end;

function Uworld126_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- ∞◊√˚Œ¥—ß“∞«Ú»≠µƒ£¨≤ª‘ –ÌΩ”»ŒŒÒ
		if (GetSex() == 0) then
			Talk(1,"","H∂o ˝ cÒa Huynh Æµi, T≠ Thµnh xin ghi nhÌ!")
		else
			Talk(1,"","H∂o ˝ cÒa Huynh Æµi, T≠ Thµnh xin ghi nhÌ!")
		end
	else
		Say("ThÀt kh´ng d∏m gi u! N®m x≠a Tπi hπ Æ∑ phÙ c´ ta, nay ngh‹ lπi hËi hÀn Æ∑ muÈn. Ta c„ mÈt b¯c th≠, hy v‰ng C∏c hπ c„ th” tÀn tay giao cho ThÛy Y™n m´n H∂i ß≠Íng S¯ Gi∂ L÷ Thu ThÒy?",2,"Vi÷c nµy c„ kh„ g◊! /Uworld126_yes","Tπi hπ v…n cﬂn c„ vi÷c, c∏c hπ h∑y Æi t◊m ng≠Íi kh∏c Æi! /Uworld126_no")
	end
end

function Uworld126_yes()
	AddEventItem(391)
	SetTask(126,10)
	Msg2Player("NhÀn Æ≠Óc th≠ cÒa ßoµn T≠ Thµnh, Æ’n Thu˝ Y™n M´n H∂i Th≠Íng S¯ Gi∂ L÷ Thu Thu˚ ")
	AddNote("NhÀn Æ≠Óc th≠ cÒa ßoµn T≠ Thµnh, Æ’n Thu˝ Y™n M´n H∂i Th≠Íng S¯ Gi∂ L÷ Thu Thu˚ ")
end

function Uworld126_no()
end

function Uworld126_jump()
	SetFightState(1)
	NewWorld(230,1613,3175)
end

function Uworld126_set()
	SetTask(126,60)
	Msg2Player("LÀp m≠u lıa Thu ThÒy Æ’n th®m ßoµn T≠ Thµnh ")
	AddNote("LÀp m≠u lıa Thu ThÒy Æ’n th®m ßoµn T≠ Thµnh ")
end

function U126_70()
	Talk(1,"","ßÛng rÂi! Thu ThÒy n„i Do∑n Ch≠Îng m´n muËn g∆p ng≠¨i, kh´ng bi’t lµ chuy÷n g◊?")
	SetTask(126,80)
	Msg2Player("Nghe Æ≠Óc ßoµn vµ L÷ n„i chuy÷n vÌi nhau, th◊ r t vui. Ng≠Íi h∑y Æi xem thˆ Do∑n Hµm Y™n c„ vi÷c g◊ mµ t◊m ng≠Íi ")
end
