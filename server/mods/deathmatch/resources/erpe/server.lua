root = getRootElement()


addEventHandler("onPlayerJoin", root,
	function ()
		spawnPlayer(source, 0, 0, 3)
		setCameraTarget(source, source)
		fadeCamera(source, true)
		outputChatBox("Szia barát! Üdv Diószeg legjobb erpé szerverén..", source)
	end
)

addCommandHandler("skin",
	function ( player, command, skin )
		local skin = tonumber(skin)
		setElementModel(player, skin)
		outputChatBox("Megváltoztattad " .. getPlayerName(player) .. " skinjét ID" .. skin .. "-re.", player)
		outputChatBox("Megváltoztatták a skined " .. skin .. "-re.", player)		
	end
)