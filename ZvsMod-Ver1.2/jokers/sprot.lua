SMODS.Joker{ --Sprot
    name = "Sprot",
    key = "sprot",
    config = {
        extra = {
            SprotRounds = 0,
            j_joker = 0
        }
    },
    loc_txt = {
        ['name'] = 'Sprot',
        ['text'] = {
            [1] = 'Every 4 rounds, creates',
            [2] = 'a random {C:uncommon}Uncommon{} Joker',
            [3] = '(must have room).'
        }
    },
    pos = {
        x = 9,
        y = 1
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
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if (card.ability.extra.SprotRounds or 0) < 3 then
                return {
                    func = function()
                    card.ability.extra.SprotRounds = (card.ability.extra.SprotRounds) + 1
                    return true
                end,
                    message = "Seed Growing..."
                }
            elseif (card.ability.extra.SprotRounds or 0) == 3 then
                return {
                    func = function()
            local created_joker = false
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    created_joker = true
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({
                                set = 'Joker',
                                rarity = 'Uncommon',
                                key_append = 'joker_forge_random'
                            })
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Seed Grown!", colour = G.C.BLUE})
            end
            return true
        end,
                    extra = {
                        func = function()
                    card.ability.extra.SprotRounds = 0
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            end
        end
    end
}