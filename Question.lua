local QuestionManager = {}

local isAskingQuestion = false
currentQuestion = ''
currentAnswer = ''
local correctAnswer


love.keyboard.setTextInput(false)
function QuestionManager.askQuestion(question, answer)
    love.keyboard.setTextInput(true)
    isAskingQuestion = true
    currentQuestion = question
    correctAnswer = answer
end
function QuestionManager.answerQuestion()
    love.keyboard.setTextInput(false)
    isAskingQuestion = false
    if string.lower(currentAnswer) == correctAnswer then
        return true
    end
    return false
end
function QuestionManager.update()
    if not isAskingQuestion then return end
    if love2d.keyboard.isDown('backspace') then
        -- get the byte offset to the last UTF-8 character in the string.
        local byteoffset = utf8.offset(text, -1)

        if byteoffset then
            -- remove the last UTF-8 character.
            -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
            QuestionManager.setCurrentAnswer(string.sub(currentAnswer, 1, byteoffset - 1))
        end
    end
    if love2d.keyboard.isDown('enter') then
        QuestionManager.answerQuestion()
    end
end
function QuestionManager.draw()
    love.graphics.print(currentAnswer, 100, 100)
end
function QuestionManager.setCurrentAnswer(answer)
    currentAnswer = answer
end
function love.textinput(t)
    print(currentAnswer)
    QuestionManager.setCurrentAnswer(currentAnswer .. t)
end
return QuestionManager