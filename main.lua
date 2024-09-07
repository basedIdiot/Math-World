local Player = require 'Player'

-- Haiiii justin please send help
function love.load()
    love.graphics.setBackgroundColor(1, 1, 1)
    
    player = Player.new(0, 0)
end

function love.update(dt)
    player:update(dt)
end

function love.draw()
    player:draw()
end