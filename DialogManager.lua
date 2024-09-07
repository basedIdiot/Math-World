local DialogManager = {}
DialogManager.__index = DialogManager

function tableConcat(t1,t2)
    for i=1, #t2 do
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
    print({...})
    if #{...} <= 1 then
        table.insert(self.textSequence, 1, ...)
    end
    self.textSequence = tableConcat({...}, self.textSequence)
end
function DialogManager:advance()
    if #self.textSequence > 0 then
        table.remove(self.textSequence, 1)
    end
end

function DialogManager:draw()
    if #self.textSequence > 0 then
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
            self.textSequence[1],
            0 + 25, love.graphics.getHeight() * 0.6 + 25,
            (love.graphics.getWidth() - 50)/2,
            'left',
            0,
            2, 2
        )
    end
end

function DialogManager:keypressed(key)
    if key == 'space' and isSkippingEnabled then
        self:advance()
    end
end

return DialogManager.new()