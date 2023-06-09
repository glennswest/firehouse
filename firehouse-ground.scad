roomsize = 27;
wallthickness = .5; // In feet
scalefactor = 6.35; // scale factor - 1 foot eq 1/4 inch
wallheight = 10;
elevatorsize = 5;
closetsize = 14;
bathroomdepth=13;
bathroomwidth=9;
kingbedsize = 7;
stairsize = 5;

backwalloffset = wallthickness + roomsize + wallthickness + roomsize + wallthickness;
interiorwallsize = roomsize + wallthickness + roomsize + wallthickness;
halfinteriorwallsize = wallthickness + roomsize + wallthickness;
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

module midhalfsidewall()
{
     cube([wallthickness * scalefactor,halfinteriorwallsize*scalefactor,wallheight*scalefactor]);
}

module midroomdivider()
{
     cube([roomsize * scalefactor,wallthickness * scalefactor,wallheight*scalefactor]);
}

module utilityroomdivider()
{
     cube([(roomsize - 11.5) * scalefactor,wallthickness * scalefactor,wallheight*scalefactor]);
}

module elevator()
{
     cube([elevatorsize * scalefactor,elevatorsize * scalefactor, wallheight*scalefactor]);

}

module bathroom()
{

    cube([bathroomdepth * scalefactor, bathroomwidth * scalefactor, wallheight * scalefactor]);

}

module kingbed()
{
      cube([7 * scalefactor, 7 * scalefactor, 4 * scalefactor]);   
}

module closet()
{
      cube([closetsize * scalefactor, closetsize * scalefactor, wallheight * scalefactor]);
}

module stairs()
{
   cube([stairsize * scalefactor, stairsize * scalefactor, wallheight * scalefactor]);

}

module interiordoubledoor()
{
     rotate([0,0,90]) cube([(60/12) * scalefactor,(wallthickness * scalefactor) + 5,(80 / 12) * scalefactor]);

}

module storageroom()
{
       cube([13 * scalefactor, wallthickness * scalefactor, wallheight * scalefactor]);
       cube([wallthickness * scalefactor, 13 * scalefactor, wallheight * scalefactor]);

}

module hallwayopening()
{
    cube([(wallthickness + 2) * scalefactor, 6 * scalefactor, 8 * scalefactor]);

}

translate([0,0,0]) bfwall(); // Front Wall
translate([0,backwalloffset * scalefactor,0]) bfwall();
midwallposition = wallthickness + roomsize;
translate([0,wallthickness * scalefactor,0]) midsidewall();
difference(){
    translate([midwallposition * scalefactor,wallthickness * scalefactor,0]) midsidewall();
    translate([(midwallposition * scalefactor)-1,(wallthickness + roomsize + wallthickness - 7.5) * scalefactor,0]) hallwayopening(); 
    }
// Hallway
midhalfwallposition = wallthickness + roomsize;
translate([(midhalfwallposition - 7) * scalefactor,(wallthickness + roomsize + wallthickness) * scalefactor,0]) midhalfsidewall();

translate([farsidewallposition * scalefactor,wallthickness * scalefactor,0]) midsidewall();
roomdivposition = wallthickness + roomsize + wallthickness;
translate([(wallthickness + 5) * scalefactor,roomdivposition * scalefactor,0]) utilityroomdivider();
translate([wallthickness * scalefactor,(roomdivposition - 8) * scalefactor,0]) midroomdivider();
translate([(wallthickness + roomsize + wallthickness) * scalefactor,roomdivposition * scalefactor,0]) midroomdivider();
translate([(wallthickness + roomsize + wallthickness) * scalefactor,(roomdivposition - 8) * scalefactor,0]) midroomdivider();
elevatorpositionx = wallthickness + roomsize + wallthickness + roomsize - elevatorsize;
elevatorpositiony = wallthickness + roomsize + wallthickness - (elevatorsize / 2);

translate([elevatorpositionx * scalefactor,elevatorpositiony * scalefactor,0]) elevator();

stairpositionx = wallthickness;
stairpositiony = wallthickness + roomsize + wallthickness - (stairsize / 2);

translate([stairpositionx * scalefactor,stairpositiony * scalefactor,0]) stairs();


firstbathroompositionx = wallthickness + roomsize + wallthickness + roomsize - bathroomwidth;
firstbathroompositiony = wallthickness + roomsize + wallthickness + roomsize + wallthickness;

translate([firstbathroompositionx * scalefactor,firstbathroompositiony * scalefactor,0]) rotate([0,0,-90]) bathroom();

secondbathroompositionx = wallthickness + roomsize - bathroomwidth - wallthickness -  10;
secondbathroompositiony = wallthickness + roomsize + wallthickness + wallthickness;

translate([secondbathroompositionx * scalefactor,secondbathroompositiony * scalefactor,0]) bathroom();



closetpositionx = wallthickness + roomsize + wallthickness + 1;
closetpositiony = wallthickness + roomsize + wallthickness;
translate([closetpositionx * scalefactor, closetpositiony * scalefactor, 0]) closet();



bedpositionx = wallthickness + roomsize + wallthickness + 1;
bedpositiony = wallthickness + roomsize + wallthickness + roomsize - 9;
translate([bedpositionx * scalefactor, bedpositiony * scalefactor, 0]) kingbed();

storageroomx = wallthickness + bathroomwidth - 2;
storageroomy = wallthickness + roomsize + wallthickness + roomsize - 12;
translate([storageroomx * scalefactor,storageroomy * scalefactor,0]) storageroom();

ht = 5;
for(x = [ 0 : 1 : 55] ){
      if (x % 4){ 
         echo ("H5");
         ht = 5;
         translate([x * scalefactor,-10, 0]) cube([1,3,ht]);
       } else {
         echo ("H10");
         ht = 10;
         translate([x * scalefactor,-10, 0]) cube([1,3,ht]);
       }
     
     }
     
translate([roomsize * scalefactor,-40,0]) text("Front",size = 20);
translate([roomsize * scalefactor - 100,400,0]) text("Back - Door To Porch",size = 20);

translate([-20,roomsize * scalefactor / 2 ,0]) rotate([0,0,90]) text("Door To Shop",size = 20);
translate([-50,roomsize * scalefactor / 2 + 20 ,0]) rotate([0,0,90]) text("Stairs To Deck",size = 15);

translate([420,3 * roomsize * scalefactor / 2 ,0]) rotate([0,0,-90]) text("Door To Garage",size = 20);
     