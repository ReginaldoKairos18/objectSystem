local object_system = require("ObjectSystem")

function love.load()
    object_system.load()
end

function love.update(dt)
    object_system.update(dt)
end

function love.draw()
    object_system.draw()
end