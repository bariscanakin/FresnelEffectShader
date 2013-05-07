#version 120

// sabit degiskenler
uniform mat4 MVP,ModelView;
uniform float reflectance, power;

// diziden alinacak degiskenler
attribute vec4 Position;
attribute vec3 Normal;

// fragment shader'a aktarilacak veriler
varying float flesner;

// vertex shader main metodu
void main()
{	
    // camera space position
    vec3 vVertex = vec3(ModelView * Position);
    // camera space normal
    vec3 normal = mat3(ModelView) * Normal;
    
    vec3 lightDir = vec3(gl_LightSource[0].position.xyz - vVertex);
	vec3 eyeVec = -vVertex;
    
    vec3 N = normal;
	vec3 L = normalize(lightDir);
	
	float intensity = dot(N,L);
    float cos = intensity / (length(N)*length(L));
    
	flesner = reflectance + (1-reflectance)*pow(1+cos,power);
	
    gl_Position = MVP * Position;
}
	
