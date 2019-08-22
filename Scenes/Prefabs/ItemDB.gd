extends Node

const ICON_PATH = "res://Assets/Sprites/Craftables/"

const ITEMS = {
	"wrinkled_paper": {
		"icon": ICON_PATH + "paper.png",
		"category": "lightness"
	},
	"plastic_bottle": {
		"icon": ICON_PATH + "bottle.png",
		"category": "lightness"
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

func get_item(item_id):
    if item_id in ITEMS:
        return ITEMS[item_id]
    else:
        return ITEMS["error"]	