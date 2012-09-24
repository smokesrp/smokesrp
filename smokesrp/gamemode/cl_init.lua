function GM:HUDShouldDraw(hud) -- What should be draw
	if(hud == "CHudHealth" || hud == "CHudBattery" || hud == "CHudSuitPower") then
		return false -- These will not be drawn
	else
		return true -- Everything else will be drawn
	end
end

function DrawHud()
	-- Main Box --
	draw.RoundedBox(12, 10, ScrH()-65, 250, 53, Color(25,  25, 25, 150))
	-- Clients Name --
	draw.SimpleText( LocalPlayer():Nick(), "CloseCaption_Bold", 55, ScrH() - 55, Color( 255, 255, 255, 255 ) )
end

function GM:HUDPaint()
	DrawHud() -- Paints the DrawHud function
	self.BaseClass:HUDPaint()
end