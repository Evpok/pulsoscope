settings.outformat = "svg";
unitsize(1cm);
defaultpen(4);
real ray_length = 1.5*sqrt(2);
real pulse_radius = 1;
real widget_length = 1/3;

// Pulsar
path pulsi = circle((0, 0), pulse_radius);
draw(pulsi);

// North east ray
pair ne_ray_start = (pulse_radius*sqrt(2)/2, pulse_radius*sqrt(2)/2);
path ne_ray = ne_ray_start -- ne_ray_start+(ray_length*sqrt(2)/2, ray_length*sqrt(2)/2);
draw(ne_ray);

// South west ray
pair sw_ray_start = (-pulse_radius*sqrt(2)/2, -pulse_radius*sqrt(2)/2);
path sw_ray = sw_ray_start -- sw_ray_start-(ray_length*sqrt(2)/2, ray_length*sqrt(2)/2);
draw(sw_ray);

// central dot
fill(circle((0,0), 0.2));