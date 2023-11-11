Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

function main()
	christmas_resettask();
	if (GetTask(christmas_bingjing_taskid) == 300000) then
		Say("§¹i hiÖp ®· sö dông §¹i B¨ng Tinh råi, kh«ng thÓ tiÕp tôc sö dông n÷a.", 0);
		return 1;
	end
	SetTask(christmas_bingjing_taskid, 200000);
	Say("HiÖn t¹i ®¹i hiÖp cã thÓ thu ®­îc kinh nghiÖm cao nhÊt lµ 2 tû.", 0);
end