#version 120

// vertex shaderindan gelen veriler
varying vec3 normal,pos;
varying float r0, r1;

// fragment shader main metodu
void main(void)
{
    vec3 lightDir = vec3(gl_LightSource[0].position.xyz - pos);
	   
	vec3 N = normalize(normal);
	vec3 L = normalize(lightDir);
	
	float lambertTerm = dot(N,L);
	float cos = lambertTerm / (length(N)*length(L));
	
	float flesner = r0 + (1-r0)*pow(1+cos,r1);
	
	vec4 blue = vec4(0.0, 0.0, 1.0, 1.0);
	vec4 red = vec4(1.0, 0.0, 0.0, 1.0);
	gl_FragColor = mix(blue, red, flesner);
    
}
