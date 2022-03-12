
Include("\\script\\lib\\baseclass.lua")
Include("\\script\\dailogsys\\dailog.lua")

Include("\\script\\dailogsys\\dailogsay.lua")
G_DIALOG = tbBaseClass:new()

function G_DIALOG:_init()	
	self.tbSet = {}
end

function G_DIALOG:OnSelect(szNpcName, nSelectId, bIsConfirm, nItemIndex)
	
	return self.tbSet[szNpcName]:OnSelect(nSelectId, bIsConfirm, nItemIndex)
end

function G_DIALOG:AddDailog(szNpcName, tbDialog)
	if self.tbSet[szNpcName] then
		--print("已经存在该对话,增加失败。");
		--return self.tbSet[szNpcName]
	else
		tbDialog.szNpcName = szNpcName
		self.tbSet[szNpcName] = tbDialog	
	end
	return self.tbSet[szNpcName]
end

function G_DIALOG:GetDailog(szNpcName)
	return self.tbSet[szNpcName]
end


function G_DIALOG:ShowDailog(szNpcName, nItemIndex)
	nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	
	CreateTaskSay(self.tbSet[szNpcName]:GetDailogTable(nCurDate, nItemIndex) )
end




G_DIALOG:_init()