local DialogManager = {}
DialogManager.__index = DialogManager

function DialogManager.new()
    local self = setmetatable({}, DialogManager)

    self.textSequence = {}

    return self
end

function DialogManager:displayText(...)
    for _, text in ipairs({...}) do
        table.insert(self.textSequence, text)
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
    if key == 'space' and #self.textSequence > 0 then
        table.remove(self.textSequence, 1)
    end
end

return DialogManager