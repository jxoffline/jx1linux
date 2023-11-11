--ÖĞÔ­ÄÏÇø ÏåÑô¸® Ç®×¯ÀÏ°å¶Ô»°
-- Update: Dan_Deng(2003-12-31) ¼Óºì°ü¡¢Ôª±¦¹¦ÄÜ

Include("\\script\\global\\Ç®×¯¹¦ÄÜ.lua")

function main(sel)
	i = random(0,1)
	if (i == 0) then
		Talk(1,"main_proc","Ng­êi lµm ¨n ®­¬ng nhiªn muèn lêi cµng nhiÒu cµng Tèt! thiªn h¹ cã mÊy ai chª tiÒn?")
	else
		Talk(1,"main_proc","Mäi thø ®Òu lµ gi¶, chØ cã vµng thËt, b¹c tr¾ng míi lµ thËt!")
	end
end;
