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
	function ( player, command, target, skin )
		local skin = tonumber(skin)
		local targetID = getPlayerFromName(target)
		setElementModel(targetID, skin)
		outputChatBox("Megváltoztattad " .. getPlayerName(target) .. " skinjét ID" .. skin .. "-re.", player)
		outputChatBox("Megváltoztatták a skined " .. skin .. "-re.", targetID)		
	end
)