class_name Projectile
extends CharacterBody2D

var destroy_flag: bool = false

signal pre_launch_signal(pos: Vector2, dir: Vector2)
signal launch_signal(pos: Vector2, dir: Vector2)
signal process_signal(delta: float)
signal collide_signal(collision_info: KinematicCollision2D)
signal post_collide_signal(collision_info: KinematicCollision2D)
signal destroy_signal()

func _physics_process(delta: float) -> void:
	process_signal.emit(delta)
	
	var collision_info := move_and_collide(velocity * delta)
	if collision_info:
		collide_signal.emit(collision_info)
		post_collide_signal.emit(collision_info)
		
	if destroy_flag:
		destroy_signal.emit()
		queue_free()

func launch(pos: Vector2, dir: Vector2) -> void:
	position = pos
	pre_launch_signal.emit(pos, dir)
	launch_signal.emit(pos, dir)
	
func queue_destroy():
	destroy_flag = true
