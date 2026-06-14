class_name DamagingProjMod
extends ProjectileModifier

@export var damage: float = 10

func _ready() -> void:
	super()
	projectile.collide_signal.connect(on_collide)
	
func on_collide(collision_info: KinematicCollision2D) -> void:
	var other := collision_info.get_collider()
	if other.has_method("take_hit"):
		other.take_hit({"damage" : damage})
