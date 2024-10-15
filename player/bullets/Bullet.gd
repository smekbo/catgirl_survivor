extends CharacterBody2D
class_name Bullet


@export var bullet_sprite: Texture

@onready var area: Area2D = $Area2D
@onready var sprite: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.texture = bullet_sprite
	area.body_entered.connect(_on_hit_enemy)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	move_and_slide()


func _on_hit_enemy(enemy: Enemy):
	print("HIT")
	enemy.damaged(10)
