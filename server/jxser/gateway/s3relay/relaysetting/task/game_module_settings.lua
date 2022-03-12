-- ¶¨Ê±ÏòÒ»×é·şÎñÆ÷µÄËùÓĞGameserver·¢ÏµÍ³¹«¸æ
Include("\\script\\gb_modulefuncs.lua")
tab_GameSetting = 
{
"Ho¹t ®éng xu©n 2006",--ÄêÊŞ
"OpenShop",--ÉÌ³Ç
"ThiÖp th«ng b¸o chóc mõng mµu",--Msg2SubWorld
"ThiÖp cuén",--AddLocalNews
"Phóc duyªn ph¸o hoa", 
"TruyÒn c«ng",
"LÔ vËt t×nh nh©n",--AddLocalNews and AddGift
"YANDIBAOZANG",
"YANDIBAOZANG_TALK",
"SWITH_DAIYITOUSHI",
"chunjie2009_dangboss",
}

function TaskShedule()
	TaskName("ThiÕt kÕ hÖ thèng trß ch¬i ");
	TaskInterval(1000000);
	TaskCountLimit(0);
	OutputMsg("Khëi ®éng hÖ thèng ®ãng më c¸c chøc n¨ng trong trß ch¬i...");
end

function TaskContent()
	for i = 1, getn(tab_GameSetting) do 
		gb_AutoStartModule(tab_GameSetting[i])
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
