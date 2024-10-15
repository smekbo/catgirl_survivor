extends Node2D


var basic_enemy = preload("res://enemies/basic/enemy_basic.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_enemy_spawn_timer() -> void:
	var new_enemy = basic_enemy.instantiate()
	Player.announce_location.connect(new_enemy._on_player_announce_location)
	get_tree().current_scene.add_child(new_enemy)
