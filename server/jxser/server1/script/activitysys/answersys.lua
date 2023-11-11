Include("\\script\\lib\\baseclass.lua")
Include("\\script\\activitysys\\functionlib.lua")

AnswerSys = tbBaseClass:new()


function AnswerSys:_init(szFile)
	
	self.tbAnswerSet = {}
end


function AnswerSys:ShowTopic(szFile, nCount, nTaskId, nValue)
	
	if not self.tbAnswerSet[szFile] then
		
		self:Load(szFile)
	end
	
	self.tbAnswerSet[szFile]:Show(nCount, nTaskId, nValue)
	
end


function AnswerSys:Load(szPath)
	
	self.tbAnswerSet[szPath] = AnswerClass:new(szPath)
end