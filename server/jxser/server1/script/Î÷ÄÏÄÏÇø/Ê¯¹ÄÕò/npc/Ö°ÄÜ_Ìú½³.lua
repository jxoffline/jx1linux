-- Ê¯¹ÄÕò Ö°ÄÜ Ìú½³
-- By: Dan_Deng(2003-09-16)
Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>C¸c lo¹i ®ao th­¬ng binh khİ ®©y! §©y lµ n¬i mua vò khİ tèt nhÊt ë Th¹ch Cæ TrÊn!"

function main(sel)
	tiejiang_village();
end;

function yes()
Sale(25);  				--ÁÙÊ±¶¨Îª25
end;
