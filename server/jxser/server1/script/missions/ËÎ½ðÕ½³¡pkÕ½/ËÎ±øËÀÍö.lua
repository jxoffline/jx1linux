--宋兵Npc死亡脚本
Include("\\script\\missions\\宋金战场PK战\\宋金战场头文件.lua");
function OnDeath(Launcher)

State = GetMissionV(1) ;
if (State ~= 2) then
return
end;

npccount = GetTask(SJKILLNPC) + 1;
SetTask(SJKILLNPC, npccount);
str1 = "<#>S� lng qu﹏ ch NPC ngi  gi誸 hi謓 gi� t╪g l猲 "..npccount;
Msg2Player(str1);

nCount = GetMissionV(MS_S_NPCDEATH) + 1;
SetMissionV(MS_S_NPCDEATH, nCount);

if (nCount == MS_SHOWKINGCOUNT) then
	CheckShowKing(1);
end;


end;

