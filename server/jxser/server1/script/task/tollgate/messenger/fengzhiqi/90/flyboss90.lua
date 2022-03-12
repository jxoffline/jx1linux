-------------------------------------------------------------------------
-- FileName		:	enemy_flyboss90.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-13 11:19:14
-- Desc			:   ·çÖ®Æï¹Ø¿¨µÄ±êÖ¾boss½Å±¾[90ÒÔÉÏ¼¶]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_biaozhiboss.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --»ñµÃÍ¬°éÐÞÁ·µÄ±í¸ñ

------ÐÅÊ¹ÈÎÎñ·çÖ®Æï¶¨µãÉ±¹Ö±í¸ñ--------------
--Ð¡µØÍ¼×ø±êx£¬y£¬ÈËÎïÃû×Ö£¨60-79¼¶£©,
killfly3 ={
{184,189,"Gia LuËt Tµ Ch©m",1},
{181,183,"§¹i Tõ ",2},
{197,179,"§¹i Qu©n",3},
{197,172,"§¹i Khè ",4},
{198,163,"Gia LuËt LËp",5},
{190,160,"Gia LuËt N¨ng",6},
{164,162,"Hoµn Nhan Ph¸ Qu©n",7},
{164,172,"Hoµn Nhan MÖnh",8},
{178,190,"§¹i NhiÕp",9},
{178,187,"Gia LuËt Kh¸ch",10},
{169,190,"Hoµn Nhan Phu Binh",11},
{172,193,"Gia LuËt M· B«n",12},
{165,191,"§¹i Cï ",13},
{178,178,"Gia LuËt Bé ",14},
{186,183,"§¹i KhÊu",15},
}

