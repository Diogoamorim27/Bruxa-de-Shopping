extends Area2D
export (String, "wrinkled_paper", "plastic_bottle", "cola", "fries") var item_1
export (String, "wrinkled_paper", "plastic_bottle", "cola", "fries") var item_2
export (String, "wrinkled_paper", "plastic_bottle", "cola", "fries") var item_3
var items : = []

var item_rects : = []
var rect_id : = {}
var current_trashcan = false
var initialized : = false

func _ready():
	items = [item_1, item_2, item_3]
	print(items)

func _on_Trashcan_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		get_tree().call_group("dialogue_panel", "_trashcan_opened")
	for body in get_overlapping_bodies():
		if body.name == "Player":
			if event is InputEventMouseButton:
				current_trashcan = true
