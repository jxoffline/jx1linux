--ÖĞÔ­ÄÏÇø ÏåÑô¸® ÑÃÃÅÎÀ±ø2¶Ô»°

FESTIVAL06_NPCNAME = "<color=yellow>VÖ binh Nha m«n:<color>";
Include([[\script\global\Â·ÈË_ÑÃÃÅÎÀ±ø.lua]]);

function main(sel)
    gsoldier_entance();
end;

function main_former()
	UTask_wd = GetTask(5);
	UTask_wd60sub = GetByte(GetTask(17),3)
	if (UTask_wd == 60*256+20) and (UTask_wd60sub == 2) then
		Say("Thñ thµnh ®¹i nh©n ®· th¸o ch¹y trong mËt ®¹o phİa sau nha m«n. GiÆc Kim cßn ch­a tíi ®· sî h·i nh­ vËy!", 0)
		AddNote("§Õn nha m«n, nãi chuyÖn víi ng­êi vÖ bŞnh vµ biÕt tÓ t­íng ®· tho¸t qua ®­êng bİ mËt phİa sau nha m«n. ")
		Msg2Player("Th× ra tÓ t­íng T­¬ng D­¬ng ®· sím tho¸t nhê ®­êng bİ mËt phİa sau nha m«n. ")
	else
		Talk(1,"","§¹i nh©n cã lÖnh, kÎ kh«ng phËn sù cÊm vµo dßm ngã!")
	end
end;
