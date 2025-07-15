SMODS.Joker{ --Joker Plush
    name = "Joker Plush",
    key = "jokerplush",
    config = {
        extra = {
            sell_value = 5
        }
    },
    loc_txt = {
        ['name'] = 'Joker Plush',
        ['text'] = {
            [1] = 'If hand played has a {C:green}Flush{},',
            [2] = 'earns {C:attention}3${} of sell value.'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    cost = 4,
    rarity = 1,
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
                card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.sell_value
            card:set_cost()
                return {
                    message = "Value Up!"
                }
        end
    end
}