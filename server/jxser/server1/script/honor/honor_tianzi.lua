-------------------------------------------------------------------------
-- FileName		:	honor_tianzi.lua
-- Author		:   zhangyifan
-- CreateTime	:	2009-05-12
-- Desc			:   Ìì×Ónpc
-------------------------------------------------------------------------

Include( "\\script\\honor\\honor_head.lua" )
Include( "\\script\\lib\\say.lua" );

function main()
	tbHonor_Sys_2009:tianzi_main()
end

function tbHonor_Sys_2009:tianzi_main()
    saypage(getn(self.tbHonor_Tianzi_List.tbHistory), 3, "tbHonor_Sys_2009:page_gen", -1);
end

tbHonor_Sys_2009.tbScoreTitle = 
{
    [1] = {nValue = -3000, strTitle = "H«n qu©n"},
    [2] = {nValue = -1001, strTitle = "Dung qu©n"},
    [3] = {nValue = -101, strTitle = "V« vÞ"},
    [4] = {nValue = 100, strTitle = "Thanh tÞnh"},
    [5] = {nValue = 1000, strTitle = "H÷u vÞ"},
    [6] = {nValue = 3000, strTitle = "Minh qu©n"},
    [7] = {nValue = 3000, strTitle = "Th¸nh Qu©n"},
}


tbHonor_Sys_2009.tbCapital = 
{
    [0] = "BiÖn Kinh",
    [1] = "L©m An",
}

function tbHonor_Sys_2009:page_gen(tb_pageinfo, str_parameter)
    local strContent;
    local tbOption = {"Rêi khái/#tbHonor_Sys_2009:tianzi_onCancel()",};
    local tbContent = {};
	
	for i = tb_pageinfo.from, tb_pageinfo.to do
	    local strGeneration;
	    
	    local tbTianzi = self.tbHonor_Tianzi_List.tbHistory[i];
	    local strEmperor;
	    local strBeginTime;
	    local strEndTime;
	    local strTitle;
	    local strTong;
	    local strScore;
	    local strCapital;
	    
	    if (i == 1) then
	        strGeneration = "§­¬ng kim th¸nh th­îng";
	    else
	        strGeneration = format("Thiªn tö ®êi thø %d", tb_pageinfo.total - i + 1);
	    end
	    
	    if(tbTianzi.szEmperor == nil or tbTianzi.szEmperor == "") then
            strEmperor = "V« hÖ ";
	        strTitle = "V« hÖ ";
	        strBeginTime = "<color=yellow>V«<color>";
	        strEndTime = "<color=yellow>V«<color>";
	        strTong = "V« hÖ ";
	        strScore = "V« hÖ "
	        
	        strCapital = "V« hÖ "
	    else
	        strEmperor = tbTianzi.szEmperor;
	        strTitle = tbTianzi.szTitle;
	        strBeginTime = format("<color=green>%d<color> n¨m <color=green>%02d<color> th¸ng <color=green>%02d<color> ngµy", floor(tbTianzi.nBeginTime/10000), floor(mod(tbTianzi.nBeginTime,10000)/100), mod(tbTianzi.nBeginTime,100));

	        if (tbTianzi.nEndTime == 0) then
	            strEndTime = "<color=yellow>V«<color>";
	        else
	            strEndTime = format("<color=green>%d<color> n¨m <color=green>%02d<color> th¸ng <color=green>%02d<color> ngµy", floor(tbTianzi.nEndTime/10000), floor(mod(tbTianzi.nEndTime,10000)/100), mod(tbTianzi.nEndTime,100));
	        end

	        strTong = tbTianzi.szTong;
	        for j = 1, getn(self.tbScoreTitle) do
                if ((strScore == nil or strScore == "") and tbTianzi.nScore <= self.tbScoreTitle[j].nValue) then
                    strScore = self.tbScoreTitle[j].strTitle;
                end
            end
            if (strScore == nil or strScore == "") then
                strScore = self.tbScoreTitle[getn(self.tbScoreTitle)].strTitle;
            end
            strCapital = self.tbCapital[tbTianzi.nSide];
	    end
	   tbContent[getn(tbContent) + 1] = 
        {
            format("%s: <color=yellow>%s<color>", strGeneration, strEmperor),
        }
        tbContent[getn(tbContent) + 1] = 
        {
			format("Quèc hiÖu: <color=yellow>%s<color>", strTitle),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("§¨ng quang: %s", strBeginTime),
        }   
        tbContent[getn(tbContent) + 1] = 
        {
			format("Bang héi: <color=yellow>%s<color>", strTong),
        }      
        tbContent[getn(tbContent) + 1] = 
        {
            format("Tho¸i vÞ: %s", strEndTime),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("Hoµng thµnh: <color=yellow>%s<color>", strCapital),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            format("Ng­êi ®êi ®¸nh gi¸: <color=yellow>%s<color>", strScore),
        }
        tbContent[getn(tbContent) + 1] = 
        {
            "--------------------------------------------",
        }
	end
   
    local var_width = {50}
    local var_align = 1
	
	strContent = maketable(tbContent, var_width, var_align);
	
    return strContent, tbOption;
end

function tbHonor_Sys_2009:tianzi_onCancel()
end