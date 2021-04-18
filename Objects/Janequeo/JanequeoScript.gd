extends KinematicBody2D

var velocity = Vector2(0,0) #Un vector 2.
var hp = 5
const speed = 200 #La rapidez del jugador.
const gravity = 30 #La gravedad.
const jumpForce = -850 #La fuerza de salto.
	
func _physics_process(delta): #Se ejecuta cada cuadro.
	
	if Input.is_action_pressed("right"): #Si precionamos las teclas correspondientes a "right".
		velocity.x = speed
		$Sprite.play("Run")
		$Sprite.flip_h = false
	
	elif Input.is_action_pressed("left"): #Si precionamos las teclas correspondientes a "right".
		velocity.x = -speed
		$Sprite.play("Run")
		$Sprite.flip_h = true
	
	else:
		$Sprite.play("Idle")
	
	if not is_on_floor():
		$Sprite.play("Jump")
	
	velocity.y = velocity.y + gravity #Simulamos la gravedad.
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jumpForce
		$Sprite.play("Jump")
	
	if Input.is_action_pressed("exit"):
		get_tree().change_scene("res://Niveles/MenúScene.tscn")
	velocity = move_and_slide(velocity, Vector2.UP) #Movemos al personaje.
	#Igualar velocity al movimiento impide que el objeto se siga acelerando por la "gravedad".
	velocity.x = lerp(velocity.x,0,0.2)#Interpolams entre velocity.x y 0 en valores de 0.2 para desacelerar.
	
func Damage():
	hp -= 1
	print(hp)
	print("Daño")
	if hp <= 0:
		hp = 5
		get_tree().reload_current_scene()
