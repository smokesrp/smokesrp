function tables_exist()
	if (!sql.TableExists("smokesrp_money")) then
		query = "CREATE TABLE smokesrp_money ( unique_id varchar(255), money int )"
		result = sql.Query(query)
		if (sql.TableExists("smokesrp_money")) then
			Msg("Table was created!\n")
		else
			Msg("Error 1: Table was not created\n")
		end	
	end
end

function Initialize()
	tables_exist()
end
 
function PlayerInitialSpawn( ply )
 
	timer.Create("Steam_id_delay", 1, 1, function()
		SteamID = ply:SteamID()
		ply:SetNWString("SteamID", SteamID)
		player_exists( ply )
	end)
 end
 
hook.Add( "PlayerInitialSpawn", "PlayerInitialSpawn", PlayerInitialSpawn )
hook.Add( "Initialize", "Initialize", Initialize )
 
 
function player_exists( ply )
	steamID = ply:GetNWString("SteamID")
	result = sql.Query("SELECT unique_id, money FROM smokesrp_money WHERE unique_id = '"..steamID.."'")
	if (result) then
		sql_value_money( ply )
	else
		new_player( steamID, ply )
	end
end
 
function new_player( SteamID, ply )
	steamID = SteamID
	sql.Query( "INSERT INTO smokesrp_money (`unique_id`, `money`)VALUES ('"..steamID.."', '100')" )
	result = sql.Query( "SELECT unique_id, money FROM smokesrp_money WHERE unique_id = '"..steamID.."'" )
	if (result) then
		sql_value_money( ply )
	else
		Msg("Error 2: Players account was not created")
	end
end

function sql_value_money ( ply )
	unique_id = sql.QueryValue("SELECT unique_id FROM smokesrp_money WHERE unique_id = '"..steamID.."'")
	money = sql.QueryValue("SELECT money FROM smokesrp_money WHERE unique_id = '"..steamID.."'")
	ply:SetNWString("unique_id", unique_id)
	ply:SetNWInt("money", money)
end

function save ( ply )
	money = ply:GetNWInt("money")
	unique_id = ply:GetNWString ("SteamID")
	sql.Query("UPDATE smokesrp_money SET money = "..money.." WHERE unique_id = '"..unique_id.."'")
end