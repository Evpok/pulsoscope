settings.outformat = "svg";
unitsize(1cm);
defaultpen(4);
real ray_length = sqrt(2);
real pulse_radius = 1;
real widget_length = 1/3;

// Pulsar
path pulsi = circle((0, 0), pulse_radius);
draw(pulsi);

// North east ray
pair ne_ray_start = (pulse_radius*sqrt(2)/2, pulse_radius*sqrt(2)/2);
path ne_ray = ne_ray_start -- ne_ray_start+(ray_length*sqrt(2)/2, ray_length*sqrt(2)/2);
draw(ne_ray);
pair ne_widget_anchor = relpoint(ne_ray, 2/3);
draw(
    ne_widget_anchor+(-widget_length, widget_length)
    -- ne_widget_anchor+(widget_length, -widget_length)
);

// South west ray
pair sw_ray_start = (-pulse_radius*sqrt(2)/2, -pulse_radius*sqrt(2)/2);
path sw_ray = sw_ray_start -- sw_ray_start-(ray_length*sqrt(2)/2, ray_length*sqrt(2)/2);
draw(sw_ray);
pair sw_widget_center = relpoint(sw_ray, 1/3);
draw(arc(sw_widget_center, pulse_radius/2, -60, -210));
