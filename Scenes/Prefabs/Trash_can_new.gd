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
	for body in get_overlapping_bodies():
		if body.name == "Player":
			if event is InputEventMouseButton:
				current_trashcan = true
				print("hi")