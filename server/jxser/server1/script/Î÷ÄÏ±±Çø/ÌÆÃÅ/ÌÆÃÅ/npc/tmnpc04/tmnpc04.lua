--description: ÌÆÃÅÆÕÍ¨µÜ×Ó Öñº£Èı¹Ø³ö¿Ú
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)

Include("\\script\\global\\repute_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(11) == 1 then
		allbrother_0801_FindNpcTaskDialog(11)
		return 0;
	end
	UTask_tm = GetTask(2);
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 80) then			--ÈëÃÅÈÎÎñ
		if (HaveItem(33) == 1) and (HaveItem(34) == 1) and (HaveItem(35) == 1) then
			Uworld37_prise()
		else
			Talk(1,"","B¹n ph¶i lÊy ®­îc 3 c©y tróc xanh, tr¾ng, tİm qua ¶i míi ®­îc!")
		end
	elseif (Uworld37 < 80) then						--ÉĞÎ´ÈëÃÅ
		Talk(1,"","Muèn qua Tróc H¶i Tam Quan, ph¶i lÊy ®­îc 3 c©y gËy tróc mµu xanh, tr¾ng, tİm.")
--	elseif (GetFaction() == "tangmen") then			--ÒÑ¾­ÈëÃÅ£¬ÉĞÎ´³öÊ¦
--		Talk(1,"","ÌÆÃÅ×¯¶¡£º´ó¼Ò¶¼ÊÇÍ¬ÃÅĞÖµÜ£¬Äã²»±ØÔÙ´³ÕâÀïÃæµÄÖñº£Èı¹ØÁË£¡")
	elseif (UTask_tm >= 70*256) and (GetFaction() ~= "tangmen") then						--ÒÑ¾­³öÊ¦
		Talk(1,"","¸m khİ vµ c¹m bÉy cña Bæn m«n ®éc b¸ thiªn h¹, ng­êi trªn giang hå kh«ng ai d¸m xem th­êng chóng ta. Sau nµy hµnh tÈu giang hå kh«ng ®­îc lµm mÊt uy phong bæn m«n! ")
	else
		Talk(1,"","Tróc h¶i nguy hiÓm, ph¶i hÕt søc cÈn thËn!")
	end
end;

function Uworld37_prise()
	Talk(1,"","Ng­¬i ®· thuËn lîi qua ¶i, trë thµnh §Ö tö kı danh cña bæn m«n! ")
	DelItem(33)
	DelItem(34)
	DelItem(35)
	UTask_world37 = SetByte(GetTask(37),1,127)
	i = ReturnRepute(25,19,4)		-- È±Ê¡ÉùÍû£¬×î´óÎŞËğºÄµÈ¼¶£¬Ã¿¼¶µİ¼õÂÊ
	SetTask(37,UTask_world37)
	AddRepute(i)		-- ¼ÓÉùÍû
	Msg2Player("Mang 3 c©y tróc ®Õn Tróc H¶i Tam Quan xuÊt khÈu giao cho phßng nghŞ sù §­êng m«n, hoµn thµnh nhiÖm vô Kı Danh ®Ö tö. Trë thµnh §­êng m«n Kı Danh ®Ö tö, thanh thÕ t¨ng lªn"..i.."®iÓm.")
	AddNote("T¹i lèi ra cña Tróc H¶i Tam Quan, giao 3 c©y tre cho §­êng M«n tr¸ng ®inh, hoµn thµnh nhiÖm vô kı danh ®Ö tö. ")
end;
