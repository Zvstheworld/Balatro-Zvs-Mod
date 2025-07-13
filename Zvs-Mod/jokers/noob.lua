SMODS.Joker{ --Noob
    name = "Noob",
    key = "noob",
    config = {
        extra = {
            mult = 13,
            chips = 37
        }
    },
    loc_txt = {
        ['name'] = 'Noob',
        ['text'] = {
            [1] = '{C:red}+13 Mult {} and {C:blue}+37 chips{}',
            [2] = 'on final hand of round.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    cost = 5,
    rarity = 2,
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
            if G.GAME.current_round.hands_left == 1 then
                return {
                    mult = card.ability.extra.mult,
                    extra = {
                        chips = card.ability.extra.chips,
                        colour = G.C.CHIPS
                        }
                }
            end
        end
    end
}