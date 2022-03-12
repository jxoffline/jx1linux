Include("\\script\\missions\\ËÎ½ğÕ½³¡PKÕ½\\ËÎ½ğÕ½³¡Í·ÎÄ¼ş.lua");
function OnTimer()

State = GetMissionV(1) ;
if (State == 0) then
return
end;

--ÔÚ¹æ¶¨Ê±¼äÄÚ£¬Á½´ó¾ü¶ÓÎ´ÓĞÒ»·½É±ËÀµĞÖ÷½«£¬Ôò±ÈÈü½áÊø
--±ÈÈç Ä³Ä³´ó½«:½«Ê¿ÃÇ!¾İÍ¨Ñ¶±øÍ¨±¨£¬µĞ¾üÕÒÀ´ÁËºó·½ÔöÔ®²¿¶Ó£¬ÎÒÃÇ´í¹ıÁË..»ú»á¡£ÏÖÔÚÍË±ø...µÈµÈ..
Msg2MSAll(1, "Trêi ®· tèi, t¹m thêi thu binh! S¸ng mai ®¸nh tiÕp, kh«ng giÕt t­íng ®Şch thÒ kh«ng vÒ. ");
SetMissionV(MS_STATE,3);
CloseMission(1);
end;