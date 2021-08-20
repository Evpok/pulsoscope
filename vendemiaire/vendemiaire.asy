settings.outformat = "svg";
unitsize(1cm);
defaultpen(4);
real ray_length = 2*sqrt(2);
real pulse_radius = 1;
real widget_length = 1/3;
real nebula_radius = pulse_radius+ray_length/3;
real planet_radius = 0.5;


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

// Nebula
path nebula = circle((0, 0), pulse_radius+ray_length/3);

// Planets
pair nw_planet_center = nebula_radius*dir(135);
path nw_planet = circle(nw_planet_center, planet_radius);
draw(nw_planet);

pair ees_planet_center = nebula_radius*dir(15);
path ees_planet = circle(ees_planet_center, planet_radius);
draw(ees_planet);

pair sse_planet_center = nebula_radius*dir(-105);
path sse_planet = circle(sse_planet_center, planet_radius);
draw(sse_planet);

path[] planets = {nw_planet, ees_planet, sse_planet};
draw(clip_path(nebula, planets));
