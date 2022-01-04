
$fn=100;

paperclip();
example();

module example(){
    //   outer_radius, inner_radius, list of segments
    pipe(10,           7,           [
        //length,rotation,angle,radius_of_curvature 
        [    200,       0,   90,    10],
        [    120,      90,  120,    20],
        [    100,       0,  120,    20],
        [     60,       0,    0,    20]
    ]);
    
    color("white")
    rotate([180, 0, 0])
    pipe(14,          10,           [
        //length,rotation,angle,radius_of_curvature 
        [     60,     180,   90,     0],
        [     60,      90,    0,    20]
    ]);

}

module paperclip() {
    color("gray")
    translate([300, 0, 60])
    pipe(10, 9, [
        //length,rotation,angle,radius_of_curvature 
        [    500,       0,   90,    70],
        [    140,       0,   90,    70],
        [    550,      10,   90,    30],
        [    120,       0,   90,    30],
        [    400,      10,   90,    50],
        [    100,       0,   90,    50],
        [    360,      10,    0,    50],
    ]);
}

function curve_length(radius, angle) = radius * tan(angle/2);

module pipe(outer_radius, inner_radius, segments, i=0, prev_radius_of_curvature=0) {
    segment = segments[i];
    length = segment[0];
    rotation = segment[1];
    angle = segment[2];
    radius_of_curvature = segment[3];
    pipe_segment(outer_radius, inner_radius, segment, prev_radius_of_curvature);
    
    translate([0,0,length]) {
        rotate([angle, 0, rotation]) {
            if (i < len(segments)-1) {
                next_radius_of_curvature = curve_length(radius_of_curvature, angle);
                pipe(outer_radius, inner_radius, segments, i+1, next_radius_of_curvature);
            }
        }
    }
    
}

module pipe_segment(outer_radius, inner_radius, segment, prev_radius_of_curvature) {
    //echo(str("segment=", segment));
    length = segment[0];
    rotation = segment[1];
    angle = segment[2];
    radius_of_curvature = segment[3];
    curve_length = curve_length(radius_of_curvature, angle);
    straight_pipe(outer_radius, inner_radius, length-curve_length, prev_radius_of_curvature);
    translate([0,0,length-curve_length]) {
        curved_pipe(outer_radius, inner_radius, rotation, angle, radius_of_curvature);
    }
}

module straight_pipe(outer_radius, inner_radius, length, prev_radius_of_curvature) {
    translate([0, 0, prev_radius_of_curvature]) {
        difference() {
            cylinder(h=length-prev_radius_of_curvature, r=outer_radius);
            cylinder(h=length-prev_radius_of_curvature, r=inner_radius);
        }
    }
}

module curved_pipe(outer_radius, inner_radius, rotation, angle, radius_of_curvature) {
    rotate([90, 0, rotation+90]) {
        translate([-radius_of_curvature, 0, 0]) {
            rotate_extrude(angle=angle) {
                difference() {
                    translate([radius_of_curvature, 0, 0]) {
                        difference() {
                            circle(r = outer_radius);
                            circle(r = inner_radius);
                        }
                    }
                    translate([-outer_radius, 0, 0]) square(size=[outer_radius*2, outer_radius*2], center=true);
                }
            }
        }
    }

}
