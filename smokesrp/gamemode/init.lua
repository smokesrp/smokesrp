include( "jobs.lua" )

AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )

include( "shared.lua" )
include( "params.lua" )

function GM:PlayerSpawn( ply )
	self.BaseClass:PlayerSpawn( ply )
	ply:setTeam(1);
	ply:SetGravity( 1 )
	ply:SetHealth( 100, true )
	
	ply:SetWalkSpeed( params.walkspeed )
	ply:SetRunSpeed( params.runspeed )
end

function GM:PlayerInitialSpawn( ply )
	self.BaseClass:PlayerSpawn( ply )
	for k,v in pairs( params.startcmds ) do //Run every command in the params.startcmds array
		ply:ConCommand( v )
	end
end

function GM:PlayerLoadout( ply )
	local lo = jobs[ply:Team()].loadout
	for index = 1, #lo do
		ply:Give(lo[index]);
	end
end