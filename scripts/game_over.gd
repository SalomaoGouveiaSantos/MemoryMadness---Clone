extends Control

@onready var moves_label = $NinePatchRect/MC/VB/HB/MovesLabel

func _ready():
	SignalManager.on_game_over.connect(on_game_over)
	pass

func on_game_over(moves: int) -> void:
	moves_label.text = str(moves)
	show()
	pass

func _on_exit_button_pressed():
	hide()
	SignalManager.on_game_exit_pressed.emit()
	pass

