--Ph�n th��ng exp khi s� d�ng S� B� ��n
tbUseAward2_Exp=
{
	{szName = "�i�m Kinh Nghi�m", nExp=6000000,nRate=68},
	{szName = "�i�m Kinh Nghi�m", nExp=7000000,nRate=30},
	{szName = "�i�m Kinh Nghi�m", nExp=12000000,nRate=2},
}
--Ph�n th��ng exp khi s� d�ng Ch�n Long ��n
tbUseAward3_Exp=
{
	{szName = "�i�m Kinh Nghi�m", nExp=8000000,nRate=20},
	{szName = "�i�m Kinh Nghi�m", nExp=10000000,nRate=63},
	{szName = "�i�m Kinh Nghi�m", nExp=20000000,nRate=10},
	{szName = "�i�m Kinh Nghi�m", nExp=50000000,nRate=5},
	{szName = "�i�m Kinh Nghi�m", nExp=100000000,nRate=2},	
}

tbAward_Old = {--server c�
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 1",tbProp={6,1,3917,1,0,0},nCount=1,nRate=0.03},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 2",tbProp={6,1,3917,2,0,0},nCount=1,nRate=0.03},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 3",tbProp={6,1,3917,3,0,0},nCount=1,nRate=0.03},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 4",tbProp={6,1,3917,4,0,0},nCount=1,nRate=0.03},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 5",tbProp={6,1,3917,5,0,0},nCount=1,nRate=0.03},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 6",tbProp={6,1,3917,6,0,0},nCount=1,nRate=0.03},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 7",tbProp={6,1,3917,7,0,0},nCount=1,nRate=0.03},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 8",tbProp={6,1,3917,8,0,0},nCount=1,nRate=0.03},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 9",tbProp={6,1,3917,9,0,0},nCount=1,nRate=0.03},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 10",tbProp={6,1,3917,10,0,0},nCount=1,nRate=0.03},
	-- {szName="M� s�ch k� n�ng c�p 150",tbProp={6,1,3916,1,0,0},nCount=1,nRate=0.01},
	-- {szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=1,nRate=20,nBindState=-2},
	-- {szName="Ch�n Nguy�n ��n (��i)",tbProp={6,1,30229,1,0,0},nCount=1,nRate=25,nBindState=-2},
	-- {szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=50,nRate=5},
	-- {szName="Thi�n Ni�n H� Th� �",tbProp={6,1,2074,1,0,0},nCount=1,nRate=0.1},
	-- {szName="Ph�ng Nguy�t Qu� Dung",tbProp={6,1,127,1,0,0},nCount=1,nRate=0.02},
	-- {szName="C�ng Nguy�t Ph� Dung",tbProp={6,1,128,1,0,0},nCount=1,nRate=0.02},
	-- {szName="Huy�t Long ��ng C�p 5",tbProp={6,1,30289,5,0,0},nCount=1,nRate=2},
	-- {szName="Huy�t Long ��ng C�p 6",tbProp={6,1,30289,6,0,0},nCount=1,nRate=2},
	-- {szName="Huy�t Long ��ng C�p 8",tbProp={6,1,30289,8,0,0},nCount=1,nRate=1.5},
	-- {szName="Huy�t Long ��ng C�p 9",tbProp={6,1,30289,9,0,0},nCount=1,nRate=3},
	-- {szName="Huy�t Long ��ng C�p 12",tbProp={6,1,30289,12,0,0},nCount=1,nRate=2},
	-- {szName="Long ��m 20% (C� th� gia h�n)",tbProp={0,3499},nCount=1,nRate=0.01,nQuality = 1,nExpiredTime=10080,},
	-- {szName="Long ��m 30% (C� th� gia h�n)",tbProp={0,4856},nCount=1,nRate=0.008,nQuality = 1,nExpiredTime=10080,},
	-- {szName="Long ��m 40% (C� th� gia h�n)",tbProp={0,4857},nCount=1,nRate=0.005,nQuality = 1,nExpiredTime=10080,},
	-- {szName="Cu�ng Lan 2% (C� th� gia h�n)",tbProp={0,3501},nCount=1,nRate=0.01,nQuality = 1,nExpiredTime=10080,},
	-- {szName="Cu�ng Lan 3% (C� th� gia h�n)",tbProp={0,4860},nCount=1,nRate=0.006,nQuality = 1,nExpiredTime=10080,},
	-- {szName="Cu�ng Lan 4% (C� th� gia h�n)",tbProp={0,4861},nCount=1,nRate=0.004,nQuality = 1,nExpiredTime=10080,},
	-- {szName="Cu�ng Lan 5% (C� th� gia h�n)",tbProp={0,4862},nCount=1,nRate=0.002,nQuality = 1,nExpiredTime=10080,},
	-- {szName="M�nh X�ch L�n",tbProp={6,1,3391,1,0,0},nCount=1,nRate=5},
	-- {szName="X�ch L�n Ph�t Qu�n - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.02,tbParam={2,0,0,0,0,0}},
	-- {szName="X�ch L�n Kim Kh�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.005,tbParam={6,0,0,0,0,0}},
	-- {szName="X�ch L�n H�ng Li�n - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.02,tbParam={1,0,0,0,0,0}},
	-- {szName="X�ch L�n H� Uy�n - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.02,tbParam={4,0,0,0,0,0}},
	-- {szName="X�ch L�n Ng�c B�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.02,tbParam={9,0,0,0,0,0}},
	-- {szName="X�ch L�n H�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.02,tbParam={8,0,0,0,0,0}},
	-- {szName="X�ch L�n Y�u ��i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.02,tbParam={5,0,0,0,0,0}},
	-- {szName="X�ch L�n Th��ng Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.02,tbParam={3,0,0,0,0,0}},
	-- {szName="X�ch L�n H� Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.02,tbParam={10,0,0,0,0,0}},
	-- {szName="X�ch L�n Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.005,tbParam={7,0,0,0,0,0}},
	-- {szName="Thu�c t�ng tr��ng",tbProp={6,1,3454,1,0,0},nCount=1,nRate=0.2},
	-- {szName="M�t n� chi�n tr��ng V��ng Gi�",tbProp={0,11,647,1,0,0},nCount=1,nRate=0.3,nExpiredTime=10080, nUsageTime = 60},
	-- {szName = "�i�m Kinh Nghi�m", nExp=6000000,nRate=15.335},
	-- {szName = "�i�m Kinh Nghi�m", nExp=8000000,nRate=10},
	-- {szName = "�i�m Kinh Nghi�m", nExp=10000000,nRate=5},
	-- {szName = "�i�m Kinh Nghi�m", nExp=20000000,nRate=2},
	-- {szName = "�i�m Kinh Nghi�m", nExp=50000000,nRate=1},
}

tbAward_New = {--server m�i
	-- {szName="B�o R��ng Kim � Kh�i (l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=0.02,tbParam={2,0,0,0,0,0}},
	-- {szName="B�o R��ng Kim � Y (l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=0.02,tbParam={6,0,0,0,0,0}},
	-- {szName="B�o R��ng Kim � H�i (l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=0.02,tbParam={8,0,0,0,0,0}},
	-- {szName="B�o R��ng Kim � Y�u ��i (l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=0.02,tbParam={5,0,0,0,0,0}},
	-- {szName="B�o R��ng Kim � H� Uy�n (l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=0.02,tbParam={4,0,0,0,0,0}},
	-- {szName="B�o R��ng Kim � H�ng Li�n (l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=0.02,tbParam={1,0,0,0,0,0}},
	-- {szName="B�o R��ng Kim � B�i (l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=0.02,tbParam={9,0,0,0,0,0}},
	-- {szName="B�o R��ng Kim � Th��ng Gi�i (l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=0.02,tbParam={3,0,0,0,0,0}},
	-- {szName="B�o R��ng Kim � H� Gi�i (l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=0.02,tbParam={10,0,0,0,0,0}},
	-- {szName="B�o R��ng Kim � V� Kh� (l�a ch�n m�n ph�i)",tbProp={6,1,30180,1,0,0},nCount=1,nRate=0.02,tbParam={7,0,0,0,0,0}},
	-- {szName="B�ch H� Ph�t Qu�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.015,tbParam={2,0,0,0,0,0}},
	-- {szName="B�ch H� Kim Kh�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.01,tbParam={6,0,0,0,0,0}},
	-- {szName="B�ch H� H�ng Li�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.015,tbParam={1,0,0,0,0,0}},
	-- {szName="B�ch H� H� Uy�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.015,tbParam={4,0,0,0,0,0}},
	-- {szName="B�ch H� Ng�c B�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.015,tbParam={9,0,0,0,0,0}},
	-- {szName="B�ch H� H�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.015,tbParam={8,0,0,0,0,0}},
	-- {szName="B�ch H� Y�u ��i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.015,tbParam={5,0,0,0,0,0}},
	-- {szName="B�ch H� Th��ng Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.015,tbParam={3,0,0,0,0,0}},
	-- {szName="B�ch H� H� Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.015,tbParam={10,0,0,0,0,0}},
	-- {szName="B�ch H� Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.01,tbParam={7,0,0,0,0,0}},
	-- {szName="M�nh X�ch L�n",tbProp={6,1,3391,1,0,0},nCount=1,nRate=1.5},
	-- {szName="X�ch L�n Kim B�i",tbProp={6,1,3392,1,0,0},nCount=1,nRate=0.1},
	-- {szName="X�ch L�n L�nh",tbProp={6,1,3393,1,0,0},nCount=1,nRate=0.1},
	-- {szName="X�ch L�n Tr�o",tbProp={6,1,3394,1,0,0},nCount=1,nRate=0.1},
	-- {szName="X�ch L�n Gi�c",tbProp={6,1,3395,1,0,0},nCount=1,nRate=0.1},
	-- {szName="X�ch L�n T�nh",tbProp={6,1,3396,1,0,0},nCount=1,nRate=0.06},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 1",tbProp={6,1,3917,1,0,0},nCount=1,nRate=0.02},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 2",tbProp={6,1,3917,2,0,0},nCount=1,nRate=0.02},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 3",tbProp={6,1,3917,3,0,0},nCount=1,nRate=0.02},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 4",tbProp={6,1,3917,4,0,0},nCount=1,nRate=0.02},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 5",tbProp={6,1,3917,5,0,0},nCount=1,nRate=0.02},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 6",tbProp={6,1,3917,6,0,0},nCount=1,nRate=0.02},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 7",tbProp={6,1,3917,7,0,0},nCount=1,nRate=0.02},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 8",tbProp={6,1,3917,8,0,0},nCount=1,nRate=0.02},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 9",tbProp={6,1,3917,9,0,0},nCount=1,nRate=0.02},
	-- {szName="K� n�ng c�p 150 c�p 21 C�p 10",tbProp={6,1,3917,10,0,0},nCount=1,nRate=0.02},
	-- {szName="M� s�ch k� n�ng c�p 150",tbProp={6,1,3916,1,0,0},nCount=1,nRate=0.005},
	-- {szName="Ch�n Nguy�n ��n (trung)",tbProp={6,1,30228,1,0,0},nCount=1,nRate=30,nBindState=-2},
	-- {szName="Ch�n Nguy�n ��n (��i)",tbProp={6,1,30229,1,0,0},nCount=1,nRate=20,nBindState=-2},
	-- {szName="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=20,nRate=10},
	-- {szName="V� L�m M�t T�ch",tbProp={6,1,26,1,0,0},nCount=1,nRate=0.2,nExpiredTime=43200},
	-- {szName="T�y T�y Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=0.2,nExpiredTime=43200},
	-- {szName="Thi�n Ni�n H� Th� �",tbProp={6,1,2074,1,0,0},nCount=1,nRate=0.1},
	-- {szName="Ph�ng Nguy�t Qu� Dung",tbProp={6,1,127,1,0,0},nCount=1,nRate=0.05},
	-- {szName="C�ng Nguy�t Ph� Dung",tbProp={6,1,128,1,0,0},nCount=1,nRate=0.05},
	-- {szName="Huy�t Long ��ng C�p 5",tbProp={6,1,30289,5,0,0},nCount=1,nRate=1},
	-- {szName="Huy�t Long ��ng C�p 6",tbProp={6,1,30289,6,0,0},nCount=1,nRate=1},
	-- {szName="Long ��m 20% (kh�ng th� gia h�n)_4485",tbProp={0,4485},nCount=1,nRate=0.04,nQuality = 1,nExpiredTime=10080,},
	-- {szName="Cu�ng Lan 2% (kh�ng th� gia h�n)_4489",tbProp={0,4489},nCount=1,nRate=0.04,nQuality = 1,nExpiredTime=10080,},
	-- {szName="T�c Hi�u B�ch C�u Ho�n c�p 150",tbProp={6,1,2975,1,0,0},nCount=1,nRate=3,nExpiredTime=20160},
	-- {szName="Thu�c t�ng tr��ng",tbProp={6,1,3454,1,0,0},nCount=1,nRate=0.1},
	-- {szName="Ng�n l��ng",nJxb=1000000,nCount=1,nRate=2},
	-- {szName="H�ng bao An khang",tbProp={6,1,2105,1,0,0},nCount=1,nRate=0.02},
	-- {szName="H�ng bao Sum v�y",tbProp={6,1,2104,1,0,0},nCount=1,nRate=0.02},
	-- {szName="T� Kim Ch�n ��n",tbProp={6,1,2263,1,0,0},nCount=1,nRate=0.02,tbParam={2000000000}},
	-- {szName="Huy�n Ch�n ��n",tbProp={6,1,1678,1,0,0},nCount=1,nRate=0.02,tbParam={1500000000}},
	-- {szName="Huy�t Ch�n ��n",tbProp={6,1,1677,1,0,0},nCount=1,nRate=0.02,tbParam={1000000000}},
	{szName = "�i�m Kinh Nghi�m", nExp=6000000,nRate=11.615},
	{szName = "�i�m Kinh Nghi�m", nExp=8000000,nRate=8},
	{szName = "�i�m Kinh Nghi�m", nExp=10000000,nRate=7},
	{szName = "�i�m Kinh Nghi�m", nExp=20000000,nRate=2},
	{szName = "�i�m Kinh Nghi�m", nExp=50000000,nRate=1},
}

--ph�n th��ng ��t m�c
tbAward_Limit_Old =
{ --Ph�n th��ng ��t m�c c� ��nh, server c�
	-- ["500"] =
	-- 	{
	-- 		{szName="Long ��m 30% (Kh�ng th� gia h�n)",tbProp={0,4486},nCount=1,nRate=50,nQuality = 1,nExpiredTime=20160,},
	-- 		{szName="Cu�ng Lan 4% (Kh�ng th� gia h�n)",tbProp={0,4491},nCount=1,nRate=50,nQuality = 1,nExpiredTime=20160,},
	-- 	},
	-- ["1000"] = {
	-- 					{
	-- 						{szName="Phi Phong C�p Ph� Quang (h�a gi�i s�t th��ng)",tbProp={0,3477},nCount=1,nRate=50,nQuality = 1,nExpiredTime=20160,},
	-- 						{szName="Phi Phong Ph� Quang ( tr�ng k�ch)",tbProp={0,3478},nCount=1,nRate=50,nQuality = 1,nExpiredTime=20160,},							
	-- 					},
	-- 					{
	-- 						{szName="Huy�t Long ��ng C�p 5",tbProp={6,1,30289,5,0,0},nCount=10,nRate=20},
	-- 						{szName="Huy�t Long ��ng C�p 6",tbProp={6,1,30289,6,0,0},nCount=10,nRate=20},
	-- 						{szName="Huy�t Long ��ng C�p 8",tbProp={6,1,30289,8,0,0},nCount=10,nRate=20},
	-- 						{szName="Huy�t Long ��ng C�p 9",tbProp={6,1,30289,9,0,0},nCount=10,nRate=20},
	-- 						{szName="Huy�t Long ��ng C�p 12",tbProp={6,1,30289,12,0,0},nCount=10,nRate=20},
	-- 					},	
	-- 				},
	-- ["2000"] = {
	-- 					{szName="M�t n� chi�n tr��ng V��ng Gi�",tbProp={0,11,647,1,0,0},nCount=1,nExpiredTime=10080,},
	-- 					{pFun = function (nItemCount, szLogTitle)	
	-- 						SetTask(4000, GetTask(4000) + 8000)
	-- 						Msg2Player(format("Nh�n ���c %d �i�m Ch�n Nguy�n", 8000))
	-- 					 end},
	-- 					 {szName ="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=4000,},
	-- 				},
}
	
tbAward_Limit_New =
{ --Ph�n th��ng ��t m�c c� ��nh, server m�i
	-- ["500"] = 
	-- 	{
	-- 		{
	-- 			{szName="Ho�ng Kim �n C�p 7 (C��ng h�a)",tbProp={0,3211},nCount=1,nRate=50 ,nQuality = 1,nExpiredTime=43200,},
	-- 			{szName="Ho�ng Kim �n C�p 7 (Nh��c h�a)",tbProp={0,3221},nCount=1,nRate=50 ,nQuality = 1,nExpiredTime=43200,},
	-- 		},
	-- 		{
	-- 			{pFun = function (nItemCount, szLogTitle)	
	-- 				SetTask(4000, GetTask(4000) + 3000)
	-- 				Msg2Player(format("Nh�n ���c %d �i�m Ch�n Nguy�n", 3000))
	-- 			end},
	-- 		},
	-- 		{
	-- 			{szName ="H� M�ch ��n",tbProp={6,1,3203,1,0,0},nCount=2000},
	-- 		},
	-- 	},
	-- ["1000"] = {
	-- 					{szName="Phi Phon Ng� Phong (h�a gi�i s�t th��ng)",tbProp={0,3474},nCount=1,nQuality = 1,nExpiredTime=10080,},
	-- 					{szName="Huy�t Long ��ng C�p 5",tbProp={6,1,30289,5,0,0},nCount=10,},
	-- 				},
	-- ["2000"] = {
	-- 					{szName="Phi�n V� ",tbProp={0,10,7,1,0,0},nCount=1,nExpiredTime=43200},
	-- 					{szName="Huy�t Long ��ng C�p 6",tbProp={6,1,30289,6,0,0},nCount=10,},
	-- 				},
}

