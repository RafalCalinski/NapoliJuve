shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform float amount;
uniform float vignette;

void fragment() {
	float x = SCREEN_UV.x - 0.5;
	float y = SCREEN_UV.y - 0.5;
	float d = x*x + y*y;
	float darken = (1.0 - d) * vignette;
	
	float r = texture(SCREEN_TEXTURE, SCREEN_UV).r;
	float g = texture(SCREEN_TEXTURE, vec2(SCREEN_UV.x + (d * amount * SCREEN_PIXEL_SIZE.x), SCREEN_UV.y)).g;
	float b = texture(SCREEN_TEXTURE, vec2(SCREEN_UV.x - (d * amount * SCREEN_PIXEL_SIZE.x), SCREEN_UV.y)).b;
	COLOR = vec4(r * darken, g * darken, b * darken, 1.0);
}
