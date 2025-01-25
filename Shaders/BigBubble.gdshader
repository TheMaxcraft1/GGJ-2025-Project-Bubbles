shader_type canvas_item;

uniform float time : hint_range(0, 100); // Tiempo para animación
uniform float distortion_strength : hint_range(0.0, 1.0) = 0.05; // Fuerza de la distorsión
uniform float speed : hint_range(0.0, 5.0) = 1.0; // Velocidad de la distorsión

void fragment() {
    // Coordenadas de la textura normalizadas
    vec2 uv = UV;

    // Crear una distorsión en los bordes
    float distortion = sin(uv.x * 10.0 + time * speed) * 0.01 
                     + cos(uv.y * 10.0 - time * speed) * 0.01;

    // Ajustar el UV con la distorsión
    uv += distortion * distortion_strength;

    // Obtener el color de la textura usando las coordenadas UV modificadas
    COLOR = texture(TEXTURE, uv);

    // Aplicar transparencia en los bordes (opcional)
    float distance_to_center = distance(uv, vec2(0.5));
    COLOR.a *= smoothstep(0.5, 0.3, distance_to_center); // Ajusta este rango según sea necesario
}
