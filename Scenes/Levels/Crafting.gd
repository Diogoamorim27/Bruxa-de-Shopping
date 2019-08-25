extends Node

# Declare member variables here. Examples:
# var a = 2
onready var crafting_items = get_tree().get_nodes_in_group("craft_rect")[0].items

var current_items = {}

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_items = {}
	for item in crafting_items:
		if current_items.has(item.item_category):
			current_items[item.item_category] += 1
		else:
			current_items[item.item_category] = 1
			
#	print(current_items)
#	pass


func _on_Button_pressed():
	print(_check_ingredients())

					
func _check_ingredients() -> bool:
	for spell in SpellRecipes.SPELLS.keys():
#		print(SpellRecipes.get_spell(spell))
		if current_items.has_all(SpellRecipes.get_spell(spell).keys()):
			for key in SpellRecipes.get_spell(spell).keys():
				if current_items[key] != SpellRecipes.get_spell(spell)[key]:
					return false
			return true
	return false