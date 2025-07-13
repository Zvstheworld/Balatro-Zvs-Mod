SMODS.Joker{ --Greentext
    name = "Greentext",
    key = "greentext",
    config = {
        extra = {
            jokercount = 1
        }
    },
    loc_txt = {
        ['name'] = 'Greentext',
        ['text'] = {
            [1] = '>be me',
            [2] = '>play Balatro Zvs Modpack',
            [3] = '>find Greentext joker',
            [4] = '>buy it',
            [5] = '>realize it gives 0.2x mult',
            [6] = 'for every joker you have',
            [7] = '>realize that\'s really good'
        }
    },
    pos = {
        x = 7,
        y = 1
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
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.jokercount + (#G.jokers.cards) * 0.2
                }
        end
    end
}