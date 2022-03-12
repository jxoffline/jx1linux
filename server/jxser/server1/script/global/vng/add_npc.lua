

new_npc = { 
{1571,80,4,53,1624,3184,0,"Thö NghiÖm 8.0",0,"\\script\\global\\VNG\\npc_thunghiem.lua"}, 
}




function add_npc_vng_new()
	add_npc(new_npc)
end

------------------------------------------------------------------------------------------------------------------------------
function add_npc(tbnpc)
	for i = 1 , getn(tbnpc) do
		Mid = SubWorldID2Idx(tbnpc[i][4]);
		if (Mid >= 0 ) then
			TabValue5 = tbnpc[i][5] * 32;
			TabValue6 = tbnpc[i][6] * 32;
			local nNpcIdx = AddNpc(tbnpc[i][1],tbnpc[i][2],Mid,TabValue5,TabValue6,tbnpc[i][7],tbnpc[i][8]);
			SetNpcScript(nNpcIdx, tbnpc[i][10]);
		end;
	end;
end