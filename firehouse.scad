roomsize = 23;
wallthickness = .5; // In feet
scalefactor = 6.35; // scale factor - 1 foot eq 1/4 inch
wallheight = 10;
elevatorsize = 5;
closetsize = 14;
bathroomdepth=12;
bathroomwidth=8;
kingbedsize = 7;

backwalloffset = wallthickness + roomsize + wallthickness + roomsize + wallthickness;
interiorwallsize = roomsize + wallthickness + roomsize + wallthickness;
farsidewallposition = wallthickness + roomsize + wallthickness + roomsize;
module bfwall()
{
     backwallsize = wallthickness + roomsize + wallthickness + roomsize + wallthickness;
     cube([backwallsize * scalefactor,wallthickness*scalefactor,wallheight*scalefactor]);
}
module midsidewall()
{
     cube([wallthickness * scalefactor,interiorwallsize*scalefactor,wallheight*scalefactor]);
}

module midroomdivider()
{
     cube([roomsize * scalefactor,wallthickness * scalefactor,wallheight*scalefactor]);
}

module elevator()
{
     cube([elevatorsize * scalefactor,elevatorsize * scalefactor, wallheight*scalefactor]);

}

module bathroom()
{

    cube([bathroomdepth * scalefactor, bathroomwidth * scalefactor, wallheight * scalefactor]);

}

translate([0,0,0]) bfwall(); // Front Wall
translate([0,backwalloffset * scalefactor,0]) bfwall();
midwallposition = wallthickness + roomsize;
translate([0,wallthickness * scalefactor,0]) midsidewall();
translate([midwallposition * scalefactor,wallthickness * scalefactor,0]) midsidewall();
translate([farsidewallposition * scalefactor,wallthickness * scalefactor,0]) midsidewall();
roomdivposition = wallthickness + roomsize + wallthickness;
translate([wallthickness * scalefactor,roomdivposition * scalefactor,0]) midroomdivider();
translate([(wallthickness + roomsize + wallthickness) * scalefactor,roomdivposition * scalefactor,0]) midroomdivider();
elevatorpositionx = wallthickness + roomsize + wallthickness + roomsize - elevatorsize;
//elevatorpositiony = wallthickness + roomsize + wallthickness + roomsize - elevatorsize/2;
elevatorpositiony = wallthickness + roomsize + wallthickness - elevatorsize;

translate([elevatorpositionx * scalefactor,elevatorpositiony * scalefactor,0]) elevator();
firstbathroompositionx = wallthickness + roomsize + wallthickness + roomsize - bathroomwidth;
firstbathroompositiony = wallthickness + roomsize + wallthickness + roomsize + wallthickness;


translate([firstbathroompositionx * scalefactor,firstbathroompositiony * scalefactor,0]) rotate([0,0,-90]) bathroom();
