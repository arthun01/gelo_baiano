/// @description player's actions

//variaveis de input
right = keyboard_check(ord("D"));
left = keyboard_check(ord("A"));

//variavel temporaria de verificaão do chão
var chao = place_meeting(x, y+1, obj_wall);

//variaveis relacionadas a movimentação
var move = right - left;
hspd = spd * move;
vspd += grv;

#region MOVE/PULO

if(chao){
	if(right){
		hspd += lerp(0, 12, .2);
		vspd -= lerp(0, 6, .9);
		
		//modificando a escala
		xscale = .5;
		yscale = 1.5;
	}else if(left){
		hspd -= lerp(0, 12, .2);
		vspd -= lerp(0, 6, .9);
		
		//modificando a escala
		xscale = .5;
		yscale = 1.5;
	}
}

#endregion

#region COLISÃO
//horizontal
if(place_meeting(x+hspd, y, obj_wall)){
	while !(place_meeting(x+sign(hspd), y, obj_wall)){
		x += sign(hspd);
	}
	hspd = 0;
}
x += hspd;

//vertical
if(place_meeting(x, y+vspd, obj_wall)){
	while !(place_meeting(x, y+sign(vspd), obj_wall)){
		y += sign(vspd);
	}
	vspd = 0;
}
y += vspd;

#endregion

#region DIREÇÃO

if(right){
	image_index = 0;
}else if(left){
	image_index = 1;
}

#endregion

//voltando a escala natural
xscale = lerp(xscale, 1, .15);
yscale = lerp(yscale, 1, .15);

//----------------------------------------

//checking hook
if(mouse_check_button_pressed(mb_left)){
	mx = mouse_x;
	my = mouse_y;
	
	if(place_meeting(mx, my, obj_wallG)){
		active = true;
	}
}

//move
if(active){
	grv = 0.1;
	
	x += (mx - x) * 0.12;
	y += (my - y) * 0.12;
}

//canceling the hook
if(mouse_check_button_released(mb_left)){
	active = false;
	grv = 0.4;
}














