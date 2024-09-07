local Player = require 'Player'

-- Haiiii justin please send help
function love.load()
    player = Player.new(0, 0)
end

function love.update(dt)
    player:update(dt)
end

function love.draw()
    player:draw()
end