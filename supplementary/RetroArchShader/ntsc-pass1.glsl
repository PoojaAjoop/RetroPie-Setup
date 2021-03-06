// GLSL shader autogenerated by cg2glsl.py.
#if defined(VERTEX)
varying     vec2 VARpix_no;
varying     vec2 VARtex;


struct data {
    vec2 VARtex;
    vec2 VARpix_no;
};

struct input_dummy {
    vec2 _video_size;
    vec2 _texture_size;
    vec2 _output_dummy_size;
    float _frame_count;
};

vec4 _oPosition1;
data _oData1;
uniform mat4 MVPMatrix;
input_dummy _IN1;
vec4 _r0004;
attribute vec4 VertexCoord;
attribute vec4 TexCoord;

 

         mat4 transpose_(mat4 matrix)
         {
            mat4 ret;
            for (int i = 0; i != 4; i++)
               for (int j = 0; j != 4; j++)
                  ret[i][j] = matrix[j][i];

            return ret;
         }
         
uniform int FrameDirection;
uniform int FrameCount;
#ifdef GL_ES
uniform mediump vec2 OutputSize;
uniform mediump vec2 TextureSize;
uniform mediump vec2 InputSize;
#else
uniform vec2 OutputSize;
uniform vec2 TextureSize;
uniform vec2 InputSize;
#endif
void main()
{
    mat4 MVPMatrix_ = transpose_(MVPMatrix);


    _r0004.x = dot(MVPMatrix_[0], VertexCoord);
    _r0004.y = dot(MVPMatrix_[1], VertexCoord);
    _r0004.z = dot(MVPMatrix_[2], VertexCoord);
    _r0004.w = dot(MVPMatrix_[3], VertexCoord);
    _oPosition1 = _r0004;
    VARtex = TexCoord.xy;
    VARpix_no = TexCoord.xy*TextureSize*(OutputSize/InputSize);
    gl_Position = _r0004;
} 
#elif defined(FRAGMENT)
#ifdef GL_ES
precision mediump float;
#endif
varying     vec2 VARpix_no;
varying     vec2 VARtex;


struct data {
    vec2 VARtex;
    vec2 VARpix_no;
};

struct input_dummy {
    vec2 _video_size;
    vec2 VARtexture_size;
    vec2 _output_dummy_size;
    float _frame_count;
};

vec4 _ret_0;
float _TMP3;
float _TMP2;
float _TMP1;
float _TMP4;
vec4 _TMP0;
input_dummy _IN1;
data _vertex1;
uniform sampler2D Texture;
vec3 _r0015;
float _x0025;

 
uniform int FrameDirection;
uniform int FrameCount;
#ifdef GL_ES
uniform mediump vec2 OutputSize;
uniform mediump vec2 TextureSize;
uniform mediump vec2 InputSize;
#else
uniform vec2 OutputSize;
uniform vec2 TextureSize;
uniform vec2 InputSize;
#endif
void main()
{

    vec3 _yiq;
    float _chroma_phase;
    float _mod_phase;

    _TMP0 = texture2D(Texture, VARtex);
    _r0015.x = dot(vec3( 2.98900008E-001, 5.87000012E-001, 1.14000000E-001), _TMP0.xyz);
    _r0015.y = dot(vec3( 5.95899999E-001, -2.74399996E-001, -3.21599990E-001), _TMP0.xyz);
    _r0015.z = dot(vec3( 2.11500004E-001, -5.22899985E-001, 3.11399996E-001), _TMP0.xyz);
    _x0025 = VARpix_no.y/3.00000000E+000;
    _TMP4 = floor(_x0025);
    _TMP1 = VARpix_no.y - 3.00000000E+000*_TMP4;
    _chroma_phase = 2.09449983E+000*(_TMP1 + float(FrameCount));
    _mod_phase = _chroma_phase + VARpix_no.x*1.25663710E+000;
    _TMP2 = cos(_mod_phase);
    _TMP3 = sin(_mod_phase);
    _yiq = vec3(_r0015.x, _r0015.y*_TMP2, _r0015.z*_TMP3);
    _ret_0 = vec4(_yiq.x, _yiq.y, _yiq.z, 1.00000000E+000);
    gl_FragColor = _ret_0;
    return;
} 
#endif
