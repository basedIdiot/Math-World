local NPC = {}
NPC.__index = NPC

function NPC.new(x, y)
    local self = setmetatable({}, NPC)

    self.x = x
    self.y = y

    return self
end

function NPC:draw()
    love.graphics.setColor(0,0,0)
    love.graphics.circle('line', self.x, self.y, 64)
    love.graphics.setColor(1,1,1)
end

return NPC