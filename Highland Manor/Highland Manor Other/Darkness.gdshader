shader_type canvas_item;

uniform vec2 position = vec2(0.0);
uniform float radius = 0.5;

uniform sampler2D grad_text;

void fragment() {
	COLOR = texture(grad_text, UV);
}