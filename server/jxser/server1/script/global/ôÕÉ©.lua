Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


Shijin2mijian=50
Mijian2babao=30
Babao2baiguo=30
Baiguo2shuijing=30
Shuijing2quyuan=3


function main()
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))

	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>Mäi ng­êi ®Òu gäi ta lµ Tèng tÈu. "
	G_TASK:OnMessage("Thiªn NhÉn", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end

function aboutluckyzongzi()
	Talk(1,"","B¸nh ch­ng May m¾n ph¶i mÊt ba n¨m míi lµm xong, ¨n råi cã thÓ t¨ng vËn may lªn 30 ®iÓm!  Nh­ng chØ cã thÓ ph¸t huy t¸c dông ë n¬i ¨n mµ th«i. B»ng h÷u cã muèn thö kh«ng?")
end


function listen()
	Talk(1,"talk2","KhuÊt Nguyªn lµ ®¹i c«ng thÇn cña Së quèc!  ¤ng ta rÊt cã n¨ng lùc lµm viÖc,nh­ng gÆp sù ph¶n ®èi cña quý téc, bÞ ®µy ®i Nguyªn t­¬ng l­u vùc. Khi bÞ ®µy ®i,«ng viÕt bµi th¬ 'Ly tao'. Sau khi kinh ®« n­íc Së bÞ tµn ph¸, lßng «ng lo l¾ng tæ quèc, sau khi viÕt tuyÖt bót 'hoµi sa' ngµy 5 th¸ng 5,«ng «m ®¸ ch×m xuèng s«ng MÞch la tù vÉn")
end;

function talk2()
	Talk(1,"talk3","sau khi KhuÊt Nguyªn mÊt, nh©n d©n v« cïng tiÕc th­¬ng! Th­êng ®Õn bªn s«ng MÞch La gäi hån. Mäi ng­êi  lÊy thøc ¨n nÐm xuèng s«ng ®Ó cho t«m cua rång c¸ ¨n no råi sÏ kh«ng ¨n x¸c KhuÊt Nguyªn! Tõ ®ã cã tôc lÖ lµm B¸nh ch­ng")
end;

function talk3()
	Talk(1,"","Sau nµy, tíi ngµy 5 th¸ng 5 hµng n¨m, th× cã ®ua thuyÒn rång, ¨n B¸nh ch­ng ®Ó t­ëng niÖm ®¹i phu KhuÊt Nguyªn!  §©y chÝnh lµ nguån gèc cña lÔ §oan ngä.")
end

function lucky()
	if (GetExtPoint(6) >= 32768) then	
		Talk(1,"","B¹n kh«ng thÓ nhËn ®­îc g¹o nÕp may m¾n! ")
--		SetExtPoint(6,0)
		WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName()..", l·nh nhËn G¹o nÕp may m¾n thÊt b¹i! tr¹ng th¸i dÞ th­êng. ")
	else
		Say("B¹n muèn nhËn bao nhiªu g¹o nÕp may m¾n! ",3,"LÊy 10 b¸nh ch­ng May M¾n. /lucky10","LÊy 1 b¸nh ch­ng May M¾n. /lucky1","Kh«ng lµm g× hÕt/no")
	end
end

function lucky10()
	if (GetExtPoint(6) >= 10) then	
		for i=1,10 do
			AddEventItem(405)			
			PayExtPoint(6,1)
		end
		Msg2Player("B¹n nhËn ®­îc 10 b¸nh ch­ng May M¾n. ")
		WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName()..", nhËn ®­îc 10  g¹o nÕp may m¾n.")
	else
		Talk(1,"","B¹n kh«ng thÓ nhËn ®­îc nhiÒu g¹o nÕp may m¾n nh­ vËy! ")
	end
end

function lucky1()
	if (GetExtPoint(6) > 0) then
		AddEventItem(405)
		PayExtPoint(6,1)
		Msg2Player("B¹n nhËn ®­îc 1 b¸nh ch­ng May M¾n. ")
		WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName()..", nhËn ®­îc 1 g¹o nÕp may m¾n.")
	else
		Talk(1,"","B¹n kh«ng thÓ nhËn ®­îc g¹o nÕp may m¾n! ")
	end
