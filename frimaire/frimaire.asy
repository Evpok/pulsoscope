settings.outformat = "svg";
unitsize(1cm);
defaultpen(4);
real ray_length = 2*sqrt(2);
real pulse_radius = 1;
real widget_length = 1/3;
real nebula_radius = pulse_radius+ray_length/3;
real nebula_emission_length = ray_length/3;

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

// Nebula
path nebula = circle((0, 0), pulse_radius+ray_length/3);
draw(nebula);

// Arrows
pair nw_arrow_start = nebula_radius*dir(135);
draw(
    nw_arrow_start
    -- nw_arrow_start+nebula_emission_length*dir(135),
    arrow=EndArrow
);

pair ees_arrow_start = nebula_radius*dir(15);
draw(
    ees_arrow_start
    -- ees_arrow_start+nebula_emission_length*dir(15),
    arrow=EndArrow
);

pair sse_arrow_start = nebula_radius*dir(-105);
draw(
    sse_arrow_start
    -- sse_arrow_start+nebula_emission_length*dir(-105),
    arrow=EndArrow
);
