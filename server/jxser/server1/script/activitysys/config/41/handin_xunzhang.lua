Include("\\script\\lib\\composeex.lua")
Include("\\script\\activitysys\\config\\41\\head.lua")
Include("\\script\\activitysys\\config\\41\\variables.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

tbMaterial_Medal = {
	[1]={szName="Huy Hi÷u c p 1",tbProp={6,1,3133,1,0,0},nExpiredTime=20120501,nCount=1,},
	[2]={szName="Huy Hi÷u c p 2",tbProp={6,1,3134,1,0,0},nExpiredTime=20120501,nCount=1,},
	[3]={szName="Huy Hi÷u c p 3",tbProp={6,1,3135,1,0,0},nExpiredTime=20120501,nCount=1,},
	}

pActivity.tbCompose = {}

function pActivity:InitHandInCompose()
	self.tbCompose = {}
	for nType=1,getn(%tbMaterial_Medal) do
		tbFormulaList = {	
			nWidth = 0,
			nHeight = 0,
			nFreeItemCellLimit = 0,
			szComposeTitle = "T›ch lÚy danh hi÷u",
			}
		tbFormulaList.tbMaterial = {}
		tinsert(tbFormulaList.tbMaterial, %tbMaterial_Medal[nType])
		tbFormulaList.pProductFun = function(pCompose, nComposeCount)
			%self:HandInMedal(%nType, nComposeCount)
		end
		p = tbActivityCompose:new(tbFormulaList, "handinmedal", INVENTORY_ROOM.room_equipment)
		tinsert(self.tbCompose, nType, p)
	end

end

function pActivity:tocompose(nType)
	local nTskIndex = %TSK_DAILY_MEDAL
	local nMaxCount = %MAX_DAILY_HANDIN_MEDAL	
	nMaxCount = nMaxCount - self:GetTaskDaily(nTskIndex)

	if nMaxCount <= 0 then
		Say("H´m nay ng≠¨i Æ∑ giao nÈp qu∏ nhi“u rÂi, ÆÓi ngµy mai quai lπi nh–")
		return
	end
	local bAskNumber = 1
	self.tbCompose[nType]:ComposeDailog(bAskNumber, nMaxCount)

end

pActivity.nPak = curpack()