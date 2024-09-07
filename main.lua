local Player = require 'Player'
local NPC = require 'NPC'
local QuestionManager = require 'QuestionManager'
local dialogManager   = require 'DialogManager'
local AdditionDialog  = require 'AdditionDialog'
local images          = require 'images'

-- Haiiii justin please send help

local npcs
local mapWidth = 1000
local mapHeight = 1500

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

function beginningDialog()
    dialogManager:displayText(
"[You]: Where is this?",

"[Addition]: You’re awake!",

"[Subtraction]: We were wondering when you would be awake.",

"[You]: Who are you?",

"[Addition]: I’m addition,",

"[Subtraction]: And I’m subtraction!",

"[Subtraction]: Do you not know us?!",

"[Addition]: You’re the famous math person!",

"[Addition]: We’ve summoned you to our world to save it!",

"[Addition]: A strange entity has started to consume our whole world! It has been turning everyone evil, and converting everyone evil!!",

"[Subtraction]: We need your math skills to be able to beat it!",

"[Subtraction]: But was it all for nothing? You don’t remember anything!",

"[Addition]: No! It’s ok! We will teach you everything from the start!",

"[Addition]: Maybe you will remember as you help us fight back against the monster!",

"[Addition]: Let’s start with the easier enemies! We can practice and hopefully regain your knowledge of math before you fight the final boss!!",

"[Subtraction]: Try to remember! If you can’t remember anything you can find us and we will help you!")
end

function love.load()
    love.graphics.setBackgroundColor(1, 1, 1)
    
    npcs = {
        addition = NPC.new(425, 200, 64, images.addition, function()
            dialogManager:displayText("Hello!")
        end),
        subtraction = NPC.new(575, 200, 64, images.subtraction, function()
            dialogManager:displayText("hehehe")
        end),
        division = NPC.new(425, 800, 64, images.division, function()
            dialogManager:displayText('bruh')
        end),
        multiplication = NPC.new(575, 800, 64, images.multiplication, function()
            dialogManager:displayText('bruh')
        end),
        mathSymbol = NPC.new(400, 1200, 128, images.mathSymbol, function()
            dialogManager:displayText("be not afraid")
        end)
    }

    player = Player.new(500, 100, npcs)
--[[
    dialogManager = DialogManager
    dialogManager:displayText('Hmmm? Do I know what this paper means? Of course! But I must ask one thing before I say: a good fight!')
    dialogManager:displayText([[I have two piles of apples. 
        A pile has one · apple (who said piles must have multiple things?). 
        The other pile has two ·· apples. 
        If I put the two piles together, how many apples does the new pile have.]]--[[)
    QuestionManager.askQuestion('blud')
    ]]
    beginningDialog()
end

function love.update(dt)
    player:update(dt)
    -- this code looks kinda bad, but dont worry abt it 
    player.isPaused = #dialogManager.textSequence > 0
    player.x = math.clamp(player.x, 0, mapWidth)
    player.y = math.clamp(player.y, 0, mapHeight)
end

function love.keypressed(key, scancode)
    QuestionManager.keypressed(scancode)
    dialogManager:keypressed(scancode)
    player:keypressed(scancode)
end

function love.draw()
    love.graphics.translate(love.graphics.getWidth()/2 - player.x,
                            love.graphics.getHeight()/2 - player.y)
    
    love.graphics.draw(images.background, -1000, 0, 0, 1.5, 1.5)
    love.graphics.rectangle('fill', -1000, -1000, 1000, 3000)
    love.graphics.rectangle('fill', 1000, -1000, 1000, 3000)
    love.graphics.rectangle('fill', -1000, -1000, 2000, 1000)
    love.graphics.rectangle('fill', -1000, mapHeight, 4000, 1000)
    love.graphics.setColor(0,0,0)
    love.graphics.rectangle('line', 0, 0, mapWidth, mapHeight)
    love.graphics.setColor(1,1,1)
    player:draw()
    for _, npc in pairs(npcs) do
        npc:draw()
    end
    love.graphics.draw(images.endBossMap, 300, 1200)
    love.graphics.origin()

    love.graphics.setColor(0, 0, 0)
    QuestionManager.draw()
    love.graphics.setColor(1, 1, 1)

    dialogManager:draw()
end

function math.clamp(value, min, max)
    if value < min then
        return min
    elseif value > max then
        return max
    else
        return value
    end
end