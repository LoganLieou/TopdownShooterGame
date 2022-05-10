extends KinematicBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var motion = Vector2()

func _physics_process(delta):
	var Player = get_parent().get_node("Player")

	position += (Player.position - position) / 50
	look_at(Player.position)

	move_and_collide(motion)

func _on_Hitbox_body_entered(body):
	if "Bullet" in body.name:
		queue_free()
