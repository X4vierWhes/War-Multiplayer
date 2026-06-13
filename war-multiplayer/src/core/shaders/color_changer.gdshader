shader_type canvas_item;

uniform vec4 color_to_replace : source_color = vec4(1.0, 1.0, 1.0, 1.0);
uniform vec4 new_color : source_color = vec4(0.0, 0.0, 1.0, 1.0);
uniform float tolerance : hint_range(0.0, 1.0) = 0.05;

void fragment() {
	vec4 current_color = texture(TEXTURE, UV);
	
	float color_diff = distance(current_color.rgb, color_to_replace.rgb);
	
	if (color_diff <= tolerance) {
		COLOR = vec4(new_color.rgb, current_color.a);
	} else {
		COLOR = current_color;
	}
}