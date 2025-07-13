SMODS.Joker{ --albert
    name = "albert",
    key = "albert",
    config = {
        extra = {
            j_zvsmod_cantaloupe = 0
        }
    },
    loc_txt = {
        ['name'] = 'albert',
        ['text'] = {
            [1] = 'hey im albert, buy me'
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 6,
        y = 1
    },

    in_pool = function(self, args)
        return false
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.buying_card and not context.blueprint then
            if (function()
      for i = 1, #G.jokers.cards do
          if G.jokers.cards[i].config.center.key == "j_zvsmod_albert" then
              return true
          end
      end
      return false
  end)() then
                return {
                    func = function()
            local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = create_card('Joker', G.jokers, nil, nil, nil, nil, 'j_zvsmod_cantaloupe')
                        joker_card:set_edition("e_negative", true)
                        joker_card:add_to_deck()
                        G.jokers:emplace(joker_card)
                        return true
                    end
                }))
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_joker'), colour = G.C.BLUE})
            end
            return true
        end
                }
            end
        end
    end
}