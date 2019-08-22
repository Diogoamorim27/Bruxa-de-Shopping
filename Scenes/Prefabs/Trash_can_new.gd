extends Area2D

export var items :  = []

var item_rects : = []
var rect_id : = {}
var current_trashcan = false
var initialized : = false

func _on_Trashcan_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		current_trashcan = true
	pass # Replace with function body.
