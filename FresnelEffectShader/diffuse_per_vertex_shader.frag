#version 120

// vertex shaderindan gelen veriler
varying float flesner;

// fragment shader main metodu
void main(void)
{
	vec4 blue = vec4(0.0, 0.0, 1.0, 1.0);
	vec4 red = vec4(1.0, 0.0, 0.0, 1.0);
	gl_FragColor = mix(red, blue, flesner);
}
