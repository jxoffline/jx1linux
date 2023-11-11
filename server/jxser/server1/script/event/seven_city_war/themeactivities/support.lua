-- 七城大战 主题活动 活动系统支持
Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\event\\seven_city_war\\themeactivities\\head.lua");

-- 加载NPC
function tbSevenCityWar_Theme:AddNpc(nCloseDate)
	
	local nYear = floor(nCloseDate / 10000);
	nCloseDate = mod(nCloseDate, 10000);
	local nMonth = floor(nCloseDate / 100);
	local nDate = mod(nCloseDate, 100);
	
	local nCloseTime = Tm2Time(nYear, nMonth, nDate);
	local nCurTime = GetCurServerTime();
	local nDiffSec = nCloseTime - nCurTime;
	
	if nDiffSec <= 0 then
		return
	end
	nDiffSec = nDiffSec + 5 * 60;	-- 延迟五分钟
	AddTimer(nDiffSec * 18, "OnTimer", 0);
	
	for i=1,getn(self.tbNpcBaoBao.tbNpcPos) do
		local tbPos = self.tbNpcBaoBao.tbNpcPos[i];
		local nSubWorldIndex = SubWorldID2Idx(tbPos[1]);
		
		if nSubWorldIndex >= 0 then
			local nNpcIndex = AddNpc(self.tbNpcBaoBao.nNpcId, 1, nSubWorldIndex, tbPos[2] * 32, tbPos[3] * 32, 0, "B秓 B秓 Ca");
			if nNpcIndex > 0 then
				self.tbNpcBaoBao.tbNpcIndex[getn(self.tbNpcBaoBao.tbNpcIndex) + 1] = nNpcIndex;
				SetNpcScript(nNpcIndex, "\\script\\activitysys\\npcdailog.lua");
			end
		end
		
	end
end


-- 定时删除NPC
function OnTimer()
	return tbSevenCityWar_Theme:OnTimer();
end

function tbSevenCityWar_Theme:OnTimer()
	
	for i =1,getn(self.tbNpcBaoBao.tbNpcIndex) do
		DelNpc(self.tbNpcBaoBao.tbNpcIndex[i]);
	end
	
	self.tbNpcBaoBao.tbNpcIndex = {};
	return 0, 0;
end


