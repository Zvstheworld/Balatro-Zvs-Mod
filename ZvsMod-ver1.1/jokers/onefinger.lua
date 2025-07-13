SMODS.Joker{ --One Finger
    name = "One Finger",
    key = "onefinger",
    config = {
        extra = {
            reduction_value = 4
        }
    },
    loc_txt = {
        ['name'] = 'One Finger',
        ['text'] = {
            [1] = 'All Flushes and Straights',
            [2] = 'can be made with one card.'
        }
    },
    pos = {
        x = 8,
        y = 1
    },
    cost = 25,
    rarity = 4,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    in_pool = function(self, args)
        return true
    end,

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    add_to_deck = function(self, card, from_debuff)
        -- Flush/Straight requirements reduced by 4
    end,

    remove_from_deck = function(self, card, from_debuff)
        -- Flush/Straight requirements restored
    end
}