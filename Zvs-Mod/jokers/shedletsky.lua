SMODS.Joker{ --Shedletsky
    name = "Shedletsky",
    key = "shedletsky",
    config = {
        extra = {
            odds = 10
        }
    },
    loc_txt = {
        ['name'] = 'Shedletsky',
        ['text'] = {
            [1] = 'Every {C:attention}Boss Blind{}, {C:green}#1# in 10{}',
            [2] = 'chance to disable the effect.'
        }
    },
    pos = {
        x = 4,
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
        return {vars = {G.GAME.probabilities.normal}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            if G.GAME.blind.boss then
                if pseudorandom('group_0_ef52eb8d') < G.GAME.probabilities.normal / card.ability.extra.odds then
                        SMODS.calculate_effect({func = function()
            if G.GAME.blind and G.GAME.blind.boss and not G.GAME.blind.disabled then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.GAME.blind:disable()
                        play_sound('timpani')
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Blame John!", colour = G.C.GREEN})
            end
                    return true
                end}, card)
                    end
            end
        end
    end
}