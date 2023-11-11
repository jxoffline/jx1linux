tbAward_A = { --Phan thuong thu ho¹ch		
	{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=1,nRate=30},
	{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=2,nRate=8},
	{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=3,nRate=4},
	{szName="Ch©n Nguyªn §¬n (trung)",
			pFun = function (tbItem, nItemCount, szLogTitle)
				local tbItemName = {szName="Ch©n Nguyªn §¬n (trung)", tbProp={6,1,30228,1,0,0},nCount=1,nBindState=-2}
				if CalcFreeItemCellCount() > 1 then 
					tbAwardTemplet:Give(tbItemName, 1, {"GH_2012", "TrongCayThienLocNhanThuong1CND"})		
				end
			end,
			nRate=30										
	},
	{szName="Ch©n Nguyªn §¬n (trung)",
			pFun = function (tbItem, nItemCount, szLogTitle)
				local tbItemName = {szName="Ch©n Nguyªn §¬n (trung)", tbProp={6,1,30228,1,0,0},nCount=2,nBindState=-2}
				if CalcFreeItemCellCount() > 1 then 
					tbAwardTemplet:Give(tbItemName, 1, {"GH_2012", "TrongCayThienLocNhanThuong2CND"})		
				end
			end,
			nRate=3										
	},
	{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.05,nExpiredTime=43200},
	{szName="Méc Nh©n LÖnh",tbProp={6,1,30105,1,0,0},nCount=5,nRate=3.65},
	{szName="Cèng HiÕn LÔ bao",tbProp={6,1,30214,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="Phong V©n Phi Tèc hoµn",tbProp={6,1,190,1,0,0},nCount=10,nRate=5,nExpiredTime=20160},
	{szName="Cµn Kh«n T¹o Hãa §an (®¹i) ",tbProp={6,1,215,1,0,0},nCount=10,nRate=5},
	{szName="Phong V©n Chiªu Binh LÖnh",tbProp={6,1,30083,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="LÖnh bµi Tèng Kim",tbProp={6,1,157,1,0,0},nCount=10,nRate=5},
	{szName="Anh Hïng ThiÕp",tbProp={6,1,1604,1,0,0},nCount=1,nRate=2,nExpiredTime=20160},
	{szName="Qu¶ Hoµng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	{szName="KiÕn ThiÕt LÔ Bao",tbProp={6,1,30216,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	{szName="NhÊt Kû Cµn Kh«n Phï",tbProp={6,1,2126,1,0,0},nCount=1,nRate=0.3,nExpiredTime=43200},
}
