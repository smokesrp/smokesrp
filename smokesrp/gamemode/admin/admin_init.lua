if( !params.integratedadmin ) then
	return 0
end

admin = {} //create the main array
admin.admins = {} //create the array of all the admins

AddCSLuaFile( "cl_admin.lua" )
include( "commands.lua" )

util.AddNetworkString( "admin_init" ) //pool the net messages
util.AddNetworkString( "admin_req_cmds" )
util.AddNetworkString( "admin_send_cmds" )
util.AddNetworkString( "admin_exec" )
util.AddNetworkString( "admin_announce" )

if( !file.Exists( "admins.txt", "DATA" ) ) then //check if the admins.txt file exists if not creat it
	file.Write( "admins.txt", "" )
end

function admin.announce( color, text ) //send a color optional (red or green) message to all clients
	net.Start( "admin_announce" )
		net.WriteBit( color )
		net.WriteString( text )
	net.Broadcast()
end

function admin.message( target, color, text ) //send a color optional (red or green) message to ONE client
	net.Start( "admin_announce" )
		net.WriteBit( color )
		net.WriteString( text )
	net.Send( target )
end

hook.Add( "PlayerInitialSpawn", "admin_check", function( ply )
	for k,v in pairs( string.Explode( "\n", file.Read( "admins.txt", "DATA" ) )  ) do //run through an array created by seperating everything in the admins.txt file by \n
		if( v == ply:SteamID() ) then //check if there in there
			table.insert( admin.admins, ply ) //if so add them to the admin array
			net.Start( "admin_init" ) //then tell them to run cl_admin.lua
			net.Send( ply )
			admin.message( ply, true, "You have logged in as an admin." ) //send them the good news
		end
	end
end )

hook.Add( "PlayerDisconnected", "admin_leave_check", function( ply ) //if a player disconnects check if he was in the admin array, if so remove him
	for k,v in pairs( admin.admins ) do
		if( v == ply ) then
			table.remove( admin.admins, k )
		end
	end
end )

net.Receive( "admin_req_cmds", function( length, ply) //send the admin commands to clients that request them
	for i = 1, #admin.cmds.cmd do
		net.Start( "admin_send_cmds" )
			net.WriteString( admin.cmds.cmd[i] )
			net.WriteInt( i, 8 )
		net.Send( ply )
	end
end )