end

function make()
	i=GetCash()
	if (i>=2000) then
	  Say("Lµm 1 c¸i B¸nh ch­ng cÇn 2000. Kh¸ch quan cÇn bao nhiªu c¸i?",7,"B¸nh ch­ng Nh©n t¸o/yes1","B¸nh ch­ng H¹t dÎ /yes2","B¸nh ch­ng ThÞt heo/yes3","B¸nh ch­ng ThÞt bß /yes4","B¸nh ch­ng ThËp cÈm/yes5","B¸nh ch­ng May m¾n /luckyzongzi","Kh«ng lµm g× hÕt/no")
	else
	  Talk(1,"","Lµm 1 c¸i B¸nh ch­ng cÇn 2000, kh¸ch quan h×nh nh­ ch­a ®ñ tiÒn! ")
	end
end;

function luckyzongzi()
	if ((GetItemCountEx(394)>=1) and (GetItemCountEx(395)>=1) and (GetItemCountEx(396)>=1) and (GetItemCountEx(405)>=1) and (GetItemCountEx(397)>=1) and (GetItemCountEx(398)>=1) and (GetItemCountEx(399)>=1)) then 
		Talk(1,"","§· lµm xong råi!  Xin h·y nh×n xem!  B¶o ®¶m võa ý! ")
	  	DelItemEx(394)
	  	DelItemEx(395)
	  	DelItemEx(396)
	  	DelItemEx(405)
	  	DelItemEx(397)
	  	DelItemEx(398)
	  	DelItemEx(399)
	  	AddItem(6,0,70,1,0,0,0)
	  	Msg2Player("B¹n nhËn ®­îc b¸nh ch­ng May M¾n. ")
		WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName()..", §· lµm xong b¸nh ch­ng may m¾n. ")
		Pay(2000)
	else
	  	Talk(1,"","Lµm B¸nh ch­ng may m¾n cÇn cã: T¸o ®á, h¹t dÎ, g¹o nÕp, thÞt heo, l¸ b¸nh, 1 <color=red>G¹o nÕp may m¾n<color>. Kh¸ch quan ch­a ®ñ vËt liÖu! ")
	end
end;

function yes1()
	if ((GetItemCountEx(394)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2)) then
	  Talk(1,"","§· lµm xong råi!  Xin h·y nh×n xem!  B¶o ®¶m võa ý! ")
	  DelItemEx(394)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(394)
	  DelItemEx(396)
	  DelItemEx(397)
	  AddItem(1,7,0,1,0,0,0)
	  Pay(2000)
	  Msg2Player("B¹n nhËn ®­îc b¸nh ch­ng t¸o ®á. ")
	else
	  Talk(1,"","Lµm B¸nh ch­ng nh©n t¸o cÇn cã: T¸o ®á, g¹o nÕp vµ l¸ b¸nh, mçi thø 2 c¸i. Kh¸ch quan ch­a ®ñ vËt liÖu! ")
	end
end;

function yes2()
	if ((GetItemCountEx(395)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2)) then
	  Talk(1,"","§· lµm xong råi!  Xin h·y nh×n xem!  B¶o ®¶m võa ý! ")
	  DelItemEx(395)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(395)
	  DelItemEx(396)
	  DelItemEx(397)
	  AddItem(6,0,60,1,0,0,0)
	  Pay(2000)
	  Msg2Player("B¹n nhËn ®­îc b¸nh ch­ng h¹t dÎ. ")
	else
	  Talk(1,"","Lµm B¸nh ch­ng h¹t dÎ cÇn cã: h¹t dÎ, g¹o nÕp vµ l¸ b¸nh, mçi thø 2 c¸i. Kh¸ch quan ch­a ®ñ vËt liÖu! ")
	end
end;

