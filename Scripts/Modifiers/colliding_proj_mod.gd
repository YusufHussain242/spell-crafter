class_name CollidingProjMod
extends ProjectileModifier

func _ready() -> void:
	super()
	projectile.post_collide_signal.connect(on_post_collide)
	
func on_post_collide(collision_info: KinematicCollision2D) -> void:
	projectile.queue_destroy()
