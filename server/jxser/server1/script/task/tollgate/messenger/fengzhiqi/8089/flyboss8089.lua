-------------------------------------------------------------------------
-- FileName		:	enemy_flyboss8089.lua
-- Author		:	xiaoyang
-- CreateTime	:	2005-04-13 11:10:14
-- Desc			:   ·çÖ®Æï¹Ø¿¨µÄ±êÖ¾boss½Å±¾[80-89¼¶]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
Include("\\script\\task\\tollgate\\messenger\\fengzhiqi\\enemy_biaozhiboss.lua") 
Include("\\script\\task\\newtask\\newtask_head.lua") --µ÷ÓÃ nt_getTask Í¬²½±äÁ¿µ½¿Í»§¶ËµÄÀà
Include("\\script\\task\\tollgate\\messenger\\messenger_losetask.lua")  --È¡ÏûÈÎÎñ
Include("\\script\\task\\tollgate\\messenger\\messenger_timeer.lua")    --µ÷ÓÃ¼ÆÊ±Æ÷
TabFile_Load( "\\settings\\task\\tollgate\\messenger\\messenger_tollprize.txt" , "tollprize");	 --»ñµÃÍ¬°éÐÞÁ·µÄ±í¸ñ

------ÐÅÊ¹ÈÎÎñ·çÖ®Æï¶¨µãÉ±¹Ö±í¸ñ--------------
--Ð¡µØÍ¼×ø±êx£¬y£¬ÈËÎïÃû×Ö£¨60-79¼¶£©,
killfly2 ={
{184,189,"§¹i ThiÖn",1},
{181,183,"§¹i Ph­êng",2},
{197,179,"Hoµn Nhan Minh",3},
{197,172,"§¹i DiÖu",4},
{198,163,"Hoµn Nhan §an",5},
{190,160,"Gia LuËt H¹o Nam",6},
{164,162,"§¹i Cæ ",7},
{164,172,"Gia LuËt Minh",8},
{178,190,"Gia LuËt Khèc Ba",9},
{178,187,"Hoµn Nhan Thu©n",10},
{169,190,"§¹i Nan",11},
{172,193,"§¹i L¹i",12},
{165,191,"Hoµn Nhan Hoµ Y",13},
{178,178,"Gia LuËt Vô Nam",14},
{186,183,"Hoµn Nhan KhÊu",15},
}

