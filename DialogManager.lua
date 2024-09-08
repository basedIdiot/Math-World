local DialogManager = {}
DialogManager.__index = DialogManager

local function tableConcat(t1,t2)
    for i=1,#t2 do
        t1[#t1+1] = t2[i]
    end
    return t1
end

function DialogManager.new()
    local self = setmetatable({}, DialogManager)

    self.textSequence = {}
    self.isSkippingEnabled = true
    return self
end

function DialogManager:displayText(...)
    for _, text in ipairs({...}) do
        table.insert(self.textSequence, text)
    end
end
function DialogManager:forceDisplayText(...)
    self.textSequence = tableConcat({...}, self.textSequence)
end
function DialogManager:advance()
    if #self.textSequence > 0 then
        table.remove(self.textSequence, 1)
    end
    local question = self.textSequence[1]
    if #self.textSequence == 0 then return end
    if type(self.textSequence[1]) ~= "table" then return end
    print(type(self.textSequence[1]))
    question:askQuestion()
end
local function drawText(text)
    love.graphics.setColor(0, 0, 0, 0.8)
    love.graphics.rectangle(
        'fill',
        0,
        love.graphics.getHeight() * 0.6,
        love.graphics.getWidth(),
        love.graphics.getHeight() * 0.4
    )
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf(
        text,
        0 + 25, love.graphics.getHeight() * 0.6 + 25,
        (love.graphics.getWidth() - 50)/2,
        'left',
        0
    )  
end
function DialogManager:draw()
    if #self.textSequence == 0 then return end
    if type(self.textSequence[1]) == "table" then
        drawText(self.textSequence[1].question)
        love.graphics.setColor(0, 0, 0)
        love.graphics.print(self.textSequence[1].currentAnswer, love.graphics.getWidth() / 2, 100)
        love.graphics.setColor(1, 1, 1)
        return
    end
    drawText(self.textSequence[1])
end

function DialogManager:keypressed(key)
    if key == 'space' and self.isSkippingEnabled then
        self:advance()
    end
    if type(self.textSequence[1]) == "table" then
        self.textSequence[1]:keypressed(key)
    end
end
function DialogManager:textinput(t)
    if type(self.textSequence[1]) ~= "table" then return end
    self.textSequence[1].currentAnswer  = self.textSequence[1].currentAnswer .. t
    print(self.textSequence[1].currentAnswer)
end

return DialogManager.new()