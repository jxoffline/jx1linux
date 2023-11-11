Include("\\script\\vng_event\\20120619_hk_bao_ruong\\variables.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
function tbVnHKBaoRuong:CheckTime()
	local nCurDate = tonumber(date("%Y%m%d%H%S"))
	if nCurDate < self.nStartDate or nCurDate >= self.nEndDate then
		Talk(1, "", "HiÖn t¹i kh«ng ph¶i thêi gian diÔn ra ch­¬ng tr×nh!")
		return nil
	end
	return 1
end

function tbVnHKBaoRuong:CheckCondition()
	if self:CheckTime() == 1 and PlayerFunLib:CheckTotalLevel(150, "default", ">=") == 1 then
		return 1	
	end
	return nil
end

function tbVnHKBaoRuong:LoadNpc()
	if not %tbVnHKBaoRuong:CheckTime() then
		return
	end
	local tbNpcPos = {
		{176,1453,3287},
		{176,1464,3298},
		{176 ,1475,3309},
		{176,1486,3320},
		{176,1498,3331},
	}
	local tbNpc = {	
		[1] = {	
			szName = "Hoµng Kim B¶o R­¬ng", 
			nLevel = 1,
			nNpcId = 844,
			nIsboss = 0,
			szScriptPath = "\\script\\vng_event\\20120619_hk_bao_ruong\\hkbaoruong.lua",
		}
	}
	for i=1,getn(tbNpc) do
		for j = 1, getn(tbNpcPos) do
			local nMapId, nPosX, nPosY = unpack(tbNpcPos[j])
			basemission_CallNpc(tbNpc[i], nMapId, nPosX * 32, nPosY * 32)	
		end
	end
end

AutoFunctions:Add(tbVnHKBaoRuong.LoadNpc)