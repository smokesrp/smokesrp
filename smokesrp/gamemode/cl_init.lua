include("hud.lua")

function GM:HUDShouldDraw(hud) -- What should be draw
	if(hud == "CHudHealth" || hud == "CHudBattery" || hud == "CHudSuitPower") then
		return false -- These will not be drawn
	else
		return true -- Everything else will be drawn
	end
end