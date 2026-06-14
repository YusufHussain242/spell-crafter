class_name Projectile
extends CharacterBody2D

# A callback function which handles movement and collision of the projectile.
# Should take a reference to the projectile and frame delta as parameters and return some a KinematicCollision2D.
# This will usually be set by one of the projectile modifiers.
var move_collide_callback: Callable

var destroy_flag: bool = false

signal pre_launch_signal(pos: Vector2, dir: Vector2)
signal launch_signal(pos: Vector2, dir: Vector2)
signal process_signal(delta: float)
signal collide_signal(collision_info: KinematicCollision2D)
signal post_collide_signal(collision_info: KinematicCollision2D)
signal destroy_signal()

func _physics_process(delta: float) -> void:
	process_signal.emit(delta)
	
	if not move_collide_callback:
		return
	
	var collision_info: KinematicCollision2D = move_collide_callback.call(self, delta)
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
