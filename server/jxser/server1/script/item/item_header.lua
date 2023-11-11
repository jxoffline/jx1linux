-- 物品相关的系统函数
-- Fanghao Wu 2005.1.21

IncludeLib( "ITEM" );
IncludeLib( "FILESYS" );

function makeItemFilePath( nItemVer, strFileName )
	if( strFileName ~= nil ) then
		return format( "\\settings\\item\\%03d\\%s", nItemVer, strFileName );
	end
end

function loadItemTabFiles( strFileName )
	local nLatestItemVer = ITEM_GetLatestItemVersion();
	for i = 0, nLatestItemVer do
		local strFullPath = makeItemFilePath( i, strFileName );
		TabFile_Load( strFullPath, strFullPath );
	end
end