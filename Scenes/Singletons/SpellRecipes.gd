extends Node

const SPELLS = {
	"invisible" : {
		"transparency" : 3
	},
	"goo" : {
		"grease" : 2,
		"paper" : 1
	},
	"floating" : {
		"paper" : 1,
		"soda" : 2
	},
	"overpower" : {
		"bota" : 1,
		"cobra" : 1,
		"controle" : 1
	}
}

func get_spell(spell_id):
    if spell_id in SPELLS:
        return SPELLS[spell_id]
    else:
        return SPELLS["error"]	