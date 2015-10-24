use <cardholder.scad>

// Helping modules

module distance(factor=1) {
    translate([-100,230,-250]*factor) rotate([0,0,-30]) children();
}

module cut(factor=1) {
    rotate([0,-55+90,25+90]) translate([300*factor,0,-65]) {
        difference() {
            children();
            translate([-10000,-5000,0]) cube(10000);
        }
    }
}

// Tests

if (t == 1) {
    distance() cardholder(); // default arguments
}

if (t == 2) {
    cut() cardholder(cards=10, delta=2, spacing=5); // almost default arguments from inside
}

if (t == 3) {
    cut() cardholder(cards=-10, delta=2, spacing=5); // negative delta
}

if (t == 4) {
    cut() cardholder(cards=10, delta=0, spacing=5); // 0 delta
}

if (t == 5) {
    distance(1.2) cardholder(spacing=10); // big spacing
}

if (t == 6) {
    distance() {
        cardholder(thickeness=0.01, thickness=0.01, $fn=100); // small thickness
    }
}

if (t == 7) {
    distance() cardholder(visibility=1, spacing=0); // front holder should still exist, just with thickness
}

// Always use "if (t == num)" including spaces!
// This file is being grepped for '^if (t == 1)' etc.
// Numbers must be in the correct order and no number can be skipped
