SMODS.Joker{ --Redprint
    name = "Redprint",
    key = "redprint",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Redprint',
        ['text'] = {
            [1] = 'Copies ability of {C:attention}Joker{}',
            [2] = 'to the left.'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        local target_joker = nil
        
        local my_pos = nil
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                my_pos = i
                break
            end
        end
        target_joker = (my_pos and my_pos > 1) and G.jokers.cards[my_pos - 1] or nil
        
        return SMODS.blueprint_effect(card, target_joker, context)
    end
}