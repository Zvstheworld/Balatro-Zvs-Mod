SMODS.Joker{ --nothing
    name = "nothing",
    key = "nothing",
    config = {
        extra = {
            NothingCounter = 0,
            var1 = 0,
            c_soul = 0
        }
    },
    loc_txt = {
        ['name'] = 'nothing',
        ['text'] = {
            [1] = 'Does nothing...'
        }
    },
    pos = {
        x = 2,
        y = 2
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
        if context.buying_card and not context.blueprint then
            if (card.ability.extra.var1 or 0) < 24 then
                return {
                    func = function()
                    card.ability.extra.NothingCounter = (card.ability.extra.NothingCounter) + 1
                    return true
                end,
                    message = "..."
                }
            elseif (card.ability.extra.var1 or 0) == 24 then
                return {
                    func = function()local created_spectral = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_spectral = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local spectral_card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, 'c_familiar')
                            spectral_card:add_to_deck()
                            G.consumeables:emplace(spectral_card)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                    if created_spectral then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                    end
                    return true
                end,
                    extra = {
                        func = function()
                card:start_dissolve()
                return true
            end,
                            message = "Bye!",
                        colour = G.C.RED
                        }
                }
            end
        end
    end
}