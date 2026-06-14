class_name MovingProjMod
extends ProjectileModifier

@export var speed: float = 600

func _ready() -> void:
	super()
	projectile.launch_signal.connect(on_launch)

func on_launch(pos: Vector2, dir: Vector2) -> void:
	projectile.velocity = dir * speed
	print(projectile.velocity)
