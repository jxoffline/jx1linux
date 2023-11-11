--ÖĞÔ­ÄÏÇø ÑïÖİ¸® æÎ¿Í1¶Ô»°
Include("\\script\\task\\newtask\\branch\\xiepai\\branch_xiepaitasknpc.lua")
Include("\\script\\task\\newtask\\newtask_head.lua")
function main(sel)
	Uworld1058 = nt_getTask(1058)
	if ( Uworld1058 ~= 0 ) then
		branch_shenfeng()
	else
		Say("§ç Môc nhµ §­êng cã c©u th¬ 'ThËp Niªn NhÊt Gi¸c D­¬ng Ch©u Méng, Doanh §¾c Thanh LÇu B¹c H¹nh Danh', hµ tÊt ph¶i chĞm giÕt lÉn nhau chø?",0)
	end
end;


