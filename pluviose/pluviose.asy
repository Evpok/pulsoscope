settings.outformat = "svg";
unitsize(1cm);
defaultpen(4);
real ray_length = 1.;
real pulse_radius = 1;
real widget_length = 1/3;

// Pulsar
path pulsi = circle((0, 0), pulse_radius);
draw(pulsi);

// North east ray
path ne_inner_ray = (0,0) .. (2*pulse_radius,2*pulse_radius);
pair ne_ray_start = intersectionpoint(pulsi, ne_inner_ray);
path ne_outer_ray = ne_ray_start -- ne_ray_start+(ray_length, ray_length);
draw(ne_outer_ray);
pair ne_widget_anchor = relpoint(ne_outer_ray, 2/3);
draw(
    ne_widget_anchor+(-widget_length, widget_length)
    -- ne_widget_anchor+(widget_length, -widget_length)
);

// South west ray
path se_inner_ray = (0,0) .. (-2*pulse_radius,-2*pulse_radius);
pair se_ray_start = intersectionpoint(pulsi, se_inner_ray);
path se_outer_ray = se_ray_start -- se_ray_start-(ray_length, ray_length);
draw(se_outer_ray);
pair se_widget_center = relpoint(se_outer_ray, 1/3);
draw(arc(se_widget_center, pulse_radius/2, -60, -210));
