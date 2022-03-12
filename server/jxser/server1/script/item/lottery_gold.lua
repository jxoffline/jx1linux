-- 黄金彩票
-- Fanghao Wu
-- 2004.11.13

function main( nItemIdx )
	local szDesc;
	szDesc = "<color=yellow>彩票幸运号码：\n\n";
	szDesc = szDesc..Lottery_GetDesc( "lottery_gold", nItemIdx );
	szDesc = szDesc.."<color>";
	Talk( 1, "", szDesc );
	return 1;
end

function GetDesc( nItem )
	local szDesc;
	local nIssueID, nIDCount;
	local nPayYear1, nPayMonth1, nPayDay1, nPayYear2, nPayMonth2, nPayDay2;
	
	nIssueID = GetItemParam( nItem, 1 );
	nIDCount = GetItemParam( nItem, 4 ) -  GetItemParam( nItem, 3 ) + 1;
	nPayPrizeDate1 = GetItemParam( nItem, 5 );
	nPayPrizeDate2 = GetItemParam( nItem, 6 );
	
	nPayYear1 = 2000 + nPayPrizeDate1 / 10000;
	nPayMonth1 = mod( nPayPrizeDate1 / 100, 100 );
	nPayDay1 = mod( nPayPrizeDate1 , 100 );
	nPayYear2 = 2000 + nPayPrizeDate2 / 10000;
	nPayMonth2 = mod( nPayPrizeDate2 / 100, 100 );
	nPayDay2 = mod( nPayPrizeDate2 , 100 );
	
	szDesc = "<color=yellow>"
	szDesc = szDesc..format( "\n彩票发行期号： 第%03d期         ", nIssueID );
	szDesc = szDesc..format( "\n彩票开奖时间： %04d-%02d-%02d 10:00", nPayYear1, nPayMonth1, nPayDay1 );
	szDesc = szDesc..format( "\n兑奖截止时间： %04d-%02d-%02d 10:00", nPayYear2, nPayMonth2, nPayDay2 );
	szDesc = szDesc..format( "\n\n%d个幸运号码（右键点击查看）\n", nIDCount );
	szDesc = szDesc.."<color>";

	return szDesc;
end