--ÖĞÔ­ÄÏÇø ÏåÑô¸® Â·ÈË16¹ùÔ±Íâ¶Ô»°
-- edit by Ğ¡ÀË¶à¶à

Include("\\script\\event\\zhongqiu2007\\picture_head.lua")
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main(sel)
	if allbrother_0801_CheckIsDialog(183) == 1 then
		allbrother_0801_FindNpcTaskDialog(183)
		return 0;
	end
	local ndate = tonumber(GetLocalDate("%y%m%d%H%M"))
	if ndate > 0709220000 and ndate < 0710312400 then
		SetTaskTemp(TSK_TEMP,2)
		Describe("Qu¸ch viªn ngo¹i: Trung thu ®· ®Õn, chØ cÇn thu thËp ®ñ 6 <color=red>m¶nh tranh Tiªn Vò<color> ®Ó hîp thµnh 1 bøc tranh hoµn chØnh mang ®Õn cho ta, ta sÏ tÆng l¹i ®¹i hiÖp 1 b¸nh <color=red>Phông NguyÖt Qu¶ Dung<color>.",2,"§æi b¸nh Phông NguyÖt Qu¶ Dung/makeItemUI","Nh©n tiÖn ghĞ qua th«i/NoChoice")
	else
		Describe("Ta ®· ®em toµn bé gia s¶n quyªn gãp cho triÒu ®×nh. N­íc nhµ gÆp n¹n, mäi ng­êi d©n ®Ò cã tr¸ch nhiÖm. Ta chØ gãp chøc søc män nµy mµ cã x¸ g×! So víi c¸c chiÕn sÜ ng· xuèng trªn sa tr­êng, chót ®ãng gãp nhá nhÆt nµy nµo cã ®¸ng chi!",1,"BiÕt råi/NoChoice")
	end
end;
