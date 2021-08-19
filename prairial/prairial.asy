settings.outformat = "svg";
unitsize(1cm);
defaultpen(4);
real ray_length = 1.5;
real pulse_radius = 1;

// Pulsar
path pulsi = circle((0, 0), pulse_radius);
draw(pulsi);

// North east ray
path ne_inner_ray = (0,0) .. (2*pulse_radius,2*pulse_radius);
pair ne_ray_start = intersectionpoint(pulsi, ne_inner_ray);
path ne_outer_ray = ne_ray_start -- ne_ray_start+(ray_length, ray_length);
draw(ne_outer_ray);

// North west beeps
draw(arc((0,0), pulse_radius+ray_length/4, 120, 150));
draw(arc((0,0), pulse_radius+2*ray_length/4, 110, 160));
draw(arc((0,0), pulse_radius+3*ray_length/4, 100, 170));

// South west ray
path sw_inner_ray = (0,0) .. (-2*pulse_radius,-2*pulse_radius);
pair sw_ray_start = intersectionpoint(pulsi, sw_inner_ray);
path sw_outer_ray = sw_ray_start -- sw_ray_start-(ray_length, ray_length);
draw(sw_outer_ray);

// South east beeps
draw(arc((0,0), pulse_radius+ray_length/4, -30, -60));
draw(arc((0,0), pulse_radius+2*ray_length/4, -20, -70));
draw(arc((0,0), pulse_radius+3*ray_length/4, -10, -80));