-----ÐÅÊ¹ÈÎÎñ·çÖ®ÆïbossËÀÍöºóÔö¼Ó¹ÖÎïµÄ±í¸ñ----
--...£¬µÚÊ®ÏîÎªbossµÄ±àºÅ£¨60-79¼¶£©
killflyboss2 ={
--·çÖ®Æï80-89¼¶Ë¢³ö¹Ö
{828,85,388,1367,2619,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",1},
{828,85,388,1360,2624,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",1},
{828,85,388,1359,2616,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",1},
{828,85,388,1368,2567,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",2},
{828,85,388,1367,2578,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",2},
{828,85,388,1366,2562,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",2},
{828,85,388,1375,2670,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",3},
{828,85,388,1379,2677,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",3},
{828,85,388,1375,2673,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",3},
{828,85,388,1406,2599,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",4},
{828,85,388,1413,2602,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",4},
{828,85,388,1410,2612,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",4},
{828,85,388,1397,2631,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",5},
{828,85,388,1390,2642,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",5},
{828,85,388,1392,2619,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",5},
{828,85,388,1414,2634,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",6},
{828,85,388,1418,2646,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",6},
{828,85,388,1420,2639,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",6},
{828,85,388,1435,2661,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",7},
{828,85,388,1438,2670,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",7},
{828,85,388,1431,2670,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",7},
{828,85,388,1399,2682,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",8},
{828,85,388,1407,2682,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",8},
{828,85,388,1400,2691,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",8},
{828,85,388,1397,2739,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",9},
{828,85,388,1388,2728,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",9},
{828,85,388,1397,2724,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",9},
{828,85,388,1432,2715,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",10},
{828,85,388,1428,2719,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",10},
{828,85,388,1440,2721,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",10},
{828,85,388,1480,2612,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",11},
{828,85,388,1488,2622,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",11},
{828,85,388,1486,2615,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",11},
{828,85,388,1506,2645,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",12},
{828,85,388,1504,2652,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",12},
{828,85,388,1511,2641,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",12},
{828,85,388,1460,2654,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",13},
{828,85,388,1455,2653,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",13},
{828,85,388,1463,2663,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",13},
{828,85,388,1521,2663,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",14},
{828,85,388,1514,2679,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",14},
{828,85,388,1527,2680,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",14},
{828,85,388,1532,2742,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",15},
{828,85,388,1541,2735,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",15},
{828,85,388,1541,2744,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",15},
{828,85,388,1491,2771,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",16},
{828,85,388,1491,2781,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",16},
{828,85,388,1485,2780,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",16},
{828,85,388,1466,2751,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",17},
{828,85,388,1464,2740,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",17},
{828,85,388,1470,2742,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",17},
{828,85,388,1578,2786,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",18},
{828,85,388,1588,2801,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",18},
{828,85,388,1578,2806,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",18},
{828,85,388,1559,2707,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",19},
{828,85,388,1564,2709,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",19},
{828,85,388,1558,2721,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",19},
{828,85,388,1589,2564,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",20},
{828,85,388,1581,2557,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",20},
{828,85,388,1581,2568,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",20},
{828,85,388,1491,2570,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",21},
{828,85,388,1495,2564,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",21},
{828,85,388,1496,2583,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",21},
{828,85,388,1414,2561,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",22},
{828,85,388,1424,2554,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",22},
{828,85,388,1423,2568,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",22},
{828,85,388,1322,2704,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",23},
{828,85,388,1326,2697,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",23},
{828,85,388,1335,2718,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",23},
{828,85,388,1426,2782,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",24},
{828,85,388,1418,2773,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",24},
{828,85,388,1416,2785,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",24},
{828,85,388,1451,2823,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",25},
{828,85,388,1459,2836,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",25},
{828,85,388,1446,2825,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",25},
{828,85,388,1494,2860,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",26},
{828,85,388,1488,2865,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",26},
{828,85,388,1492,2874,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",26},
{828,85,388,1395,2889,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",27},
{828,85,388,1406,2875,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",27},
{828,85,388,1407,2890,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",27},
{828,85,388,1527,2916,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",28},
{828,85,388,1519,2916,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",28},
{828,85,388,1514,2899,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",28},
{828,85,388,1523,2958,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",29},
{828,85,388,1522,2967,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",29},
{828,85,388,1530,2969,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",29},
{828,85,388,1459,3026,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",30},
{828,85,388,1462,3036,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",30},
{828,85,388,1469,3027,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",30},
{828,85,388,1359,2935,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",31},
{828,85,388,1369,2940,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",31},
{828,85,388,1361,2924,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",31},
{828,85,388,1372,2844,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",32},
{828,85,388,1370,2833,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",32},
{828,85,388,1366,2830,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",32},
{828,85,388,1349,2803,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",33},
{828,85,388,1345,2807,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",33},
{828,85,388,1339,2806,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",33},
{828,85,388,1311,2894,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",34},
{828,85,388,1303,2882,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",34},
{828,85,388,1308,2870,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",34},
{828,85,388,1314,2935,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",35},
{828,85,388,1319,2943,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",35},
{828,85,388,1321,2931,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",35},
{828,85,388,1367,2987,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",36},
{828,85,388,1357,2996,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",36},
{828,85,388,1353,2983,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",36},
{828,85,388,1398,2969,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",37},
{828,85,388,1410,2979,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",37},
{828,85,388,1402,2985,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",37},
{828,85,388,1466,2990,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",38},
{828,85,388,1459,2992,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",38},
{828,85,388,1452,2991,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",38},
{828,85,388,1473,3090,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",39},
{828,85,388,1470,3099,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",39},
{828,85,388,1469,3082,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",39},
{828,85,388,1481,3149,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",40},
{828,85,388,1487,3151,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",40},
{828,85,388,1492,3157,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",40},
{828,85,388,1447,3159,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",41},
{828,85,388,1440,3160,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",41},
{828,85,388,1441,3146,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",41},
{828,85,388,1441,3083,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",42},
{828,85,388,1442,3089,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",42},
{828,85,388,1443,3086,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",42},
{828,85,388,1405,3132,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",43},
{828,85,388,1409,3149,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",43},
{828,85,388,1400,3105,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",43},
{828,85,388,1363,3162,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",44},
{828,85,388,1371,3161,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",44},
{828,85,388,1371,3145,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",44},
{828,85,388,1316,3156,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",45},
{828,85,388,1314,3139,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",45},
{828,85,388,1313,3124,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",45},
{828,85,388,1345,3070,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",46},
{828,85,388,1342,3060,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",46},
{828,85,388,1344,3036,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",46},
{828,85,388,1299,3033,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",47},
{828,85,388,1302,3013,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",47},
{828,85,388,1306,3004,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",47},
{828,85,388,1594,2935,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",48},
{828,85,388,1588,2931,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",48},
{828,85,388,1579,2920,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",48},
{828,85,388,1545,2890,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",49},
{828,85,388,1552,2892,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",49},
{828,85,388,1550,2875,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",49},
{828,85,388,1588,2969,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",50},
{828,85,388,1588,2978,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",50},
{828,85,388,1581,2972,1,"Kim Quèc Hæ B¸o Kþ ",1,"\\script\\task\\tollgate\\messenger\\fengzhiqi\\8089\\flyrefresh8089.lua",50},

}


NPC_PARAM_ID = 1;        --ÓÃÔÚbossËÀÍöºóË¢³ö¹ÖÎïµÄÌØÊâÊÂ¼þÖÐ£¬Ôö¼ÓnpcµÄÊ±ºò×÷ÎªGetNpcParamµÄµÚ¶þÎ»£¬ÒâË¼ÊÇ¸Ãº¯ÊýÈ¡³öµÄÊÇ´ú±íÄ¿Ç°ËÀÍöbossIDµÄÊý×Ö   
FLYBOSS_RELIVE=120        --Ã¿¸ö±êÖ¾µÄÖØÉúÊ±¼ä
FLYBOSS_EXP=tonumber( TabFile_GetCell( "tollprize" ,3 ,"boss_exp"))        --Ã¿¸öbossµÄ¾­Ñé£¨60-79£©
FLYBOSS_MAPID=388        --µ±Ç°Íæ¼ÒËùÔÚµØÍ¼·çÖ®ÆïµÄµØÍ¼±àºÅ£¨8089£©
FLYBOSS_MESSENGEREXP=tonumber( TabFile_GetCell( "tollprize" ,3 ,"boss_jifen"))  --Ã¿¸ö±êÖ¾boss±»´¥·¢£¬Íæ¼Ò»ñµÃ2¸ö»ý·Ö¡£

function main()
	local name = GetName()
	if (  messenger_middletime() == 10 ) then --Íæ¼ÒÔÚµØÍ¼ÖÐµÄÊ±¼ä
		Msg2Player("Xin lçi! "..name.."! B¹n ®· hÕt thêi gian thùc hiÖn nhiÖm vô TÝn sø! NhiÖm vô thÊt b¹i!.")
		losemessengertask()
	else
		Talk(1,"messenger_gogogo","B¹n ®· ®¹t ®­îc tiªu chÝ nµy.")
	end
end

