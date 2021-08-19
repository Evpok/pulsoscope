settings.outformat = "svg";
import graph;
unitsize(1cm);
defaultpen(4);
real ray_length = 1.5;
real pulse_radius = 1;

// Sinusoidal rays
pair sinray(real t) {
    return (t/4, sin(t)/2);
}

// Pulsar
path pulsi = circle((0, 0), pulse_radius);
draw(pulsi);

// North east ray
pair ne_ray_start = (pulse_radius*sqrt(2)/2, pulse_radius*sqrt(2)/2);
draw(
    shift(ne_ray_start)
    * rotate(45)
    * graph(sinray, 0, 4*pi)
);

// // South west ray
pair sw_ray_start = (-pulse_radius*sqrt(2)/2, -pulse_radius*sqrt(2)/2);
draw(
    shift(sw_ray_start)
    * rotate(-135)
    * graph(sinray, 0, 4*pi)
);

