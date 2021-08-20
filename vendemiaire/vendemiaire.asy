settings.outformat = "pdf";
import graph;
unitsize(1cm);
defaultpen(4);
real ray_length = 2*sqrt(2);
real pulse_radius = 1;
real companion_distance = 3*pulse_radius;

// Inspired from https://tex.stackexchange.com/a/542429
bool is_outside(pair point, path[] paths){
    for (path p: paths){
        if (inside(p, point)) {
            return false;
        }
    }
    return true;
}

// Return the subpaths of `main` that are not inside of any of the cyclic paths in `clippers`.
path[] clip_path (path main, path[] clippers){
    path[] subpaths;
    real[] times;
    for (path c : clippers){
        for (real[] t : intersections(main, c)){
            times.push(t[0]);
        }
    }
    times = sort(times);
    times.push(size(main));
    for (int i = 1; i < times.length; ++i){
        real this_time = times[i];
        real last_time = times[i-1];
        real mid_time = (this_time + last_time) / 2.0;
        pair mid_location = point(main, mid_time);
        if (is_outside(mid_location, clippers)){
            subpaths.push(subpath(main, last_time, this_time));
        }
    }
    return subpaths;
}


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

// Companion
pair companion_center =  (2*pulse_radius+companion_distance, 0);
path companion = circle(companion_center, pulse_radius);
draw(companion);

// lemniscate
real half_width = (companion_center.x+pulse_radius)/2;
pair lemniscate(real t) {
    return (
        half_width*cos(t)/(1+sin(t)^2),
        half_width*sin(t)*cos(t)/(1+sin(t)^2)
    );
}

path lemn = shift(companion_center.x/2, 0)*graph(lemniscate, 0, 2*pi);
path[] clippers = {pulsi, companion};
draw(clip_path(lemn, clippers));