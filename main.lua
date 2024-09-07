local Player = require 'Player'
local NPC = require 'NPC'
local QuestionManager = require 'QuestionManager'
local dialogManager   = require 'DialogManager'
local AdditionDialog  = require 'AdditionDialog'

-- Haiiii justin please send help

local npcs
-- Haiiii justin please send help
function handleDialog(dialog)
    if type(dialog) == "string" then
        dialogManager:displayText(dialog)
    else
        dialogManager:displayText(dialog.question)
        QuestionManager.askQuestion(dialog.answers)
    end
end
function additionDialog()
    dialogManager:displayText('Hmmm? Do I know what this paper means? Of course! But I must ask one thing before I say: a good fight!')
    dialogManager:displayText([[I have two piles of apples. A pile has one · apple (who said piles must have multiple things?). The other pile has two ·· apples. If I put the two piles together, how many apples does the new pile have.]])
    QuestionManager.askQuestion({'blud'})
end

function love.load()
    love.graphics.setBackgroundColor(1, 1, 1)
    
    npcs = {
        plusSignNPC = NPC.new(100, 200, 64, function()
            dialogManager:displayText("Hello!")
        end)
    }

    player = Player.new(0, 0, npcs)

    --dialogManager = DialogManager
    dialogManager:displayText('Hmmm? Do I know what this paper means? Of course! But I must ask one thing before I say: a good fight!')
    dialogManager:displayText([[I have two piles of apples. 
        A pile has one · apple (who said piles must have multiple things?). 
        The other pile has two ·· apples. 
        If I put the two piles together, how many apples does the new pile have.]])
    QuestionManager.askQuestion('blud')
end

function love.update(dt)
    player:update(dt)
end

function love.keypressed(key, scancode)
    QuestionManager.keypressed(scancode)
    dialogManager:keypressed(scancode)
    player:keypressed(scancode)
end

function love.draw()
    player:draw()
    for _, npc in pairs(npcs) do
        npc:draw()
    end
    love.graphics.setColor(0, 0, 0)
    QuestionManager.draw()
    love.graphics.setColor(1, 1, 1)

    dialogManager:draw()
end