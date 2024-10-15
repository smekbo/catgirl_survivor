extends CharacterBody2D
class_name Enemy


@export var stats: EnemyStats

@onready var boid_sensor: Area2D = $boid_sensor
@onready var boid_push_cooldown: Timer = $boid_push_cooldown
@onready var boid_max_neighbors: int = 5
@onready var sprite_animation: AnimationPlayer = $sprite_animation
@onready var particle_animation: AnimationPlayer = $particle_animation

var target: Vector2
var boid_direction: Vector2 = Vector2.ZERO
var boid_target_speed: float = 0
var boid_speed: float = 0
var boid_vector: Vector2
var boid_neighbor_count = 0
var boid_neighbor_list: Array[Node2D]

func _on_player_announce_location(_target: Vector2):
	target = _target


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	boid_push()
	velocity = (target - position) * stats.SPEED
	velocity += boid_vector
	#boid_speed = move_toward(boid_target_speed, 0, stats.SPEED)
	move_and_slide()


func damaged(amount: int):
	sprite_animation.play("damage")
	stats.HEALTH -= amount
	velocity = Vector2.ZERO
	if stats.HEALTH <= 0:
		particle_animation.play("die")

func boid_push():
	boid_vector = Vector2.ZERO
	for boid in boid_neighbor_list:
		boid_direction = (position - boid.position)
		boid_speed = clamp(stats.boid_separation - abs(position.distance_to(boid.position)), 0, stats.boid_separation)
		boid_vector += boid_direction * boid_speed


func add_neighbor(boid: Node2D):
	if boid_neighbor_list.size() < boid_max_neighbors:
		boid_neighbor_list.append(boid)


func remove_neighbor(boid: Node2D):
	if boid_neighbor_list.has(boid):
		boid_neighbor_list.remove_at(boid_neighbor_list.find(boid))
