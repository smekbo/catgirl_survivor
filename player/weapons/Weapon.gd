extends Node2D
class_name Weapon


@export var bullet_type: PackedScene
@export var bullet_quantity: int
@export var attack_speed: Timer

var bullet_pool: Node2D


func _ready():
	attack_speed.autostart = true
	attack_speed.timeout.connect(shoot)
	bullet_pool = get_tree().current_scene.find_child("bullet_pool")

func _physics_process(delta: float) -> void:
	movement()


func movement():
	pass


func shoot():
	var new_bullet = bullet_type.instantiate()
	new_bullet.position = Player.position
	bullet_pool.add_child(new_bullet)
