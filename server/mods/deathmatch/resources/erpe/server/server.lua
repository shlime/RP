root = getRootElement()
MAX_PLAYERS = 32

local components = { "weapon", "ammo", "health", "clock", "money", "breath", "armour", "wanted" }

pInfo = { } -- TÖMB

function mysqlQueriesOnStart(res)
	createTables()
end
addEventHandler("onResourceStart", root, mysqlQueriesOnStart)

addEventHandler("onPlayerJoin", root,
	function ()
		spawnPlayer(source, 0, 0, 3)
		setCameraTarget(source, source)
		fadeCamera(source, true)
		outputChatBox("Szia barát! Üdv Diószeg legjobb erpé szerverén..", source)
		setPlayerNametagShowing ( source,  false ) 
		for _, component in ipairs( components ) do
			setPlayerHudComponentVisible(source, component, false )
		end
	end
)

addCommandHandler("skin",
	function ( player, command, targetID, skin )

		local skin = tonumber(skin)
		local targetID = tonumber(targetID)
		
		if(targetID == nil or skin == nil) then return outputChatBox("Használat: /skin [ID] [SkinID]", player) end
		if(targetID < 0 or targetID > MAX_PLAYERS) then return outputChatBox("ID 0-32", player) end
		if(skin < 0 or skin > 312) then return outputChatBox("skin: 0-312", player) end

		local target = getPlayerFromID(targetID)
		setElementModel(target, skin)
		outputChatBox("Megváltoztattad " .. getPlayerName(target) .. " skinjét ID" .. skin .. "-re.", player)
		outputChatBox("Megváltoztatták a skined " .. skin .. "-re.", target)		
	end
)

addCommandHandler("akocsi",
	function(player, command, vehicleID)

		local vehicleID = tonumber(vehicleID)
		local x,y,z = getElementPosition(player)

		local vehicle = createVehicle(vehicleID, 0,0,0)
		spawnVehicle(vehicle, x+5,y,z+1)
		if(spawnVehicle) then outputChatBox("Adminkocsi lehívva: ID" .. vehicleID, player) end
	end

)