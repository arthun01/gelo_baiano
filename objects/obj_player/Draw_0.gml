/// @description Insert description here
// You can write your code in this editor

//desenhando a minha sprite com a escala atualizada
draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);

if(active){
	//draw_line(x, y, mx, my);
	draw_line_width_color(x, y, mx, my, 4, c_dkgray, c_black);
}