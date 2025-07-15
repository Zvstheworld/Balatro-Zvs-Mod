SMODS.Joker{ --EMERGENCY FROG SITUATION
    name = "EMERGENCY FROG SITUATION",
    key = "emergencyfrogsituation",
    config = {
        extra = {
            mult = 4,
            j_zvsmod_emergencyfrogsituation = 0
        }
    },
    loc_txt = {
        ['name'] = 'EMERGENCY FROG SITUATION',
        ['text'] = {
            [1] = '{C:rare}+4 Mult{}, duplicates at',
            [2] = 'end of round.'
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    cost = 2,
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
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    mult = card.ability.extra.mult,
                    message = "EMERGENCY FROG SITUATION"
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                return {
                    func = function()
            local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local joker_card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_zvsmod_emergencyfrogsituation')
                            joker_card:add_to_deck()
                            G.jokers:emplace(joker_card)
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "EMERGENCY FROG SITUATION!!!", colour = G.C.BLUE})
            end
            return true
        end
                }
        end
    end
}