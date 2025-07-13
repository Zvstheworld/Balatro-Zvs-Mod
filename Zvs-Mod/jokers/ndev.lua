SMODS.Joker{ --NDev
    name = "NDev",
    key = "ndev",
    config = {
        extra = {
            odds = 10,
            j_egg = 0
        }
    },
    loc_txt = {
        ['name'] = 'NDev',
        ['text'] = {
            [1] = 'When {C:attention}Blind{} is selected,',
            [2] = '{C:green}#1# in 10{} chance to spawn',
            [3] = '{C:blue}Egg Joker{}.'
        }
    },
    pos = {
        x = 1,
        y = 0
    },
    cost = 8,
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
                if pseudorandom('group_0_e00d2a42') < G.GAME.probabilities.normal / card.ability.extra.odds then
                        SMODS.calculate_effect({func = function()
            local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_egg')
                            joker_card:add_to_deck()
                            G.jokers:emplace(joker_card)
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end}, card)
                    end
        end
    end
}
