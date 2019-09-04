extends Control

onready var label : = $Label
onready var char_rect : = $TextureRect
onready var animation_player : = $AnimationPlayer
onready var music_player : = $MusicPlayer
onready var sfx_player : = $SFXPlayer

const TEXTO_1  = [
	"Durante séculos, as Forças do Caos estiveram aprisionadas por um poderoso feitiço... ",
	"No entanto, no alvorecer do Século 21, uma misteriosa bruxa conseguiu romper a proteção mágica que preservava a própria ordem da realidade…",
	"Era Robertinha, a Bruxa do Caos."
]

const TEXTO_2 = [
	"Na verdade, ela fez isso sem querer.",
	"Porém, após o despertar de suas habilidades mágicas, tudo que Roberta precisava era de um poderoso elemento cósmico... ",
	"Um elemento que revelaria a verdadeira extensão de seus poderes...",
	"Um elemento tão poderoso que só poderia ser encontrado no...",
	"Shopping."
]

var dialogue_index : = -1
var current_text = TEXTO_1
var can_play = true

func _ready():
	label.text = TEXTO_1[0]
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dialogue_index < current_text.size():
		label.text = current_text[dialogue_index]
	else:
		if current_text == TEXTO_1:
			char_rect.visible = true
		elif current_text == TEXTO_2:
			music_player.stop()
		label.visible = false
#	pass


func _on_CutsceneInicial_gui_input(event):
	if event is InputEventMouseButton and event.pressed:
		label.visible = true
		dialogue_index += 1
		if current_text == TEXTO_1 and dialogue_index > TEXTO_1.size():
			animation_player.play("FadeOut")
		elif current_text == TEXTO_2 and music_player.playing == false:
			if can_play:
				sfx_player.play()
				can_play = false
			pass
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
		dialogue_index = 0
		current_text = TEXTO_2
	


func _on_SFXPlayer_finished():
	get_tree().change_scene("res://Scenes/Levels/InitialDialog.tscn")
	pass # Replace with function body.
