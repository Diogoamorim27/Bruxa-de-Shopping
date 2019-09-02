extends Node

const ICON_PATH = "res://Assets/Sprites/Craftables/"

const ITEMS = {
	"wrinkled_paper": {
		"icon": ICON_PATH + "paper.png",
		"category": "paper"
	},
	"plastic_bottle": {
		"icon": ICON_PATH + "bottle.png",
		"category": "transparency"
	},
	"cola" : {
		"icon": ICON_PATH + "cola.png",
		"category": "soda"
	},
	"fries": {
		"icon": ICON_PATH + "fries.png",
		"category" : "grease"
	}	
}

const ITEM_DESCRIPTIONS = {
	"paper" : "Fino e leve. Meio genérico. Serve pra bastante coisa…",
	"soda" : "Posso sentir um passado gasoso aqui dentro…",
	"grease": "Delícia! Restos de comida gordurosa com altos níveis de oleosidade.",
	"transparency" : "Plástico. Transparente. Do tipo que engasga tartarugas."
	}

func get_item(item_id):
    if item_id in ITEMS:
        return ITEMS[item_id]
    else:
        return ITEMS["error"]	