Include("\\script\\missions\\bw\\bwhead.lua");

function main()
	Say("Cã ph¶i ng­¬i muèn rêi khái l«i ®µi thi ®Êu kh«ng?",3,"Ph¶i, ta ra ®©y mét l¸t!/yes","Ta lµ ®éi tr­ëng, muèn biÕt sè thø tù vµo ®Êu tr­êng./OnShowKey","Kh«ng cÇn ®©u/no")
end;

function yes()
	LeaveGame();
	NewWorld(GetTask(BW_SIGNPOSWORLD), GetTask(BW_SIGNPOSX), GetTask(BW_SIGNPOSY));
end

function no()
end
