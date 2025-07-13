SMODS.Joker{ --Green Needle
    name = "Green Needle",
    key = "greenneedle",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Green Needle',
        ['text'] = {
            [1] = 'Copies ability of',
            [2] = 'rightmost {C:attention}Joker.{}'
        }
    },
    pos = {
        x = 1,
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
        
        target_joker = G.jokers.cards[5]
        if target_joker == card then
            target_joker = nil
        end
        
        return SMODS.blueprint_effect(card, target_joker, context)
    end
}