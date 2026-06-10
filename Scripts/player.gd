extends CharacterBody2D

@export var speed: float = 400

@onready var _animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var _target: Vector2 = position
var _anim_dir: float = 0

func _input(event):
	if event.is_action_pressed(&"click"):
		_target = get_global_mouse_position()

func _process(delta):
	update_animations()

func _physics_process(delta):
	if position.distance_to(_target) > 10:
		velocity = position.direction_to(_target) * speed
		_anim_dir = rad_to_deg(velocity.angle())
		move_and_slide()
	else:
		velocity = Vector2.ZERO

func update_animations() -> void:
	var prefix := ""
	if velocity.length_squared() < 5:
		prefix = "idle"
	else:
		prefix = "run"
	
	if _anim_dir >= -22.5 and _anim_dir < 22.5:
		_animated_sprite.flip_h = false
		_animated_sprite.play("%s-east" % prefix)
	elif _anim_dir >= 22.5 and _anim_dir < 67.5:
		_animated_sprite.flip_h = false
		_animated_sprite.play("%s-southeast" % prefix)
	elif _anim_dir >= 67.5 and _anim_dir < 112.5:
		_animated_sprite.flip_h = false
		_animated_sprite.play("%s-south" % prefix)
	elif _anim_dir >= 112.5 and _anim_dir < 157.5:
		_animated_sprite.flip_h = true
		_animated_sprite.play("%s-southeast" % prefix)
	elif _anim_dir >= 157.5 or _anim_dir < -157.5:
		_animated_sprite.flip_h = true
		_animated_sprite.play("%s-east" % prefix)
	elif _anim_dir >= -157.5 and _anim_dir < -112.5:
		_animated_sprite.flip_h = true
		_animated_sprite.play("%s-northeast" % prefix)
	elif _anim_dir >= -112.5 and _anim_dir < -67.5:
		_animated_sprite.flip_h = false
		_animated_sprite.play("%s-north" % prefix)
	elif _anim_dir >= -67.5 and _anim_dir < -22.5:
		_animated_sprite.flip_h = false
		_animated_sprite.play("%s-northeast" % prefix)
