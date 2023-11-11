-------------------------------------------------------------------------
-- FileName		:	reward_partner.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-07-18 14:43:15
-- Desc			:  	同伴修炼任务卷轴右键触发脚本
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
TabFile_Load( "\\settings\\task\\partner\\reward\\index_taskid.txt" , "taskindex");	 --获得同伴修练的表格

function getrealreward ( ItemGenre,DetailType,ParticualrType )
	local nRowCount = TabFile_GetRowCount("taskindex")
	for i=2, nRowCount do
		local real_ItemGenre      = tonumber( TabFile_GetCell( "taskindex" ,i , "index_ItemGenre"      ))
		local real_DetailType     =	tonumber( TabFile_GetCell( "taskindex" ,i , "index_DetailType"     ))
		local real_ParticualrType =	tonumber( TabFile_GetCell( "taskindex" ,i , "index_ParticualrType" ))
		local real_taskid         =	tonumber( TabFile_GetCell( "taskindex" ,i , "index_taskid"         ))
		local real_level          =	tonumber( TabFile_GetCell( "taskindex" ,i , "index_level"          ))
		if (  ItemGenre == real_ItemGenre) and ( DetailType == real_DetailType ) and ( ParticualrType == real_ParticualrType ) then
			return real_taskid,real_level
		end
	end
end