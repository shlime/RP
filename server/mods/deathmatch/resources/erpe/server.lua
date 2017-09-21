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
		local target = tonumber(target)
		local targetName = getPlayerFromID(target)
		setElementModel(targetName, skin)
		outputChatBox("Megváltoztattad " .. getPlayerName(targetName) .. " skinjét ID" .. skin .. "-re.", player)
		outputChatBox("Megváltoztatták a skined " .. skin .. "-re.", targetName)		
	end
)