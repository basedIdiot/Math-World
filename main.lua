local Player = require 'Player'
local QuestionManager = require 'Question'

-- Haiiii justin please send help


function love.load()
    player = Player.new(0, 0)
    QuestionManager.askQuestion('bro', 'blud')
end

function love.update(dt)
    player:update(dt)
    QuestionManager.update()
end

function love.draw()
    player:draw()
    QuestionManager.draw()
end