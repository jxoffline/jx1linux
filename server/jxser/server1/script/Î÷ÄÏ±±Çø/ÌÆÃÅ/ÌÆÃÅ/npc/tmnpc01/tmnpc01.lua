--description: ÌÆÃÅÆÕÍ¨µÜ×Ó Öñº£Èı¹ØÈë¿Ú
--author: yuanlan	
--date: 2003/3/7
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(8) == 1 then
		allbrother_0801_FindNpcTaskDialog(8)
		return 0;
	end
	UTask_tm = GetTask(2)
	UTask_wu = GetTask(10)
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 0) and (GetLevel() >=10) and (GetFaction() ~= "tangmen") then		--ÈëÃÅÈÎÎñÆô¶¯
		Say("Muèn trë thµnh §Ö tö Kİ danh bæn m«n ph¶i th«ng qua <color=Red>Tróc H¶i Tam Quan<color>, ng­¬i muèn thö kh«ng?", 2, "X«ng trËn /enroll_get_yes", "Kh«ng x«ng /no")
	elseif (Uworld37 > 0) and (Uworld37 < 20) then			--ÈÎÎñÖĞ
		Talk(1,"","Muèn lÊy ®­îc <color=Red>gËy tróc mµu xanh<color> ph¶i ®¸nh b¹i <color=Red>§¹i M· hÇu<color> trong ¶i thø nhÊt.")
--£¬ÏëµÃµ½<color=Red>°×É«ÖñÕÈ<color>Äã±ØĞëÈ¥µÚ¶ş¹ØÕÒÒ»¸ö<color=Red>×¯¶¡<color>£¬×îºóÒ»±ú<color=Red>×ÏÉ«ÖñÕÈ<color>ÔÚµÚÈı¹ØµÄ<color=Red>×¯¶¡<color>ÊÖÉÏ¡£µÃµ½Èı±úÖñÕÈºó½»¸ø<color=Red>³ö¿ÚµÄ×¯¶¡<color>£¬²ÅÄÜËãÊÇ¹ı¹Ø¡£
--	elseif (GetFaction() == "tangmen") then			--ÒÑ¾­ÈëÃÅ£¬ÉĞÎ´³öÊ¦
--		Talk(1,"","ÌÆÃÅ×¯¶¡£º´ó¼Ò¶¼ÊÇÍ¬ÃÅĞÖµÜ£¬Äã²»±ØÔÙ´³ÕâÀïÃæµÄÖñº£Èı¹ØÁË£¡")
	elseif (UTask_tm >= 70*256) then						--ÒÑ¾­³öÊ¦
		Talk(1,"","¸m khİ vµ c¹m bÉy cña Bæn m«n ®éc b¸ thiªn h¹, ng­êi trªn giang hå kh«ng ai d¸m xem th­êng chóng ta. Sau nµy hµnh tÈu giang hå kh«ng ®­îc lµm mÊt uy phong bæn m«n! ")
	else
		Talk(1,"","Bæn m«n kh«ng hoan nghªnh ng­êi l¹ tù ı ra vµo.")
	end
end;

function enroll_get_yes()
	Talk(2, "", "LÊy ®­îc 3 c©y <color=Red>gËy tróc xanh, tr¾ng, tİm<color> trong <color=Red>Tróc H¶i Tam Quan<color> ®­a cho ®ång m«n ë lèi ra, coi nh­ qua ¶i.", "Muèn lÊy ®­îc<color=Red>gËy tróc mµu xanh<color> ph¶i ®¸nh b¹i <color=Red>§¹i M· hÇu<color> trong ¶i thø nhÊt, <color=Red>gËy tróc mµu tr¾ng<color> ph¶i qua ¶i thø hai t×m <color=Red>Tr¸ng §inh<color>, <color=Red>GËy tróc mµu tİm<color> ë trong tay cña <color=Red>Tr¸ng §inh<color> ë ¶i thø ba.")
	Uworld37 = SetByte(GetTask(37),1,20)
	SetTask(37,Uworld37)
	AddNote("§Õn Tróc H¶i Tam quan, gÆp §­êng M«n tr¸ng ®inh, nhËn nhiÖm vô <color=red>Kı Danh §Ö Tö<color>, v­ît qua Tróc H¶i Tam Quan ®Ó lÊy 3 c©y gËy tre mµu xanh, tr¾ng, tİm. ")
--	AddNote("µ½ÌÆÃÅ¼ÇÃûµÜ×ÓÈÎÎñ£º´³¹ıÖñº£Èı¹Ø²¢µÃµ½Çà¡¢°×¡¢×ÏÈı±úÖñÕÈ¡£")
end;

function no()
end;
