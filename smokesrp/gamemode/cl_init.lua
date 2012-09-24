include( "jobs.lua" )
include( "shared.lua" )
include( "admin/cl_admin.lua" )

function GM:HUDShouldDraw(hud) -- What should be draw
	if(hud == "CHudHealth" || hud == "CHudBattery" || hud == "CHudSuitPower") then
		return false -- These will not be drawn
	else
		return true -- Everything else will be drawn
	end
end

function DrawHud()
	-- Main Box --
	draw.RoundedBox(12, 10, ScrH()-90, 250, 65, Color(25,  25, 25, 150))
	-- Clients Name --
	draw.SimpleText( LocalPlayer():Nick(), "BudgetLabel", 55, ScrH() - 80, Color( 255, 255, 255, 255 ) )
	-- Clients Health --
	draw.SimpleText( "Health: "..LocalPlayer():Health(), "BudgetLabel", 55, ScrH() - 65, Color( 255, 255, 255, 255 ) )
	-- Clients Job --
	draw.SimpleText( "Job: "..jobs[LocalPlayer():Team()].name, "BudgetLabel", 55, ScrH() - 50, Color( 255, 255, 255, 255 ) )
end

function GM:HUDPaint()
	DrawHud() -- Paints the DrawHud function
	self.BaseClass:HUDPaint()
end

function GM:DrawDeathNotice(x, y)
    return
end