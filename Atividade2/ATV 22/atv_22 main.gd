extends Node2D 

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var button: Button = $Button

var is_animating: bool = false  

func _ready():
	
	animated_sprite.stop()    
	button.text = "Executar Animação"
	
	
	button.pressed.connect(_on_button_pressed)

func _on_button_pressed():
	toggle_animation()

func toggle_animation():
	is_animating = !is_animating  
	
	if is_animating:
		animated_sprite.play("jump")  
		button.text = "Parar Animação"
	else:
		animated_sprite.stop()  
		button.text = "Executar Animação"


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_SPACE:  
			toggle_animation()  
			get_viewport().set_input_as_handled()  
