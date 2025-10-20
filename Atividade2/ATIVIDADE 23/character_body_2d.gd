extends CharacterBody2D

@export var speed := 100
@onready var anim = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Vector2.ZERO

	# Movimento
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	# Normaliza direção
	direction = direction.normalized()
	velocity = direction * speed

	# Move o personagem
	move_and_slide()

	# Controla animações
	if direction == Vector2.ZERO:
		anim.play("idle")
	else:
		if direction.y > 0:
			anim.play("walk_down")
		elif direction.y < 0:
			anim.play("walk_up")
		elif direction.x > 0:
			anim.play("walk_right")
		elif direction.x < 0:
			anim.play("walk_left")
