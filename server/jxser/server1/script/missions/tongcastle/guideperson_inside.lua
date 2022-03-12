--°×»¢½ÚÌÃ½ÓÒıÈË£¨´«³öÓÃ£©

function main()
	local tbSel = {
		"Ta muèn rêi khái Thµnh B¶o Bang Héi" .. "/OnLeave",
		"Ta xem thö" .. "/OnCancel",
	};
	Say("§¹i hiÖp! Ng­¬i muèn rêi khái ®©y sao?", getn(tbSel), tbSel);
end

function OnLeave()
	UseTownPortal();
end

function OnCancel()
end

