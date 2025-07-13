SMODS.Joker{ --Chance Plush
    name = "Chance Plush",
    key = "chanceplush",
    config = {
        extra = {
            odds = 2,
            dollars = 1,
            odds2 = 10,
            sell_value = 3,
            odds3 = 5,
            j_joker = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Chance Plush',
        ['text'] = {
            [1] = 'When the round ends,',
            [2] = '{C:uncommon}#1# in 2{} chance to earn {C:gold}1${}',
            [3] = '{C:green}#1# in 5 {}chance to {C:red}destroy{} a',
            [4] = 'random Joker.',
            [5] = '{C:green}#1# in 10{} chance to earn {C:money}3${}',
            [6] = 'of sell value.'
        }
    },
    pos = {
        x = 8,
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
        x = 9,
        y = 0
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                if pseudorandom('group_0_90c0e332') < G.GAME.probabilities.normal / card.ability.extra.odds then
                        SMODS.calculate_effect({dollars = card.ability.extra.dollars}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I cant stop winning!", colour = G.C.WHITE})
                    end
                if pseudorandom('group_0_03c96387') < G.GAME.probabilities.normal / card.ability.extra.odds then
                        SMODS.calculate_effect({func = function()
            card.ability.extra_value = (card.ability.extra_value or 0) + card.ability.extra.sell_value
            card:set_cost()
                    return true
                end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I cant stop winning!", colour = G.C.MONEY})
                    end
                if pseudorandom('group_0_705b9362') < G.GAME.probabilities.normal / card.ability.extra.odds then
                        SMODS.calculate_effect({func = function()
                local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not joker.ability.eternal and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    local joker_sell_value = target_joker.sell_cost or 0
                    local sell_value_gain = joker_sell_value * 1
                    card.ability.extra.var1 = card.ability.extra.var1 + sell_value_gain
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Aw dang it!", colour = G.C.RED})
                end
                    return true
                end}, card)
                    end
        end
    end
}