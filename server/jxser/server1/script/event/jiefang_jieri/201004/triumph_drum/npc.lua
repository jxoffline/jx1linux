-- ¿­Ðý¹ÄÉù Í·ÎÄ¼þ
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

-- Npc¶Ô»°
function tbTriumphDrum:NpcTalk()
	
	if tbTriumphDrum:CheckCondition_BuyDrum() ~= 1 then
		CreateTaskSay({"C¸c h¹ kh«ng cã quyÒn h¹n ®Ó mua trèng kh¶i hoµn!",  "§­îc råi./Cancel",});
		return
	end
	
	if GetCash() < self.nLimit_Money then
		CreateTaskSay({"Mua Trèng Kh¶i Hoµn cÇn 304 v¹n l­îng",  "§­îc råi./Cancel",});
		return		
	end
	
	if Pay(self.nLimit_Money) ~= 1 then
		Msg2Player("Trõ ng©n l­îng thÊt b¹i")
		return
	end
		
	local tbAwardItem = 
	{
		szName="Trèng Kh¶i Hoµn", 
		tbProp={6,1, 2309, 1,0,0},
		nCount = 1,
		nExpiredTime=60,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "Mua Trèng Kh¶i Hoµn");
end
