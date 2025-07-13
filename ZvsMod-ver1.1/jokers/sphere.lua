SMODS.Joker{ --sphere.
    name = "sphere.",
    key = "sphere",
    config = {
        extra = {
            sell_value = 10
        }
    },
    loc_txt = {
        ['name'] = 'sphere.',
        ['text'] = {
            [1] = 'Earns {C:gold}10${} of sell value',
            [2] = 'after defeating the',
            [3] = '{C:attention}{C:attention}Boss Blind.{}{}'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss and not context.blueprint then
                return {
                    func = function()
            card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.sell_value
            card:set_cost()
                    return true
                end,
                    message = localize('k_val_up')
                }
        end
    end
}