include<../sixinch_library.scad>

debug = false;
if (debug) {
     $fn = 16;
     color("red") {
          TPLinkTLSG105();
     }
}


   //////////////////////////////////////////////////
  //  PASTE ALL OF: sixinch_library.scad IN HERE  //
 //   Thingiverse can only accept one file.      //
//////////////////////////////////////////////////


TPLinkTLSG105_length = 99;
TPLinkTLSG105_height = 25.5;
TPLinkTLSG105_width = 100;
TPLinkTLSG105_powerdepth = 30;
TPLinkTLSG105_xoffset = 0;/* 9.7; */

Part = "c"; // [a:All, b:FrontPlate, c:Cabinet, d:Lid, e:BackPlate, f:Handles]
Units = 3;
Depth = TPLinkTLSG105_length + TPLinkTLSG105_powerdepth;

xoffset = ((width - TPLinkTLSG105_width) / 2) - 2;
yoffset = (((Units * unit) - TPLinkTLSG105_height) / 2) - 2;
round_holes = [[6, 5, 6],[6, 1, 6]];
square_holes = [[xoffset + 4.5, yoffset + 7, 81, 14.5]];
remove_tlsg105 = true;

go();

module go(){
    rotate([90,0,-90]){
        if(Part=="a"){
             frontplate(Units,[],[],[],[],[45],[45]);
             cabinet_supported () {
                  cabinet(Depth,Units,[45],[],[Units/2]);
             }
             lid_supported () {
                  lid(Depth,Units,[45],[45]);
             }
             back_plate(Units, Depth, [45], [45], [Units/2], square_holes, round_holes);
             handle(Units, false);
        }else if(Part=="b"){
             frontplate(Units,[],[],[],[],[45],[45]);
        }else if(Part=="c"){
             cabinet_supported () {
                  cabinet(Depth,Units,[45],[],[Units/2]);
             }
        }else if(Part=="d"){
             lid_supported () {
                  lid(Depth,Units,[45],[45]);
             }
        }else if(Part=="e"){
            back_plate(Units, Depth, [45], [45], [Units/2], square_holes, round_holes);
        }else if(Part=="f"){
            handle(Units, true);
        }
    }
}

module lid_supported () {


     difference () {
          union () {
               children();
               translate([(sixinch - TPLinkTLSG105_width) / 2 + 20 , (Units * unit), (TPLinkTLSG105_length / 3) * 2 + TPLinkTLSG105_powerdepth]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=20, r=5);
                    }
               }
               translate([((sixinch - TPLinkTLSG105_width) / 2) + TPLinkTLSG105_width - 20, (Units * unit), (TPLinkTLSG105_length / 3) * 2 + TPLinkTLSG105_powerdepth]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=20, r=5);
                    }
               }
               translate([(sixinch - TPLinkTLSG105_width) / 2 + 20 , (Units * unit), (TPLinkTLSG105_length / 3) * 2]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=20, r=5);
                    }
               }
               translate([((sixinch - TPLinkTLSG105_width) / 2) + TPLinkTLSG105_width - 20, (Units * unit), (TPLinkTLSG105_length / 3) * 2]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=20, r=5);
                    }
               }
          }
          rotate([0, 90, 90]){
               TPLinkTLSG105();
          }
     }
}

module cabinet_supported () {
     difference () {
          union () {
               children();
               translate([(sixinch - TPLinkTLSG105_width) / 2 + (TPLinkTLSG105_xoffset / 2), 20, (TPLinkTLSG105_length / 3) * 2 + TPLinkTLSG105_powerdepth]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=20, r=5);
                    }
               }
               translate([((sixinch - TPLinkTLSG105_width) / 2) + TPLinkTLSG105_width - (TPLinkTLSG105_xoffset / 2), 20, (TPLinkTLSG105_length / 3) * 2 + TPLinkTLSG105_powerdepth]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=20, r=5);
                    }
               }

               translate([(sixinch - TPLinkTLSG105_width) / 2 + (TPLinkTLSG105_xoffset / 2), 20, TPLinkTLSG105_powerdepth + 1]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=20, r=5);
                    }
               }
               translate([((sixinch - TPLinkTLSG105_width) / 2) + TPLinkTLSG105_width - (TPLinkTLSG105_xoffset / 2), 20, TPLinkTLSG105_powerdepth + 1]) {
                    rotate([90, 0, 0]) {
                         cylinder(h=20, r=5);
                    }
               }
          }
          rotate([0, 90, 90]){
               TPLinkTLSG105();
          }
     }
}

module TPLinkTLSG105 () {
     rotate([0,0,0]) {
          translate([-TPLinkTLSG105_length - 2 - TPLinkTLSG105_powerdepth, -TPLinkTLSG105_width - ((sixinch - TPLinkTLSG105_width) / 2) - (TPLinkTLSG105_xoffset / 2), ((Units * unit) - TPLinkTLSG105_height) / 2]) {
               cube([TPLinkTLSG105_length + 1, TPLinkTLSG105_width, TPLinkTLSG105_height ]);
          }
     }
}
