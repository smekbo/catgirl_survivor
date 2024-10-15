# The GUN weapon, shoots in a straight line
extends Weapon


func movement():
	for bullet: Bullet in bullet_pool.get_children():
		bullet.velocity = Vector2.RIGHT * 400
