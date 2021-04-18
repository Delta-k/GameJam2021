extends Node

func _ready():
	get_tree().reload_current_scene()

func _on_btnRegresar_pressed():
	get_tree().change_scene("res://Niveles/MenúScene.tscn")

func _on_btnCreditos_pressed():
	get_tree().change_scene("res://Niveles/CréditosScene.tscn")

func _on_btnComenzar_pressed():
	get_tree().change_scene("res://Niveles/PruebasScene.tscn")
