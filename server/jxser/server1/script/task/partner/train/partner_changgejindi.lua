Include("\\script\\task\\partner\\train\\partner_addtrainnpc.lua")

function Goto_jindichangge()
	Describe(DescLink_ChangGeMen..": Trong Tr­êng ca m«n cÊm ®Þa, ng­êi ch¬i vµ ®ång hµnh sÏ nhËn ®­îc rÊt nhiÒu ®iÓm kinh nghiÖm. Cã thÓ lÊy ®­îc MËt tÞch. Cã muèn vµo ®ã kh«ng?", 2,
	"µ, ta muèn ®i/sure_gotojindi",
	"§îi mét l¸t/OnCancel")
end

function OnCancel()
end

function sure_gotojindi()
	local filehigh = pt_GetTabFileHeight( jindienter_pos_file )
	local row = random(filehigh)
	local posx = pt_GetTabFileData(jindienter_pos_file, row + 1, 1)
	local posy = pt_GetTabFileData(jindienter_pos_file, row + 1, 2)
	
	if (posx > 0 and posy > 0) then
		NewWorld(539, posx, posy)
		SetFightState(1)
	else
		print("jindienter_pos_file error row = "..row)
	end
end