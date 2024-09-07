local Player = require 'Player'
local QuestionManager = require 'Question'

-- Haiiii justin please send help


function love.load()
    love.graphics.setBackgroundColor(1, 1, 1)
    
    player = Player.new(0, 0)
    QuestionManager.askQuestion('bro', 'blud')
end

function love.update(dt)
    player:update(dt)
end

function love.keypressed(key, scancode)
    QuestionManager.keypressed(scancode)
end

function love.draw()
    player:draw()
    QuestionManager.draw()
end