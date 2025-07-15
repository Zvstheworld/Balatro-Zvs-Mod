SMODS.Joker{ --No B*tches?
    name = "No B*tches?",
    key = "nobtches",
    config = {
        extra = {
            Xmult = 5
        }
    },
    loc_txt = {
        ['name'] = 'No B*tches?',
        ['text'] = {
            [1] = '{X:red,C:white}X5{} Mult if there are no',
            [2] = '{C:attention}Queens{} in your deck.'
        }
    },
    pos = {
        x = 2,
        y = 2
    },
    cost = 10,
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
        if context.cardarea == G.jokers and context.joker_main then
            if (function()
    local count = 0
    for _, playing_card in pairs(G.playing_cards or {}) do
        if playing_card:get_id() == 12 then
            count = count + 1
        end
    end
    return count == 0
end)() then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}