SMODS.Joker{ --Micro Joker
    name = "Micro Joker",
    key = "microjoker",
    config = {
        extra = {
            repetitions = 3
        }
    },
    loc_txt = {
        ['name'] = 'Micro Joker',
        ['text'] = {
            [1] = 'Retrigger each played {C:attention}2{}',
            [2] = '{C:green}3{}  additional times.'
        }
    },
    pos = {
        x = 1,
        y = 2
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
        if context.repetition and context.cardarea == G.play then
            if context.other_card:get_id() == 2 then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = "Retrigger!"
                }
            end
        end
    end
}