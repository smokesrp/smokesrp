GM.Name			= "Smokes RP"
GM.Author		= "Dylan \"Laredef\" Stokes, Tyler \"Olaf\" Stokes, Christopher \"mrchris75\" Tosques"
GM.Email		= "smokesrp@gmail.com"
GM.Website		= ""

DeriveGamemode( "sandbox" )

team.SetUp( 1, "Citizen", Color( 125, 125, 125, 255 ) ) //Team guest
concommand.Add( "srp_citizen", function()
	ply:SetTeam( 1 )
	ply:Spawn()
	ply:PrintMessage( HUD_PRINTTALK, "You have become a "..team.GetName( ply:Team() ).."." )
end )