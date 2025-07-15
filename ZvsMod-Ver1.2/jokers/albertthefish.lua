SMODS.Joker{ --Albert The Fish
    name = "Albert The Fish",
    key = "albertthefish",
    config = {
        extra = {
            AlbertMult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Albert The Fish',
        ['text'] = {
            [1] = '{X:red,C:white}X1.5{} Mult for every used',
            [2] = '{C:blue}Consumable{}.',
            [3] = '{C:inactive}Currently {}{X:red,C:white}X#1#{}',
            [4] = '{C:inactive}This is a reference to a',
            [5] = 'character in Zvs\' friend',
            [6] = 'group, NOT the killer.{}'
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    cost = 8,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 7,
        y = 0
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.AlbertMult}}
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.AlbertMult = (card.ability.extra.AlbertMult) + 0.5
                    return true
                end,
                    message = "im albert"
                }
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.AlbertMult,
                    message = "im albert"
                }
        end
    end
}