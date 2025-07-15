SMODS.Joker{ --Cantaloupe
    name = "Cantaloupe",
    key = "cantaloupe",
    config = {
        extra = {
            CantalopeDestroy = 3,
            Xmult = 0.7,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Cantaloupe',
        ['text'] = {
            [1] = 'fuck you',
            [2] = '(gives 0.7x Mult,',
            [3] = 'and destroys itself in',
            [4] = '#1# rounds.'
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.CantalopeDestroy}}
    end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.Xmult
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if (card.ability.extra.CantalopeDestroy or 0) == 1 then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "Destroyed!"
                }
            else
                return {
                    func = function()
                    card.ability.extra.var1 = math.max(0, (card.ability.extra.var1) - 1)
                    return true
                end,
                    message = "fuck you"
                }
            end
        end
    end
}