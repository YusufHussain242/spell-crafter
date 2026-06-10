class_name Projectile
extends CharacterBody2D

@export var damage: float = 10
@export var speed: float = 400

func _physics_process(delta: float) -> void:
	var collision_info := move_and_collide(velocity * delta)
	if collision_info:
		if collision_info.get_collider().has_method("take_hit"):
			collision_info.get_collider().take_hit({"damage": damage})
		queue_free()

func launch(dir: Vector2):
	velocity = dir * speed