function yes3()
	if ((GetItemCountEx(395)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2) and (GetItemCountEx(398)>=2)) then 
	  Talk(1,"","§· lµm xong råi!  Xin h·y nh×n xem!  B¶o ®¶m võa ý! ")
	  DelItemEx(395)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(398)
	  DelItemEx(395)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(398)
	  AddItem(6,0,61,1,0,0,0)
	  Pay(2000)
	  Msg2Player("B¹n nhËn ®­îc b¸nh ch­ng thÞt heo. ")
	else
	  Talk(1,"","Lµm B¸nh ch­ng thÞt heo cÇn cã: h¹t dÎ, thÞt heo, g¹o nÕp vµ l¸ b¸nh, mçi thø 2 c¸i. Kh¸ch quan ch­a ®ñ vËt liÖu! ")
	end
end;


function yes4()
	if ((GetItemCountEx(394)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2) and (GetItemCountEx(399)>=2)) then 
	  Talk(1,"","§· lµm xong råi!  Xin h·y nh×n xem!  B¶o ®¶m võa ý! ")
	  DelItemEx(394)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(399)
	  DelItemEx(394)
	  DelItemEx(396)
	  DelItemEx(397)
	  DelItemEx(399)
	  AddItem(6,0,62,1,0,0,0)
	  Pay(2000)
	  Msg2Player("B¹n nhËn ®­îc b¸nh ch­ng thÞt bß. ")
	else
	  Talk(1,"","Lµm B¸nh ch­ng thÞt heo cÇn cã: thÞt heo, T¸o ®á, g¹o nÕp vµ l¸ b¸nh, mçi thø 2 c¸i. Kh¸ch quan ch­a ®ñ vËt liÖu! ")
	end
end;


function yes5()
	Say("Lµm b¸nh còng cã lóc bÞ thÊt b¹i!  Kh¸ch quan ®ång ý lµm kh«ng?",2,"§­îc. /yes6","Kh«ng ®­îc. /no")
end;

function yes6()
	if ((GetItemCountEx(394)>=2) and (GetItemCountEx(395)>=2) and (GetItemCountEx(396)>=2) and (GetItemCountEx(397)>=2) and (GetItemCountEx(398)>=2) and (GetItemCountEx(399)>=2)) then 
	  i=random(1,100)
	  if (i<=30) then	
	    Talk(1,"","§· lµm xong råi!  Xin h·y nh×n xem!  B¶o ®¶m võa ý! ")
	    DelItemEx(394)
	    DelItemEx(394)
	    DelItemEx(395)
	    DelItemEx(395)
	    DelItemEx(396)
	    DelItemEx(396)
	    DelItemEx(397)
	    DelItemEx(397)
	    DelItemEx(398)
	    DelItemEx(398)
	    DelItemEx(399)
	    DelItemEx(399)
	    AddItem(6,1,63,1,0,0,0)
	    Msg2Player("B¹n nhËn ®­îc b¸nh ch­ng tæng hîp ")
	    Pay(2000)
	  else
	    Talk(1,"","¤i Xin lçi!  Ta lµm háng råi! ")
	    DelItemEx(394)
	    DelItemEx(394)
	    DelItemEx(395)
	    DelItemEx(395)
	    DelItemEx(396)
	    DelItemEx(396)
	    DelItemEx(397)
	    DelItemEx(397)
	    DelItemEx(398)
	    DelItemEx(398)
	    DelItemEx(399)
	    DelItemEx(399)
	    Pay(2000)
	  end
	else
	  Talk(1,"","Lµm B¸nh ch­ng ThËp cÈm cÇn cã T¸o ®á, h¹t dÎ, g¹o nÕp, thÞt heo,thÞt heo vµ l¸ b¸nh, mçi thø 2 c¸i. Kh¸ch quan ch­a ®ñ vËt liÖu! ")
	end
end;

