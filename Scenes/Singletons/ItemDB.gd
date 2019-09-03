extends Node

const ICON_PATH = "res://Assets/Sprites/Craftables/"

const ITEMS = {
	"banana" : {
		"icon" : ICON_PATH + "banana.png",
		"category" : "healthy"
	},
	"burg": {
		"icon": ICON_PATH + "burg.png",
		"category" : "grease"
	},
	"batata": {
		"icon": ICON_PATH + "lixobatata.png",
		"category" : "grease"
	},
	"copo": {
		"icon": ICON_PATH + "lixocopo.png",
		"category" : "transparency"
	},
	"garrafa": {
		"icon": ICON_PATH + "lixogarrafa.png",
		"category" : "transparency"
	},
	"lata1": {
		"icon": ICON_PATH + "lixolata1.png",
		"category" : "soda"
	},
	"lata2": {
		"icon": ICON_PATH + "lixolata2.png",
		"category" : "soda"
	},
	"maca" : {
		"icon" : ICON_PATH + "lixomaca.png",
		"category" : "healthy"
	},
	"papel1" : {
		"icon" : ICON_PATH + "lixopapel1.png",
		"category" : "paper"
	},
	"papel2" : {
		"icon" : ICON_PATH + "lixopapel2.png",
		"category" : "paper"
	},
	"pizza": {
		"icon": ICON_PATH + "lixopizza.png",
		"category" : "grease"
	},
	"meleca": {
		"icon": ICON_PATH + "meleca.png",
		"category" : "grease"
	}

}
	

const ITEM_DESCRIPTIONS = {
	"paper" : "Fino e leve. Meio genérico. Serve pra bastante coisa…",
	"soda" : "Posso sentir um passado gasoso aqui dentro…",
	"grease": "Delícia! Restos de comida gordurosa com altos níveis de oleosidade.",
	"transparency" : "Plástico. Transparente. Do tipo que engasga tartarugas.",
	"healthy" : "Não serve. Isso é pra galera fitness."
	}

func get_item(item_id):
    if item_id in ITEMS:
        return ITEMS[item_id]
    else:
        return ITEMS["error"]	