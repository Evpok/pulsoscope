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
pair ne_ray_start = pulse_radius*dir(45);
path ne_ray = ne_ray_start -- ne_ray_start+ray_length*dir(45);
draw(ne_ray);

// South west ray
pair sw_ray_start =  pulse_radius*dir(-135);
path sw_ray = sw_ray_start -- sw_ray_start+ray_length*dir(-135);
draw(sw_ray);

// interrogation
path mark = (
    (0, 2*pulse_radius){left}
    :: (0, 4*pulse_radius){right}
    :: (pulse_radius, 2*pulse_radius){up}
    .. controls (0, pulse_radius) and (0, pulse_radius) .. (0, 0)
);
draw(shift(0, 1.5*pulse_radius)*mark);