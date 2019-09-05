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
#	while !crafting_items.items.empty():
#			for item in crafting_items.items:
#				crafting_items.remove_item(item)
#				item.queue_free()

#	print(crafting_items.items)

	if _check_ingredients():
		player.enter_state(spell_indexes[_check_ingredients()])
		print(_check_ingredients())
		print(spell_indexes[_check_ingredients()])
		get_tree().call_group("dialogue_panel", "spell_dialog", _check_ingredients())
	else:
		get_tree().call_group("dialogue_panel", "wrong_recipe_dialog")
		
#		while !crafting_items.items.empty():
#			for item in crafting_items.items:
#				crafting_items.remove_item(item)
#				item.queue_free()
					
func _check_ingredients():
	for spell in SpellRecipes.SPELLS.keys():
#		print(SpellRecipes.get_spell(spell))
		if current_items.has_all(SpellRecipes.get_spell(spell).keys()):
			for key in SpellRecipes.get_spell(spell).keys():
				if current_items[key] != SpellRecipes.get_spell(spell)[key]:
					return null
			return spell
	return null