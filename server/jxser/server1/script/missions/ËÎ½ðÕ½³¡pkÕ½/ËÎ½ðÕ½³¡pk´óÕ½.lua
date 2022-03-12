Include("\\script\\missions\\ËÎ½ğÕ½³¡PKÕ½\\ËÎ½ğÕ½³¡Í·ÎÄ¼ş.lua");

function InitMission()
    --Msg2Player("Õ½ÊÂ½ô¼±£¬´óÕ½Ò»´¥¼´·¢.");
    StartMissionTimer(1,4,TIMER_1);
    SetMissionV(1,1);--ÔÊĞí±¨ÃûÁË
    SetMissionV(MS_KEY, random(100000))
    RevivalAllNpc();
    HideNpc("T­íng Qu©n Nam Tèng",1000000);
    HideNpc("§¹i t­íng Kim Quèc",1000000);

    RestMin, RestSec = GetMinAndSec(1800);
    local str1 = "<#>Tèng Kim ®¹i chiÕn ®ang cho b¸o danh, nh÷ng ng­êi muèn tham gia h·y nhanh ch©n ®Õn hai cöa vµo chiÕn tr­êng Tèng Kim, thêi gian b¸o danh cßn l¹i lµ: "..RestMin.."<#>phót"..RestSec.."<#> gi©y".."<#>. §iÒu kiÖn tham chiÕn: §¼ng cÊp İt nhÊt lµ 40, phİ b¸o danh 3000 l­îng. ";
    AddGlobalCountNews(str1, 1);
end;

function RunMission()
    SetMissionV(1,2);
    SetMissionV(MS_J_NPCDEATH, 0);
    SetMissionV(MS_S_NPCDEATH, 0);
    SetMissionV(MS_S_SHOWKING, 0);
    SetMissionV(MS_J_SHOWKING, 0);
    RevivalAllNpc();
    HideNpc("T­íng Qu©n Nam Tèng",1000000);
    HideNpc("§¹i t­íng Kim Quèc",1000000);
    HideNpc("Qu©n y",1000000);
    HideNpc("Qu©n y Kim quèc",1000000);
    idx = 0;
    
    for i = 1 , 500 do
    	idx, pidx = GetNextPlayer(1,idx, 0);
    	
    	if (idx == 0) then
    		break
    	end;
    	
    	if (pidx > 0) then
    		PlayerIndex = pidx;
    		SetFightState(1);
    	end;

    	--´ËÊ±ÎªGM·¢²¼ÃüÁî£¬ÕıÊ½´òÏìÕ½¶·
    	PutMessage("§Şch qu©n ®· b¾t ®Çu hµnh ®éng! C¸c chiÕn sÜ! X«ng lªn!");
    end;
    
    StartMissionTimer(1,5, TIMER_2);
end;

function EndMission()

    for i = 1, 20 do 
    SetMissionV(i , 0);
    end;

    StopMissionTimer(1,4);
    StopMissionTimer(1,5);
    GameOver();
end;

function OnLeave(RoleIndex)
    PlayerIndex = RoleIndex;
    str2 = GetName().."<#>Rêi khái chiÕn tr­êng, ";
    -- SetLogoutRV(0);  Íæ¼ÒµôÏßÒ²»á´ÓMissionÖĞOnLeave£¬Òò´Ë²»ÄÜÔÚ´Ëµ÷ÓÃSetLogoutRV(0)£¬±ØĞëÔÚ°ÑÍæ¼ÒNewWorld³öMissionµØÍ¼µÄµØ·½µ÷ÓÃ Fanghao_Wu 2006-3-21
    SetPKFlag(0)
    ForbidChangePK(0);
    Msg2MSAll(1, str2);
end;
