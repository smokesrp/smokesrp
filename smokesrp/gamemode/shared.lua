GM.Name			= "Smokes RP"
GM.Author		= "Dylan \"Laredef\" Stokes, Tyler \"Olaf\" Stokes, Christopher \"mrchris75\" Tosques"
GM.Email		= "smokesrp@gmail.com"
GM.Website		= ""


DeriveGamemode( "sandbox" )

for index = 1, #jobs do
	concommand.Add( jobs[index].cmd, function()
		ply:SetTeam(index)
		ply:Spawn()
		ply:PrintMessage( HUD_PRINTTALK, "You have become a "..team.GetName( ply:Team() ).."." )
	end )
end