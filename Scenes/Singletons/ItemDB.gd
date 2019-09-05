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
	},
	
	#special items#
	
	"bota": {
		"icon": ICON_PATH + "bota.png",
		"category" : "bota"
	},

	"brinq-carreta" : {
		"icon": ICON_PATH + "brinq-carreta.png",
		"category" : "special"
	},

	"brinq-cobrinha": {
		"icon": ICON_PATH + "brinq-cobrinha.png",
		"category" : "cobra"
	},

	"brinq-urso": {
		"icon": ICON_PATH + "brinq-urso.png",
		"category" : "special"
	},

	"chinelo": {
		"icon": ICON_PATH + "chinelo.png",
		"category" : "special"
	},

	"salto": {
		"icon": ICON_PATH + "salto.png",
		"category" : "special"
	},

	"tech-controle": {
		"icon": ICON_PATH + "tech-controle.png",
		"category" : "controle"
	},

	"tech-headphone": {
		"icon": ICON_PATH + "tech-headpohe.png",
		"category" : "special"
	},

	"tech-lamp": {
		"icon": ICON_PATH + "tech-lamp.png",
		"category" : "special"
	}

}
	

const ITEM_DESCRIPTIONS = {
	"paper" : "Papel. Fino e leve. Meio genérico mas pode ser útil.",
	"soda" : "Lata de refrigerante. Posso sentir um passado gasoso aqui dentro...",
	"grease": "Delícia! Comida gordurosa com altos níveis de oleosidade. Pode ser útil.",
	"transparency" : "Plástico transparente, do tipo que engasga tartarugas...",
	"healthy" : "Não serve. Isso é pra galera fitness.",
	"special" : "",
	"bota" : "",
	"cobra" : "",
	"controle": ""
	}

func get_item(item_id):
    if item_id in ITEMS:
        return ITEMS[item_id]
    else:
        return ITEMS["error"]	