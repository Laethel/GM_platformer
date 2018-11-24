//Get player input
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space); //on precise si le bouton est juste pressé brievement

//Calculate movement
var move = key_right - key_left; //var est une variable temporaire
//1 pour la droite, -1 pour la gauche, 0 si aucun ou les deux

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,oWall)) && (key_jump){
	vsp = -8;
}

//Collision horizontale
if (place_meeting(x+hsp,y,oWall)){
	//sign retourne 1 ou -1 si la variable est positive ou négative
	while (!place_meeting(x+sign(hsp),y,oWall)){ //se rapprocher un max du mur avant que la speed = 0
		x = x +sign(hsp); 
	}
	hsp = 0;
}
x = x + hsp;

//Collision verticale
if (place_meeting(x,y+vsp,oWall)){
	while (!place_meeting(x,y+sign(vsp),oWall)){ 
		y = y +sign(vsp); 
	}
	vsp = 0;
}
y = y + vsp;

//Animation
if (!place_meeting(x,y+1,oWall)){//si il n'y a pas de pixel directement en dessous
	sprite_index=sPlayerJump; //on assigne le sprite du saut
	image_speed=0;
	if (sign(vsp)>0){ //si sign est positif, c'est qu'on descend
		image_index = 1; //donc on assigne l'image 1 du sprite, qui est la chute
	} else{
		image_index = 0; //sinon, on afiche l'image 0, celle du saut
	}
} else { //si il y a un pixel en dessous
	image_speed=1; //vitesse du sprite à 15 fps
	if (hsp == 0){ //si le player ne bouge pas
		sprite_index=sPlayer; //sprite standing still
	} else {
		sprite_index=sPlayerRun; //sinon animation de course/marche
	}	
}
//tourner le sprite dans l'autre direction
if (hsp != 0){
	image_xscale = sign(hsp); //scaling, si set à -1 (donc quand on va à gauche), retourne le sprite
}