SMODS.Joker{ --Manly Joker
    name = "Manly Joker",
    key = "manlyjoker",
    config = {
        extra = {
            ManlyMult = 0,
            sell_value = 3
        }
    },
    loc_txt = {
        ['name'] = 'Manly Joker',
        ['text'] = {
            [1] = 'When this Joker is sold,',
            [2] = 'add {C:gold}3${} of sell value',
            [3] = 'to all Jokers',
            [4] = 'and consumables.'
        }
    },
    pos = {
        x = 3,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.selling_self and not context.blueprint then
                return {
                    func = function()
            for _, area in ipairs({ G.jokers, G.consumeables }) do
                for i, other_card in ipairs(area.cards) do
                    if other_card.set_cost then
                        other_card.ability.extra_value = (other_card.ability.extra_value) + card.ability.extra.sell_value
                        other_card:set_cost()
                    end
                end
            end
                    return true
                end,
                    message = localize('k_val_up')
                }
        end
    end
}