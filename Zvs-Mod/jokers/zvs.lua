SMODS.Joker{ --Zvs
    name = "Zvs",
    key = "zvs",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Zvs',
        ['text'] = {
            [1] = 'When {C:diamonds}Blind {}is selected,',
            [2] = 'spawn a random {C:green}Skip Tag{}.'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
                return {
                    func = function()
            G.E_MANAGER:add_event(Event({
                func = function()
                    local selected_tag = pseudorandom_element(G.P_TAGS, pseudoseed("create_tag")).key
                    local tag = Tag(selected_tag)
                    tag:set_ability()
                    add_tag(tag)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
                    return true
                end,
                    message = "Created Tag!"
                }
        end
    end
}