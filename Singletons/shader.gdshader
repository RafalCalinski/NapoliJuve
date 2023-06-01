shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform float amount = 7.0;
uniform float vignette = 0.75;
uniform float lod: hint_range(0.0, 5) = 0.0;

void fragment() {
	float x = SCREEN_UV.x - 0.5;
	float y = SCREEN_UV.y - 0.5;
	float d = x*x + y*y;
	float darken = (1.0 - d * vignette);
	
	float r = texture(SCREEN_TEXTURE, SCREEN_UV, d * lod).r;
	float g = texture(SCREEN_TEXTURE, vec2(SCREEN_UV.x + (d * amount * SCREEN_PIXEL_SIZE.x), SCREEN_UV.y), d * lod).g;
	float b = texture(SCREEN_TEXTURE, vec2(SCREEN_UV.x - (d * amount * SCREEN_PIXEL_SIZE.x), SCREEN_UV.y), d * lod).b;
	COLOR = vec4(r * darken, g * darken, b * darken, 1.0);
}
