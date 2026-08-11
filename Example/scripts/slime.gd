extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_cast_right = $raycastright
@onready var ray_cast_left = $raycastleft
@onready var animate_sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
		animate_sprite.flip_h = true
	if ray_cast_left.is_colliding():
		direction = 1
		animate_sprite.flip_h = false
		
	position.x += direction * SPEED * delta
