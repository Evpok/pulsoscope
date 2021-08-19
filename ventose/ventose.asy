settings.outformat = "svg";
unitsize(1cm);
defaultpen(4);
real ray_length = 2*sqrt(2);
real pulse_radius = 1;
real widget_length = 1/3;


// Pulsar
path pulsi = circle((0, 0), pulse_radius);
draw(pulsi);

// North east ray
pair ne_ray_start = pulse_radius*dir(45);
path ne_ray = (
    ne_ray_start
    -- ne_ray_start+ray_length*dir(30)
    -- ne_ray_start+ray_length*dir(60)
    -- cycle
);
draw(ne_ray);

// South west ray
pair sw_ray_start =  pulse_radius*dir(-135);
path sw_ray = (
    sw_ray_start
    -- sw_ray_start+ray_length*dir(-120)
    -- sw_ray_start+ray_length*dir(-150)
    -- cycle
);
draw(sw_ray);
