SMODS.Joker{ --Bootleg Chance Plush
    name = "Bootleg Chance Plush",
    key = "bootlegchanceplush",
    config = {
        extra = {
            odds = 3,
            odds2 = 5,
            dollars = 3,
            j_joker = 0,
            var1 = 0
        }
    },
    loc_txt = {
        ['name'] = 'Bootleg Chance Plush',
        ['text'] = {
            [1] = 'Every hand, {C:uncommon}1 in 3{} chance',
            [2] = 'to destroy a random joker.',
            [3] = '{C:uncommon}1 in 5{} chance to earn 3$.'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    cost = 2,
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
        if context.cardarea == G.jokers and context.joker_main then
            if true then
                if pseudorandom('group_0_8a5b294d') < G.GAME.probabilities.normal / card.ability.extra.odds then
                        local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not joker.ability.eternal and not joker.getting_sliced then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Come on!", colour = G.C.RED})
                end
                        
                    end
                if pseudorandom('group_1_5bc9582f') < G.GAME.probabilities.normal / card.ability.extra.odds2 then
                        SMODS.calculate_effect({dollars = card.ability.extra.dollars}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "I wont ever lose!", colour = G.C.WHITE})
                    end
            end
        end
    end
}