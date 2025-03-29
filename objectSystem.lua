local object = require("object")
local player = require("player")
local solid = require("solids")
-- char = require("characteres")

local object_system = {}

local objects = {}

local box_1 = {}

object_system.createNew = function(class, q, x, y, w, h, color, type)
    for i = 1, q or 1 do
        table.insert(objects, class:new(x, y, w, h, color, type))
    end
end

object_system.destroyByID = function(id)
    table.remove(objects, id)
end

object_system.destroyByCord = function(x, y)
    for i, obj in pairs(objects) do
        if (x < obj.x+obj.w and x > obj.x) and (y < obj.y+obj.h and y > obj.y) then
            table.remove(objects, tonumber(i))
        end
    end
end

object_system.load = function()
    object_system.createNew(player, 1, 50, 50, 50, 50, {0,255,255})
    object_system.createNew(solid, 1, 0, love.graphics.getHeight()-150, love.graphics.getWidth(), 50, {0,255,0}, "solid")
end

object_system.update = function(dt)
    if love.keyboard.isDown("space") then
        object_system.destroyByID(1)
    end

    for i, obj in pairs(objects) do
        obj:update(dt, objects)
    end
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        object_system.createNew(solid, 1, love.mouse.getX(), love.mouse.getY(), 50, 50, {0,255,0}, "block")
    end
    if button == 2 then
        object_system.destroyByCord(x, y)
    end
end

object_system.draw = function()
    for i, obj in pairs(objects) do
        obj:draw()
    end
end


return object_system