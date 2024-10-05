extends Node2D

var Ball = preload("res://Content/Scenes/Ball.tscn")

var throw_strength = 500
var last_mouse_position = Vector2()

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			throw_ball(event.position)
		
func throw_ball(target_pos):
	var ball = Ball.instantiate()
	add_child(ball)
	ball.position = $Thrower.position
	
	var throw_direction = (target_pos - ball.position).normalized()
	
	ball.apply_central_impulse(throw_direction * throw_strength)
