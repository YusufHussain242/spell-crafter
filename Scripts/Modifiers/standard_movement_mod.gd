class_name StandardMovementMod
extends ProjectileModifier

func _ready() -> void:
	super()
	projectile.launch_signal.connect(on_launch)

func on_launch(pos: Vector2, dir: Vector2) -> void:
	projectile.move_collide_callback = move_collide_callback

func move_collide_callback(projectile: Projectile, delta: float):
	return projectile.move_and_collide(projectile.velocity * delta)
