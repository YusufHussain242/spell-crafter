class_name ProjectileModifier
extends Node

var projectile: Projectile

func _ready() -> void:
	var parent = get_parent()
	
	if not parent:
		return
	if parent is not Projectile:
		return
		
	projectile = parent as Projectile
