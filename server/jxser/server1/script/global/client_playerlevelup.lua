--Creator:yfeng
--Date:2004-9-6
--Comm:¿Í»§¶ËÉı¼¶ÌáÊ¾ĞÅÏ¢

STRTAB_LEVELUP={
	[2]="<#> Chóc mõng b¹n ®· lªn cÊp 2, b¹n ®· cã thÓ ®i t×m Vâ s­ ®Ó häc Khinh c«ng",
	[5]="<#> Chóc mõng b¹n ®· lªn ®Õn cÊp 5! B¹n ®· cã thÓ ®i xem thÕ giíi bªn ngoµi råi!.",
	[10]="<#> Chóc mõng b¹n ®· lªn ®Õn cÊp 10! B¹n ®· cã thÓ gia nhËp m«n ph¸i, PK víi ng­êi kh¸c, tham gia bÊt cø ho¹t ®éng nµo cña Vâ l©m!",
	[20]="<#> Chóc mõng b¹n ®· lªn ®Õn cÊp 20! B©y giê b¹n ®· cã thÓ t×m ng­êi t©m ®Çu ı hîp ®Ó kÕt b¹n tr¨m n¨m, hoÆc tiÕp tôc con ®­êng giang hå cña m×nh",
	[30]="<#> Chóc mõng b¹n ®· lªn ®Õn cÊp 30!H·y quay vÒ m«n ph¸i, cã rÊt nhiÒu nhiÖm vô tr«ng chê b¹n!",
	[40]="<#> Chóc mõng b¹n ®· lªn ®Õn cÊp 40! B¹n ®· cã thÓ  tham gia chiÕn tr­êng Tèng  Kim. §õng quªn quay vÒ m«n ph¸i, cã rÊt nhiÒu nhiÖm vô tr«ng chê b¹n!",
	[50]="<#> Chóc mõng b¹n ®· lªn ®Õn cÊp 50! B¹n ®· cã thÓ ®i ®¶o TÈy Tñy, n¬i ®ã b¹n cã v« sè lÇn thö nghiÖm hiÖu qu¶ tÈy ®iÓm cña m×nh/ hoÆc ®Õn §µo hoa ®¶o ®Ó th­ëng chø? ch¸o L¹p B¸t t¨ng kinh nghiÖm! C¸c thuyÒn phu vµ Xa phu ®Òu cã thÓ ®­a b¹n ®i! Nhí vÒ m«n ph¸i lµm nhiÖm vŞu xuÊt s­ ®Ó häc ®­îc tuyÖt kü trÊn ph¸i",
	[60]="<#> B¹n cã thÓ nhËn nhiÖm vô Håi s­, hoµn thµnh sÏ häc ®­îc tuyÖt häc trÊn ph¸i! ",
}

