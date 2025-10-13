extends CharacterBody2D

@onready var _animated_sprite = $AnimatedSprite2D
@onready var _botao = $"../Botao"  

var animando = false

func _ready():
	_botao.text = "Executar animação"
	_botao.pressed.connect(_ao_clicar_botao)
	_animated_sprite.playing = false
	_animated_sprite.animation = "run" 

func _process(_delta):
   
	if Input.is_action_pressed("ui_right"):
		_animated_sprite.play("run")
		animando = true
		_botao.text = "Parar animação"
	elif animando == false:
		_animated_sprite.stop()

func _ao_clicar_botao():
	if animando:
		parar_animacao()
	else:
		iniciar_animacao()

func iniciar_animacao():
	_animated_sprite.play("run")
	animando = true
	_botao.text = "Parar animação"

func parar_animacao():
	_animated_sprite.stop()
	animando = false
	_botao.text = "Executar animação"

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):  
		if animando:
			parar_animacao()
		else:
			iniciar_animacao()
