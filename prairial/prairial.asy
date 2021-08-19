settings.outformat = "svg";
unitsize(1cm);
defaultpen(4);
real ray_length = 1.5*sqrt(2);
real pulse_radius = 1;

// Pulsar
path pulsi = circle((0, 0), pulse_radius);
draw(pulsi);

// North east ray
pair ne_ray_start = (pulse_radius*sqrt(2)/2, pulse_radius*sqrt(2)/2);
path ne_ray = ne_ray_start -- ne_ray_start+(ray_length*sqrt(2)/2, ray_length*sqrt(2)/2);
draw(ne_ray);

// North west beeps
draw(arc((0,0), pulse_radius+ray_length/4, 120, 150));
draw(arc((0,0), pulse_radius+2*ray_length/4, 110, 160));
draw(arc((0,0), pulse_radius+3*ray_length/4, 100, 170));

// South west ray
pair sw_ray_start = (-pulse_radius*sqrt(2)/2, -pulse_radius*sqrt(2)/2);
path sw_ray = sw_ray_start -- sw_ray_start-(ray_length*sqrt(2)/2, ray_length*sqrt(2)/2);
draw(sw_ray);

// South east beeps
draw(arc((0,0), pulse_radius+ray_length/4, -30, -60));
draw(arc((0,0), pulse_radius+2*ray_length/4, -20, -70));
draw(arc((0,0), pulse_radius+3*ray_length/4, -10, -80));
