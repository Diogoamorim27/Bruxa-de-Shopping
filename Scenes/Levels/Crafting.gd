extends Node

# Declare member variables here. Examples:
# var a = 2
onready var crafting_items = get_tree().get_nodes_in_group("craft_rect")[0]
onready var player = get_tree().get_nodes_in_group("player")[0]

var current_items = {}
var spell_indexes = {"invisible" : 1, "goo" : 2, "floating" : 3}

# warning-ignore:unused_argument
func _process(delta):
	current_items = {}
	if !crafting_items.items.empty():
		for item in crafting_items.items:
			if current_items.has(item.item_category):
				current_items[item.item_category] += 1
			else:
				current_items[item.item_category] = 1


func _on_Button_pressed():
	print("hi")
	for item in crafting_items.items:
		
		item.queue_free()
		crafting_items.remove_item(item)

	if _check_ingredients():
		player.timer_ready = false
		player.timer.start()
		player.state = spell_indexes[_check_ingredients()]
		print(_check_ingredients())
		print(spell_indexes[_check_ingredients()])
					
func _check_ingredients():
	for spell in SpellRecipes.SPELLS.keys():
#		print(SpellRecipes.get_spell(spell))
		if current_items.has_all(SpellRecipes.get_spell(spell).keys()):
			for key in SpellRecipes.get_spell(spell).keys():
				if current_items[key] != SpellRecipes.get_spell(spell)[key]:
					return null
			return spell
	return null