include( "jobs.lua" )
AddCSLuaFile( "jobs.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "sql.lua" )
include( "shared.lua" )
include( "params.lua" )
include("sql.lua")
include( "admin/admin_init.lua" )

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
end

function GM:PlayerLoadout( ply )
	local lo = jobs[ply:Team()].loadout
	for index = 1, #lo do
		ply:Give(lo[index]);
	end
end