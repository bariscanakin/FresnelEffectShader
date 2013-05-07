#version 120

// sabit degiskenler
uniform mat4 MVP,ModelView;
uniform float reflectance, power;

// diziden alinacak degiskenler
attribute vec4 Position;
attribute vec3 Normal;

// fragment shader'a aktarilacak veriler
varying vec3 normal,pos;
varying float r0, r1;

// vertex shader main metodu
void main()
{	
	r0 = reflectance;
	r1 = power;
	
    // gl_Position ekranda noktanin nerede olacagini belirtir.
    vec3 vVertex = vec3(ModelView * Position);
    
    normal = mat3(ModelView)*Normal;
    pos = vVertex;
    
    gl_Position = MVP * Position;
}