extends Node

const SPELLS = {
	"invisible" : {
		"transparency" : 3
	},
	"goo" : {
		"grease" : 2,
		"soda" : 1
	},
	"floating" : {
		"lightness" : 1,
		"soda" : 2
	}
}

func get_spell(spell_id):
    if spell_id in SPELLS:
        return SPELLS[spell_id]
    else:
        return SPELLS["error"]	