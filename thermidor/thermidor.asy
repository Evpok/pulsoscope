settings.outformat = "svg";
import graph;
unitsize(1cm);
defaultpen(4);
real ray_length = 1.5*sqrt(2);
real pulse_radius = 1;
real widget_length = 1/3;

// Pulsar
pair spiral(real t) {
    return (t*cos(6*pi*t+pi/4), t*sin(6*pi*t+pi/4));
};
guide pulsi = graph(spiral, 0, 1);
draw(pulsi);


// North east ray
pair ne_ray_start = (pulse_radius*sqrt(2)/2, pulse_radius*sqrt(2)/2);
path ne_ray = ne_ray_start -- ne_ray_start+(ray_length*sqrt(2)/2, ray_length*sqrt(2)/2);
draw(ne_ray);

// South west ray
path sw_inner_ray = (0,0) -- (pulse_radius*cos(-3*pi/4), pulse_radius*sin(-3*pi/4));
pair sw_ray_start = intersectionpoints(sw_inner_ray, pulsi).pop();
path sw_ray = sw_ray_start -- sw_ray_start-(ray_length*sqrt(2)/2, ray_length*sqrt(2)/2);
draw(sw_ray);
