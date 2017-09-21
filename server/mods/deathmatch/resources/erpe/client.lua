root = getRootElement()


addCommandHandler("skin",
	function ( player, command, target, skin )
		local skin = tonumber(skin)
		setPedSkin(target, skin)
		outputChatBox("Megváltoztattad " .. getPlayerName(target) .. " skinjét ID" .. skin .. "-re.", player)
		outputChatBox("Megváltoztatták a skined " .. skin .. "-re.", target)		
	end
)