Include("\\script\\event\\cookies2007\\head.lua");

function iscookies2007()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20070414 and nDate <= 20070424) then
		return 1;
	else
		return 0;
	end;
end;

function cookies2007_main()
	Say("B¸n hµng rong: L·o phu chØ bu«n b¸n nhá, gÇn ®©y cã mua vÒ mét Ýt hµng hãa, dù ®Þnh mïng 3 th¸ng 3 sÏ ®em b¸n. Cã ngê ®©u trªn ®­êng bÞ bän thæ phØ ®¸nh c­íp hÕt sè hµng hãa vµ tiÒn trªn ng­êi. L·o xin c¸c vÞ ®¹i hiÖp gióp ®ì ®i lÊy l¹i hµng hãa vµ tiÒn vÒ.", 3,
			"Ta ®· t×m thÊy råi/want_take_cookiesma",
			"Ta muèn t×m hiÓu ho¹t ®éng mïng 3 th¸ng 3/about_cookies2007", 
			"Ta sÏ quay l¹i sau/OnCancel");
end;

function want_take_cookiesma()
	if (checkcookies2007Limit() ~= 1) then
		Say("B¸n hµng rong: ThËt ng¹i qu¸, chØ cã ng­êi ch¬i <color=yellow> cÊp trªn 50 ®· n¹p thÎ<color> míi cã thÓ nhËn Bao nguyªn liÖu lµm b¸nh.", 0);
		return 0;
	end;
	if (iscookies2007() == 1) then
		sure_task_cookiesma();
	else
		Say("B¸n hµng rong: [Ho¹t ®éng ch­a diÔn ra] Tói hµng hãa cña l·o chøa ®ùng nguyªn liÖu rÊt tèt, ®a t¹ ®¹i hiÖp quan t©m.",0);
		return 0;
	end
end;

function sure_task_cookiesma()
	if (iscookies2007() == 1) then
			if GetCash() < 100000 then 
				Say("B¸n hµng rong: L·o phu bÞ mÊt <color=yellow>10 v¹n l­îng<color>, ch¼ng hay ®¹i hiÖp ®· t×m thÊy hay ch­a?",0);
				return 0;
			end
			if CalcFreeItemCellCount() < 1 then 
				Say("B¸n hµng rong: Xin h·y s¾p xÕp l¹i hµnh trang! L·o phu cã phÇn qu¶ nhá muèn gëi tÆng ®¹i hiÖp.",0);
				return 0;
			end
			local nsum = CalcEquiproomItemCount(6,1,1393,-1);
			if nsum < 20 then
				Say("B¸n hµng rong: §¹i hiÖp vÉn ch­a t×m ®ñ tói hµng hãa, l·o phu bÞ mÊt <color=yellow>20 tói hµng hãa<color> c¬ mµ.",0);
				return 0;
			end	
			if ConsumeEquiproomItem(20,6,1,1393,-1) ~= 1 then
				WriteLog(format("[2007Mïng 3 th¸ng 3] \t%sName:%s\tAccount:%s\t Hñy bá tói hµng hãa thÊt b¹i.", GetLocalDate("%Y-%m-%d %H:%M:%S"), GetName(), GetAccount()));
				Say("B¸n hµng rong: Hñy bá tói hµng hãa thÊt b¹i.",0);
				return 0;
			else
				WriteLog(format("[2007Mïng 3 th¸ng 3]\t%sName:%s\tAccount:%s\t Hñy bá Tói hµng hãa thµnh c«ng.", GetLocalDate("%Y-%m-%d %H:%M:%S"), GetName(), GetAccount()));
			end
			Pay(100000);
			AddItem(6,1,1394,1,0,0);
			Say("B¸n hµng rong: §©y lµ Bao nguyªn liÖu lµm b¸nh, ®ai hiÖp h·y mau chãng cïng víi vÞ n÷ hiÖp nµo ®ã lµm b¸nh ®i.", 0);
		--end;
	end;
end;

function about_cookies2007()
	Talk(3,"","B¸n hµng rong: Trong thêi gian ho¹t ®éng, tÊt c¶ ng­êi ch¬i khi ®¸nh qu¸i luyÖn c«ng sÏ cã c¬ héi nhÆt ®­îc <color=yellow>Tói hµng hãa<color>. Sau ®ã, mang 20 <color=yellow>Tói hµng hãa<color> vµ <color=yellow>10 v¹n l­îng<color> ®Õn NPC b¸n hµng rong t¹i c¸c ®¹i thµnh thÞ ®Ó ®æi lÊy <color=yellow>Bao nguyªn liÖu lµm b¸nh<color>.","Tæ ®éi nam n÷ (®¼ng cÊp trªn 50 ®· n¹p thÎ) cã thÓ ®Õn c¸c thµnh thÞ, t©n thñ th«n hay c¸c khu vùc phong c¶nh ®Ó cïng nhau lµm b¸nh."," Trong qu¸ tr×nh lµm b¸nh, ng­êi ch¬i sÏ tiÕn hµnh c¸c thao t¸c Nhµo bét, §·i vá ®Ëu xanh, Bá nh©n vµo b¸nh, Thªm cñiThao t¸c cµng nhanh gän th× b¸nh lµm ra sÏ cµng ngon.");
end;

function OnCancel()
	
end