local object = {}

object.__index = object

function object:new(x, y, w, h, c)
    local atributo = setmetatable({}, object)

    atributo.x = x
    atributo.y = y
    atributo.w = w
    atributo.h = h
    atributo.c = c or {}

    return atributo
end

function object:update(dt)

end

function object:draw()
    love.graphics.push()
    love.graphics.setColor(self.c)
    love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
    love.graphics.pop()
end

return object