-----ÐÅÊ¹ÈÎÎñ·çÖ®ÆïbossËÀÍöºóÔö¼Ó¹ÖÎïµÄ±í¸ñ----
--...£¬µÚÊ®ÏîÎªbossµÄ±àºÅ£¨60-79¼¶£©
killflyboss3 ={
--·çÖ®Æï90¼¶Ë¢³ö¹Ö
{831,100,389,1367,2619,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",1},
{831,100,389,1360,2624,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",1},
{831,100,389,1359,2616,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",1},
{831,100,389,1368,2567,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",2},
{831,100,389,1367,2578,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",2},
{831,100,389,1366,2562,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",2},
{831,100,389,1375,2670,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",3},
{831,100,389,1379,2677,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",3},
{831,100,389,1375,2673,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",3},
{831,100,389,1406,2599,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",4},
{831,100,389,1413,2602,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",4},
{831,100,389,1410,2612,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",4},
{831,100,389,1397,2631,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",5},
{831,100,389,1390,2642,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",5},
{831,100,389,1392,2619,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",5},
{831,100,389,1414,2634,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",6},
{831,100,389,1418,2646,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",6},
{831,100,389,1420,2639,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",6},
{831,100,389,1435,2661,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",7},
{831,100,389,1438,2670,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",7},
{831,100,389,1431,2670,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",7},
{831,100,389,1399,2682,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",8},
{831,100,389,1407,2682,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",8},
{831,100,389,1400,2691,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",8},
{831,100,389,1397,2739,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",9},
{831,100,389,1388,2728,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",9},
{831,100,389,1397,2724,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",9},
{831,100,389,1432,2715,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",10},
{831,100,389,1428,2719,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",10},
{831,100,389,1440,2721,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",10},
{831,100,389,1480,2612,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",11},
{831,100,389,1488,2622,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",11},
{831,100,389,1486,2615,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",11},
{831,100,389,1506,2645,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",12},
{831,100,389,1504,2652,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",12},
{831,100,389,1511,2641,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",12},
{831,100,389,1460,2654,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",13},
{831,100,389,1455,2653,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",13},
{831,100,389,1463,2663,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",13},
{831,100,389,1521,2663,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",14},
{831,100,389,1514,2679,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",14},
{831,100,389,1527,2680,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",14},
{831,100,389,1532,2742,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",15},
{831,100,389,1541,2735,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",15},
{831,100,389,1541,2744,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",15},
{831,100,389,1491,2771,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",16},
{831,100,389,1491,2781,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",16},
{831,100,389,1485,2780,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",16},
{831,100,389,1466,2751,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",17},
{831,100,389,1464,2740,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",17},
{831,100,389,1470,2742,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",17},
{831,100,389,1578,2786,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",18},
{831,100,389,1588,2801,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",18},
{831,100,389,1578,2806,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",18},
{831,100,389,1559,2707,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",19},
{831,100,389,1564,2709,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",19},
{831,100,389,1558,2721,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",19},
{831,100,389,1589,2564,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",20},
{831,100,389,1581,2557,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",20},
{831,100,389,1581,2568,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",20},
{831,100,389,1491,2570,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",21},
{831,100,389,1495,2564,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",21},
{831,100,389,1496,2583,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",21},
{831,100,389,1414,2561,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",22},
{831,100,389,1424,2554,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",22},
{831,100,389,1423,2568,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",22},
{831,100,389,1322,2704,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",23},
{831,100,389,1326,2697,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",23},
{831,100,389,1335,2718,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",23},
{831,100,389,1426,2782,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",24},
{831,100,389,1418,2773,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",24},
{831,100,389,1416,2785,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",24},
{831,100,389,1451,2823,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",25},
{831,100,389,1459,2836,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",25},
{831,100,389,1446,2825,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",25},
{831,100,389,1494,2860,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",26},
{831,100,389,1488,2865,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",26},
{831,100,389,1492,2874,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",26},
{831,100,389,1395,2889,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",27},
{831,100,389,1406,2875,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",27},
{831,100,389,1407,2890,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",27},
{831,100,389,1527,2916,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",28},
{831,100,389,1519,2916,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",28},
{831,100,389,1514,2899,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",28},
{831,100,389,1523,2958,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",29},
{831,100,389,1522,2967,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",29},
{831,100,389,1530,2969,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",29},
{831,100,389,1459,3026,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",30},
{831,100,389,1462,3036,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",30},
{831,100,389,1469,3027,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",30},
{831,100,389,1359,2935,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",31},
{831,100,389,1369,2940,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",31},
{831,100,389,1361,2924,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",31},
{831,100,389,1372,2844,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",32},
{831,100,389,1370,2833,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",32},
{831,100,389,1366,2830,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",32},
{831,100,389,1349,2803,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",33},
{831,100,389,1345,2807,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",33},
{831,100,389,1339,2806,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",33},
{831,100,389,1311,2894,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",34},
{831,100,389,1303,2882,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",34},
{831,100,389,1308,2870,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",34},
{831,100,389,1314,2935,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",35},
{831,100,389,1319,2943,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",35},
{831,100,389,1321,2931,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",35},
{831,100,389,1367,2987,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",36},
{831,100,389,1357,2996,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",36},
{831,100,389,1353,2983,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",36},
{831,100,389,1398,2969,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",37},
{831,100,389,1410,2979,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",37},
{831,100,389,1402,2985,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",37},
{831,100,389,1466,2990,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",38},
{831,100,389,1459,2992,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",38},
{831,100,389,1452,2991,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",38},
{831,100,389,1473,3090,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",39},
{831,100,389,1470,3099,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",39},
{831,100,389,1469,3082,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",39},
{831,100,389,1481,3149,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",40},
{831,100,389,1487,3151,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",40},
{831,100,389,1492,3157,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",40},
{831,100,389,1447,3159,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",41},
{831,100,389,1440,3160,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",41},
{831,100,389,1441,3146,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",41},
{831,100,389,1441,3083,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",42},
{831,100,389,1442,3089,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",42},
{831,100,389,1443,3086,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",42},
{831,100,389,1405,3132,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",43},
{831,100,389,1409,3149,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",43},
{831,100,389,1400,3105,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",43},
{831,100,389,1363,3162,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",44},
{831,100,389,1371,3161,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",44},
{831,100,389,1371,3145,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",44},
{831,100,389,1316,3156,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",45},
{831,100,389,1314,3139,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",45},
{831,100,389,1313,3124,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",45},
{831,100,389,1345,3070,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",46},
{831,100,389,1342,3060,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",46},
{831,100,389,1344,3036,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",46},
{831,100,389,1299,3033,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",47},
{831,100,389,1302,3013,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",47},
{831,100,389,1306,3004,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",47},
{831,100,389,1594,2935,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",48},
{831,100,389,1588,2931,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",48},
{831,100,389,1579,2920,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",48},
{831,100,389,1545,2890,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",49},
{831,100,389,1552,2892,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",49},
{831,100,389,1550,2875,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",49},
{831,100,389,1588,2969,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",50},
{831,100,389,1588,2978,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",50},
{831,100,389,1581,2972,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\90\\flyrefresh90.lua",50},

}


NPC_PARAM_ID = 1;        --ÓÃÔÚbossËÀÍöºóË¢³ö¹ÖÎïµÄÌØÊâÊÂ¼þÖÐ£¬Ôö¼ÓnpcµÄÊ±ºò×÷ÎªGetNpcParamµÄµÚ¶þÎ»£¬ÒâË¼ÊÇ¸Ãº¯ÊýÈ¡³öµÄÊÇ´ú±íÄ¿Ç°ËÀÍöbossIDµÄÊý×Ö   
FLYBOSS_RELIVE=120        --Ã¿¸ö±êÖ¾µÄÖØÉúÊ±¼ä
FLYBOSS_EXP=tonumber( TabFile_GetCell( "tollprize" ,4 ,"boss_exp"))    --Ã¿¸öbossµÄ¾­Ñé£¨60-79£©
FLYBOSS_MAPID=389        --µ±Ç°Íæ¼ÒËùÔÚµØÍ¼·çÖ®ÆïµÄµØÍ¼±àºÅ£¿£¿ÊÇ¶àÉÙ£¿£¿
FLYBOSS_MESSENGEREXP=tonumber( TabFile_GetCell( "tollprize" ,4 ,"boss_jifen"))  --Ã¿¸ö±êÖ¾boss±»´¥·¢£¬Íæ¼Ò»ñµÃ2¸ö»ý·Ö¡£

function main()
	local name = GetName()
	if (  messenger_middletime() == 10 ) then --Íæ¼ÒÔÚµØÍ¼ÖÐµÄÊ±¼ä
		Msg2Player("Xin lçi! "..name.."! B¹n ®· hÕt thêi gian thùc hiÖn nhiÖm vô TÝn sø! NhiÖm vô thÊt b¹i!.")
		losemessengertask()
	else
		Talk(1,"messenger_gogogo","B¹n ®· ®¹t ®­îc tiªu chÝ nµy.")
	end
end

