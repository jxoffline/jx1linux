Include("\\script\\global\\titlefuncs.lua")
Include("\\script\\global\\login_head.lua")
tbVnCustomTitle = {}

function tbVnCustomTitle:RemoveTitleWithSkill()
	local nActiveTitle = GetTask(TASK_ACTIVE_TITLE)
	local tbTitle2Remove = {
		[1] = {3000, 1500},
		[2] = {3006, 1500},
		[3] = {3007, 1500},
	}
	for i = 1, getn(tbTitle2Remove) do
		if nActiveTitle == tbTitle2Remove[i][1] then
			return		
		end
	end
	for i = 1, getn(tbTitle2Remove) do
		if nActiveTitle ~= tbTitle2Remove[i][1] and Title_GetTitleInfo(tbTitle2Remove[i][1]) > 0 then
			Title_RemoveTitle(tbTitle2Remove[i][1])
			if GetSkillState(tbTitle2Remove[i][2]) ~= -1 then
				RemoveSkillState(tbTitle2Remove[i][2])
			end
		end
	end
end

function tbVnCustomTitle:RemoveTitleWithSkill2()	
	local tbTitle2Remove = {
		[1] = {3005, 1500},
		[2] = {3006, 1500},
		[3] = {3007, 1500},
	}
	for i = 1, getn(tbTitle2Remove) do
		Title_RemoveTitle(tbTitle2Remove[i][1])
		RemoveSkillState(tbTitle2Remove[i][2])
	end	
end

if login_add  then login_add(tbVnCustomTitle.RemoveTitleWithSkill, 2)  end
if login_add  then login_add(tbVnCustomTitle.RemoveTitleWithSkill2, 2)  end