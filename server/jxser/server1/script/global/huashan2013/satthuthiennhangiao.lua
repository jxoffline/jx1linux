-- Edit by Youtube PGaming --

function OnDeath () 
if (GetTask(69) == 26) then
SetTask(69,27)
elseif (GetTask(69) == 27) then
SetTask(69,28)
elseif (GetTask(69) == 28) then
SetTask(69,29)
elseif (GetTask(69) == 29) then
SetTask(69,30)
elseif (GetTask(69) == 30) then
Msg2Player("§¹i hiÖp ®· tiªu diÖt toµn bé S¸t Thñ Thiªn NhÉn Gi¸o.") 
AddNote("§¹i hiÖp ®· tiªu diÖt toµn bé S¸t Thñ Thiªn NhÉn Gi¸o.")
SetTask(69,31)
end
end 