function skill()
	i=GetCash()
	if (i>=1000) then
	  if (GetItemCountEx(394) >= 1) then
	  		SetTaskTemp(51,394)
	  elseif (GetItemCountEx(395) >= 1) then
	  		SetTaskTemp(51,395)
	  elseif (GetItemCountEx(396) >= 1) then
	  		SetTaskTemp(51,396)
	  elseif (GetItemCountEx(397) >= 1) then
	  		SetTaskTemp(51,397)
	  elseif (GetItemCountEx(398) >= 1) then
	  		SetTaskTemp(51,398)
	  elseif (GetItemCountEx(399) >= 1) then
	  		SetTaskTemp(51,399)
	  end
	  Say("Tæ tiªn ta chuyªn lµm b¸nh ch­ng cèng n¹p cho Hoµng cung nh­ng truyÒn ®Õn ®êi ta ®· kh¸c biÖt rÊt nhiÒu!  NÕu kh¸ch quan ®ång ý, ta cã thÓ ®em b¸nh ch­ng tæng hîp trong tay ng­êi ®iÒu chÕ thµnh b¸nh ch­ng cèng n¹p trong truyÒn thuyÕt, chØ nhËn 1000 ng©n l­îng!  Thö kh«ng?",6,"B¸nh ch­ng ThËp cÈm MËt ong/yes7","B¸nh ch­ng ThËp cÈm B¸t böu/yes8","B¸nh ch­ng ThËp cÈm B¸ch qu¶ /yes9","B¸nh ch­ng ThËp cÈm Th­îng h¹ng/yes10","B¸nh ch­ng ThËp cÈm KhuÊt Nguyªn/yes11","Kh«ng lµm g× hÕt/no")
	else
	  Talk(1,"","Gia c«ng b¸nh nµy ph¶i mÊt 1000 ng©n l­îng. Kh¸ch quan kh«ng ®ñ tiÒn råi")
	end
end;