function main(lvl)
	Uworld1001 = nt_getTask(1001)
	Uworld1002 = nt_getTask(1002)
	Uworld1003 = nt_getTask(1003)
	if ( GetLevel() == 30 ) then
		if ( Uworld1001 == 60 ) and ( Uworld1002 == 60 ) and ( Uworld1003 == 108) then
			nt_setTask(1001,80)
			nt_setTask(1002,80)
			nt_setTask(1003,109)
			SendTaskOrder("B¹n ®ång thêi nhËn ®­îc nhiÖm vô chİnh, trung, tµ cÊp 30.")
		elseif ( Uworld1001 == 60 ) and ( Uworld1002 == 60 )  then
			nt_setTask(1001,80)
			nt_setTask(1002,80)
			SendTaskOrder("B¹n ®ång thêi nhËn ®­îc nhiÖm vô chİnh ph¸i, trung lËp cÊp 30.")
		elseif ( Uworld1001 == 60 ) and ( Uworld1003 == 108)  then
			nt_setTask(1001,80)
			nt_setTask(1003,109)
			SendTaskOrder("B¹n ®ång thêi nhËn ®­îc nhiÖm vô chİnh ph¸i, tµ ph¸i cÊp 30 ")
		elseif ( Uworld1002 == 60 ) and ( Uworld1003 == 108)  then
			nt_setTask(1002,80)
			nt_setTask(1003,109)
			SendTaskOrder("B¹n ®ång thêi nhËn ®­îc nhiÖm vô trung lËp, tµ ph¸i cÊp 30.")
		elseif ( Uworld1001 == 60 ) then
			nt_setTask(1001,80)
			SendTaskOrder("B¹n nhËn ®­îc nhiÖm vô chİnh ph¸i cÊp 30.")
		elseif ( Uworld1002 == 60 ) then
			nt_setTask(1002,80)
			SendTaskOrder("B¹n nhËn ®­îc nhiÖm vô trung lËp cÊp 30.")
		elseif ( Uworld1003 == 108) then
			nt_setTask(1003,109)
			SendTaskOrder("B¹n nhËn ®­îc nhiÖm vô tµ ph¸i cÊp 30.")
		end
	elseif ( GetLevel() == 40 ) then
		if ( Uworld1001 == 130 ) and ( Uworld1002 == 110 ) and ( Uworld1003 == 208 ) then
			nt_setTask(1001,150)
			nt_setTask(1002,130)
			nt_setTask(1003,209)
			SendTaskOrder("B¹n ®ång thêi nhËn ®­îc nhiÖm vô chİnh, trung, tµ cÊp 40")
		elseif ( Uworld1001 == 130 ) and ( Uworld1002 == 110 )  then
			nt_setTask(1001,150)
			nt_setTask(1002,130)
			SendTaskOrder("B¹n ®ång thêi nhËn ®­îc nhiÖm vô chİnh, trung cÊp 40.")
		elseif ( Uworld1001 == 130 ) and ( Uworld1003 == 208 )  then
			nt_setTask(1001,150)
			nt_setTask(1003,209)
			SendTaskOrder("B¹n ®ång thêi nhËn ®­îc nhiÖm vô chİnh, tµ  cÊp 40")
		elseif ( Uworld1002 == 110 ) and ( Uworld1003 == 208 )  then
			nt_setTask(1002,130)
			nt_setTask(1003,209)
			SendTaskOrder("B¹n ®ång thêi nhËn ®­îc nhiÖm vô trung, tµ cÊp 40.")
		elseif ( Uworld1001 == 130 ) then
			nt_setTask(1001,150)
			SendTaskOrder("B¹n nhËn d­îc nhiÖm vô chİnh ph¸i cÊp 40.")
		elseif ( Uworld1002 == 110 ) then
			nt_setTask(1002,130)
			SendTaskOrder("B¹n nhËn ®­îc nhiÖm vô trung lËp cÊp 40.")
		elseif ( Uworld1003 == 208 ) then
			nt_setTask(1003,209)
			SendTaskOrder("B¹n nhËn ®­îc nhiÖm vô tµ ph¸i cÊp 40.")
		end
	elseif ( GetLevel() == 50 ) then
		if ( Uworld1001 == 200 ) and ( Uworld1002 == 180 ) and ( Uworld1003 == 328) then
			nt_setTask(1001,220)
			nt_setTask(1002,200)
			nt_setTask(1003,329)
			SendTaskOrder("B¹n ®ång thêi nhËn ®­îc nhiÖm vô chİnh, trung, tµ cÊp 50")
		elseif ( Uworld1001 == 200 ) and ( Uworld1002 == 180 )  then
			nt_setTask(1001,220)
			nt_setTask(1002,200)
			SendTaskOrder("B¹n ®ång thêi nhËn ®­îc nhiÖm vô chİnh ph¸i, trung lËp  cÊp 50")
		elseif ( Uworld1001 == 200 ) and ( Uworld1003 == 328 )  then
			nt_setTask(1001,220)
			nt_setTask(1003,329)
			SendTaskOrder("B¹n ®ång thêi nhËn ®­îc nhiÖm vô chİnh ph¸i, tµ ph¸i cÊp 50")
		elseif ( Uworld1002 == 180 ) and ( Uworld1003 == 328 )  then
			nt_setTask(1002,200)
			nt_setTask(1003,329)
			SendTaskOrder("B¹n ®ång thêi nhËn ®­îc nhiÖm vô trung lËp, tµ ph¸i cÊp 50")
		elseif ( Uworld1001 == 200 ) then
			nt_setTask(1001,220)
			SendTaskOrder("B¹n nhËn ®­îc nhiÖm vô chİnh ph¸i cÊp 50")
		elseif ( Uworld1002 == 180 ) then
			nt_setTask(1002,200)
			SendTaskOrder("B¹n nhËn ®­îc nhiÖm vô trung lËp cÊp 50")
		elseif ( Uworld1003 == 328 ) then
			nt_setTask(1003,329)
			SendTaskOrder("B¹n nhËn ®­îc nhiÖm vô tµ ph¸i cÊp 50")
		end
	elseif ( GetLevel() == 60 ) then
		if ( Uworld1001 == 270 ) and ( Uworld1002 == 240 ) and ( Uworld1003 == 408 ) then
			nt_setTask(1001,290)
			nt_setTask(1002,260)
			nt_setTask(1003,409)
			SendTaskOrder("B¹n ®ång thêi nhËn ®­îc nhiÖm vô chİnh, trung, tµ cÊp 50")
		elseif ( Uworld1001 == 270 ) and ( Uworld1002 == 240 )  then
			nt_setTask(1001,290)
			nt_setTask(1002,260)
			SendTaskOrder("B¹n ®ång thêi nhËn ®­îc nhiÖm vô chİnh ph¸i, trung lËp  cÊp 50")
		elseif ( Uworld1001 == 270 ) and ( Uworld1003 == 408 )  then
			nt_setTask(1001,290)
			nt_setTask(1003,409)
			SendTaskOrder("B¹n ®ång thêi nhËn ®­îc nhiÖm vô chİnh ph¸i, tµ ph¸i cÊp 50")
		elseif ( Uworld1002 == 240 ) and ( Uworld1003 == 408 )  then
			nt_setTask(1002,260)
			nt_setTask(1003,409)
			SendTaskOrder("B¹n ®ång thêi nhËn ®­îc nhiÖm vô trung lËp, tµ ph¸i cÊp 50")
		elseif ( Uworld1001 == 270 ) then
			nt_setTask(1001,290)
			SendTaskOrder("B¹n nhËn ®­îc nhiÖm vô chİnh ph¸i cÊp 50")
		elseif ( Uworld1002 == 240 ) then
			nt_setTask(1002,260)
			SendTaskOrder("B¹n nhËn ®­îc nhiÖm vô trung lËp cÊp 50")
		elseif ( Uworld1003 == 408 ) then
			nt_setTask(1003,409)
			SendTaskOrder("B¹n nhËn ®­îc nhiÖm vô tµ ph¸i cÊp 50")
		end
	else
		return Msg2Player(STRTAB_LEVELUP[lvl])
	end
end
