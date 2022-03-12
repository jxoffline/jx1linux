Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\baoruongthanbi\\openbox\\openbox.lua")
Include("\\script\\baoruongthanbi\\key\\definitionkey.lua")
Include("\\script\\baoruongthanbi\\key\\keyupgrade.lua")


function BRTB_Dialog_main()
	
	local tbOpp = {}
	--local nDay = tonumber(GetLocalDate("%Y%m%d"))
	local str = "<#> Kh«ng biÕt ta cã thÓ gióp g× cho ®¹i hiÖp ?";
	
	tinsert(tbOpp,"Ta ®Õn nhê më R­¬ng ThÇn BÝ/OpenBox_main");
	tinsert(tbOpp,"Ta ®Õn nhê gi¸m ®Þnh l¹i Ch×a Khãa V¹n N¨ng/DefinitionKey_main");
	tinsert(tbOpp,"Ta ®Õn nhê n©ng cÊp Ch×a Khãa V¹n N¨ng/KeyUpgrade_main");
	tinsert(tbOpp, "<#>Tho¸t/OnCancel")
	if ( getn( tbOpp ) == 0 ) then
		Say(str, 0);
		return
	end;
	Say( str, getn( tbOpp ), tbOpp )
end
function OnCancel()
end 

