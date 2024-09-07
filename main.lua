local Player = require 'Player'
local NPC = require 'NPC'
local QuestionManager = require 'QuestionManager'
local dialogManager   = require 'DialogManager'
local AdditionDialog  = require 'AdditionDialog'
local images          = require 'images'

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
        addition = NPC.new(100, 200, 64, images.addition, function()
            dialogManager:displayText("Hello!")
        end),
        subtraction = NPC.new(250, 200, 64, images.subtraction, function()
            dialogManager:displayText("hehehe")
        end),
        division = NPC.new(400, 200, 64, images.division, function()
            dialogManager:displayText('bruh')
        end),
        multiplication = NPC.new(550, 200, 64, images.multiplication, function()
            dialogManager:displayText('bruh')
        end),
        mathSymbol = NPC.new(600, 600, 128, images.mathSymbol, function()
            dialogManager:displayText("be not afraid")
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
    -- this code looks kinda bad, but dont worry abt it 
    player.isPaused = #dialogManager.textSequence > 0
end

function love.keypressed(key, scancode)
    QuestionManager.keypressed(scancode)
    dialogManager:keypressed(scancode)
    player:keypressed(scancode)
end

function love.draw()
    love.graphics.translate(love.graphics.getWidth()/2 - player.x,
                            love.graphics.getHeight()/2 - player.y)
    love.graphics.draw(images.background, -1000, -1000)
    player:draw()
    for _, npc in pairs(npcs) do
        npc:draw()
    end
    love.graphics.origin()

    love.graphics.setColor(0, 0, 0)
    QuestionManager.draw()
    love.graphics.setColor(1, 1, 1)

    dialogManager:draw()
end