extends CanvasLayer

@export var level_scene: PackedScene

func _ready():
	$CenterContainer/VBoxContainer/GameOverScoreLabel.text = $CenterContainer/VBoxContainer/GameOverScoreLabel.text + str(Global.score)

func _input(event): 
	if event.is_action_pressed("shoot"): 
		get_tree().change_scene_to_packed(level_scene)
