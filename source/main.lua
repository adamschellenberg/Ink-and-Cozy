import "CoreLibs/ui"
import "CoreLibs/graphics"
import "CoreLibs/nineslice"
import "CoreLibs/timer"

local gfx = playdate.graphics
local menuOptions = {"Sword", "Shield", "Arrow", "Sling", "Stone", "Longbow", "MorningStar", "Armour", "Dagger", "Rapier", "Skeggox", "War Hammer", "Battering Ram", "Catapult"}
local listview = playdate.ui.gridview.new(0, 10)
local scrollBackground = 'assets/images/scroll'
listview.backgroundImage = playdate.graphics.nineSlice.new(scrollBackground, 20, 23, 92, 28)
listview:setNumberOfRows(#menuOptions)
listview:setCellPadding(0, 0, 13, 10)
listview:setContentInset(24, 24, 13, 11)

function listview:drawCell(section, row, column, selected, x, y, width, height)
        if selected then
                gfx.fillRoundRect(x, y, width, 20, 4)
                gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
        else
                gfx.setImageDrawMode(gfx.kDrawModeCopy)
        end
        gfx.drawTextInRect(menuOptions[row], x, y+2, width, height, nil, "item", kTextAlignment.center)
end

function playdate.update()
--     gridview:drawInRect(20, 20, 180, 200)
    listview:drawInRect(0, 0, 20, 210)
    playdate.timer.updateTimers()
end