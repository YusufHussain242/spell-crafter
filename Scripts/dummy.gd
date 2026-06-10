extends CharacterBody2D

@export var health: float = 100

func take_hit(payload: Dictionary) -> void:
	health -= payload["damage"]
	if health <= 0:
		queue_free()
