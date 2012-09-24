include( "jobs.lua" )
AddCSLuaFile( "jobs.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
include( "shared.lua" )
include( "params.lua" )

function GM:PlayerSpawn( ply )
	self.BaseClass:PlayerSpawn( ply )
	ply:SetGravity( 1 )
	ply:SetHealth( 100, true )
	ply:SetWalkSpeed( params.walkspeed )
	ply:SetRunSpeed( params.runspeed )
end

function GM:PlayerInitialSpawn( ply )
	ply:SetTeam( 1 )
	self.BaseClass:PlayerSpawn( ply )
	for k,v in pairs( params.startcmds ) do //Run every command in the params.startcmds array
		ply:ConCommand( v )
	end
end

function GM:PlayerLoadout( ply )
	for k,v in pairs( player.GetAll() ) do
		v:PrintMessage( HUD_PRINTTALK, ply:Team() )
	end
	local lo = jobs[ply:Team()].loadout
	for index = 1, #lo do
		ply:Give(lo[index]);
	end
end