-- First element in array is question, subsequent elements are possible answers
local additionDialog = {
    'Hmmm? Do I know what this paper means? Of course! But I must ask one thing before I say: a good fight!',
    {
        question = [[I have two piles of apples. 
        A pile has one · apple (who said piles must have multiple things?). 
        The other pile has two ·· apples. 
        If I put the two piles together, how many apples does the new pile have.
        ]], 
        answers = {"three", "3"},
        rightResponse = "Nice work. Remember your counting, and it wil ltake you rather far.",
        wrongResponse = "Hmmm. I am merciful. Try again. Remember your counting!"
    },
    {
        question = [[Ok, same pile of apples from the last question.
        If I add an empty pile of apples, how many apples with the new pile have?
        ]], 
        answers = {"three", "3"},
        rightResponse = "Of course! That's what adding zero (or nothing) does! Some people didn't like zero too much, but they're gone now.",
        wrongResponse = "Hmmm. What happens to the number of apples if I do nothing to the pile?"
    },

}

return additionDialog