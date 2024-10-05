class_name Ball
extends RigidBody2D

var is_stuck = false

func _ready():
	contact_monitor = true
	max_contacts_reported = 1
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if body is Ball and not is_stuck:
		stick_to_ball(body)

func stick_to_ball(other_ball):
	if not is_stuck:
		is_stuck = true
		
		var joint = PinJoint2D.new()
		get_parent().add_child(joint)
		
		joint.position = position
		joint.node_a = get_path()
		joint.node_b = other_ball.get_path()
		
		joint.softness = 0.1
