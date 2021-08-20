import graph;
unitsize(1cm);
currentpen += 4;
real ray_length = 2*sqrt(2);
real pulse_radius = 1;

// Pulsar
path pulsi = circle((0, 0), pulse_radius);
draw(pulsi);

// North east ray
pair ne_ray_start = pulse_radius*dir(45);
path ne_ray = ne_ray_start -- ne_ray_start+ray_length*dir(45);
draw(ne_ray);

// South west ray
pair sw_ray_start =  pulse_radius*dir(-135);
path sw_ray = sw_ray_start -- sw_ray_start+ray_length*dir(-135);
draw(sw_ray);

// Companion
pair companion_center =  (2*pulse_radius, 0);
path companion = circle(companion_center, pulse_radius);
draw(companion);

// Wave
draw(arc((pulse_radius, 0), 2.375*pulse_radius, -20, 20));