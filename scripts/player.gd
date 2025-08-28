extends CharacterBody2D

# assigning a variable with := is like saying that it can only store the type 
# that follows the =
@export var speed := 500
var can_shoot: bool = true;

signal laser(pos)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_just_pressed("shoot") && can_shoot:
		laser.emit($LaserStartPosition.global_position)
		can_shoot = false
		$ShootingCooldown.start()
		$LaserSound.play()

func play_collision_sound():
	$DamageSound.play()

func _on_shooting_cooldown_timeout() -> void:
	can_shoot = true
