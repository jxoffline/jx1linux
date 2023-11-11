Include("\\script\\event\\vnchristmas2007\\head.lua")
Include("\\script\\task\\system\\task_string.lua")


function xmas2007_getnextgirlname()
	local sznextgirl = ""
	local ntask = GetTask(xmas2007_findgirl_taskID)
	if ntask == 0 then
		sznextgirl = "B¨ng Nhi"
	elseif ntask == 1 then
		sznextgirl = "§«ng Nhi"
	elseif ntask == 2 then
		sznextgirl = "B¹ch Nhi"
	elseif ntask == 3 then
		sznextgirl = "TuyÕt Nhi"
	end
	return sznextgirl
end
function main()
	--local nidx = GetNpcIdx()

	local tbarytalk = 
	{
		[1]= "<dec><npc>Ta vµ c¸c tû muéi ®· thÊt l¹c nhau råi, ®¹i hiÖp cã thÓ gióp ta t×m muéi muéi ®­îc kh«ng? H·y gióp ta t×m <color=yellow>B¨ng Nhi<color> tr­íc, cã thÓ muéi Êy ®ang ë trong thµnh.",
		[2]= "<dec><npc>Th× ra c¸c tû muéi ta nhê ®¹i hiÖp ®i t×m ta, nh­ng giê vÉn ch­a t×m ®­îc <color=yellow>%s<color> n÷a, lµm phiÒn ®¹i hiÖp vËy!",
		[3]= "<dec><npc>§¹i hiÖp, chóng t«i vÉn ch­a t×m thÊy <color=yellow>%s<color> n÷a, phiÒn ®¹i hiÖp ®i t×m mét chuyÕn n÷a.",
		[4]= "<dec><npc>Xin chóc mõng, ®¹i hiÖp ®· nhËn ®­îc phÇn th­ëng gi¸ trŞ, hi väng lÇn sau sÏ gÆp l¹i",
		[5]= "<dec><npc>Xin chóc mõng, ®¹i hiÖp ®· t×m ®­îc chóng t«i.",
		[6]= "NhËn ®­îc <color=yellow>%s<color> ®iÓm kinh nghiÖm",
		[7]= "<dec><npc>§¹i hiÖp ®Õn qu¸ muén råi, ®· cã 3 ng­êi ®· t×m thÊy t«i, lÇn sau ®Õn sím h¬n nhĞ.",

	}
	local nidx = GetLastDiagNpc()
	local ngirl = GetNpcParam(nidx,1)
	local szgirl = GetNpcName(nidx)
	local ntask = GetTask(xmas2007_findgirl_taskID)
	local sznextgirl = ""
	sznextgirl = xmas2007_getnextgirlname()
	local ntaskdate = GetTask(xmas2007_findgirl_limit_taskID)
	local ndate = xmas2007_findgirl_returndate()
	if ntaskdate ~= ndate then
		SetTask(xmas2007_findgirl_limit_taskID,ndate)
		SetTask(xmas2007_findgirl_taskID,0)
		local arysay = {}
		arysay[1] = tbarytalk[1]
		arysay[2] = "§­îc!/NoChoice"
		CreateTaskSay(arysay)
		return
	end
	if ntask == 0 then
		local arysay = {}
		arysay[1] = tbarytalk[1]
		arysay[2] = "§­îc!/NoChoice"
		CreateTaskSay(arysay)
		return
	
	elseif ntask == 4 then
		local arysay = {}
		arysay[1] = tbarytalk[4]
		arysay[2] = "§­îc!/NoChoice"
		CreateTaskSay(arysay)		
		return
	end
	if ngirl == 1 then
		if ntask == 1 then
			SetTask(xmas2007_findgirl_taskID,2)
			sznextgirl = xmas2007_getnextgirlname()
			local arysay = {}
			arysay[1] = format(tbarytalk[2],sznextgirl)
			arysay[2] = "§­îc!/NoChoice"
			CreateTaskSay(arysay)
			return
		else
			local arysay = {}
			arysay[1] = format(tbarytalk[3],sznextgirl)
			arysay[2] = "§­îc!/NoChoice"
			CreateTaskSay(arysay)
			return
		end
		
	elseif ngirl == 2 then
		if ntask == 2 then
			SetTask(xmas2007_findgirl_taskID,3)
			sznextgirl = xmas2007_getnextgirlname()
			local arysay = {}
			arysay[1] = format(tbarytalk[2],sznextgirl)
			arysay[2] = "§­îc!/NoChoice"
			CreateTaskSay(arysay)
			return
		else
			local arysay = {}
			arysay[1] = format(tbarytalk[3],sznextgirl)
			arysay[2] = "§­îc!/NoChoice"
			CreateTaskSay(arysay)
			return
		end
	elseif ngirl == 3 then
		if ntask == 3 then
			
			local nsort = GetNpcParam(nidx,2)
			if nsort < 3 then
				SetTask(xmas2007_findgirl_taskID,4)
				SetNpcParam(nidx,2,(nsort+1))
				AddOwnExp(xmas2007_findgirl_exp)
				Msg2Player(format(tbarytalk[6],xmas2007_findgirl_exp))
				xmas2007_sdl_writeLog("T×m kiÕm thiÕu n÷ thÇn bİ",format("NhËn ®­îc %s ®iÓm kinh nghiÖm",xmas2007_findgirl_exp),0)
				xmas2007_findgirl_award()
				local arysay = {}
				arysay[1] = format(tbarytalk[5])
				arysay[2] = "§­îc!/NoChoice"
				CreateTaskSay(arysay)
				return
			else
				local arysay = {}
				arysay[1] = format(tbarytalk[7])
				arysay[2] = "§­îc!/NoChoice"
				CreateTaskSay(arysay)
				return
			end
		else
			local arysay = {}
			arysay[1] = format(tbarytalk[3],sznextgirl)
			arysay[2] = "§­îc!/NoChoice"
			CreateTaskSay(arysay)
			return
		end
	end
	
end

function xmas2007_findgirl_award()
	local nallrate = tb_xmas2007_findgirl_item[1]
	local np = random(1,nallrate)
	local nsum = 0
	for ni=2,getn(tb_xmas2007_findgirl_item) do
		local tbitem = tb_xmas2007_findgirl_item[ni]
		nsum = nsum + tbitem[1]*nallrate
		if nsum > np then
			AddGoldItem(tbitem[2][1],tbitem[2][2])
			Msg2Player(format("NhËn ®­îc <color=yellow>%s<color>",tbitem[3]))
			xmas2007_sdl_writeLog("T×m kiÕm thiÕu n÷ thÇn bİ",format("NhËn ®­îc trang bŞ hoµng kim %s",tbitem[3]))
			return 
		end
	end
end
