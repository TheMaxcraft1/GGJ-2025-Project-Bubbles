extends RigidBody2D

var followingPlayer: bool = false
var isPlayerColliding: bool = false # This is used only for the use case in which player is already colliding and changes mode
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var player = get_parent().get_node("Player")
		
	if isPlayerColliding and player.getBubbleMode() == GameManager.BUBBLE_MODES.BIG_BUBBLE:
		_on_box_area_body_entered(player)
	
	if followingPlayer:
		
		var playerPosition = player.position
		
		if player.getBubbleMode() == GameManager.BUBBLE_MODES.SMALL_BUBBLES:
			followingPlayer = false
			linear_velocity = Vector2(player.velocity.x, 0) # This line ALMOST MAKES ME KILL MYSELF. I WASTED 3 HOURS OMGGGG
		else:
			var tween = create_tween()
			tween.tween_property(self, "position", playerPosition, 0.2) 
		


func _on_box_area_body_entered(body: Node2D) -> void:
	if body.name == "Player": #BOX IS COLLIDING WITH THE PLAYER...
		isPlayerColliding = true
		if body.getBubbleMode() == GameManager.BUBBLE_MODES.BIG_BUBBLE:
			call_deferred("swapCollisionEnablement", true)
			followingPlayer = true  # Start following the player

	
func swapCollisionEnablement(disable: bool):
	$BoxCollisionShape.disabled = disable
	
func _on_tween_finished() -> void:
	followingPlayer = true  # Start following the player

func _on_box_area_body_exited(body: Node2D) -> void:
	if body.name == "Player": #BOX IS COLLIDING WITH THE PLAYER...
		call_deferred("swapCollisionEnablement", false)
		isPlayerColliding = false
