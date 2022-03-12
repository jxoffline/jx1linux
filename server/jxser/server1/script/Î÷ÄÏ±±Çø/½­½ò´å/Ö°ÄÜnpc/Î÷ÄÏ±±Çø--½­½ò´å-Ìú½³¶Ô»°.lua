--Î÷ÄÏ±±Çø½­½ò´åÌú½³
--½­½ò´åĞÂÊÖÈÎÎñ£º»¢×ÓµÄµ¯¹­
--suyu
-- Update: Dan_Deng(2003-08-11)

Include("\\script\\global\\global_tiejiang.lua")

TIEJIANG_DIALOG = "<dec><npc>Gian hµng cña ta binh khİ tinh x¶o mµ gi¸ c¶ l¹i võa ph¶i, ®¹i hiÖp hµnh tÈu giang hå mµ kh«ng cã mét mãn binh khİ cho võa tay sao? Mua mét mãn ®i nµo?"

function main(sel)
--	UTask_world18 = GetTask(46);
	UTask_world45 = GetTask(45)
	Uworld1000 = nt_getTask(1000)	
	if(UTask_world45 == 10) then
		Talk(1,"","Ng­¬i ®Õn hái chiÕc n¸ cho tiÓu Hæ Tö µ? Ta ch­a ®éng tay tíi! §å cÇn thiÕt ta cßn ch­a ®i t×m.Ta l¹i kh«ng thÓ rêi tiÖm. ThÕ nµy nhĞ! Ng­¬i gióp ta ®i t×m ch¹c c©y vµ da tr©u.Cã ®ñ råi ta sÏ lËp tøc lµm ngay!")
		SetTask(45, 20)
		AddNote("Thî rÌn cÇn nguyªn liÖu míi cã thÓ b¾t ®Çu lµm giµn n¸! B¹n gióp anh ta t×m mét ch¹c v©y vµ mét miÕng da tr©u.")
		Msg2Player("Thî rÌn cÇn nguyªn liÖu míi cã thÓ b¾t ®Çu lµm giµn n¸! B¹n gióp anh ta t×m mét ch¹c v©y vµ mét miÕng da tr©u.")
	elseif(UTask_world45 == 20) then
		if((HaveItem(177) ==1 ) and (HaveItem(178) == 1)) then	--ÅĞ¶ÏÊÇ·ñÓĞµÀ¾ß
			Talk(2,"","Sao nhanh thÕ? §­a ch¹c c©y vµ da tr©u ®­a cho ta! Ta lµm ngay!","§· lµm xong. Thay ta ®­a c©y n¸ cho TiÓu Hæ Tö!")
			DelItem(177)		--É¾µôÊ÷è¾
			DelItem(178)		--É¾µôÅ£Æ¤
			AddEventItem(176)		--¸øÍæ¼Òµ¯¹­
			Msg2Player("§­îc mét giµn n¸.")
			AddNote("Thî rÌn ®· lµm xong giµn n¸ nhê b¹n ®em ®i cho Hæ Tö.")
			Msg2Player("Thî rÌn ®· lµm xong giµn n¸ nhê b¹n ®em ®i cho Hæ Tö.")
--			SetTask(46, 3)
		else
			tiejiang_village("<dec><npc>ChØ cÇn mang ch¹c vµ da tr©u ®Õn cho ta th× sÏ cã ngay c©y n¸ cho TiÓu Hæ, chØ cÇn ®îi mét lóc lµ xong. Ng­¬i muèn lo¹i vò khİ nµo kh¸c kh«ng?")
		end
	else
		tiejiang_village();
	end
end;

function yes()
	Sale(22);  				--µ¯³ö½»Ò×¿ò
end;
