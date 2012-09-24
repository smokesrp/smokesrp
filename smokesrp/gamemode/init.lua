include( "jobs.lua" )

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
	self.BaseClass:PlayerSpawn( ply )
	for index = 1, #jobs do
		umsg.Start( "sendjobs", ply )
			umsg.String( jobs[index].cmd )
			umsg.Short( index )
		umsg.End()
	end
	timer.Create( ply:UniqueID(), 10, 1, function()
		for k,v in pairs( params.startcmds ) do //Run every command in the params.startcmds array
			ply:ConCommand( v )
		end
	end )
end

function GM:PlayerLoadout( ply )
	local lo = jobs[ply:Team()].loadout
	for index = 1, #lo do
		ply:Give(lo[index]);
	end
end