local object = require("object")
local colision = require("colisionSystem")

local player = {setmetatable, {__index = object}}

function player:new(x, y, w, h, c)
    local atributo = object.new(self, x, y, w, h, c)
    setmetatable(atributo, {__index = player})

    atributo.tag = "player"
    atributo.gravity = 2000
    atributo.vely = 0

    atributo.jumpForce = -750
    atributo.speed = 500

    atributo.colisionSolid = false

    return atributo
end 

function player:update(dt, objects)
    self:Gravity(dt)
    self:ColisionWithSolids(objects)
    self:Movement(dt)
end

function player:Movement(dt)
    if love.keyboard.isDown("d") then
        self.x = self.x + self.speed*dt
    end
    if love.keyboard.isDown("a") then
        self.x = self.x - self.speed*dt
    end
    if self.colisionSolid and love.keyboard.isDown("w") then
        self.vely = self.jumpForce
    end
end

function player:Gravity(dt)
    self.vely = self.vely + self.gravity*dt
    self.y = self.y + self.vely*dt
end

function player:ColisionWithSolids(objects)
    self.colisionSolid = false
    for i, obj in pairs(objects) do
        if obj.tag == "solid" then
            if obj.type == "solid" then
                if colision.isOnColsiion(self, obj) then
                    self.colisionSolid = true
                    self.vely = 0
                    self.y = obj.y - self.h
                end
            elseif obj.type == "block" then
                if colision.isOnColsiionTop(self, obj) and self.y + self.h <= obj.y + obj.h and self.vely >= 0 then
                    self.colisionSolid = true   
                    self.vely = 0
                    self.y = obj.y - self.h
                end
            end
        end
    end
end

function player:draw()
    love.graphics.push()
    love.graphics.setColor(self.c)
    love.graphics.rectangle('line', self.x, self.y, self.w, self.h)
    love.graphics.pop()
end

return player