function yes7()
	flag=nil
	local temp=Shijin2mijian
	if ((HaveCommonItem(6,1,63)>0) and (GetTaskTemp(51) > 0)) then 
		if(GetItemCountEx(404)>0) then
			flag=1
			temp=Shijin2mijian+10
		end
		Talk(1,"","Xin h·y ®îi 1 l¸t! ")
	    	DelItemEx(GetTaskTemp(51))
	  	i=random(1,100)
	  	if (i<=temp) then	
	    		Talk(1,"","NghÖ thuËt lµm b¸nh tæ truyÒn qu¶ nhiªn kh«ng tÖ, ta ®· hoµn thµnh B¸nh ch­ng ThËp cÈm mËt ong")
	    		DelCommonItem(6,1,63)
	    		AddItem(6,1,64,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("B¹n nhËn ®­îc b¸nh ch­ng møt hoa qu¶! ")
	  	else
	    		Talk(1,"","ThÊt b¹i råi, B¸nh ch­ng tèt nh­ vËy kh«ng dÔ lµm ®©u, chØ cã thÓ ®­a cho kh¸ch quan B¸nh ch­ng ThËp cÈm nµy th«i! ")
	    		Pay(1000)
	    		Msg2Player("B¹n nhËn ®­îc b¸nh ch­ng tæng hîp ")
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	  	end
	else
	  	Talk(1,"","lµm B¸nh ch­ng ThËp cÈm mËt ong cÇn cã 1 phÇn B¸nh ch­ng ThËp cÈm vµ c¸c nguyªn liÖu kh¸c.Kh¸ch quan ch­a ®ñ vËt liÖu! ")
	end
end;

function yes8()
	flag=nil
	local temp=Mijian2babao
	if ((HaveCommonItem(6,1,64)>0) and (GetTaskTemp(51) > 0)) then 
		if(GetItemCountEx(404)>0) then
			flag=1
			temp=Mijian2babao+20
		end
	  	Talk(1,"","Xin h·y ®îi 1 l¸t! ")
	    	DelItemEx(GetTaskTemp(51))
	  	i=random(1,100)
	  	if (i<=temp) then	
	    		Talk(1,"","NghÖ thuËt lµm b¸nh tæ truyÒn qu¶ nhiªn kh«ng tÖ, ta ®· hoµn thµnh B¸nh ch­ng ThËp cÈm B¸t böu! ")
	    		DelCommonItem(6,1,64)
	    		AddItem(6,1,65,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("B¹n nhËn ®­îc b¸nh ch­ng B¸t Böu ")
  	  	else
	    		Talk(1,"","ThÊt b¹i råi, B¸nh ch­ng tèt nh­ vËy kh«ng dÔ lµm ®©u, chØ cã thÓ ®­a cho kh¸ch quan B¸nh ch­ng ThËp cÈm nµy th«i! ")
	    		DelCommonItem(6,1,64)
	    		AddItem(6,1,63,1,0,0,0)
	    		Pay(1000)
	    		Msg2Player("B¹n nhËn ®­îc b¸nh ch­ng tæng hîp ")
	    		if(flag) then
	    			DelItemEx(404)
	    		end
  	  	end
	else
	  	Talk(1,"","Lµm B¸nh ch­ng ThËp cÈm B¸t böu cÇn cã 1 phÇn B¸nh ch­ng ThËp cÈm vµ 1 B¸nh ch­ng bÊt kú kh¸c. Kh¸ch quan ch­a ®ñ vËt liÖu! ")
	end
end;


function yes9()
	flag=nil
	local temp=Babao2baiguo
	if ((HaveCommonItem(6,1,65)>0) and (GetTaskTemp(51) > 0)) then 
		if(GetItemCountEx(404)>0) then
			flag=1
			temp=Babao2baiguo+10
		end
	  	Talk(1,"","Xin h·y ®îi 1 l¸t! ")
	    	DelItemEx(GetTaskTemp(51))
	  	i=random(1,100)
	  	if (i<=temp) then	
	    		Talk(1,"","NghÖ thuËt lµm b¸nh tæ truyÒn qu¶ nhiªn kh«ng tÖ, ta ®· hoµn thµnh B¸nh ch­ng ThËp cÈm! ")
	    		DelCommonItem(6,1,65)
	    		AddItem(6,1,66,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("B¹n nhËn ®­îc B¸nh ch­ng ThËp cÈm! ")
	  	else
	    		Talk(1,"","ThÊt b¹i råi, B¸nh ch­ng tèt nh­ vËy kh«ng dÔ lµm ®©u, chØ cã thÓ ®­a cho kh¸ch quan B¸nh ch­ng ThËp cÈm nµy th«i! ")
	    		DelCommonItem(6,1,65)
	    		AddItem(6,1,63,1,0,0,0)
	    		Pay(1000)
	    		Msg2Player("B¹n nhËn ®­îc b¸nh ch­ng tæng hîp ")
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	  	end
	else
	  	Talk(1,"","Lµm B¸nh ch­ng ThËp cÈm b¸ch qu¶ cÇn 1 phÇn B¸nh ch­ng ThËp cÈm B¸t böu vµ mét B¸nh ch­ng bÊt kú. Kh¸ch quan ch­a ®ñ vËt liÖu! ")
	end
end;

function yes10()
	flag=nil
	local temp=Baiguo2shuijing
	if ((HaveCommonItem(6,1,66)>0) and (GetTaskTemp(51) > 0)) then 
		if(GetItemCountEx(404)>0) then
			flag=1
			temp=Baiguo2shuijing+5
		end
	  	Talk(1,"","Xin h·y ®îi 1 l¸t! ")
	    	DelItemEx(GetTaskTemp(51))
	  	i=random(1,100)
	  	if (i<=temp) then	
	    		Talk(1,"","NghÖ thuËt lµm b¸nh tæ truyÒn qu¶ nhiªn kh«ng tÖ, ta ®· hoµn thµnh B¸nh ch­ng ThËp cÈm Thñy Tinh! ")
	    		DelItemEx(398)
	    		DelItemEx(399)
	    		DelCommonItem(6,1,66)
	    		AddItem(6,1,67,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("B¹n nhËn ®­îc b¸nh ch­ng Thñy Tinh! ")
	  	else
	    		Talk(1,"","ThÊt b¹i råi, B¸nh ch­ng tèt nh­ vËy kh«ng dÔ lµm ®©u, chØ cã thÓ ®­a cho kh¸ch quan B¸nh ch­ng ThËp cÈm nµy th«i! ")
	    		DelCommonItem(6,1,66)
	    		AddItem(6,1,63,1,0,0,0)
	    		Pay(1000)
	    		if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("B¹n nhËn ®­îc b¸nh ch­ng tæng hîp ")
	  	end
	else
	  	Talk(1,"","Lµm B¸nh ch­ng ThËp cÈm Thñy Tinh cÇn 1 phÇn B¸nh ch­ng ThËp cÈm b¸ch qu¶ vµ 1 B¸nh ch­ng tïy ý. Kh¸ch quan ch­a ®ñ vËt liÖu! ")
	end
end;



function yes11()
	flag=nil
	local temp=Shuijing2quyuan
	if ((HaveCommonItem(6,1,67)>0) and (GetTaskTemp(51) > 0)) then 
		if (GetItemCountEx(404)>0) then
			flag = 1
			temp = Shuijing2quyuan + 3
		end
		Talk(1,"","Xin h·y ®îi 1 l¸t! ")
	   	DelItemEx(GetTaskTemp(51)) 
	  	i = random(1,100)
	  	if (i<=temp) then	
	   		Talk(1,"","§©y lµ B¸nh ch­ng ThËp cÈm KhuÊt Nguyªn!  Ha ha!  Hu hu!  Ta thµnh c«ng råi! ")
		        DelCommonItem(6,1,67)
		        sel=AddItem(6,1,68,1,0,0,0)
		        time=GetItemGenTime(sel)
		        name=GetName()
	   	 	Pay(1000)
	   	 	if(flag) then
	    			DelItemEx(404)
	    		end
	    		Msg2Player("B¹n nhËn ®­îc b¸nh ch­ng KhuÊt Nguyªn ")
	    		n = GetGlbValue(1)+1
	    		SetGlbValue(1,n)
				WriteLog(date("%H%M%S")..": Tµi kho¶n"..GetAccount()..", nh©n vËt"..GetName()..", ®· lµm thµnh c«ng b¸nh ch­ng KhuÊt Nguyªn! Sè B¸nh ch­ng ThËp cÈm KhuÊt Nguyªn h«m nay lµ "..n.."Con ")
    			AddGlobalNews("Nãi mäi ng­êi biÕt 1 tin vui, b¸nh ch­ng KhuÊt Nguyªn trong truyÒn thuyÕt ®· ®­îc lµm ra, mäi ng­êi tiÕp tôc nç lùc nhÐ! ")
		else
			Talk(1,"","ThÊt b¹i råi, B¸nh ch­ng tèt nh­ vËy kh«ng dÔ lµm ®©u, chØ cã thÓ ®­a cho kh¸ch quan B¸nh ch­ng ThËp cÈm nµy th«i! ")
			DelCommonItem(6,1,67)
			AddItem(6,1,63,1,0,0,0)
			Pay(1000)
			if(flag) then
	    			DelItemEx(404)
	    		end
			Msg2Player("B¹n nhËn ®­îc b¸nh ch­ng tæng hîp ")
		end
	else
		Talk(1,"","Lµm B¸nh ch­ng ThËp cÈm KhuÊt Nguyªn cÇn 1 phÇn B¸nh ch­ng ThËp cÈm Thñy Tinh vµ 1 B¸nh ch­ng tïy ý. Kh¸ch quan ch­a ®ñ vËt liÖu! ")
	end
end


function quyuan()
	Talk(1,"","KhuÊt Nguyªn MËt ph­¬ng lµ mËt tÞch tæ phô ta truyÒn l¹i, b©y giê bÞ mÊt råi!  C¸c vÞ cã thÓ gióp ta ®i t×m nã kh«ng?")
end;

function no()
end;
