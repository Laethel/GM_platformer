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
