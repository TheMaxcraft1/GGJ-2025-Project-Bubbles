extends CharacterBody2D

enum BUBBLE_MODES { BIG_BUBBLE, SMALL_BUBBLES }

# FIRST ELEMENT WILL BE BIG_BUBBLE, SECOND ELEMENT WILL BE SMALL_BUBBLES
# WE CAN ACCESS THE VALUES VIA THE bubbleMode var

@export var max_speed: Array = [200, 300]
@export var acceleration: Array = [100, 500]
@export var deceleration: Array = [200, 300]
@export var ascend_speed: float = 100
@export var gravity: float = 200

var bubble_mode: int
var big_bubble : Node2D

func _ready():
	bubble_mode = BUBBLE_MODES.BIG_BUBBLE
	$BigBubble.visible = true
	$SmallBubbles.visible = false

func _process(delta: float) -> void:
	swapBubbleMode()
	move(delta)

func move(delta: float) -> void:
	# Entrada horizontal (izquierda y derecha)
	var input_horizontal = 0
	if Input.is_action_pressed("ui_right"):
		input_horizontal += 1
	if Input.is_action_pressed("ui_left"):
		input_horizontal -= 1

	# Movimiento horizontal con aceleración/desaceleración
	if input_horizontal != 0:
		# Acelerar hacia la dirección presionada
		velocity.x = move_toward(velocity.x, input_horizontal * max_speed[bubble_mode], acceleration[bubble_mode] * delta)
	else:
		# Desacelerar gradualmente cuando no se presiona nada
		velocity.x = move_toward(velocity.x, 0, deceleration[bubble_mode] * delta)

	if Input.is_action_pressed("ui_accept"):
		velocity.y = -ascend_speed
	else:
		# Gravedad que afecta al personaje
		velocity.y += gravity * delta

	# Llamar al método de movimiento
	move_and_slide()

func swapBubbleMode() -> void:
	if Input.is_action_just_released("swap_bubble"): # Key "C"
		if bubble_mode == BUBBLE_MODES.BIG_BUBBLE:
			bubble_mode = BUBBLE_MODES.SMALL_BUBBLES
		else: 
			bubble_mode = BUBBLE_MODES.BIG_BUBBLE
		
		
		$BigBubble.visible = !$BigBubble.visible
		$SmallBubbles.visible = !$SmallBubbles.visible
		
	
