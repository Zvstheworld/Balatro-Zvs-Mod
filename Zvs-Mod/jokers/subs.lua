SMODS.Joker{ --Subs
    name = "Subs",
    key = "subs",
    config = {
        extra = {
            Xmult = 1.5,
            mult = 7
        }
    },
    loc_txt = {
        ['name'] = 'Subs',
        ['text'] = {
            [1] = '{X:red,C:white}x1.5{} {C:red}Mult{} on final',
            [2] = 'hand of round. Otherwise,',
            [3] = '{C:red}+7 Mult{}.'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    cost = 7,
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
                    Xmult = card.ability.extra.Xmult
                }
            elseif G.GAME.current_round.hands_left > 1 then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
    end
}