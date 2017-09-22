
hostanddbname = "host=127.0.0.1;dbname=ds_roleplay"
username = "root"
password = ""
port = 3306

local charset = "utf8";

connection = dbConnect( "mysql", hostanddbname, username, password)

if connection then
	outputDebugString( "Connection with database was successfully established." )
else
	outputDebugString( "Connection with database couldn't be established." )
end


function createTables()

	local query = dbQuery(connection, "CREATE TABLE IF NOT EXISTS felhasznalok (fnev VARCHAR(24), jelszo VARCHAR(24), date_reg DATETIME, date_lastlog DATETIME)")
	local result = dbPoll( query, -1 )
	if(result) then
		print("A \"felhasznalok\" tábla sikeresen létrehozva a szerver által.")
	end

	query = dbQuery(connection, "CREATE TABLE IF NOT EXISTS karakterek (keresztnev VARCHAR(24), vezeteknev VARCHAR(24), kor INT)")
	result = dbPoll( query, -1 )
	if(result) then
		print("A \"karakterek\" tábla sikeresen létrehozva a szerver által.")
	end

end

