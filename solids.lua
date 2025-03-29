local object = require("object")

local solid = {setmetatable, {__index = object}}

function solid:new(x, y, w, h, c, type)
    local atributo = object.new(self, x, y, w, h, c)
    setmetatable(atributo, {__index = solid})

    atributo.type = type

    atributo.tag = "solid"

    return atributo
end

function solid:update(dt)
    
end

function solid:draw()
    love.graphics.push()
    love.graphics.setColor(self.c)
    love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
    love.graphics.pop()
end

return solid