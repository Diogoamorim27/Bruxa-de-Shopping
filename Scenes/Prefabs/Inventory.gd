extends Control

const item_base = preload("res://Scenes/Singletons/ItemBase.tscn")
const loot_ui = preload("res://Scenes/Prefabs/LootUI.tscn")

onready var craft_rect = $CraftTextureRect
onready var inv_rect = $InvTextureRect

var item_held = null
var item_offset = Vector2()
var last_container = null
var last_pos = Vector2()
var loot_open = false
var new_loot_rect = null
var trashcans = []

func _ready():
	trashcans = get_tree().get_nodes_in_group("trashcans")

func _process(delta):
	var cursor_pos = get_global_mouse_position()
	if Input.is_action_just_pressed("inv_grab"):
#		print("inv_grab")
		grab(cursor_pos)
	if Input.is_action_just_released("inv_grab"):
	    release(cursor_pos)
	if item_held != null:
	    item_held.rect_global_position = cursor_pos + item_offset
		
	##trahscans ##
			
		
func grab(cursor_pos):
	var c = get_container_under_cursor(cursor_pos)
#	print(c)
	if c == null and loot_open == true:
		for trashcan in trashcans:
			if trashcan.current_trashcan == true:
				delete_loot_ui(trashcan)
	if c != null and c.has_method("grab_item"):
	    item_held = c.grab_item(cursor_pos)
	    if item_held != null:
	    	last_container = c
	    	last_pos = item_held.rect_global_position
	    	item_offset = item_held.rect_global_position - cursor_pos
	    	move_child(item_held, get_child_count())
			
func release(cursor_pos):
	if item_held == null:
	    return
	var c = get_container_under_cursor(cursor_pos)
	if c == null:
	    return_item()
	elif c.has_method("insert_item"):
	    if c.insert_item(item_held):
	    	item_held = null
	    else:
	    	return_item()
	else:
	    return_item()
			
func get_container_under_cursor(cursor_pos):
	var containers = []
	if loot_open:
		containers = [craft_rect,new_loot_rect, inv_rect]
	else: 
		containers = [craft_rect, inv_rect]
	for c in containers:
	    if c.get_global_rect().has_point(cursor_pos):
	    	return c
	return null
	
func drop_item():
	item_held.queue_free()
	item_held = null
	
func return_item():
	item_held.rect_global_position = last_pos
	last_container.insert_item(item_held)
	item_held = null
	
func pickup_item(item_id, container):
	var item = item_base.instance()
	item.set_meta("id", item_id)
	item.texture = load(ItemDB.get_item(item_id)["icon"])
	item.item_category = ItemDB.get_item(item_id)["category"]
	add_child(item)
	if !container.insert_item_at_first_available_spot(item):
		item.queue_free()
		return false
	return item

func _on_Trashcan_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if loot_open == false:
			for trashcan in trashcans:
				if trashcan.current_trashcan == true:
					for player in get_tree().get_nodes_in_group("player"):
						player.state = 4
					if trashcan.initialized:
						open_loot(trashcan)
					else:
						spawn_loot_ui(trashcan)
	pass # Replace with function body.

func spawn_loot_ui(trashcan):
	new_loot_rect = loot_ui.instance()
	add_child(new_loot_rect)
	loot_open = true 
	trashcan.initialized = true
	for trash in trashcan.items:
		var new_item = pickup_item(trash, new_loot_rect)

func open_loot(trashcan):
	new_loot_rect = loot_ui.instance()
	add_child(new_loot_rect)
	loot_open = true 
	for item in trashcan.item_rects:
		reinstance_item(item, new_loot_rect)
#	pickup_item("plastic_bottle", new_loot_rect)
	
func delete_loot_ui(trashcan):
	for player in get_tree().get_nodes_in_group("player"):
		player.state = 0
	trashcan.current_trashcan = false
	loot_open = false
	trashcan.item_rects.clear()
	for item in new_loot_rect.items:
		trashcan.item_rects.append(item)
		remove_child(item)
#		item.queue_free()
	new_loot_rect.queue_free()
	
func reinstance_item(item, container):
	add_child(item)
	if !container.insert_item(item):
		item.queue_free()
		return false
	return item	


