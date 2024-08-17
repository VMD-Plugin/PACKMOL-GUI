package provide packmol 1.0
namespace eval ::packmol:: {
	namespace export packmolview
	variable packmol
	variable packmol_name
	set packmol_name ""

	variable system
	variable packmol_output
	set packmol_output ""

	variable writecrdname
	set writecrdname "output.crd"
	variable writecrdname_write
	set writecrdname_write $writecrdname
	variable outputfilename
	set outputfilename "mixture.pdb"
	variable outputfilename_write
	set outputfilename_write $outputfilename
	variable before_outputname
	set before_outputname "mixture.pdb"

	variable is_writecrd
	set is_writecrd 0

	variable pbc_xmin
	set pbc_xmin 0
	variable pbc_xmax
	set pbc_xmax 0
	variable pbc_ymin
	set pbc_ymin 0
	variable pbc_ymax
	set pbc_ymax 0
	variable pbc_zmin
	set pbc_zmin 0
	variable pbc_zmax
	set pbc_zmax 0

	variable is_fixed
	set is_fixed 0
	variable fix_x
	set fix_x 0
	variable fix_y
	set fix_y 0
	variable fix_z
	set fix_z 0
	variable fix_alpha
	set fix_alpha 0
	variable fix_beta
	set fix_beta 0
	variable fix_gamma
	set fix_gamma 0
	variable center_fix_list
	set center_fix_list {}
	variable position
	set position {}

	variable is_constrain
	set is_constrain 0
	variable constrain_x
	set constrain_x 0
	variable constrain_y
	set constrain_y 0
	variable constrain_z
	set constrain_z 0
	variable constrain_x_plus
	set constrain_x_plus 0
	variable constrain_y_plus
	set constrain_y_plus 0
	variable constrain_z_plus
	set constrain_z_plus 0
	variable constrain_list
	set constrain_list {}

	variable molid
	set molid {}
	variable all_mol
	set all_mol {}
	variable filelist
	set filelist {}
	variable file_name_list
	set file_name_list {}
	variable countlist
	set countlist {}
	variable sitlist
	set sitlist {}
	variable res_moleculelist
	set res_moleculelist {}
	variable res_atomlist
	set res_atomlist {}
	variable radiuslist
	set radiuslist {}
	variable fscalelist
	set fscalelist {}
	variable short_radiuslist
	set short_radiuslist {}
	variable short_radius_scalelist
	set short_radius_scalelist {}
	variable fscale_short_radius_scale_wrong
	set fscale_short_radius_scale_wrong 0
	variable relativelist
	set relativelist {}
	variable mol_sel
	set mol_sel 0
	variable sit_sel
	set sit_sel 0
	variable graphic_line_list
	set graphic_line_list {}
	variable graphic_label_list
	set graphic_label_list {}
	variable graphic_info_list
	set graphic_info_list {}

	variable atomlist
	set atomlist {}
	variable atom_serial_name_list
	set atom_serial_name_list {}

	variable mol_material
	set mol_material {}
	variable sel_material
	set sel_material "Opaque"

	set draw_shape "yes"
	set draw_label "yes"
	variable label_size
	set label_size 1.0

	variable box_start_x
        variable box_start_y
        variable box_start_z
        variable box_end_x
        variable box_end_y
        variable box_end_z
	set box_start_x 0.0
	set box_start_y 0.0
	set box_start_z 0.0
	set box_end_x 0.0
	set box_end_y 0.0
	set box_end_z 0.0
	variable box_width
	set box_width 1
	variable box_color
	set box_color "0 blue"

	variable cube_start_x
        variable cube_start_y
        variable cube_start_z
        variable cube_size
	set cube_start_x 0.0
	set cube_start_y 0.0
	set cube_start_z 0.0
	set cube_size 0.0
	variable cube_color
	set cube_color "0 blue"
	variable cube_width
	set cube_width 1

	variable sphere_x
        variable sphere_y
        variable sphere_z
        variable sphere_r
	set sphere_x 0.0
	set sphere_y 0.0
	set sphere_z 0.0
	set sphere_r 0.0
	variable sphere_color
	set sphere_color "0 blue"
	variable sphere_resolution
	set sphere_resolution 30
#	variable sphere_material
#	set sphere_material "Opaque"

	variable ellipsoid_a1
        variable ellipsoid_b1
        variable ellipsoid_c1
        variable ellipsoid_a2
        variable ellipsoid_b2
        variable ellipsoid_c2
        variable ellipsoid_d
	set ellipsoid_a1 0.0
	set ellipsoid_b1 0.0
	set ellipsoid_c1 0.0
	set ellipsoid_a2 0.0
	set ellipsoid_b2 0.0
	set ellipsoid_c2 0.0
	set ellipsoid_d 0.0
	variable ellipsoid_color
	set ellipsoid_color "0 blue"
	variable ellipsoid_resolution
	set ellipsoid_resolution 2
#	variable ellipsoid_material
#	set ellipsoid_material "Opaque"

	variable plane_a
        variable plane_b
        variable plane_c
        variable plane_d
	set plane_a 0.0
	set plane_b 0.0
	set plane_c 0.0
	set plane_d 0.0
	variable plane_color
	set plane_color "0 blue"
#	variable plane_material
#	set plane_material "Opaque"
	variable plane_min_a
	set plane_min_a 0.0
	variable plane_min_b
	set plane_min_b 0.0
	variable plane_min_c
	set plane_min_c 0.0
	variable plane_max_a
	set plane_max_a 5.0
	variable plane_max_b
	set plane_max_b 5.0
	variable plane_max_c
	set plane_max_c 5.0

	variable cylinder_fir_circle_x
        variable cylinder_fir_circle_y
        variable cylinder_fir_circle_z
        variable cylinder_sec_circle_x
        variable cylinder_sec_circle_y
        variable cylinder_sec_circle_z
        variable cylinder_r
	variable cylinder_length
	set cylinder_fir_circle_x 0.0
	set cylinder_fir_circle_y 0.0
	set cylinder_fir_circle_z 0.0
	set cylinder_sec_circle_x 0.0
	set cylinder_sec_circle_y 0.0
	set cylinder_sec_circle_z 0.0
	set cylinder_r 0.0
	set cylinder_length 0.0
	variable cylinder_color
	set cylinder_color "0 blue"
	variable cylinder_resolution
	set cylinder_resolution 30
#	variable cylinder_material
#	set cylinder_material "Opaque"

	variable gaussian_a1
	variable gaussian_a2
	variable gaussian_b1
	variable gaussian_b2
	variable gaussian_c
	variable gaussian_h
	set gaussian_a1 ""
	set gaussian_a2 ""
	set gaussian_b1 ""
	set gaussian_b2 ""
	set gaussian_c ""
	set gaussian_h ""

	variable thesefile
	set thesefile {}
	variable tolerance
	set tolerance 2
	variable structure_num_list
	set structure_num_list {}
#	variable structure_num
#	set structure_num 0
	variable resnumber_list
	set resnumber_list {}
	variable restart_from_list
	set restart_from_list {}
	variable restart_to_list
	set restart_to_list {}
	variable changechains_list
	set changechains_list {}
	variable chain_list
	set chain_list {}
	variable segid_list
	set segid_list {}
	variable maxmove_list
	set maxmove_list {}
	variable rep_list
	set rep_list {}
	variable record_show_atomlist
	set record_show_atomlist {}
	variable constrain_volume_list
	set constrain_volume_list {}
	variable molecular_volume_list
	set molecular_volume_list {}
	variable nvmax_list
	set nvmax_list {}
	variable surface_area_list
	set surface_area_list {}
	variable apl_list
	set apl_list {}
	variable nsmax_list
	set nsmax_list {}

	variable all_color_list
	set all_color_list {"0 blue" "1 red" "2 gray" "3 orange" "4 yellow" "5 tan" "6 silver" "7 green" "8 white" "9 pink" "10 cyan" "11 purple" "12 lime" "13 mauve" "14 ochre" "15 iceblue" "16 black" "17 yellow2" "18 yellow3" "19 green2" "20 green3" "21 cyan2" "22 cyan3" "23 blue2" "24 blue3" "25 violet" "26 violet2" "27 magenta" "28 magenta2" "29 red2" "30 red3" "31 orange2" "32 orange3"}

	variable all_material_list
	set all_material_list {"Opaque" "Transparent" "BrushedMetal" "Diffuse" "Ghost" "Glass1" "Glass2" "Glass3" "Glossy" "HardPlastic" "MetallicPastel" "Steel" "Translucent" "Edgy" "EdgyShiny" "EdgyGlass" "Goodsell" "AOShiny" "AOChalky" "AOEdgy" "BlownGlass" "GlassBubble" "RTChrome"}

	variable file_type
	set file_type "pdb"
	variable add_amber_ter
	set add_amber_ter "no"
	variable box_sides
	set box_sides 1
	variable sidemax
	set sidemax 1000
	variable seed
	set seed -1
	variable use_randominitialpoint
	set use_randominitialpoint "no"
	variable avoid_overlap
	set avoid_overlap "no"
	variable discale
	set discale 0
	variable maxit
	set maxit 20
	variable movebadrandom
	set movebadrandom "no"
	variable nloop
	set nloop 0
	variable precision
	set precision 0.01
	variable writeout
	set writeout 0
	variable writebad
	set writebad "no"
	variable check
	set check "no"
	variable iprint1
	set iprint1 -1
	variable iprint2
	set iprint2 -1
	variable fbins
	set fbins 1.7321
	variable chkgrad
	set chkgrad "no"
	variable checkbox
	set checkbox "yes"
	variable use_short_tol
	set use_short_tol "no"
	variable short_tol_dist
	set short_tol_dist 1
	variable short_tol_scale
	set short_tol_scale 3
	variable movefrac
	set movefrac 0.05
	variable connect
	set connect "yes"

	variable import_file_dir
	global env
        set default_pwd $env(PACKMOLDIR)
        set import_file_dir [file dirname $default_pwd]
	variable outputdir
	set outputdir [pwd]

	variable format_wrong
	set format_wrong 0
	variable change_which_graphic
	set change_which_graphic "box"
	variable need_to_reset
	set need_to_reset 0
	variable generate_packmol_input
	set generate_packmol_input ""

	variable res_atom_flag
	set res_atom_flag 0

	variable ellipsoid_return_flag
	set ellipsoid_return_flag 0
	variable plane_return_flag
	set plane_return_flag 0
	variable xygauss_number_return_flag
	set xygauss_number_return_flag 0
	variable xygauss_zero_return_flag
	set xygauss_zero_return_flag 0

	variable cube_value
	set cube_value 0.00
	variable box_value
	set box_value 0.00
	variable sphere_value
	set sphere_value 0.00
	variable ellipsoid_value
	set ellipsoid_value 0.00
	variable cylinder_value
	set cylinder_value 0.00

	variable packmol_userguide
	set packmol_userguide {User guide
Important: always download the latest version of Packmol in order that all features are available.

Contents
1. What do you need?
2. How to compile Packmol.
3. Running Packmol.
4. Basic input structure.
5. More types of molecules.
6. Atom selections.
7. Types of constraints.
8. Periodic boundary conditions.
9. Different radii for different atoms.
10. Solvating a large molecule automatically.
11. Controlling residue numbering in PDB files.
12. Building very large systems: using restart files.
13. Convergence problems: what to try.
14. Additional input options and keywords.
15. Some tutorials available online.

What do you need?

You need coordinate files for each type of molecule you want your simulation to have. For example, if you are going to simulate a solution of water and ions, you will need a coordinate file for one water molecule, and independent coordinates files for each of the ions. This coordinate files may be in the PDB, TINKER, MOLDEN or MOLDY format. The simplest and best molecular structure builder we have used is this one.

Of course, you also need the Packmol package, which you can get from
  http://m3g.iqm.unicamp.br/packmol
by clicking on the Download link. You can download the file packmol-20.14.4.tar.gz which contains the whole source code of Packmol. The 20.14.4 is the version number, which might change relative to this example.

Windows users: We suggest trying to use the Julia-based distribution available at [Packmol.jl], which works on all platforms and doesn't need compilation.

If you plan to use MOLDY as your MD package, read THIS.

How to compile Packmol

Once you have downloaded the packmol-20.14.4.tar.gz file from the home-page, you need to expand the files and compile the package. This is done by:

Expanding the files:
  tar -xvzf packmol-20.14.4.tar.gz
This will create a directory called packmol inside which you can find the source code. You can build the executable by:
  cd packmol
  make
That's it, if no error was reported the packmol executable was built. Note that 20.14.4 is the version number, which may differ relative to this example.

-----

If you have problems, let the configure script find a suitable compiler for you:

chmod +x ./configure (this makes the script executable)

./configure (this executes the script)

If the script was not able to find a suitable compiler, then you can manually set the compiler by:

./configure /path/to/your/compiler/yourcompiler

Then, run the "make" command again:

make

If no error was detected, an executable called packmol is now ready.

Running Packmol

Once you have compiled and built your input file, run Packmol with

packmol < packmol.inp

Where packmol.inp is the input file (you can obtain example files by clicking at the 'Input examples' link on the left).

A successful packing will end with something like

------------------------------
Success!
Final objective function value: .22503E-01
Maximum violation of target distance: 0.000000
Maximum violation of the constraints: .78985E-02

------------------------------


Where the maximum violation of the target distance indicates the difference between the minimum distance between atoms required by the user and that of the solution. It will not be greater than 10^-2 The maximum violation of the constrains must not be greater than 10^-2.

A good idea is to check if your constraints are correct by using the "check" keyword in the input file. With this option a rough initial approximation will be built but no actual packing will be performed. You can look at the output to see if the molecules are within the desired regions (but do not expect a good structure at this point!). Just add the word "check" to any line of your input file (available since 28 Feb 2008).


Common issues:

- If you get "Command not found" when running Packmol, use
./packmol < packmol.inp
(with a "./" before "packmol") or add the directory where the packmol executable is located to your path.

- If you run packmol and get the message "Killed", this is because the package is trying to allocate more memory than available for static storage. Open the "sizes.i" file and decrease the "maxatom" parameter to the number of atoms of your system, compile the package again, and try again.

Basic input structure

The minimal input file must contain the distance tolerance required (for systems at room temperature and pressure and coordinates in Angstroms, 2.0 Å is a good value [note]). This is specified with

tolerance 2.0

The file must contain also the name of the output file to be created, specified with

output test.pdb

and the file type (pdb, tinker, xyz or moldy, pdb is the default value),

filetype pdb

At least one type of molecule must be present. This is set by the structure ... end structure section, for example, if water.pdb is the file containing the coordinates of a single water molecule, you could add to your input file something like

structure water.pdb
  number 2000
  inside cube 0. 0. 0. 40.
end structure

This section specifies that 2000 molecules of the water.pdb type, will be placed inside a cube with minimum coordinates (x,y,z)=(0,0,0) and maximum coordinates (40,40,40). Therefore, this minimum input file must be:

tolerance 2.0
output test.pdb
filetype pdb
structure water.pdb
  number 2000
  inside cube 0. 0. 0. 40.
end structure

Running Packmol with this input file will fill a cube of side 40.0 Å with 2000 water molecules. Every pair of atoms of different molecules will be separated by, at least, 2.0 Å and the molecules will be randomly distributed inside de cube.

More types of molecules

You can add more types of molecules to the same region, or to different regions of the space, simply adding other structure ... end structure section to the input file.

Atom selections

The coordinate file of a single molecule contains, for example, 10 atoms. You can restrain a part of the molecule to be in a specified region of the space. This is useful for building vesicles where the hydrophilic part of the surfactants must be pointing to the aqueous environment, for example. For the 10 atoms molecule, this is done by using the keyword atoms, as in

structure molecule.pdb
  inside cube 0. 0. 0. 20.
  atoms 9 10
    inside box 0. 0. 15. 20. 20. 20.
  end atoms
end structure

In this case, all the atoms of the molecule will be put inside the defined cube, but atoms 9 and 10 will be restrained to be inside the box.

Types of constraints

There are several types of constraints that can be applied both to whole molecules or to parts of the molecule. These constraints define the region of the space in which the molecules must be at the solution. Very ordered systems can be built in such a way. The constraints are:

1.	fixed
Usage: fixed x y z a b g

This options holds the molecule fixed in the position specified by the parameters. x, y, z, a, b, g, which are six real numbers. The first three determine the translation of the molecule relative to its position in the coordinate file. The latter three parameters are rotation angles (in radians). For this option it is required that only one molecule is set. It may be accompanied by the keyword center. If this keyword is present the first three numbers are the position of the baricenter (not really the center of mass, because we suppose that all atoms have the same mass). Therefore this keyword must be used in the following context:

structure molecule.pdb
  number 1
  center
  fixed 0. 0. 0. 0. 0. 0.
end structure

In this example, the molecule will be fixed with its center the origin and no rotation.

2.	inside cube
Usage: inside cube xmin  ymin  zmin  d

xmin , ymin , zmin and d are four real numbers. The coordinates (x,y,z) of the atoms restrained by this option will satisfy, at the solution:


xmin < x < xmin + d
ymin < y < ymin + d
zmin < z < zmin + d


3.	outside cube
Usage: outside cube xmin  ymin  zmin  d

xmin , ymin , zmin and d are four real numbers. The coordinates (x,y,z) of the atoms restrained by this option will satisfy, at the solution:


x < xmin or x > xmin + d
y < ymin or y > ymin + d
z < zmin or z > zmin + d


4.	inside box
Usage: inside box  xmin  ymin  zmin  xmax  ymax  zmax

xmin , ymin , zmin , xmax , ymax  and zmax are six real numbers. The coordinates (x,y,z) of the atoms restrained by this option will satisfy, at the solution:

xmin < x < xmax
ymin < y < ymax
zmin < z < zmax


5.	outside box
Usage: outside box  xmin  ymin  zmin  xmax  ymax  zmax

xmin , ymin , zmin , xmax , ymax  and zmax are six real numbers. The coordinates (x,y,z) of the atoms restrained by this option will satisfy, at the solution:

x < xmin or x > xmax
y < ymin or y > ymax
z < zmin or z > zmax


6.	inside (or outside) sphere
Spheres are defined by equations of the general form

(x-a)^2+(y-b)^2+(z-c)^2-d^2=0

and, therefore, you must provide four real parameters a, b, c and d in order to define it. The input syntax is, for example,

inside sphere 2.30 3.40 4.50 8.0

and therefore the coordinates of the atoms will satisfy the equation

(x-2.30)^2+(y-3.40)^2+(z-4.50)^2-8.0^2<=0.0
Other input alternative would be:

outside sphere 2.30 3.40 4.50 8.0

The outside parameter is similar to the inside parameter, but the equation above uses >= instead of <= and, therefore, the atoms will be placed outside the defined sphere.

7.	inside (or outside) ellipsoid
Ellipsoids are defined by the general equation

(x-a1)^2/a2^2+(y-b1)^2/b2^2+(z-c1)^2/c2^2-d^2=0
The parameters must be given as in the sphere example, but now they are 7, and must be entered in the following order:

inside ellipsoid   a1  b1  c1  a2  b2  c2  d

The coordinates (a1,b1,c1) will define the center of the ellipsoid, the coordinates (a2,b2,c2) will define the relative size of the axes and d will define the volume of the ellipsoid. Of course, the commands

outside ellipsoid   a1  b1  c1  a2  b2  c2  d

can also be used in the same manner as the parameters for spheres. Note that the case a2 = b2 = c2 = 1.0 provides the exactly the same as the sphere parameter. The parameters for the ellipsoid are not normalized. Therefore, if a2, b2 and c2 are large, the ellipsoid will be large, even for a small d.

8.	above (or below) plane
The planes are defined by the general equation

ax+by+cz-d=0
And it is possible to restrict atoms to be above or below the plane. The syntax is

above plane 2.5 3.2 1.2 6.2

below plane 2.5 3.2 1.2 6.2

where the above keyword will make the atoms satisfy the condition
2.5x+3.2y+1.2z-6.2>=0
and the below keyword will make the atoms satisfy
2.5x+3.2y+1.2z-6.2<=0
*Note: the above notation was introduced in version 20.1.1 (Sept. 5, 2020)

9.	inside (or outside) cylinder
In order to define a cylinder, it is necessary first to define a line oriented in space. This line is defined in Packmol by the parametric equation
p=(a1,b1,c1)+t*(a2,b2,c2)
where t is the independent parameter. The vector (a2,b2,c2) defines the direction of the line. The cylinder is therefore defined by the distance to this line, d, and a length l. Therefore, the usage must be:

inside cylinder  a1  b1  c1  a2  b2  c2  d  l

outside cylinder  a1  b1  c1  a2  b2  c2  d  l

Here, the first three parameters define the point where the cylinder starts, and l defines the length of the cylinder. d defines de radius of the cylinder. The simpler example is a cylinder oriented in the x axis and starting at the origin, such as

inside cylinder 0. 0. 0. 1. 0. 0. 10. 20.

This cylinder is specified by the points that have a distance of 10. to the x axis (the cylinder has a radius of 10.). Furthermore, it starts at the origin, therefore no atom restricted by this cylinder will have an x coordinate less than 0. Furthermore, it has a length of 20. and, as such, no atom will have an x coordinate greater than 20. The orientation of the cylinder, parallel to the x axis is defined by the director vector (1,0,0), the fourth, fifth and sixth parameters. Cylinders can be oriented in space in anyway.

10.	Constrain rotations
It is possible to constrain rotations of all molecules of each type, so that they have some average orientation in space.

The keywords to be used are, within a structure...end structure section:

constrain_rotation x 180. 20.
constrain_rotation y 180. 20.
constrain_rotation z 180. 20.

Each of these keywords restricts the possible rotation angles around each axis to be within 180±20 degrees (or any other value). For a technical reason the rotation around the z axis will, alone, be identical to the rotation around the y axis (we hope to fix this some day). Constraining the three rotations will constrain completely the rotations. Note that to have your molecules oriented parallel to an axis, you need to constrain the rotations relative to the other two.

For example, to constrain the rotation of your molecule along the z axis, use something like:

constrain_rotation x 0. 20.
constrain_rotation y 0. 20.

Note that these rotations are defined relative to the molecule in the orientation which was provided by the user, in the input PDB file. Therefore, it is a good idea to orient the molecule in a reasonable way in order to understand the rotations. For example, if the molecule is elongated in one direction, a good idea is to provide the molecule with the larger dimension oriented along the z axis.



11.	over (or below) xygauss (gaussian surface)
Gaussian surfaces are defined by the equation
h*exp[-(x-a1)^2/2a2^2-(y-b1)^2/2b2^2]-(z-c)=0
Parameters (a1,b1) define center of the gaussian, while c specifies the height in the z dimension. a2 and b2 set the width of the gaussian in x and y, respectively, while h specifies its height. It is possible to restrict atoms to be over or below the gaussian plane. The gaussian surface as implemented is restricted to be over the xy plane. The syntax is



over xygauss a1 b1 a2 b2 c h

below xygauss a1 b1 a2 b2 c h

For example, using

over xygauss 21.0 5.0 10.0 20.0 -23.0 15.0

the atoms satisfy the condition
15.0*exp[-(x-21.0)^2/2(10.0)^2-(y-5.0)^2/2(20.0)^2]-(z+23.0)>=0.0


Periodic Boundary Conditions

As of version 20.15.0, Packmol supports Orthorhombic periodic boundary conditions (thanks to Yi Yao for the contribution).

Usage:

For example, to set a periodic boundary with a box of 30x30x60 Angstroms, use:

pbc 30.0 30.0 60.0

In this case, all molecules will be set to stay in the box defined by minimum and maximum coordinates 0.0 0.0 0.0 30.0 30.0 60.0, but with periodic boundary conditions at the boundaries.

And if six parameters are provided, the periodic boundaries will be applied at the minimum and maximum coordinates provided:

pbc -15.0 -15.0 -30.0 15.0 15.0 60.0

This keyword is a global keyword, and will affect all but fixed molecules. For example, this creates a periodic box of water:

tolerance 2.0
output water_box.pdb
pbc 30.0 30.0 60.0
structure water.pdb
  number 1000
end


And this will create an interface of water and carbon tetrachloride, with the interface at the (z=0) plane:

tolerance 2.0
output interface.pdb
pbc -20.0 -20.0 -30.0 20.0 20.0 30.0
structure water.pdb
  number 1000
  below plane 0.0 0.0 1.0 0.0
end structure
structure ccl4.pdb
  number 200
  above plane 0.0 0.0 1.0 0.0
end structure


Importantly, the positions of the constraints refer to the periodic reference box, which is defined by the minimum and maximum coordinates provided.

Different radii for different atoms

It is possible (from version 15.133 on) to attribute different radii to different atoms during the packing procedure. The default behavior is that all atoms will be distant to each other at the final structure at least the distance defined by the tolerance parameter. In this case it is possible to think that the radius of every atom is half the distance tolerance. A tolerance of 2.0 Angs is usually fine for simulation of molecular systems using all-atom models.

Most times, therefore, you won't need this option. This was requested by users that want to pack multiscale models, in which all-atom and coarse-grained representations are combined in the same system.

It is easy to define different radii to different molecules, or to atoms within a molecule. Just add the "radius" keyword within the structure ... end structure section of a molecule type, or within atoms ... end atoms section of an atom selection.

For example, in this case:

tolerance 2.0
structure water.pdb
  number 500
  inside box 0. 0. 0. 30. 30. 30.
  radius 1.5
end structure

the radius of the atoms of the water molecules will be 1.5. Note that this implies a distance tolerance of 3.0 within water molecules.

In this case, on the other side:

tolerance 2.0
structure water.pdb
  number 500
  inside box 0. 0. 0. 30. 30. 30.
  atoms 1 2
    radius 1.5
  end atoms
end structure

only atoms 1 and 2 of the water molecule (as listed in the water.pdb file) will have a radius of 1.5, while atom 3 will have a radius of 1.0, as defined by the tolerance of 2.0

Always remember that the distance tolerance is the sum of the radii of each pair of atoms, and that the greatest the radii the harder the packing. Also, keep in mind that your minimization and equilibration will take care of the actual atom radii, and Packmol is designed only to give a first coordinate file.

Finally, currently the restrictions are set to be fulfilled by the center of the atoms. Therefore, if you are using large radii, you might want to adjust the sizes of the boxes, spheres, etc., so that the whole atoms are within the desired regions. For standard all-atom simulations this is not usually an issue because the radii are small.

Solvating large molecules automatically

The Packmol distribution includes the solvate.tcl script, which is used to solvate large molecules, usually proteins, with water and ions (Na+ and Cl-). Given the PDB file of the biomolecule, just run the script with:

solvate.tcl PROTEIN.pdb

And the script will create a input file for packmol called packmol_input.inp. With this file, run Packmol with

packmol < packmol_input.inp

And your large molecule will be solvated by a shell of 15. Angs. of water, and ions to keep the system neutral and a physiological NaCl concentration of 0.16M. The script usually makes reasonable choices for every parameter (number of water molecules, number of ions, etc.), but these may be controlled manually with additional options, as described below:

solvate.tcl structure.pdb -shell 15. -charge +5 -density 1.0 -i pack.inp -o solvated.pdb

Where:	structure.pdb is the pdb file to be solvated (usually a protein)

"15." is the size of the solvation shell. This is an optional parameter. If not set, 15. will be used.

+5 is the total charge of the system, to be neutralized. This is also and optional parameter, if not used, the package considers histidine residues as neutral, Arg and Lys as +1 and Glu and Asp as -1. The Na+ and Cl- concentrations are set the closest possible to 0.16M, approximately the physiological concentration. Alternatively, use the -noions to not add any ions, just water.

1.0 is the desired density. Optional. If not set, the density will be set to 1.0 g/ml.

solvated.pdb: is the (optional) name for the solvated system output file. If this argument is not provided, it will be the default solvated.pdb file.

pack.inp: is the (optional) name for the packmol input file that will be generated. If not provided, packmol_input.inp will be used.

All these options are output when running the "solvate.tcl" script without any parameter. The script also outputs the size of the box and the suggested periodic boundary condition dimensions to be used.

Controlling residue numbering in PDB files.

Since Packmol will create one or more copies of your molecules in a new PDB file, there are some options on how residue numbers are set to these new molecules. There are four options, which are set with the resnumbers keyword. This keyword may assume three values, 0, 1, 2 or 3, and must be inserted within the structure ... end structure section of each type of molecule. The options are:

resnumbers 0

In this case the residue numbers of all residues will correspond to the molecule of each type, independently of the residue numbering of the original pdb file. This means that if you pack 10 water molecules and 10 ethanol molecules, the water molecules will be numbered 1 to 10, and the ethanol molecules will be numbered 1 to 10.

resnumbers 1

In this case, the residue numbers of the original pdb files are kept unmodified. This means that if you pack 10 proteins of 5 residues, the residue numbers will be preserved and, therefore, they will be repeated for equivalent residues in each molecule of the same protein.

resnumbers 2

In this case, the residue numbers of all residues for this structure will be numbered sequentially according to the number of residues that are printed previously in the same file. This means that if you pack 10 proteins of 5 residues, there will be residue numbers ranging from 1 to 50.

resnumbers 3

In this case, the numbering of the residues will correspond to the sequential numbering of all residues in the file. That is, if you pack a protein with 150 residues followed by 10 water molecules, and use this option for the water molecules, the water molecules will be numbered from 151 to 161. Note: If you use this option for a protein, the whole protein will have its residue numbers overwritten by the same number, corresponding to the residue that would follow in the complete structure.

For example, this keyword may be used as in:
structure peptide.pdb  
  number 10               
  resnumbers 1            
  inside box 0. 0. 0. 20. 20. 20.
end structure        
Default: The default behavior is to use 0 for structures with only one residue and 1 for structures with more than one residue.

Chain identifier:
It is also possible to modify the "chain" identifiers of PDB files. By default, each type of molecule is set to a "chain". On the other side, using the

changechains

whithin the structure...end structure section of a type of molecule, the chains will alternate between two values ("A" and "B" for example). This might be useful if the molecules are peptides, and topology builders sometimes think that the peptides of the same chain must be joint by covalent bonds. This is avoided by alternating the chain from molecule to molecule.

Additionally each structure can have a specific chain identifier, set by the user with the option:

chain D

where "D" is the desired identifier (Do not use "#").

Building very large systems: using restart files

From version 16.143 on, it is possible to build the system from multiple and independent executions of Packmol by the use of restart files. In order to write a restart file, the following keyword must be used: restart_to restart.pack where restart.pack is the name of the restart file to be created. It is possible to write restart files for the whole system, if the keyword is put outside structure...end structure sections, or to write a restart file for a specific part of the system, using, for instance:
structure water.pdb
  number 1000
  inside cube 0. 0. 0. 40.
  restart_to water1.pack
end structure
This will generate a restart file for the water molecules only.

These restart files can be used to start a new execution of Packmol with more molecules. The restart_from keyword must then be used. For example:
structure water.pdb
  number 1000
  inside cube 0. 0. 0. 40.
  restart_from water1.pack
end structure
The new input file might contain other molecules, as a regular Packmol input file, and these water molecules will be packed together with the new molecules, but starting from the previous runs. This can be used, for example, to build solvated bilayers by parts. For instance, the bilayers could be built and, later, different solvents can be added to the bilayer, without having to restart the whole system construction from scratch every time. This could also be used to add some molecule to the bilayer.

Tip: the restart file can be used to restart the position of a smaller number of molecules of the same type. For instance, if a new molecule is introduced inside a previous set of molecules (a lipid bilayer, for instance), you can tell Packmol to pack less molecules of the original set, in order to provide space for the new structure, while using the original restart file of more molecules. That is, a restart_from water1.pack similar to the ones of the example above could be used to restart the positions of 800 molecules.

Convergence problems: what to try

Sometimes Packmol is not able to find an adequate packing solution. Here are some tips to try to overcome these difficulties:

* Look at the best solution obtained, many times it is good enough to be used.
* Simulate the same problem with only a few molecules of each type. For example, instead of using 20 thousand water molecules, put 300, and see if they are in the correct regions.
* If you have large molecules, try running the program twice, one to pack these molecules, and then use the solution as fixed molecule for the next packing, in which solvation is included. This may be particularly useful for building solvated membranes. Build the membrane first and then use it as a fixed molecule for a solvation run.
* You can change some options of the packing procedure to try improve the optimization:
1.	discale [real]
This option controls the distance tolerance actually used in the local optimization method. It was found that using larger distances helps sometimes. Try setting discale to 1.5, for example.
2.	maxit [integer]
This is the maximum number of iterations of the local optimizer (GENCAN) per loop. The default value is currently 20, changing it may improve (or worse) the convergence.
3.	movebadrandom
One of the convergence heuristics of Packmol consists in moving molecules that are badly placed. If this option is set, the molecules will be placed in new random position in the box. If not (default), the molecules are moved to positions nearby molecules that are well packed. Using this option can help when the restraints are complex, but will probably be bad if there are large structures, because the new random position might overlap with those.
4.	movefrac and maxmove
In the heuristic that moves the worst molecules, movefrac defines which is the fraction of molecules that are going to be moved, for each type of molecule. For very large systems, it is isually a good idea to define a small value of movefrac, because otherwise the randomization of the system is too great. The default value is 0.05. At the same time, maxmove defines a maximum absolute number of molecules to be displaced for each type of molecule. it must be set within a structure ... end structure section, and defaults to the number of molecules of each type.


Additional input options and keywords

There are some input options which are probably not of interest of the general user, but may be useful in specific contexts. These keywords may be added in the input file in any position.

Write a CHARMM CRD file as output:
Usage: writecrd output.crd
The segment identifier for each type of molecule can be set by adding, within the structure ... end structure section of each type, the following keyword:
segid NAME.

Add the TER flag betwen every molecule (AMBER uses this):
Usage: add_amber_ter
and
Usage: amber_ter_preserve
(this option will preserve TER flags within input structures, fixed or not from v20.14.0 on).

Add box side information to output PDB File (GROMACS uses this):
Usage: add_box_sides 1.0
Where the "1.0" is an optional real number that will be added to the length of each side, if the actual sides of your simulation box will not be exactly the same as the maximum and minimum coordinates of the molecules of the system (usually, if you are using periodic boundary conditions, you may want to add "1.0" to avoid clashes at the boundary).

Display, or not, connectivity of molecules in output PDB files:
Usage: connect yes/no
By default, if the input PDB file of a molecule has CONECT fields, the output PDB File of packmol will contain also CONECT fields with the appropriate connectivity of the corresponding molecules. If you do not want this, add connect no to the structure section of this molecule, and the output of the connectivity will be suppressed.

Increase maximum system dimensions:
Usage: sidemax [real] (ex: sidemax 2000.d0)
"sidemax" is used to build an initial approximation of the molecular distribution. Increase "sidemax" if your system is very large, or your system may look cut out by this maximum dimension. All system coordinates must fit within -sidemax and +sidemax, and using a sidemax that approximately fits your system may accelerate a little bit the packing calculation. The default value is 1000.d0.

Change random number generator seed:
Usage: seed [integer] (ex: seed 191917)
Use seed -1 to generate a seed automatically from the computer time.

Use a truly random initial point for the minimization (the default option is to generate a roughly homogeneous-density initial approximation):
Usage: randominitialpoint

Avoid, or not, overlap with fixed molecules at initial point (avoiding this overlaps is generally recommended, but sometimes generates gaps that are too large):
Usage: avoid_overlap yes/no

Change the maximum number of Gencan iterations per loop:
Usage: maxit [integer]

Change the maximum number of optimization loops (if this option is used inside the structure section, it affects the number of optimization loops only of that specific structure):
Usage: nloop [integer]

Change the precision required for the solution: how close the solution must be to the desired distances to be considered correct.
Usage: precision [real] (Default: 0.01)

Change the frequency of output file writing:
Usage: writeout [integer]

Write the current point to output file even if it is worse than the the best point so far (used for checking purposes only):
Usage: writebad

Change the optimization subroutine printing output:
Usage: iprint1 [integer] and/or iprint2 [integer]
where the integer must be 0, 1, 2 or 3.

Change the number of bins of the linked-cell method (technical):
Usage: fbins [real]
The default value is the square root of three.

Compare analytical and finite-difference gradients: This is only for testing purposes. Writes chkgrad.log file containing the comparison.
Usage: chkgrad

Options tho change the shape of the minimum-distance penalty function:

Usage: fscale [real]
This option must be used within structure ... end structure or atoms ... end atoms sections, to change the weight of the penalty function, as illustrated in the images below. The fscale defines how greater the penalty is relative to the default penalty.

Usage: use_short_tol
Usage: short_tol_dist [real]
Usage: short_tol_scale [real]
These options define a new penalty tolerance for short distances, to increase the repulsion between atoms when they are too close to each other. The "use" parameter turns on this feature, using default parameters (dist=tolerance/2; scale=3). The "dist" parameter defines from which distance the penalty is applied, and the "scale" parameter how greater this penalty is relative to the default penalty. They affect the penalty of all atoms. Remember that the "tolerance" is twice the size of the "radius" of each atom. The figure below, on the right, illustrates for example the build up of the penalty function using short_tol_dist=0.5; short_tol_scale=3, with the default overall tolerance of 2.0 set.

Usage: short_radius [real]
Usage: short_radius_scale [real]
These parameters define a new penalty for short distances, but for specific atoms. These options must be used within structure ... end structure or atoms ... end atoms sections. Note that, in this case, the radius is defined (the actual tolerance is the sum of the radii of each pair of atoms; for atoms without an explicit radius definition, the radius is one half of the overall set tolerance parameter).}

	set packmol_userguide [encoding convertfrom utf-8 $packmol_userguide]

	variable cube_xyarea
	set cube_xyarea 0.00
	variable box_xyarea
	set box_xyarea 0.00
	variable box_xzarea
	set box_xzarea 0.00
	variable box_yzarea
	set box_yzarea 0.00
	variable sphere_area
	set sphere_area 0.00
	variable ellipsoid_area
	set ellipsoid_area 0.00
	variable cylinder_area
	set cylinder_area 0.00

	variable click_save
	set click_save 0
}

proc ::packmol::packmolview {} {
	variable packmol
	variable system
	variable generate_packmol_input
	variable packmol_output
	variable packmol_userguide
	variable is_writecrd
	variable use_short_tol
	set packmol ".packmolview"
	catch {destroy $packmol}
	toplevel $packmol
	wm title .packmolview "packmol"
	wm resizable $packmol 0 0
	wm protocol $packmol WM_DELETE_WINDOW "menu packmolview off"

	# system
	set which_system [vmdinfo arch]
        set is_linux [string match *LINUX* $which_system]
        set is_window [string match *WIN* $which_system]
	if {$is_linux==1} {
		set system "Linux"
	}
	if {$is_window==1} {
		set system "Windows"
	}
        # set column
	grid columnconfigure $packmol 0 -weight 1
	grid columnconfigure $packmol 1 -weight 0
	grid rowconfigure $packmol 0 -weight 0
	grid rowconfigure $packmol 1 -weight 1

	grid [ttk::notebook $packmol.all] -row 1 -column 0 -sticky news -padx 0
	grid columnconfigure $packmol.all 0 -weight 1
	grid rowconfigure $packmol.all 1 -weight 1

	ttk::frame $packmol.all.first
	grid columnconfigure $packmol.all.first 0 -weight 1
	grid rowconfigure $packmol.all.first 1 -weight 0
	grid rowconfigure $packmol.all.first 2 -weight 2

	ttk::frame $packmol.all.second
	grid columnconfigure $packmol.all.second 0 -weight 1
	grid columnconfigure $packmol.all.second 1 -weight 0
	grid columnconfigure $packmol.all.second 2 -weight 2

#	ttk::frame $packmol.all.second
#	grid columnconfigure $packmol.all.second 0 -weight 1
#	grid rowconfigure $packmol.all.second 1 -weight 0
#	grid rowconfigure $packmol.all.second 2 -weight 2
#	grid rowconfigure $packmol.all.second 3 -weight 0
#	grid rowconfigure $packmol.all.second 4 -weight 2

	$packmol.all add $packmol.all.first -text "Packmol-GUI" -sticky news
	::packmol::molinformation
	# general setting
	labelframe $packmol.all.first.general -text "General Parameters"
	frame $packmol.all.first.general.tol_constrain
	# first
        labelframe $packmol.all.first.general.tol_constrain.tol_out_file
        frame $packmol.all.first.general.tol_constrain.tol_out_file.fra
        frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.tolerance
        label $packmol.all.first.general.tol_constrain.tol_out_file.fra.tolerance.label -text "tolerance:"
        spinbox $packmol.all.first.general.tol_constrain.tol_out_file.fra.tolerance.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::tolerance -from 0 -to 100000 -increment 1 -command {::packmol::change_general_setting}
        bind $packmol.all.first.general.tol_constrain.tol_out_file.fra.tolerance.spinbox <Return> {
		::packmol::check_tolerance
                ::packmol::change_general_setting
        }
        grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.tolerance.label $packmol.all.first.general.tol_constrain.tol_out_file.fra.tolerance.spinbox

        frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.filetype
        label $packmol.all.first.general.tol_constrain.tol_out_file.fra.filetype.label -text "filetype:"
        ttk::combobox $packmol.all.first.general.tol_constrain.tol_out_file.fra.filetype.combobox -state readonly -values [list "pdb" "tinker" "xyz" "molden"] -width 6 -textvariable ::packmol::file_type -background white
        bind $packmol.all.first.general.tol_constrain.tol_out_file.fra.filetype.combobox <<ComboboxSelected>> {
                ::packmol::change_general_setting
        }
        $packmol.all.first.general.tol_constrain.tol_out_file.fra.filetype.combobox current 0
        grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.filetype.label $packmol.all.first.general.tol_constrain.tol_out_file.fra.filetype.combobox

	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.output_dir
	label $packmol.all.first.general.tol_constrain.tol_out_file.fra.output_dir.label -text "output directory:"
	entry $packmol.all.first.general.tol_constrain.tol_out_file.fra.output_dir.dir_entry -textvariable ::packmol::outputdir -state readonly -width 18
	button $packmol.all.first.general.tol_constrain.tol_out_file.fra.output_dir.button -text "browse" -width 5 -height 1 -command {::packmol::set_outputdir}
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.output_dir.label $packmol.all.first.general.tol_constrain.tol_out_file.fra.output_dir.dir_entry $packmol.all.first.general.tol_constrain.tol_out_file.fra.output_dir.button -sticky w

	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename
	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename.writecrd
	checkbutton $packmol.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename.writecrd.label -text "writecrd:" -variable ::packmol::is_writecrd -anchor w -command {::packmol::writecrd_able}
	if {$is_writecrd==0} {
		entry $packmol.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename.writecrd.entry -textvariable ::packmol::writecrdname -width 18 -state disable
	} else {
		entry $packmol.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename.writecrd.entry -textvariable ::packmol::writecrdname -width 18 -state normal
	}
	bind $packmol.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename.writecrd.entry <Return> {
		::packmol::change_writecrd
	}
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename.writecrd.label $packmol.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename.writecrd.entry

	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename.filename
	label $packmol.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename.filename.label -text "filename:"
	entry $packmol.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename.filename.entry -textvariable ::packmol::outputfilename -width 18
	bind $packmol.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename.filename.entry <Return> {
		::packmol::set_outputfilename
	}
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename.filename.label $packmol.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename.filename.entry
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename.writecrd $packmol.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename.filename

        frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.add_amber_ter
        label $packmol.all.first.general.tol_constrain.tol_out_file.fra.add_amber_ter.label -text "add_amber_ter:"
        frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.add_amber_ter.radiobutton
        radiobutton $packmol.all.first.general.tol_constrain.tol_out_file.fra.add_amber_ter.radiobutton.yes -text yes -variable ::packmol::add_amber_ter -value "yes" -state normal -command {::packmol::change_general_setting}
        radiobutton $packmol.all.first.general.tol_constrain.tol_out_file.fra.add_amber_ter.radiobutton.no -text no -variable ::packmol::add_amber_ter -value "no" -state normal -command {::packmol::change_general_setting}
        grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.add_amber_ter.radiobutton.yes $packmol.all.first.general.tol_constrain.tol_out_file.fra.add_amber_ter.radiobutton.no
        grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.add_amber_ter.label $packmol.all.first.general.tol_constrain.tol_out_file.fra.add_amber_ter.radiobutton

	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.add_box_sides
        label $packmol.all.first.general.tol_constrain.tol_out_file.fra.add_box_sides.label -text "add_box_sides:"
        spinbox $packmol.all.first.general.tol_constrain.tol_out_file.fra.add_box_sides.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::box_sides -from 0 -to 100000 -increment 1 -state normal -command {::packmol::change_general_setting}
        bind $packmol.all.first.general.tol_constrain.tol_out_file.fra.add_box_sides.spinbox <Return> {
		::packmol::check_add_box_sides
                ::packmol::change_general_setting
        }
        grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.add_box_sides.label $packmol.all.first.general.tol_constrain.tol_out_file.fra.add_box_sides.spinbox

	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.seed
        label $packmol.all.first.general.tol_constrain.tol_out_file.fra.seed.label -text "seed:"
        spinbox $packmol.all.first.general.tol_constrain.tol_out_file.fra.seed.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::seed -from -1 -to 191917 -increment 1 -state normal -command {::packmol::change_general_setting}
        grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.seed.label $packmol.all.first.general.tol_constrain.tol_out_file.fra.seed.spinbox
        bind $packmol.all.first.general.tol_constrain.tol_out_file.fra.seed.spinbox <Return> {
		::packmol::check_seed
                ::packmol::get_seed_int
                ::packmol::change_general_setting
        }

	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc
	label $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.label -text "pbc:"
	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz
	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.x
	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.x.xmin
	label $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.x.xmin.label -text "xmin:"
	spinbox $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.x.xmin.spinbox -relief sunken -bd 2 -textvariable ::packmol::pbc_xmin -from -1000000 -to 1000000 -increment 1 -state normal -width 6 -command {::packmol::check_pbcsize}
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.x.xmin.label $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.x.xmin.spinbox

	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.x.xmax
	label $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.x.xmax.label -text "xmax:"
	spinbox $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.x.xmax.spinbox -relief sunken -bd 2 -textvariable ::packmol::pbc_xmax -from -1000000 -to 1000000 -increment 1 -state normal -width 6 -command {::packmol::check_pbcsize}
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.x.xmax.label $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.x.xmax.spinbox
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.x.xmin -sticky e
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.x.xmax -sticky e

	bind $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.x.xmin.spinbox <Return> {
		::packmol::check_pbcsize
	}
	bind $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.x.xmax.spinbox <Return> {
		::packmol::check_pbcsize
	}

	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.y
	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.y.ymin
	label $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.y.ymin.label -text "ymin:"
	spinbox $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.y.ymin.spinbox -relief sunken -bd 2 -textvariable ::packmol::pbc_ymin -from -1000000 -to 1000000 -increment 1 -state normal -width 6 -command {::packmol::check_pbcsize}
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.y.ymin.label $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.y.ymin.spinbox

	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.y.ymax
	label $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.y.ymax.label -text "ymax:"
	spinbox $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.y.ymax.spinbox -relief sunken -bd 2 -textvariable ::packmol::pbc_ymax -from -1000000 -to 1000000 -increment 1 -state normal -width 6 -command {::packmol::check_pbcsize}
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.y.ymax.label $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.y.ymax.spinbox

	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.y.ymin -sticky e
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.y.ymax -sticky e

	bind $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.y.ymin.spinbox <Return> {
		::packmol::check_pbcsize
	}
	bind $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.y.ymax.spinbox <Return> {
		::packmol::check_pbcsize
	}

	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.z
	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.z.zmin
	label $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.z.zmin.label -text "zmin:"
	spinbox $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.z.zmin.spinbox -relief sunken -bd 2 -textvariable ::packmol::pbc_zmin -from -1000000 -to 1000000 -increment 1 -state normal -width 6 -command {::packmol::check_pbcsize}
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.z.zmin.label $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.z.zmin.spinbox

	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.z.zmax
	label $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.z.zmax.label -text "zmax:"
	spinbox $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.z.zmax.spinbox -relief sunken -bd 2 -textvariable ::packmol::pbc_zmax -from -1000000 -to 1000000 -increment 1 -state normal -width 6 -command {::packmol::check_pbcsize}
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.z.zmax.label $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.z.zmax.spinbox

	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.z.zmin -sticky e
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.z.zmax -sticky e

	bind $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.z.zmin.spinbox <Return> {
		::packmol::check_pbcsize
	}
	bind $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.z.zmax.spinbox <Return> {
		::packmol::check_pbcsize
	}

	pack $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.x $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.y $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz.z -side left -fill x -expand 1

	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.label $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc.xyz

	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.system
	label $packmol.all.first.general.tol_constrain.tol_out_file.fra.system.label -text "system:"
        frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.system.linux_window
        radiobutton $packmol.all.first.general.tol_constrain.tol_out_file.fra.system.linux_window.linux -text Linux -variable ::packmol::system -value "Linux" -state disable
        radiobutton $packmol.all.first.general.tol_constrain.tol_out_file.fra.system.linux_window.windows -text Windows -variable ::packmol::system -value "Windows" -state disable
        if {$is_linux==1} {
                $packmol.all.first.general.tol_constrain.tol_out_file.fra.system.linux_window.linux configure -text Linux -variable ::packmol::system -value "Linux" -state normal
        }
        if {$is_window==1} {
                $packmol.all.first.general.tol_constrain.tol_out_file.fra.system.linux_window.windows configure -text Windows -variable ::packmol::system -value "Windows" -state normal
        }
        grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.system.linux_window.linux $packmol.all.first.general.tol_constrain.tol_out_file.fra.system.linux_window.windows -sticky w
        grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.system.label $packmol.all.first.general.tol_constrain.tol_out_file.fra.system.linux_window

	frame $packmol.all.first.general.tol_constrain.tol_out_file.fra.packmol
        label $packmol.all.first.general.tol_constrain.tol_out_file.fra.packmol.label -text "Packmol directory:"
	button $packmol.all.first.general.tol_constrain.tol_out_file.fra.packmol.browse -text "browse" -state disable -width 8 -height 1 -command {::packmol::find_packmol}
	if {$is_linux==1} {
		$packmol.all.first.general.tol_constrain.tol_out_file.fra.packmol.browse configure -text "browse" -state disable -width 8 -height 1 -command {::packmol::find_packmol}
	}
	if {$is_window==1} {
		$packmol.all.first.general.tol_constrain.tol_out_file.fra.packmol.browse configure -text "browse" -state normal -width 8 -height 1 -command {::packmol::find_packmol}
	}
        grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.packmol.label $packmol.all.first.general.tol_constrain.tol_out_file.fra.packmol.browse -sticky e

	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.system -sticky e
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.packmol -sticky e
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.tolerance -sticky e
        grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.filetype -sticky e
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.output_dir -sticky e
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename -sticky e
        grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.add_amber_ter -sticky e
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.add_box_sides -sticky e
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.seed -sticky e
	grid $packmol.all.first.general.tol_constrain.tol_out_file.fra.pbc -sticky e
        pack $packmol.all.first.general.tol_constrain.tol_out_file.fra -side top -fill y -expand 1 -anchor center
	# second
	labelframe $packmol.all.first.general.tol_constrain.side_random_avoid
	frame $packmol.all.first.general.tol_constrain.side_random_avoid.fra
	frame $packmol.all.first.general.tol_constrain.side_random_avoid.fra.sidemax
        label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.sidemax.label -text "sidemax:"
        spinbox $packmol.all.first.general.tol_constrain.side_random_avoid.fra.sidemax.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::sidemax -from 0 -to 2000 -increment 1 -state normal -command {::packmol::change_general_setting}
        bind $packmol.all.first.general.tol_constrain.side_random_avoid.fra.sidemax.spinbox <Return> {
		::packmol::check_sidemax
                ::packmol::change_general_setting
        }
        grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.sidemax.label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.sidemax.spinbox

        frame $packmol.all.first.general.tol_constrain.side_random_avoid.fra.randominitialpoint
        label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.randominitialpoint.label -text "randominitialpoint:"
        frame $packmol.all.first.general.tol_constrain.side_random_avoid.fra.randominitialpoint.radiobutton
        radiobutton $packmol.all.first.general.tol_constrain.side_random_avoid.fra.randominitialpoint.radiobutton.yes -text yes -variable ::packmol::use_randominitialpoint -value "yes" -state normal -command {::packmol::change_general_setting}
        radiobutton $packmol.all.first.general.tol_constrain.side_random_avoid.fra.randominitialpoint.radiobutton.no -text no -variable ::packmol::use_randominitialpoint -value "no" -state normal -command {::packmol::change_general_setting}
        grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.randominitialpoint.radiobutton.yes $packmol.all.first.general.tol_constrain.side_random_avoid.fra.randominitialpoint.radiobutton.no
        grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.randominitialpoint.label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.randominitialpoint.radiobutton

        frame $packmol.all.first.general.tol_constrain.side_random_avoid.fra.avoid_overlap
        label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.avoid_overlap.label -text "avoid_overlap:"
        frame $packmol.all.first.general.tol_constrain.side_random_avoid.fra.avoid_overlap.radiobutton
        radiobutton $packmol.all.first.general.tol_constrain.side_random_avoid.fra.avoid_overlap.radiobutton.yes -text yes -variable ::packmol::avoid_overlap -value "yes" -state normal -command {::packmol::change_general_setting}
        radiobutton $packmol.all.first.general.tol_constrain.side_random_avoid.fra.avoid_overlap.radiobutton.no -text no -variable ::packmol::avoid_overlap -value "no" -state normal -command {::packmol::change_general_setting}
        grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.avoid_overlap.radiobutton.yes $packmol.all.first.general.tol_constrain.side_random_avoid.fra.avoid_overlap.radiobutton.no
        grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.avoid_overlap.label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.avoid_overlap.radiobutton

	frame $packmol.all.first.general.tol_constrain.side_random_avoid.fra.discale
        label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.discale.label -text "discale:"
        spinbox $packmol.all.first.general.tol_constrain.side_random_avoid.fra.discale.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::discale -from 0 -to 100000 -increment 1 -state normal -command {::packmol::change_general_setting}
        bind $packmol.all.first.general.tol_constrain.side_random_avoid.fra.discale.spinbox <Return> {
		::packmol::check_discale
                ::packmol::change_general_setting
        }
        grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.discale.label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.discale.spinbox

        frame $packmol.all.first.general.tol_constrain.side_random_avoid.fra.maxit
        label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.maxit.label -text "maxit:"
        spinbox $packmol.all.first.general.tol_constrain.side_random_avoid.fra.maxit.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::maxit -from 0 -to 100000 -increment 1 -state normal -command {::packmol::change_general_setting}
        grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.maxit.label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.maxit.spinbox
        bind $packmol.all.first.general.tol_constrain.side_random_avoid.fra.maxit.spinbox <Return> {
		::packmol::check_maxit
                ::packmol::get_maxit_int
                ::packmol::change_general_setting
        }

        frame $packmol.all.first.general.tol_constrain.side_random_avoid.fra.movebadrandom
        label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.movebadrandom.label -text "movebadrandom:"
        frame $packmol.all.first.general.tol_constrain.side_random_avoid.fra.movebadrandom.radiobutton
        radiobutton $packmol.all.first.general.tol_constrain.side_random_avoid.fra.movebadrandom.radiobutton.yes -text yes -variable ::packmol::movebadrandom -value "yes" -state normal -command {::packmol::change_general_setting}
        radiobutton $packmol.all.first.general.tol_constrain.side_random_avoid.fra.movebadrandom.radiobutton.no -text no -variable ::packmol::movebadrandom -value "no" -state normal -command {::packmol::change_general_setting}
        grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.movebadrandom.radiobutton.yes $packmol.all.first.general.tol_constrain.side_random_avoid.fra.movebadrandom.radiobutton.no
        grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.movebadrandom.label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.movebadrandom.radiobutton

        frame $packmol.all.first.general.tol_constrain.side_random_avoid.fra.nloop
        label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.nloop.label -text "nloop:"
        spinbox $packmol.all.first.general.tol_constrain.side_random_avoid.fra.nloop.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::nloop -from 0 -to 100000 -increment 1 -state normal -command {::packmol::change_general_setting}
        grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.nloop.label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.nloop.spinbox
        bind $packmol.all.first.general.tol_constrain.side_random_avoid.fra.nloop.spinbox <Return> {
		::packmol::check_nloop
                ::packmol::get_nloop_int
                ::packmol::change_general_setting
        }

	frame $packmol.all.first.general.tol_constrain.side_random_avoid.fra.precision
        label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.precision.label -text "precision:"
        spinbox $packmol.all.first.general.tol_constrain.side_random_avoid.fra.precision.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::precision -from 0 -to 100000 -increment 0.01 -state normal -command {::packmol::change_general_setting}
        bind $packmol.all.first.general.tol_constrain.side_random_avoid.fra.precision.spinbox <Return> {
		::packmol::check_precision
                ::packmol::change_general_setting
        }
        grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.precision.label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.precision.spinbox

	frame $packmol.all.first.general.tol_constrain.side_random_avoid.fra.use_short_tol
	label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.use_short_tol.label -text "use_short_tol:"
	frame $packmol.all.first.general.tol_constrain.side_random_avoid.fra.use_short_tol.radiobutton
	radiobutton $packmol.all.first.general.tol_constrain.side_random_avoid.fra.use_short_tol.radiobutton.yes -text yes -variable ::packmol::use_short_tol -value "yes" -state normal -command {::packmol::change_dist_scale}
	radiobutton $packmol.all.first.general.tol_constrain.side_random_avoid.fra.use_short_tol.radiobutton.no -text no -variable ::packmol::use_short_tol -value "no" -state normal -command {::packmol::change_dist_scale}
	grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.use_short_tol.radiobutton.yes $packmol.all.first.general.tol_constrain.side_random_avoid.fra.use_short_tol.radiobutton.no
	grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.use_short_tol.label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.use_short_tol.radiobutton

	frame $packmol.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_dist
	label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_dist.label -text "short_tol_dist:"
	if {$use_short_tol=="yes"} {
		spinbox $packmol.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_dist.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::short_tol_dist -from 0 -to 100000 -increment 1 -state normal -command {::packmol::change_general_setting}
	} else {
		spinbox $packmol.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_dist.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::short_tol_dist -from 0 -to 100000 -increment 1 -state disable -command {::packmol::change_general_setting}
	}
	grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_dist.label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_dist.spinbox
	bind $packmol.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_dist.spinbox <Return> {
		::packmol::change_general_setting
	}

	frame $packmol.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_scale
	label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_scale.label -text "short_tol_scale:"
	if {$use_short_tol=="yes"} {
		spinbox $packmol.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_scale.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::short_tol_scale -from 0 -to 100000 -increment 1 -state normal -command {::packmol::change_general_setting}
	} else {
		spinbox $packmol.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_scale.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::short_tol_scale -from 0 -to 100000 -increment 1 -state disable -command {::packmol::change_general_setting}
	}
	grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_scale.label $packmol.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_scale.spinbox
	bind $packmol.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_scale.spinbox <Return> {
		::packmol::change_general_setting
	}

	grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.sidemax -sticky e
	grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.randominitialpoint -sticky e
	grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.avoid_overlap -sticky e
	grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.discale -sticky e
	grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.maxit -sticky e
	grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.movebadrandom -sticky e
	grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.nloop -sticky e
	grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.precision -sticky e
	grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.use_short_tol -sticky e
	grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_dist -sticky e
	grid $packmol.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_scale -sticky e
	pack $packmol.all.first.general.tol_constrain.side_random_avoid.fra -side top -fill y -expand 1 -anchor center

	# third
	labelframe $packmol.all.first.general.tol_constrain.out_bad_print
	frame $packmol.all.first.general.tol_constrain.out_bad_print.fra
	frame $packmol.all.first.general.tol_constrain.out_bad_print.fra.writeout
        label $packmol.all.first.general.tol_constrain.out_bad_print.fra.writeout.label -text "writeout:"
        spinbox $packmol.all.first.general.tol_constrain.out_bad_print.fra.writeout.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::writeout -from 0 -to 100000 -increment 1 -state normal -command {::packmol::change_general_setting}
        grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.writeout.label $packmol.all.first.general.tol_constrain.out_bad_print.fra.writeout.spinbox
        bind $packmol.all.first.general.tol_constrain.out_bad_print.fra.writeout.spinbox <Return> {
		::packmol::check_writeout
                ::packmol::get_writeout_int
                ::packmol::change_general_setting
        }

        frame $packmol.all.first.general.tol_constrain.out_bad_print.fra.writebad
        label $packmol.all.first.general.tol_constrain.out_bad_print.fra.writebad.label -text "writebad:"
        frame $packmol.all.first.general.tol_constrain.out_bad_print.fra.writebad.radiobutton
        radiobutton $packmol.all.first.general.tol_constrain.out_bad_print.fra.writebad.radiobutton.yes -text yes -variable ::packmol::writebad -value "yes" -state normal -command {::packmol::change_general_setting}
        radiobutton $packmol.all.first.general.tol_constrain.out_bad_print.fra.writebad.radiobutton.no -text no -variable ::packmol::writebad -value "no" -state normal -command {::packmol::change_general_setting}
        grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.writebad.radiobutton.yes $packmol.all.first.general.tol_constrain.out_bad_print.fra.writebad.radiobutton.no
        grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.writebad.label $packmol.all.first.general.tol_constrain.out_bad_print.fra.writebad.radiobutton

        frame $packmol.all.first.general.tol_constrain.out_bad_print.fra.check
        label $packmol.all.first.general.tol_constrain.out_bad_print.fra.check.label -text "check:"
        frame $packmol.all.first.general.tol_constrain.out_bad_print.fra.check.radiobutton
        radiobutton $packmol.all.first.general.tol_constrain.out_bad_print.fra.check.radiobutton.yes -text yes -variable ::packmol::check -value "yes" -state normal -command {::packmol::change_general_setting}
        radiobutton $packmol.all.first.general.tol_constrain.out_bad_print.fra.check.radiobutton.no -text no -variable ::packmol::check -value "no" -state normal -command {::packmol::change_general_setting}
        grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.check.radiobutton.yes $packmol.all.first.general.tol_constrain.out_bad_print.fra.check.radiobutton.no
        grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.check.label $packmol.all.first.general.tol_constrain.out_bad_print.fra.check.radiobutton

        frame $packmol.all.first.general.tol_constrain.out_bad_print.fra.iprint1
        label $packmol.all.first.general.tol_constrain.out_bad_print.fra.iprint1.label -text "iprint1:"
        spinbox $packmol.all.first.general.tol_constrain.out_bad_print.fra.iprint1.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::iprint1 -from -1 -to 3 -increment 1 -state readonly -command {::packmol::change_general_setting}
        grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.iprint1.label $packmol.all.first.general.tol_constrain.out_bad_print.fra.iprint1.spinbox

	frame $packmol.all.first.general.tol_constrain.out_bad_print.fra.iprint2
        label $packmol.all.first.general.tol_constrain.out_bad_print.fra.iprint2.label -text "iprint2:"
        spinbox $packmol.all.first.general.tol_constrain.out_bad_print.fra.iprint2.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::iprint2 -from -1 -to 3 -increment 1 -state readonly -command {::packmol::change_general_setting}
        grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.iprint2.label $packmol.all.first.general.tol_constrain.out_bad_print.fra.iprint2.spinbox

        frame $packmol.all.first.general.tol_constrain.out_bad_print.fra.fbins
        label $packmol.all.first.general.tol_constrain.out_bad_print.fra.fbins.label -text "fbins:"
        spinbox $packmol.all.first.general.tol_constrain.out_bad_print.fra.fbins.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::fbins -from 0 -to 100000 -increment 0.0001 -state normal -command {::packmol::change_general_setting}
        bind $packmol.all.first.general.tol_constrain.out_bad_print.fra.fbins.spinbox <Return> {
		::packmol::check_fbins
                ::packmol::change_general_setting
        }
        grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.fbins.label $packmol.all.first.general.tol_constrain.out_bad_print.fra.fbins.spinbox

        frame $packmol.all.first.general.tol_constrain.out_bad_print.fra.chkgrad
        label $packmol.all.first.general.tol_constrain.out_bad_print.fra.chkgrad.label -text "chkgrad:"
        frame $packmol.all.first.general.tol_constrain.out_bad_print.fra.chkgrad.radiobutton
        radiobutton $packmol.all.first.general.tol_constrain.out_bad_print.fra.chkgrad.radiobutton.yes -text yes -variable ::packmol::chkgrad -value "yes" -state normal -command {::packmol::change_general_setting}
        radiobutton $packmol.all.first.general.tol_constrain.out_bad_print.fra.chkgrad.radiobutton.no -text no -variable ::packmol::chkgrad -value "no" -state normal -command {::packmol::change_general_setting}
        grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.chkgrad.radiobutton.yes $packmol.all.first.general.tol_constrain.out_bad_print.fra.chkgrad.radiobutton.no
        grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.chkgrad.label $packmol.all.first.general.tol_constrain.out_bad_print.fra.chkgrad.radiobutton

	frame $packmol.all.first.general.tol_constrain.out_bad_print.fra.checkbox
	label $packmol.all.first.general.tol_constrain.out_bad_print.fra.checkbox.label -text "load output structure:"
	frame $packmol.all.first.general.tol_constrain.out_bad_print.fra.checkbox.radiobutton
	radiobutton $packmol.all.first.general.tol_constrain.out_bad_print.fra.checkbox.radiobutton.yes -text yes -variable ::packmol::checkbox -value "yes" -state normal -command {::packmol::change_general_setting}
	radiobutton $packmol.all.first.general.tol_constrain.out_bad_print.fra.checkbox.radiobutton.no -text no -variable ::packmol::checkbox -value "no" -state normal -command {::packmol::change_general_setting}
	grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.checkbox.radiobutton.yes $packmol.all.first.general.tol_constrain.out_bad_print.fra.checkbox.radiobutton.no
	grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.checkbox.label $packmol.all.first.general.tol_constrain.out_bad_print.fra.checkbox.radiobutton

	frame $packmol.all.first.general.tol_constrain.out_bad_print.fra.movefrac
	label $packmol.all.first.general.tol_constrain.out_bad_print.fra.movefrac.label -text "movefrac:"
	spinbox $packmol.all.first.general.tol_constrain.out_bad_print.fra.movefrac.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::movefrac -from 0 -to 1000000 -increment 0.01 -state normal -command {::packmol::change_general_setting}
	grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.movefrac.label $packmol.all.first.general.tol_constrain.out_bad_print.fra.movefrac.spinbox
	bind $packmol.all.first.general.tol_constrain.out_bad_print.fra.movefrac.spinbox <Return> {
		::packmol::change_general_setting
	}

	frame $packmol.all.first.general.tol_constrain.out_bad_print.fra.connect
	label $packmol.all.first.general.tol_constrain.out_bad_print.fra.connect.label -text "connect:"
	frame $packmol.all.first.general.tol_constrain.out_bad_print.fra.connect.radiobutton
	radiobutton $packmol.all.first.general.tol_constrain.out_bad_print.fra.connect.radiobutton.yes -text yes -variable ::packmol::connect -value "yes" -state normal -command {::packmol::change_general_setting}
	radiobutton $packmol.all.first.general.tol_constrain.out_bad_print.fra.connect.radiobutton.no -text no -variable ::packmol::connect -value "no" -state normal -command {::packmol::change_general_setting}
	grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.connect.radiobutton.yes $packmol.all.first.general.tol_constrain.out_bad_print.fra.connect.radiobutton.no
	grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.connect.label $packmol.all.first.general.tol_constrain.out_bad_print.fra.connect.radiobutton

        frame $packmol.all.first.general.tol_constrain.out_bad_print.fra.default
        label $packmol.all.first.general.tol_constrain.out_bad_print.fra.default.label -text "reset:"
        button $packmol.all.first.general.tol_constrain.out_bad_print.fra.default.button -text "default" -height 1 -width 5 -command {::packmol::default_setting}
        grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.default.label $packmol.all.first.general.tol_constrain.out_bad_print.fra.default.button

	grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.writeout -sticky e
	grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.writebad -sticky e
	grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.check -sticky e
	grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.iprint1 -sticky e
	grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.iprint2 -sticky e
	grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.fbins -sticky e
	grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.chkgrad -sticky e
	grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.checkbox -sticky e
	grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.movefrac -sticky e
	grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.connect -sticky e
	grid $packmol.all.first.general.tol_constrain.out_bad_print.fra.default -sticky e
	pack $packmol.all.first.general.tol_constrain.out_bad_print.fra -side top -fill y -expand 1 -anchor center

        pack $packmol.all.first.general.tol_constrain.tol_out_file $packmol.all.first.general.tol_constrain.side_random_avoid $packmol.all.first.general.tol_constrain.out_bad_print -side left -fill both -expand 1 -anchor center
	pack $packmol.all.first.general.tol_constrain -side left -fill both -expand 1 -anchor center

	# filelist
	frame $packmol.all.first.mol_try
	labelframe $packmol.all.first.mol_try.all
	labelframe $packmol.all.first.mol_try.all.mol -text "Molecule Loading"

	frame $packmol.all.first.mol_try.all.mol.molecule
#	label $packmol.all.first.mol_try.mol.molecule.text -text "molecule"
	frame $packmol.all.first.mol_try.all.mol.molecule.file
	scrollbar $packmol.all.first.mol_try.all.mol.molecule.file.scrolly -command ".packmolview.all.first.mol_try.all.mol.molecule.file.listbox yview"
	scrollbar $packmol.all.first.mol_try.all.mol.molecule.file.scrollx -command ".packmolview.all.first.mol_try.all.mol.molecule.file.listbox xview" -orient horizontal
	tablelist::tablelist $packmol.all.first.mol_try.all.mol.molecule.file.listbox -columns {0 "ID" center 0 "File Name" center 0 "Number" center  0 "Resnumbers" center 0 "Restart from" center 0 "Restart to" center 0 "Changechains" center 0 "Chain" center 0 "Segid" center 0 "Maxmove" center 0 "Constrains Volume" center 0 "Molecular Volume" center 0 "Nvmax" center 0 "Surface Area" center 0 "APL" center 0 "Nsmax" center} -selectmode single -width 68 -height 8 -showseparators 0 -state normal -stretch "all" -labelrelief groove  -labelbd 1 -forceeditendcommand true -yscrollcommand [list $packmol.all.first.mol_try.all.mol.molecule.file.scrolly set] -xscrollcommand [list $packmol.all.first.mol_try.all.mol.molecule.file.scrollx set] -listvariable ::packmol::filelist -selectmode extended -editstartcommand ::packmol::file_start_edit -editendcommand ::packmol::file_end_edit -forceeditendcommand true
	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 2 -sortmode integer -name Number
	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 2 -width 8 -maxwidth 0 -editable true -editwindow spinbox

	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 3 -sortmode dictionary -name Resnumber
	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 3 -width 8 -maxwidth 0 -editable true -editwindow ttk::combobox

	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 4 -sortmode command -name "Restart from"
	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 4 -width 10 -maxwidth 0 -editable true -editwindow entry

	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 5 -sortmode command -name "Restart to"
	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 5 -width 10 -maxwidth 0 -editable true -editwindow entry

	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 6 -sortmode dictionary -name Changechains
	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 6 -width 10 -maxwidth 0 -editable true -editwindow ttk::combobox

	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 7 -sortmode command -name "Chain"
	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 7 -width 10 -maxwidth 0 -editable true -editwindow entry

	if {$is_writecrd==0} {
		$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 8 -sortmode command -name "Segid" -editable 0
		$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 8 -width 10 -maxwidth 0 -editable true -editwindow entry -editable 0
	} else {
		$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 8 -sortmode command -name "Segid" -editable 1
		$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 8 -width 10 -maxwidth 0 -editable true -editwindow entry -editable 1
	}

	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 9 -sortmode command -name "Maxmove"
	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 9 -width 10 -maxwidth 0 -editable true -editwindow entry -editable 1

	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 10 -sortmode command -name "Constrains Volume"
	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 10 -width 10 -maxwidth 0 -editable true -editwindow entry -editable 1

	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 11 -sortmode command -name "Molecular Volume"
	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 11 -width 10 -maxwidth 0 -editable true -editwindow entry -editable 1

	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 12 -sortmode command -name "Nvmax"
	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 12 -width 10 -maxwidth 0 -editable true -editwindow entry -editable 0

	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 13 -sortmode command -name "Surface Area"
	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 13 -width 10 -maxwidth 0 -editable true -editwindow entry -editable 1

	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 14 -sortmode command -name "APL"
	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 14 -width 10 -maxwidth 0 -editable true -editwindow entry -editable 1

	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 15 -sortmode command -name "Nsmax"
	$packmol.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 15 -width 10 -maxwidth 0 -editable true -editwindow entry -editable 0

	grid $packmol.all.first.mol_try.all.mol.molecule.file.listbox -column 0 -row 0 -sticky news
	grid $packmol.all.first.mol_try.all.mol.molecule.file.scrolly -column 1 -row 0 -sticky ns
	grid $packmol.all.first.mol_try.all.mol.molecule.file.scrollx -row 1 -sticky news

	frame $packmol.all.first.mol_try.all.mol.molecule.atom
	scrollbar $packmol.all.first.mol_try.all.mol.molecule.atom.scrolly -command ".packmolview.all.first.mol_try.all.mol.molecule.atom.listbox yview"
	scrollbar $packmol.all.first.mol_try.all.mol.molecule.atom.scrollx -command ".packmolview.all.first.mol_try.all.mol.molecule.atom.listbox xview" -orient horizontal
	tablelist::tablelist $packmol.all.first.mol_try.all.mol.molecule.atom.listbox -columns {0 "Atom" center} -selectmode single -width 12 -height 8 -showseparators 0 -state normal -stretch "all" -labelrelief groove  -labelbd 1 -forceeditendcommand true -yscrollcommand [list $packmol.all.first.mol_try.all.mol.molecule.atom.scrolly set] -xscrollcommand [list $packmol.all.first.mol_try.all.mol.molecule.atom.scrollx set] -listvariable ::packmol::atom_serial_name_list -selectmode multiple -columntitles {"Atom"}
	$packmol.all.first.mol_try.all.mol.molecule.atom.listbox columnconfigure 0 -name Atom -align left -labelalign center
	grid $packmol.all.first.mol_try.all.mol.molecule.atom.listbox -column 0 -row 0 -sticky news
	grid $packmol.all.first.mol_try.all.mol.molecule.atom.scrolly -column 1 -row 0 -sticky ns
	grid $packmol.all.first.mol_try.all.mol.molecule.atom.scrollx -row 1 -sticky news
	# add
#	grid $packmol.all.first.mol_try.all.mol.molecule.atom.label -sticky news
#	grid $packmol.all.first.mol_try.all.mol.molecule.atom.listboxframe -sticky news
#	pack $packmol.all.first.mol_try.all.mol.molecule.atom.label $packmol.all.first.mol_try.all.mol.molecule.atom.listboxframe -fill both -side top

	frame $packmol.all.first.mol_try.all.mol.molecule.refresh
	button $packmol.all.first.mol_try.all.mol.molecule.refresh.ref -text "refresh" -height 1 -width 5 -command {::packmol::refresh} -font {{Times New Roman} -18 bold}
	button $packmol.all.first.mol_try.all.mol.molecule.refresh.import -text "import" -height 1 -width 5 -command {::packmol::import_mol} -font {{Times New Roman} -18 bold}
	button $packmol.all.first.mol_try.all.mol.molecule.refresh.delete -text "delete" -height 1 -width 5 -command {::packmol::delete_mol} -font {{Times New Roman} -18 bold}
	pack $packmol.all.first.mol_try.all.mol.molecule.refresh.import $packmol.all.first.mol_try.all.mol.molecule.refresh.delete $packmol.all.first.mol_try.all.mol.molecule.refresh.ref -side top -fill y

#	pack $packmol.all.first.mol_try.all.mol.molecule.file $packmol.all.first.mol_try.all.mol.molecule.atom $packmol.all.first.mol_try.all.mol.molecule.refresh -side left -fill x
	pack $packmol.all.first.mol_try.all.mol.molecule.refresh $packmol.all.first.mol_try.all.mol.molecule.file $packmol.all.first.mol_try.all.mol.molecule.atom -side left -fill x -padx 1m

	bind $packmol.all.first.mol_try.all.mol.molecule.file.listbox <<ListboxSelect>> {
		# only %w
		::packmol::getmol_sit %W
		::packmol::getatom_list %W
		::packmol::show_atom_selection
        }

	bind $packmol.all.first.mol_try.all.mol.molecule.atom.listbox <<ListboxSelect>> {
		::packmol::draw_atom %W
	}
	pack $packmol.all.first.mol_try.all.mol.molecule -side left

	labelframe $packmol.all.first.mol_try.all.basic -text "Position Constraints"
	labelframe $packmol.all.first.mol_try.all.basic.constrain
        frame $packmol.all.first.mol_try.all.basic.constrain.is_constrain
        checkbutton $packmol.all.first.mol_try.all.basic.constrain.is_constrain.check -text "constrain rotation:" -variable ::packmol::is_constrain -anchor w -command {::packmol::change_constrain}
        pack $packmol.all.first.mol_try.all.basic.constrain.is_constrain.check -fill x -side left
        frame $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp
        frame $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.xp
	frame $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.xp.x
        label $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.xp.x.label -text "x:"
        spinbox $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.xp.x.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::constrain_x -from -180 -to 180 -increment 1 -command {::packmol::change_constrain}
	bind $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.xp.x.spinbox <Return> {
		::packmol::change_constrain
	}
	grid $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.xp.x.label $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.xp.x.spinbox

	frame $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.xp.p
	label $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.xp.p.label -text "+/-:"
        spinbox $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.xp.p.spinbox_plus -width 6 -relief sunken -bd 2 -textvariable ::packmol::constrain_x_plus -from -180 -to 180 -increment 1 -command {::packmol::change_constrain}
	bind $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.xp.p.spinbox_plus <Return> {
		::packmol::change_constrain
	}
	grid $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.xp.p.label $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.xp.p.spinbox_plus

	grid $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.xp.x -sticky e
	grid $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.xp.p -sticky e

        frame $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.yp
	frame $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.yp.y
	label $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.yp.y.label -text "y:"
	spinbox $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.yp.y.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::constrain_y -from -180 -to 180 -increment 1 -command {::packmol::change_constrain}
	bind $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.yp.y.spinbox <Return> {
		::packmol::change_constrain
	}
	grid $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.yp.y.label $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.yp.y.spinbox

	frame $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.yp.p
	label $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.yp.p.label -text "+/-:"
	spinbox $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.yp.p.spinbox_plus -width 6 -relief sunken -bd 2 -textvariable ::packmol::constrain_y_plus -from -180 -to 180 -increment 1 -command {::packmol::change_constrain}
	bind $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.yp.p.spinbox_plus <Return> {
		::packmol::change_constrain
	}
	grid $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.yp.p.label $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.yp.p.spinbox_plus

	grid $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.yp.y -sticky e
	grid $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.yp.p -sticky e

	frame $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.zp
	frame $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.zp.z
	label $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.zp.z.label -text "z:"
	spinbox $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.zp.z.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::constrain_z -from -180 -to 180 -increment 1 -command {::packmol::change_constrain}
	bind $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.zp.z.spinbox <Return> {
		::packmol::change_constrain
	}
	grid $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.zp.z.label $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.zp.z.spinbox

	frame $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.zp.p
	label $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.zp.p.label -text "+/-:"
	spinbox $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.zp.p.spinbox_plus -width 6 -relief sunken -bd 2 -textvariable ::packmol::constrain_z_plus -from -180 -to 180 -increment 1 -command {::packmol::change_constrain}
	bind $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.zp.p.spinbox_plus <Return> {
		::packmol::change_constrain
	}
	grid $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.zp.p.label $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.zp.p.spinbox_plus
	grid $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.zp.z -sticky e
	grid $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.zp.p -sticky e

        pack $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.xp $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.yp $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp.zp -side left -fill x -expand 1
        pack $packmol.all.first.mol_try.all.basic.constrain.is_constrain $packmol.all.first.mol_try.all.basic.constrain.xp_yp_zp -side top -fill both

	labelframe $packmol.all.first.mol_try.all.basic.center_fixed
	frame $packmol.all.first.mol_try.all.basic.center_fixed.is_fixed
	checkbutton $packmol.all.first.mol_try.all.basic.center_fixed.is_fixed.check -text "center fixed:" -variable ::packmol::is_fixed -anchor w -command {::packmol::change_fixed}
	pack $packmol.all.first.mol_try.all.basic.center_fixed.is_fixed.check -fill x -side left
#	bind $packmol.all.first.mol_try.basic.center_fixed.label <Button-1> {
#		::packmol::change_fixed
#	}
	frame $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg

	frame $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.xa
	frame $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.xa.x
	label $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.xa.x.label -text "x:"
	spinbox $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.xa.x.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::fix_x -from -100000 -to 100000 -increment 1 -command {::packmol::change_fixed}
	bind $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.xa.x.spinbox <Return> {
		::packmol::change_fixed
	}
	grid $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.xa.x.label $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.xa.x.spinbox

	frame $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.xa.a
	label $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.xa.a.label -text "alpha:"
	spinbox $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.xa.a.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::fix_alpha -from -180 -to 180 -increment 1 -command {::packmol::change_fixed}
	bind $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.xa.a.spinbox <Return> {
		::packmol::change_fixed
	}
	grid $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.xa.a.label $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.xa.a.spinbox
	grid $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.xa.x -sticky e
	grid $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.xa.a -sticky e

	frame $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.yb
	frame $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.yb.y
	label $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.yb.y.label -text "y:"
	spinbox $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.yb.y.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::fix_y -from -100000 -to 100000 -increment 1 -command {::packmol::change_fixed}
	bind $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.yb.y.spinbox <Return> {
		::packmol::change_fixed
	}
	grid $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.yb.y.label $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.yb.y.spinbox

	frame $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.yb.b
	label $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.yb.b.label -text "beta:"
	spinbox $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.yb.b.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::fix_beta -from -180 -to 180 -increment 1 -command {::packmol::change_fixed}
	bind $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.yb.b.spinbox <Return> {
		::packmol::change_fixed
	}
	grid $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.yb.b.label $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.yb.b.spinbox
	grid $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.yb.y -sticky e
	grid $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.yb.b -sticky e

	frame $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.zg
	frame $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.zg.z
	label $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.zg.z.label -text "z:"
	spinbox $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.zg.z.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::fix_z -from -100000 -to 100000 -increment 1 -command {::packmol::change_fixed}
	bind $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.zg.z.spinbox <Return> {
		::packmol::change_fixed
	}
	grid $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.zg.z.label $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.zg.z.spinbox

	frame $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.zg.g
	label $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.zg.g.label -text "gamma:"
	spinbox $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.zg.g.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::fix_gamma -from -180 -to 180 -increment 1 -command {::packmol::change_fixed}
	bind $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.zg.g.spinbox <Return> {
		::packmol::change_fixed
	}
	grid $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.zg.g.label $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.zg.g.spinbox
	grid $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.zg.z -sticky e
	grid $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.zg.g -sticky e

	pack $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.xa $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.yb $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg.zg -side left -fill x -expand 1
	pack $packmol.all.first.mol_try.all.basic.center_fixed.is_fixed $packmol.all.first.mol_try.all.basic.center_fixed.xa_yb_zg -side top -fill both

	pack $packmol.all.first.mol_try.all.basic.center_fixed $packmol.all.first.mol_try.all.basic.constrain -side top -fill both -expand 1

	pack $packmol.all.first.mol_try.all.mol $packmol.all.first.mol_try.all.basic -fill both -side left -expand 1
	pack $packmol.all.first.mol_try.all -side left -fill both -expand 1
#	pack $packmol.all.first.mol_try

	# graphics
	labelframe $packmol.all.first.sel -text "Geometry Constraints"
	labelframe $packmol.all.first.sel.sit_list
#       label $packmol.all.first.mol_try.mol.sit.text -text "situation"
        frame $packmol.all.first.sel.sit_list.sitlist
        scrollbar $packmol.all.first.sel.sit_list.sitlist.scrolly -command ".packmolview.all.first.sel.sit_list.sitlist.listbox yview"
        scrollbar $packmol.all.first.sel.sit_list.sitlist.scrollx -command ".packmolview.all.first.sel.sit_list.sitlist.listbox xview" -orient horizontal
        tablelist::tablelist $packmol.all.first.sel.sit_list.sitlist.listbox -columns {0 "Molecule" center 0 "Atom" center 0 "Location" center 0 "Type" center 0 "Radius" center 0 "fscale" center 0 "short_radius" center 0 "short_radius_scale" center} -selectmode single -width 45 -height 6 -showseparators 0 -state normal -stretch "all" -labelrelief groove  -labelbd 1 -forceeditendcommand true -yscrollcommand [list $packmol.all.first.sel.sit_list.sitlist.scrolly set] -xscrollcommand [list $packmol.all.first.sel.sit_list.sitlist.scrollx set] -listvariable ::packmol::geo_sitlist_radius_sel -selectmode extended -editstartcommand ::packmol::radius_start_edit -editendcommand ::packmol::radius_end_edit -forceeditendcommand true
	$packmol.all.first.sel.sit_list.sitlist.listbox columnconfigure 0 -sortmode dictionary -name Molecule
	$packmol.all.first.sel.sit_list.sitlist.listbox columnconfigure 0 -width 8 -maxwidth 0 -editable true -editwindow ttk::combobox

	$packmol.all.first.sel.sit_list.sitlist.listbox columnconfigure 1 -sortmode command -name Atom
	$packmol.all.first.sel.sit_list.sitlist.listbox columnconfigure 1 -width 8 -maxwidth 0 -editable true -editwindow entry

	$packmol.all.first.sel.sit_list.sitlist.listbox columnconfigure 2 -sortmode dictionary -name Location
	$packmol.all.first.sel.sit_list.sitlist.listbox columnconfigure 2 -width 8 -maxwidth 0 -editable true -editwindow ttk::combobox

	$packmol.all.first.sel.sit_list.sitlist.listbox columnconfigure 3 -sortmode dictionary -name Type
	$packmol.all.first.sel.sit_list.sitlist.listbox columnconfigure 3 -width 8 -maxwidth 0 -editable true -editwindow ttk::combobox

	$packmol.all.first.sel.sit_list.sitlist.listbox columnconfigure 4 -sortmode real -name Radius
	$packmol.all.first.sel.sit_list.sitlist.listbox columnconfigure 4 -width 8 -maxwidth 0 -editable true -editwindow spinbox

	$packmol.all.first.sel.sit_list.sitlist.listbox columnconfigure 5 -sortmode command -name fscale
	$packmol.all.first.sel.sit_list.sitlist.listbox columnconfigure 5 -width 8 -maxwidth 0 -editable true -editwindow entry

	$packmol.all.first.sel.sit_list.sitlist.listbox columnconfigure 6 -sortmode command -name short_radius
        $packmol.all.first.sel.sit_list.sitlist.listbox columnconfigure 6 -width 8 -maxwidth 0 -editable true -editwindow entry

	$packmol.all.first.sel.sit_list.sitlist.listbox columnconfigure 7 -sortmode command -name short_radius_scale
        $packmol.all.first.sel.sit_list.sitlist.listbox columnconfigure 7 -width 8 -maxwidth 0 -editable true -editwindow entry

        grid $packmol.all.first.sel.sit_list.sitlist.listbox -column 0 -row 0 -sticky news
        grid $packmol.all.first.sel.sit_list.sitlist.scrolly -column 1 -row 0 -sticky ns
        grid $packmol.all.first.sel.sit_list.sitlist.scrollx -row 1 -sticky news

        bind $packmol.all.first.sel.sit_list.sitlist.listbox <<ListboxSelect>> {
                # only %w
                ::packmol::getsit_info %W
        }

        frame $packmol.all.first.sel.sit_list.add_del
#	frame $packmol.all.first.sel.sit_list.add_del.geonumber
#	label $packmol.all.first.sel.sit_list.add_del.geonumber.label -text "number:"
#	spinbox $packmol.all.first.sel.sit_list.add_del.geonumber.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::geo_number -from -100000 -to 100000 -increment 1 -command {::packmol::change_number}
#	bind $packmol.all.first.sel.sit_list.add_del.geonumber.spinbox <Return> {
#		::packmol::change_number
#	}
#	grid $packmol.all.first.sel.sit_list.add_del.geonumber.label $packmol.all.first.sel.sit_list.add_del.geonumber.spinbox -sticky e
        button $packmol.all.first.sel.sit_list.add_del.add -text "add" -height 1 -width 5 -command {::packmol::add_sit}
        button $packmol.all.first.sel.sit_list.add_del.del -text "del" -height 1 -width 5 -command {::packmol::del_sit}
        pack $packmol.all.first.sel.sit_list.add_del.add $packmol.all.first.sel.sit_list.add_del.del -side top -fill y

        pack $packmol.all.first.sel.sit_list.sitlist $packmol.all.first.sel.sit_list.add_del -side left -fill x

	labelframe $packmol.all.first.sel.up_down

	labelframe $packmol.all.first.sel.up_down.shape_label
	labelframe $packmol.all.first.sel.up_down.shape_label.shape_frame
	frame $packmol.all.first.sel.up_down.shape_label.shape_frame.shape
	label $packmol.all.first.sel.up_down.shape_label.shape_frame.shape.label -text "show shape:"
	frame $packmol.all.first.sel.up_down.shape_label.shape_frame.shape.radiobutton
	radiobutton $packmol.all.first.sel.up_down.shape_label.shape_frame.shape.radiobutton.yes -text yes -variable ::packmol::draw_shape -value "yes" -state normal -command {::packmol::select_draw_shape}
	radiobutton $packmol.all.first.sel.up_down.shape_label.shape_frame.shape.radiobutton.no -text no -variable ::packmol::draw_shape -value "no" -state normal -command {::packmol::select_draw_shape}
	grid $packmol.all.first.sel.up_down.shape_label.shape_frame.shape.radiobutton.yes $packmol.all.first.sel.up_down.shape_label.shape_frame.shape.radiobutton.no
	grid $packmol.all.first.sel.up_down.shape_label.shape_frame.shape.label $packmol.all.first.sel.up_down.shape_label.shape_frame.shape.radiobutton
	pack $packmol.all.first.sel.up_down.shape_label.shape_frame.shape

	labelframe $packmol.all.first.sel.up_down.shape_label.label_frame
	frame $packmol.all.first.sel.up_down.shape_label.label_frame.label
	label $packmol.all.first.sel.up_down.shape_label.label_frame.label.label -text "show label:"
	frame $packmol.all.first.sel.up_down.shape_label.label_frame.label.radiobutton
	radiobutton $packmol.all.first.sel.up_down.shape_label.label_frame.label.radiobutton.yes -text yes -variable ::packmol::draw_label -value "yes" -state normal -command {::packmol::select_draw_label}
	radiobutton $packmol.all.first.sel.up_down.shape_label.label_frame.label.radiobutton.no -text no -variable ::packmol::draw_label -value "no" -state normal -command {::packmol::select_draw_label}
	grid $packmol.all.first.sel.up_down.shape_label.label_frame.label.radiobutton.yes $packmol.all.first.sel.up_down.shape_label.label_frame.label.radiobutton.no
	grid $packmol.all.first.sel.up_down.shape_label.label_frame.label.label $packmol.all.first.sel.up_down.shape_label.label_frame.label.radiobutton

	frame $packmol.all.first.sel.up_down.shape_label.label_frame.size
	label $packmol.all.first.sel.up_down.shape_label.label_frame.size.text -text "size:"
	spinbox $packmol.all.first.sel.up_down.shape_label.label_frame.size.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::label_size -from 0 -to 10 -increment 0.1 -command {::packmol::select_draw_label}
	bind $packmol.all.first.sel.up_down.shape_label.label_frame.size.spin <Return> {
		::packmol::select_draw_label
	}
	grid $packmol.all.first.sel.up_down.shape_label.label_frame.size.text $packmol.all.first.sel.up_down.shape_label.label_frame.size.spin
	pack $packmol.all.first.sel.up_down.shape_label.label_frame.label $packmol.all.first.sel.up_down.shape_label.label_frame.size -side left -fill both -expand 1

	pack $packmol.all.first.sel.up_down.shape_label.shape_frame $packmol.all.first.sel.up_down.shape_label.label_frame -side left -fill both -expand 1

	labelframe $packmol.all.first.sel.up_down.graphics
	ttk::notebook $packmol.all.first.sel.up_down.graphics.all_graphics
	# cube
	ttk::frame $packmol.all.first.sel.up_down.graphics.all_graphics.cube
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cube.text -text "cube:"

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.startx_spin
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.startx_spin.start_x -text "start x:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.startx_spin.spinbox_start_x -width 6 -relief sunken -bd 2 -textvariable ::packmol::cube_start_x -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_cube}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.startx_spin.start_x $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.startx_spin.spinbox_start_x

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.startx_spin.spinbox_start_x <Return> {
		::packmol::draw_cube
	}

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.starty_spin
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.starty_spin.start_y -text "start y:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.starty_spin.spinbox_start_y -width 6 -relief sunken -bd 2 -textvariable ::packmol::cube_start_y -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_cube}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.starty_spin.start_y $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.starty_spin.spinbox_start_y

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.starty_spin.spinbox_start_y <Return> {
		::packmol::draw_cube
	}

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.startz_spin
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.startz_spin.start_z -text "start z:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.startz_spin.spinbox_start_z -width 6 -relief sunken -bd 2 -textvariable ::packmol::cube_start_z -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_cube}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.startz_spin.start_z $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.startz_spin.spinbox_start_z

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.startz_spin.spinbox_start_z <Return> {
		::packmol::draw_cube
	}

	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.startx_spin -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.starty_spin -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start.startz_spin -sticky e

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.size
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.size.text -text "size:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.size.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::cube_size -from 0 -to 100000 -increment 1 -state disable -command {::packmol::draw_cube}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.size.text $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.size.spinbox

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.size.spinbox <Return> {
		::packmol::draw_cube
	}

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.width
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.width.text -text "width:"
        spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.width.spinbox -width 11 -relief sunken -bd 2 -textvariable ::packmol::cube_width -from 1 -to 255 -increment 1 -state disable -command {::packmol::draw_cube}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.width.text $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.width.spinbox

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.width.spinbox <Return> {
		::packmol::draw_cube
	}

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.color
        label $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.color.text -text "color:"
        ttk::combobox $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.color.color -state disable -values [list "0 blue" "1 red" "2 gray" "3 orange" "4 yellow" "5 tan" "6 silver" "7 green" "8 white" "9 pink" "10 cyan" "11 purple" "12 lime" "13 mauve" "14 ochre" "15 iceblue" "16 black" "17 yellow2" "18 yellow3" "19 green2" "20 green3" "21 cyan2" "22 cyan3" "23 blue2" "24 blue3" "25 violet" "26 violet2" "27 magenta" "28 magenta2" "29 red2" "30 red3" "31 orange2" "32 orange3"] -width 11 -textvariable ::packmol::cube_color -background white
        grid $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.color.text $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.color.color
	
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.color.color <<ComboboxSelected>> {
		::packmol::draw_cube
	}

	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.size -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.width -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.color -sticky e

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.cube.volume
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cube.volume.volume
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cube.volume.volume.text -text "volume:"
	entry $packmol.all.first.sel.up_down.graphics.all_graphics.cube.volume.volume.value -textvariable ::packmol::cube_value -width 12 -state readonly
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cube.volume.volume.text $packmol.all.first.sel.up_down.graphics.all_graphics.cube.volume.volume.value

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cube.volume.xyarea
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cube.volume.xyarea.text -text "xy area:"
	entry $packmol.all.first.sel.up_down.graphics.all_graphics.cube.volume.xyarea.value -textvariable ::packmol::cube_xyarea -width 12 -state readonly
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cube.volume.xyarea.text $packmol.all.first.sel.up_down.graphics.all_graphics.cube.volume.xyarea.value

	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cube.volume.volume -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cube.volume.xyarea -sticky e

	pack $packmol.all.first.sel.up_down.graphics.all_graphics.cube.start $packmol.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width $packmol.all.first.sel.up_down.graphics.all_graphics.cube.volume -fill both -expand 1 -side left

	# box
	ttk::frame $packmol.all.first.sel.up_down.graphics.all_graphics.box
	label $packmol.all.first.sel.up_down.graphics.all_graphics.box.text -text "box:"

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.box.start

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.startx_spin
	label $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.startx_spin.start_x -text "start x:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.startx_spin.spinbox_start_x -width 6 -relief sunken -bd 2 -textvariable ::packmol::box_start_x -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_box}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.startx_spin.start_x $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.startx_spin.spinbox_start_x

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.starty_spin
	label $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.starty_spin.start_y -text "start y:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.starty_spin.spinbox_start_y -width 6 -relief sunken -bd 2 -textvariable ::packmol::box_start_y -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_box}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.starty_spin.start_y $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.starty_spin.spinbox_start_y

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.startz_spin
	label $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.startz_spin.start_z -text "start z:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.startz_spin.spinbox_start_z -width 6 -relief sunken -bd 2 -textvariable ::packmol::box_start_z -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_box}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.startz_spin.start_z $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.startz_spin.spinbox_start_z
	pack $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.startx_spin $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.starty_spin $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.startz_spin -side top -fill y

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.box.end

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endx_spin
	label $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endx_spin.end_x -text "end x:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endx_spin.spinbox_end_x -width 6 -relief sunken -bd 2 -textvariable ::packmol::box_end_x -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_box}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endx_spin.end_x $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endx_spin.spinbox_end_x

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endy_spin
	label $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endy_spin.end_y -text "end y:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endy_spin.spinbox_end_y -width 6 -relief sunken -bd 2 -textvariable ::packmol::box_end_y -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_box}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endy_spin.end_y $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endy_spin.spinbox_end_y

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endz_spin
	label $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endz_spin.end_z -text "end z:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endz_spin.spinbox_end_z -width 6 -relief sunken -bd 2 -textvariable ::packmol::box_end_z -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_box}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endz_spin.end_z $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endz_spin.spinbox_end_z
	pack $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endx_spin $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endy_spin $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endz_spin -side top -fill y

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.width_spin
	label $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.width_spin.width -text "width:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.width_spin.spinbox_width -width 11 -relief sunken -bd 2 -textvariable ::packmol::box_width -from 1 -to 255 -increment 1 -state disable -command {::packmol::draw_box}
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.width_spin.spinbox_width <Return> {
		::packmol::draw_box
	}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.width_spin.width $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.width_spin.spinbox_width

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.color
	label $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.color.text -text "color:"
	ttk::combobox $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.color.color -state disable -values [list "0 blue" "1 red" "2 gray" "3 orange" "4 yellow" "5 tan" "6 silver" "7 green" "8 white" "9 pink" "10 cyan" "11 purple" "12 lime" "13 mauve" "14 ochre" "15 iceblue" "16 black" "17 yellow2" "18 yellow3" "19 green2" "20 green3" "21 cyan2" "22 cyan3" "23 blue2" "24 blue3" "25 violet" "26 violet2" "27 magenta" "28 magenta2" "29 red2" "30 red3" "31 orange2" "32 orange3"] -width 11 -textvariable ::packmol::box_color -background white
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.color.text $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.color.color

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.volume
	label $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.volume.text -text "volume:"
	entry $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.volume.value -textvariable ::packmol::box_value -width 12 -state readonly
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.volume.text $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.volume.value

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.color.color <<ComboboxSelected>> {
		::packmol::draw_box
	}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.width_spin -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.color -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color.volume -sticky e

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.box.area
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.box.area.xy
	label $packmol.all.first.sel.up_down.graphics.all_graphics.box.area.xy.text -text "xy area:"
	entry $packmol.all.first.sel.up_down.graphics.all_graphics.box.area.xy.value -textvariable ::packmol::box_xyarea -width 12 -state readonly
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.box.area.xy.text $packmol.all.first.sel.up_down.graphics.all_graphics.box.area.xy.value

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.box.area.xz
	label $packmol.all.first.sel.up_down.graphics.all_graphics.box.area.xz.text -text "xz area:"
	entry $packmol.all.first.sel.up_down.graphics.all_graphics.box.area.xz.value -textvariable ::packmol::box_xzarea -width 12 -state readonly
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.box.area.xz.text $packmol.all.first.sel.up_down.graphics.all_graphics.box.area.xz.value

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.box.area.yz
	label $packmol.all.first.sel.up_down.graphics.all_graphics.box.area.yz.text -text "yz area:"
	entry $packmol.all.first.sel.up_down.graphics.all_graphics.box.area.yz.value -textvariable ::packmol::box_yzarea -width 12 -state readonly
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.box.area.yz.text $packmol.all.first.sel.up_down.graphics.all_graphics.box.area.yz.value

	grid $packmol.all.first.sel.up_down.graphics.all_graphics.box.area.xy -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.box.area.xz -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.box.area.yz -sticky e

	pack $packmol.all.first.sel.up_down.graphics.all_graphics.box.start  $packmol.all.first.sel.up_down.graphics.all_graphics.box.end $packmol.all.first.sel.up_down.graphics.all_graphics.box.width_color $packmol.all.first.sel.up_down.graphics.all_graphics.box.area -fill both -expand 1 -side left

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.startx_spin.spinbox_start_x <Return> {
		::packmol::draw_box
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.starty_spin.spinbox_start_y <Return> {
		::packmol::draw_box
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.box.start.startz_spin.spinbox_start_z <Return> {
		::packmol::draw_box
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endx_spin.spinbox_end_x <Return> {
		::packmol::draw_box
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endy_spin.spinbox_end_y <Return> {
		::packmol::draw_box
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.box.end.endz_spin.spinbox_end_z <Return> {
		::packmol::draw_box
	}

	# sphere
	ttk::frame $packmol.all.first.sel.up_down.graphics.all_graphics.sphere

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.x
	label $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.x.text -text "x:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.x.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::sphere_x -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_sphere}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.x.text $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.x.spin

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.y
	label $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.y.text -text "y:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.y.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::sphere_y -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_sphere}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.y.text $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.y.spin

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.z
	label $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.z.text -text "z:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.z.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::sphere_z -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_sphere}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.z.text $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.z.spin
	pack $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.x $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.y $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.z -side top -fill y

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.r
	label $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.r.text -text "radius:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.r.spin -width 11 -relief sunken -bd 2 -textvariable ::packmol::sphere_r -from 0 -to 100000 -increment 1 -state disable -command {::packmol::draw_sphere}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.r.text $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.r.spin

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.color
	label $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.color.text -text "color:"
	ttk::combobox $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.color.color -state disable -values [list "0 blue" "1 red" "2 gray" "3 orange" "4 yellow" "5 tan" "6 silver" "7 green" "8 white" "9 pink" "10 cyan" "11 purple" "12 lime" "13 mauve" "14 ochre" "15 iceblue" "16 black" "17 yellow2" "18 yellow3" "19 green2" "20 green3" "21 cyan2" "22 cyan3" "23 blue2" "24 blue3" "25 violet" "26 violet2" "27 magenta" "28 magenta2" "29 red2" "30 red3" "31 orange2" "32 orange3"] -width 11 -textvariable ::packmol::sphere_color -background white
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.color.color <<ComboboxSelected>> {
		::packmol::draw_sphere
	}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.color.text $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.color.color

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.material
	label $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.material.text -text "material:"
	ttk::combobox $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.material.material -state disable -values [list "Opaque" "Transparent" "BrushedMetal" "Diffuse" "Ghost" "Glass1" "Glass2" "Glass3" "Glossy" "HardPlastic" "MetallicPastel" "Steel" "Translucent" "Edgy" "EdgyShiny" "EdgyGlass" "Goodsell" "AOShiny" "AOChalky" "AOEdgy" "BlownGlass" "GlassBubble" "RTChrome"] -width 11 -textvariable ::packmol::sel_material -background white
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.material.material <<ComboboxSelected>> {
		::packmol::draw_sphere
	}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.material.text $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.material.material
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.r -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.color -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.material -sticky e
	
	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.resolution
	label $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.resolution.text -text "resolution:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.resolution.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::sphere_resolution -from 4 -to 100000 -increment 1 -state disable -command {::packmol::draw_sphere}
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.resolution.spin <Return> {
		::packmol::draw_sphere
	}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.resolution.text $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.resolution.spin

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.volume
	label $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.volume.text -text "volume:"
	entry $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.volume.value -textvariable ::packmol::sphere_value -width 12 -state readonly
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.volume.text $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.volume.value

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.area
	label $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.area.text -text "surface area:"
	entry $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.area.value -textvariable ::packmol::sphere_area -width 12 -state readonly
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.area.text $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.area.value

	grid $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.resolution -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.volume -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.area -sticky e

	pack $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number -side left -fill both -expand 1

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.x.spin <Return> {
		::packmol::draw_sphere
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.y.spin <Return> {
		::packmol::draw_sphere
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.center.z.spin <Return> {
		::packmol::draw_sphere
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.r.spin <Return> {
		::packmol::draw_sphere
	}

	# ellipsoid
	ttk::frame $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.a1
	label $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.a1.text -text "a1:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.a1.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::ellipsoid_a1 -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_ellipsoid}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.a1.text $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.a1.spin

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.b1
	label $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.b1.text -text "b1:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.b1.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::ellipsoid_b1 -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_ellipsoid}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.b1.text $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.b1.spin

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.c1
	label $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.c1.text -text "c1:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.c1.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::ellipsoid_c1 -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_ellipsoid}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.c1.text $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.c1.spin
	pack $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.a1 $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.b1 $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.c1 -side top -fill y

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.a2
	label $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.a2.text -text "a2:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.a2.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::ellipsoid_a2 -from 0 -to 100000 -increment 1 -state disable -command {::packmol::draw_ellipsoid}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.a2.text $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.a2.spin

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.b2
	label $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.b2.text -text "b2:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.b2.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::ellipsoid_b2 -from 0 -to 100000 -increment 1 -state disable -command {::packmol::draw_ellipsoid}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.b2.text $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.b2.spin

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.c2
	label $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.c2.text -text "c2:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.c2.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::ellipsoid_c2 -from 0 -to 100000 -increment 1 -state disable -command {::packmol::draw_ellipsoid}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.c2.text $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.c2.spin
	pack $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.a2 $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.b2 $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.c2 -side top -fill y

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.d
	label $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.d.text -text "d:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.d.spin -width 11 -relief sunken -bd 2 -textvariable ::packmol::ellipsoid_d -from 0 -to 100000 -increment 1 -state disable -command {::packmol::draw_ellipsoid}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.d.text $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.d.spin

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.color
	label $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.color.text -text "color:"
	ttk::combobox $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.color.color -state disable -values [list "0 blue" "1 red" "2 gray" "3 orange" "4 yellow" "5 tan" "6 silver" "7 green" "8 white" "9 pink" "10 cyan" "11 purple" "12 lime" "13 mauve" "14 ochre" "15 iceblue" "16 black" "17 yellow2" "18 yellow3" "19 green2" "20 green3" "21 cyan2" "22 cyan3" "23 blue2" "24 blue3" "25 violet" "26 violet2" "27 magenta" "28 magenta2" "29 red2" "30 red3" "31 orange2" "32 orange3"] -width 11 -textvariable ::packmol::ellipsoid_color -background white
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.color.color <<ComboboxSelected>> {
		::packmol::draw_ellipsoid
	}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.color.text $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.color.color

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.material
	label $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.material.text -text "material:"
	ttk::combobox $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.material.material -state disable -values [list "Opaque" "Transparent" "BrushedMetal" "Diffuse" "Ghost" "Glass1" "Glass2" "Glass3" "Glossy" "HardPlastic" "MetallicPastel" "Steel" "Translucent" "Edgy" "EdgyShiny" "EdgyGlass" "Goodsell" "AOShiny" "AOChalky" "AOEdgy" "BlownGlass" "GlassBubble" "RTChrome"] -width 11 -textvariable ::packmol::sel_material -background white
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.material.material  <<ComboboxSelected>> {
		::packmol::draw_ellipsoid
	}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.material.text $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.material.material
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.d -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.color -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.material -sticky e

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.resolution
	label $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.resolution.text -text "resolution:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.resolution.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::ellipsoid_resolution -from 0 -to 100000 -increment 1 -state disable -command {::packmol::draw_ellipsoid}
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.resolution.spin <Return> {
		::packmol::draw_ellipsoid
	}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.resolution.text $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.resolution.spin

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.volume
	label $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.volume.text -text "volume:"
	entry $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.volume.value -textvariable ::packmol::ellipsoid_value -width 12 -state readonly
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.volume.text $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.volume.value

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.area
	label $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.area.text -text "surface area:"
	entry $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.area.value -textvariable ::packmol::ellipsoid_area -width 12 -state readonly
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.area.text $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.area.value

	grid $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.resolution -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.volume -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.area -sticky e

	pack $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1 $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2 $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number -side left -fill both -expand 1

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.a1.spin <Return> {
		::packmol::draw_ellipsoid
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.b1.spin <Return> {
		::packmol::draw_ellipsoid
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.c1.spin <Return> {
		::packmol::draw_ellipsoid
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.a2.spin <Return> {
		::packmol::draw_ellipsoid
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.b2.spin <Return> {
		::packmol::draw_ellipsoid
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.c2.spin <Return> {
		::packmol::draw_ellipsoid
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.d.spin <Return> {
		::packmol::draw_ellipsoid
	}
	# plane
	ttk::frame $packmol.all.first.sel.up_down.graphics.all_graphics.plane

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.a
	label $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.a.a -text "a:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.a.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::plane_a -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_plane}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.a.a $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.a.spin

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.b
	label $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.b.b -text "b:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.b.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::plane_b -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_plane}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.b.b $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.b.spin
	
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.c
	label $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.c.c -text "c:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.c.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::plane_c -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_plane}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.c.c $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.c.spin
	pack $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.a $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.b $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.c -side top -fill y

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.d
	label $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.d.d -text "d:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.d.spin -width 11 -relief sunken -bd 2 -textvariable ::packmol::plane_d -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_plane}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.d.d $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.d.spin

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.color
	label $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.color.text -text "color:"
	ttk::combobox $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.color.color -state disable -values [list "0 blue" "1 red" "2 gray" "3 orange" "4 yellow" "5 tan" "6 silver" "7 green" "8 white" "9 pink" "10 cyan" "11 purple" "12 lime" "13 mauve" "14 ochre" "15 iceblue" "16 black" "17 yellow2" "18 yellow3" "19 green2" "20 green3" "21 cyan2" "22 cyan3" "23 blue2" "24 blue3" "25 violet" "26 violet2" "27 magenta" "28 magenta2" "29 red2" "30 red3" "31 orange2" "32 orange3"] -width 11 -textvariable ::packmol::plane_color -background white
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.color.color <<ComboboxSelected>> {
		::packmol::draw_plane
	}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.color.text $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.color.color

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.material
	label $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.material.text -text "material:"
	ttk::combobox $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.material.material -state disable -values [list "Opaque" "Transparent" "BrushedMetal" "Diffuse" "Ghost" "Glass1" "Glass2" "Glass3" "Glossy" "HardPlastic" "MetallicPastel" "Steel" "Translucent" "Edgy" "EdgyShiny" "EdgyGlass" "Goodsell" "AOShiny" "AOChalky" "AOEdgy" "BlownGlass" "GlassBubble" "RTChrome"] -width 11 -textvariable ::packmol::sel_material -background white
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.material.material  <<ComboboxSelected>> {
		::packmol::draw_plane
	}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.material.text $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.material.material
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.d -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.color -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.material -sticky e

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_a
	label $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_a.label -text "max a:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_a.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::plane_max_a -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_plane}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_a.label $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_a.spinbox
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_a.spinbox <Return> {
		::packmol::draw_plane
	}

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_b
	label $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_b.label -text "max b:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_b.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::plane_max_b -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_plane}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_b.label $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_b.spinbox
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_b.spinbox <Return> {
		::packmol::draw_plane
	}

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_c
	label $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_c.label -text "max c:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_c.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::plane_max_c -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_plane}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_c.label $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_c.spinbox
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_c.spinbox <Return> {
		::packmol::draw_plane
	}

	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_a -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_b -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max.max_c -sticky e

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_a
	label $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_a.label -text "min a:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_a.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::plane_min_a -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_plane}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_a.label $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_a.spinbox
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_a.spinbox <Return> {
		::packmol::draw_plane
	}

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_b
	label $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_b.label -text "min b:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_b.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::plane_min_b -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_plane}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_b.label $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_b.spinbox
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_b.spinbox <Return> {
		::packmol::draw_plane
	}

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_c
	label $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_c.label -text "min c:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_c.spinbox -width 6 -relief sunken -bd 2 -textvariable ::packmol::plane_min_c -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_plane}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_c.label $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_c.spinbox
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_c.spinbox <Return> {
		::packmol::draw_plane
	}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_a -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_b -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min.min_c -sticky e

	pack $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat $packmol.all.first.sel.up_down.graphics.all_graphics.plane.max $packmol.all.first.sel.up_down.graphics.all_graphics.plane.min -side left -fill both -expand 1

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.a.spin <Return> {
		::packmol::draw_plane
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.b.spin <Return> {
		::packmol::draw_plane
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.plane.abc.c.spin <Return> {
		::packmol::draw_plane
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.d.spin <Return> {
		::packmol::draw_plane
	}

	# cylinder
	ttk::frame $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_x
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_x.text -text "x1:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_x.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::cylinder_fir_circle_x -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_cylinder}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_x.text $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_x.spin
	
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_y
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_y.text -text "y1:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_y.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::cylinder_fir_circle_y -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_cylinder}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_y.text $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_y.spin

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_z
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_z.text -text "z1:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_z.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::cylinder_fir_circle_z -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_cylinder}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_z.text $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_z.spin
	pack $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_x $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_y $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_z -side top -fill y

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_x
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_x.text -text "x2:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_x.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::cylinder_sec_circle_x -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_cylinder}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_x.text $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_x.spin

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_y
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_y.text -text "y2:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_y.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::cylinder_sec_circle_y -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_cylinder}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_y.text $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_y.spin

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_z
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_z.text -text "z2:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_z.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::cylinder_sec_circle_z -from -100000 -to 100000 -increment 1 -state disable -command {::packmol::draw_cylinder}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_z.text $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_z.spin
	pack $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_x $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_y $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_z -side top -fill y

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.r
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.r.text -text "radius:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.r.spin -width 11 -relief sunken -bd 2 -textvariable ::packmol::cylinder_r -from 0 -to 100000 -increment 1 -state disable -command {::packmol::draw_cylinder}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.r.text $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.r.spin

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.color
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.color.text -text "color:"
	ttk::combobox $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.color.color -state disable -values [list "0 blue" "1 red" "2 gray" "3 orange" "4 yellow" "5 tan" "6 silver" "7 green" "8 white" "9 pink" "10 cyan" "11 purple" "12 lime" "13 mauve" "14 ochre" "15 iceblue" "16 black" "17 yellow2" "18 yellow3" "19 green2" "20 green3" "21 cyan2" "22 cyan3" "23 blue2" "24 blue3" "25 violet" "26 violet2" "27 magenta" "28 magenta2" "29 red2" "30 red3" "31 orange2" "32 orange3"] -width 11 -textvariable ::packmol::cylinder_color -background white
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.color.color <<ComboboxSelected>> {
		::packmol::draw_cylinder
	}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.color.text $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.color.color

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.material
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.material.text -text "material:"
	ttk::combobox $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.material.material -state disable -values [list "Opaque" "Transparent" "BrushedMetal" "Diffuse" "Ghost" "Glass1" "Glass2" "Glass3" "Glossy" "HardPlastic" "MetallicPastel" "Steel" "Translucent" "Edgy" "EdgyShiny" "EdgyGlass" "Goodsell" "AOShiny" "AOChalky" "AOEdgy" "BlownGlass" "GlassBubble" "RTChrome"] -width 11 -textvariable ::packmol::sel_material -background white
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.material.material  <<ComboboxSelected>> {
		::packmol::draw_cylinder
	}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.material.text $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.material.material
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.r -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.color -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.material -sticky e

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.length
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.length.text -text "length:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.length.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::cylinder_length -from 0 -to 100000 -increment 1 -state disable -command {::packmol::draw_cylinder}
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.length.spin <Return> {
		::packmol::draw_cylinder
	}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.length.text $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.length.spin

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.resolution
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.resolution.text -text "resolution:"
	spinbox $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.resolution.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::cylinder_resolution -from 2 -to 100000 -increment 1 -state disable -command {::packmol::draw_cylinder}
	bind $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.resolution.spin <Return> {
		::packmol::draw_cylinder
	}
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.resolution.text $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.resolution.spin

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.volume
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.volume.text -text "volume:"
	entry $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.volume.value -textvariable ::packmol::cylinder_value -width 12 -state readonly
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.volume.text $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.volume.value

	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.length -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.resolution -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.volume -sticky e

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.area
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.area.area
	label $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.area.area.text -text "bottom circle area:"
	entry $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.area.area.value -textvariable ::packmol::cylinder_area -width 12 -state readonly
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.area.area.text $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.area.area.value
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.area.area -sticky e

	pack $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.area -side left -fill both -expand 1

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_x.spin <Return> {
		::packmol::draw_cylinder
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_y.spin <Return> {
		::packmol::draw_cylinder
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_z.spin <Return> {
		::packmol::draw_cylinder
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_x.spin <Return> {
		::packmol::draw_cylinder
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_y.spin <Return> {
		::packmol::draw_cylinder
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_z.spin <Return> {
		::packmol::draw_cylinder
	}

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.r.spin <Return> {
		::packmol::draw_cylinder
	}

	# gaussian surface
        ttk::frame $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian

        labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.aone_spin
	label $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.aone_spin.aone -text "a1:"
	entry $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.aone_spin.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::gaussian_a1 -state disable
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.aone_spin.aone $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.aone_spin.spin

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.aone_spin.spin <Return> {
		::packmol::record_xygauss
	}

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.atwo_spin
	label $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.atwo_spin.atwo -text "a2:"
	entry $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.atwo_spin.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::gaussian_a2 -state disable
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.atwo_spin.atwo $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.atwo_spin.spin

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.atwo_spin.spin <Return> {
		::packmol::record_xygauss
	}

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.c_spin
	label $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.c_spin.c -text "c:"
	entry $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.c_spin.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::gaussian_c -state disable
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.c_spin.c $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.c_spin.spin

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.c_spin.spin <Return> {
		::packmol::record_xygauss
	}

	grid $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.aone_spin -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.atwo_spin -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.c_spin -sticky e

	labelframe $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec
	frame $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.bone_spin
	label $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.bone_spin.bone -text "b1:"
	entry $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.bone_spin.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::gaussian_b1 -state disable
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.bone_spin.bone $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.bone_spin.spin

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.bone_spin.spin <Return> {
		::packmol::record_xygauss
	}

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.btwo_spin
	label $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.btwo_spin.btwo -text "b2:"
	entry $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.btwo_spin.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::gaussian_b2 -state disable
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.btwo_spin.btwo $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.btwo_spin.spin

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.btwo_spin.spin <Return> {
		::packmol::record_xygauss
	}

	frame $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.h_spin
	label $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.h_spin.h -text "h:"
	entry $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.h_spin.spin -width 6 -relief sunken -bd 2 -textvariable ::packmol::gaussian_h -state disable
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.h_spin.h $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.h_spin.spin

	bind $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.h_spin.spin <Return> {
		::packmol::record_xygauss
	}

	grid $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.bone_spin -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.btwo_spin -sticky e
	grid $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.h_spin -sticky e

	pack $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.fir $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian.sec -side left -fill both -expand 1

	$packmol.all.first.sel.up_down.graphics.all_graphics add $packmol.all.first.sel.up_down.graphics.all_graphics.cube -text "cube"
	$packmol.all.first.sel.up_down.graphics.all_graphics add $packmol.all.first.sel.up_down.graphics.all_graphics.box -text "box"
        $packmol.all.first.sel.up_down.graphics.all_graphics add $packmol.all.first.sel.up_down.graphics.all_graphics.sphere -text "sphere"
        $packmol.all.first.sel.up_down.graphics.all_graphics add $packmol.all.first.sel.up_down.graphics.all_graphics.ellipsoid -text "ellipsoid"
        $packmol.all.first.sel.up_down.graphics.all_graphics add $packmol.all.first.sel.up_down.graphics.all_graphics.plane -text "plane"
        $packmol.all.first.sel.up_down.graphics.all_graphics add $packmol.all.first.sel.up_down.graphics.all_graphics.cylinder -text "cylinder"
	$packmol.all.first.sel.up_down.graphics.all_graphics add $packmol.all.first.sel.up_down.graphics.all_graphics.gaussian -text "xygauss"

	pack $packmol.all.first.sel.up_down.graphics.all_graphics -side top -fill both -expand 1
	pack $packmol.all.first.sel.up_down.shape_label $packmol.all.first.sel.up_down.graphics -side top -fill both -expand 1
#	pack $packmol.all.first.sel.up_down.sel_graphics $packmol.all.first.sel.up_down.graphics -side top -fill both

	pack $packmol.all.first.sel.sit_list $packmol.all.first.sel.up_down -side left -fill both -expand 1

	# system
	labelframe $packmol.all.first.system -text "Input File & Run"
	labelframe $packmol.all.first.system.system_fra
	frame $packmol.all.first.system.system_fra.packmol_input_show
	frame $packmol.all.first.system.system_fra.packmol_input_show.show
	ttk::notebook $packmol.all.first.system.system_fra.packmol_input_show.show.notebook
	frame $packmol.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar
	scrollbar $packmol.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.scrolly -command [list ".packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.text" yview]
	text $packmol.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.text -relief ridge -state disable -yscrollcommand [list ".packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.scrolly" set] -height 12 -width 68
	grid $packmol.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.text -column 0 -row 0 -sticky news
	grid $packmol.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.scrolly -column 1 -row 0 -sticky news
	$packmol.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.text insert 1.0 $generate_packmol_input
	$packmol.all.first.system.system_fra.packmol_input_show.show.notebook add $packmol.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar -text "Packmol Input File"
	pack $packmol.all.first.system.system_fra.packmol_input_show.show.notebook
	pack $packmol.all.first.system.system_fra.packmol_input_show.show.notebook -fill both

	frame $packmol.all.first.system.system_fra.packmol_input_show.browse_save
#	frame $packmol.all.first.system.system_fra.packmol_input_show.browse_save.load
#	button $packmol.all.first.system.system_fra.packmol_input_show.browse_save.load.button -text "load" -width 8 -height 1 -command {::packmol::load_inp}
#	pack $packmol.all.first.system.system_fra.packmol_input_show.browse_save.load.button

	frame $packmol.all.first.system.system_fra.packmol_input_show.browse_save.save
	button $packmol.all.first.system.system_fra.packmol_input_show.browse_save.save.button -text "save" -width 8 -height 1 -command {::packmol::generate_output}
	pack $packmol.all.first.system.system_fra.packmol_input_show.browse_save.save.button

	frame $packmol.all.first.system.system_fra.packmol_input_show.browse_save.generate
	button $packmol.all.first.system.system_fra.packmol_input_show.browse_save.generate.button -text "generate" -width 8 -height 1 -command {::packmol::show_packmol_input}
	pack $packmol.all.first.system.system_fra.packmol_input_show.browse_save.generate.button

	frame $packmol.all.first.system.system_fra.packmol_input_show.browse_save.run
	button $packmol.all.first.system.system_fra.packmol_input_show.browse_save.run.button -text "run" -width 8 -height 1 -command {::packmol::generate_bash}
	pack $packmol.all.first.system.system_fra.packmol_input_show.browse_save.run.button

#	pack $packmol.all.first.system.system_fra.packmol_input_show.browse_save.load $packmol.all.first.system.system_fra.packmol_input_show.browse_save.generate $packmol.all.first.system.system_fra.packmol_input_show.browse_save.save $packmol.all.first.system.system_fra.packmol_input_show.browse_save.run -side top -fill y
	pack $packmol.all.first.system.system_fra.packmol_input_show.browse_save.generate $packmol.all.first.system.system_fra.packmol_input_show.browse_save.save $packmol.all.first.system.system_fra.packmol_input_show.browse_save.run -side top -fill y

	pack $packmol.all.first.system.system_fra.packmol_input_show.show $packmol.all.first.system.system_fra.packmol_input_show.browse_save -side left -fill x -padx 1m

	pack $packmol.all.first.system.system_fra.packmol_input_show -side left -fill both -expand 1
#	pack $packmol.all.first.system.system_fra -side left -fill both -expand 1

	# output
        labelframe $packmol.all.first.system.output
        # text widget
        frame $packmol.all.first.system.output.output
	ttk::notebook $packmol.all.first.system.output.output.notebook
	frame $packmol.all.first.system.output.output.notebook.framework
	scrollbar $packmol.all.first.system.output.output.notebook.framework.scrolly -command [list ".packmolview.all.first.system.output.output.notebook.framework.text" yview]
	text $packmol.all.first.system.output.output.notebook.framework.text -relief ridge -state disable -yscrollcommand [list ".packmolview.all.first.system.output.output.notebook.framework.scrolly" set] -height 12 -width 68
	grid $packmol.all.first.system.output.output.notebook.framework.text -column 0 -row 0 -sticky news
	grid $packmol.all.first.system.output.output.notebook.framework.scrolly -column 1 -row 0 -sticky ns
	$packmol.all.first.system.output.output.notebook.framework.text insert 1.0 $packmol_output
	$packmol.all.first.system.output.output.notebook add $packmol.all.first.system.output.output.notebook.framework -text "Output"
	pack $packmol.all.first.system.output.output.notebook -fill both
	pack $packmol.all.first.system.output.output -fill both
	pack $packmol.all.first.system.system_fra $packmol.all.first.system.output -side left -fill both -expand 1

	pack $packmol.all.first.general $packmol.all.first.mol_try $packmol.all.first.sel $packmol.all.first.system -side top -fill both

	$packmol.all add $packmol.all.second -text "PACKMOL User Guide" -sticky news
	labelframe $packmol.all.second.guide

	frame $packmol.all.second.guide.notebook
	ttk::notebook $packmol.all.second.guide.notebook.notebook
	frame $packmol.all.second.guide.notebook.notebook.framework
	scrollbar $packmol.all.second.guide.notebook.notebook.framework.scrolly -command [list ".packmolview.all.second.guide.notebook.notebook.framework.text" yview]
	text $packmol.all.second.guide.notebook.notebook.framework.text -relief ridge -state normal -yscrollcommand [list ".packmolview.all.second.guide.notebook.notebook.framework.scrolly" set] -height 58 -width 155
	$packmol.all.second.guide.notebook.notebook.framework.text insert end $packmol_userguide
#	$packmol.all.second.guide.notebook.notebook.framework.text configure -font {-family Helvetica -size 8}
	grid $packmol.all.second.guide.notebook.notebook.framework.text -row 0 -column 0 -sticky nsew
	grid $packmol.all.second.guide.notebook.notebook.framework.scrolly -row 0 -column 1 -sticky ns
	pack $packmol.all.second.guide.notebook.notebook.framework -fill both -expand 1
	pack $packmol.all.second.guide.notebook.notebook -expand 1 -fill both
	pack $packmol.all.second.guide.notebook -expand 1 -fill both
	pack $packmol.all.second.guide -expand 1 -fill both

	grid rowconfigure . 0 -weight 1
	grid columnconfigure . 0 -weight 1
}

proc ::packmol::del_mol_constrainlist_refresh {} {
	variable molid
	variable sitlist
        variable relativelist
        variable radiuslist
        variable fscalelist
        variable short_radiuslist
        variable short_radius_scalelist
        variable res_moleculelist
        variable res_atomlist
	variable graphic_label_list
        variable graphic_line_list
        variable graphic_info_list

	set all_mol [molinfo num]
	if {$all_mol==0} {
		set sitlist {}
		set relativelist {}
		set radiuslist {}
		set fscalelist {}
		set short_radiuslist {}
		set short_radius_scalelist {}
		set res_moleculelist {}	
		set res_atomlist {}
		set graphic_label_list {}
		set graphic_line_list {}
		set graphic_info_list {}
		::packmol::refresh_constrain_list
	}

	set number 0
	set sitlist_len [llength $sitlist]
	set index_list {}
	while {$number<$sitlist_len} {
		set each_res_id [lindex $res_moleculelist $number]
		set which_index [lsearch $molid $each_res_id]
		if {$which_index!=-1} {
			lappend index_list $number
		}
		incr number
	}

	set sitlist_new {}
	set relativelist_new {}
	set radiuslist_new {}
	set fscalelist_new {}
	set short_radiuslist_new {}
	set short_radius_scalelist_new {}
	set res_moleculelist_new {}
	set res_atomlist_new {}
	set graphic_label_list_new {}
	set graphic_line_list_new {}
	set graphic_info_list_new {}

	set number 0
	set index_list_len [llength $index_list]
	while {$number<$index_list_len} {
		set same_index [lindex $index_list $number]
		lappend sitlist_new [lindex $sitlist $same_index]
		lappend relativelist_new [lindex $relativelist $same_index]
		lappend radiuslist_new [lindex $radiuslist $same_index]
		lappend fscalelist_new [lindex $fscalelist $same_index]
		lappend short_radiuslist_new [lindex $short_radiuslist $same_index]
		lappend short_radius_scalelist_new [lindex $short_radius_scalelist $same_index]
		lappend res_moleculelist_new [lindex $res_moleculelist $same_index]
		lappend res_atomlist_new [lindex $res_atomlist $same_index]
		lappend graphic_label_list_new [lindex $graphic_label_list $same_index]
		lappend graphic_line_list_new [lindex $graphic_line_list $same_index]
		lappend graphic_info_list_new [lindex $graphic_info_list $same_index]
		incr number
	}

	set sitlist $sitlist_new
	set relativelist $relativelist_new
	set radiuslist $radiuslist_new
	set fscalelist $fscalelist_new
	set short_radiuslist $short_radiuslist_new
	set short_radius_scalelist $short_radius_scalelist_new
	set res_moleculelist $res_moleculelist_new
	set res_atomlist $res_atomlist_new
	set graphic_label_list $graphic_label_list_new
	set graphic_line_list $graphic_line_list_new
	set graphic_info_list $graphic_info_list_new

	::packmol::refresh_constrain_list
}

proc ::packmol::refresh_constrain_list {} {
	variable molid
	variable sitlist
	variable relativelist
	variable radiuslist
	variable fscalelist
        variable short_radiuslist
        variable short_radius_scalelist
	variable res_moleculelist
	variable res_atomlist
	variable geo_sitlist_radius_sel

	set geo_sitlist_radius_sel {}
        set sitlist_len [llength $sitlist]
        set number 0
        while {$number<$sitlist_len} {
                set sit_info_list [lindex $sitlist $number]
                set relative_info_list [lindex $relativelist $number]
		set res_molecule_info_list [lindex $res_moleculelist $number]
		set res_atom_info [lindex $res_atomlist $number]
		set res_atom_info_list [list $res_atom_info]
                set radius_info_list [lindex $radiuslist $number]
		set fscale_info [lindex $fscalelist $number]
		set fscale_info_list [list $fscale_info]
		set short_radius_info [lindex $short_radiuslist $number]
		set short_radius_info_list [list $short_radius_info]
		set short_radius_scale_info [lindex $short_radius_scalelist $number]
		set short_radius_scale_info_list [list $short_radius_scale_info]
                set msg [format "%s   %s   %s   %s   %s   %s   %s   %s" $res_molecule_info_list $res_atom_info_list $relative_info_list $sit_info_list $radius_info_list $fscale_info_list $short_radius_info_list $short_radius_scale_info_list]
                lappend geo_sitlist_radius_sel $msg
                incr number
        }
}

proc ::packmol::set_outputdir {} {
	variable outputdir

	set get_outputdir [tk_chooseDirectory -initialdir $outputdir -title "Choose a directory"]
	if {$get_outputdir==""} {
		return
	}
	
	set outputdir $get_outputdir
	::packmol::change_general_setting
}

proc ::packmol::writecrd_able {} {
	variable is_writecrd

	if {$is_writecrd==1} {
		.packmolview.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename.writecrd.entry configure -state normal

		.packmolview.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 8 -sortmode command -name "Segid" -editable 1
		.packmolview.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 8 -width 10 -maxwidth 0 -editable true -editwindow entry -editable 1
	} else {
		.packmolview.all.first.general.tol_constrain.tol_out_file.fra.writecrd_filename.writecrd.entry configure -state disable

		.packmolview.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 8 -sortmode command -name "Segid" -editable 0
		.packmolview.all.first.mol_try.all.mol.molecule.file.listbox columnconfigure 8 -width 10 -maxwidth 0 -editable true -editwindow entry -editable 0
	}
}

proc ::packmol::change_writecrd {} {
	variable writecrdname
	variable writecrdname_write

	if {$writecrdname==""} {
		return
	}

	set writecrdname_write $writecrdname
}

proc ::packmol::set_outputfilename {} {
	variable outputfilename
	variable outputfilename_write
	variable before_outputname
#	variable file_type
#	set outputfilename [tk_getSaveFile -filetypes  {{PDB .pdb} {All *}}]
#	set outputfilename [tk_getSaveFile -filetypes  {{TINKer .arc} {All *}}]
#	set outputfilename [tk_getSaveFile -filetypes  {{XYZ .xyz} {All *}}]
#	set outputfilename [tk_getSaveFile -filetypes  {{MOLDEN .molden} {All *}}]
	if {$outputfilename==""} {
		return
	}

	set outputfilename_write $outputfilename
	set before_outputname $outputfilename
	::packmol::change_general_setting
}

proc ::packmol::load_inp {} {
	variable generate_packmol_input

	set filename [tk_getOpenFile -filetypes  {{INP .inp} {All *}}]
	if {$filename!=""} {
		set generate_packmol_input [read -nonewline [open $filename r]]
		destroy .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook
        	ttk::notebook .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook
        	frame .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar
        	scrollbar .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.scrolly -command [list ".packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.text" yview]
        	text .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.text -relief ridge -state normal -yscrollcommand [list ".packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.scrolly" set] -height 12 -width 68
        	grid .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.text -column 0 -row 0 -sticky news
        	grid .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.scrolly -column 1 -row 0 -sticky ns
        	.packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.text insert 1.0 $generate_packmol_input
        	.packmolview.all.first.system.system_fra.packmol_input_show.show.notebook add .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar -text "Packmol Input File"
		pack .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook -fill both
	}
}

proc ::packmol::find_packmol {} {
	variable packmol_name
	variable system

	if {$system=="Windows"} {
		set packmol_open_dir [file dirname $packmol_name]
		set choose_packmol_name [tk_getOpenFile -filetypes {{EXE .exe} {All *}} -initialdir $packmol_open_dir]
		if {$choose_packmol_name==""} {
			return
		}

		set packmol_name $choose_packmol_name
		::packmol::change_general_setting
	}
}

proc ::packmol::dict2json {dictVal} {
    # XXX: Currently this API isn't symmetrical, as to create proper
    # XXX: JSON text requires type knowledge of the input data
	set json ""
	set prefix ""

	foreach {key val} $dictVal {
	# key must always be a string, val may be a number, string or
	# bare word (true|false|null)
		if {0 && ![string is double -strict $val] && ![regexp {^(?:true|false|null)$} $val]} {
			set val "\"$val\""
		}
		append json "$prefix\"$key\": $val" \n
		set prefix ,
	}

	return "\{${json}\}"
}

proc ::packmol::generate_bash {} {
	variable packmol_name
	variable system
	variable packmol_output
	variable checkbox
	variable outputdir
	variable outputfilename
	variable outputdir
	variable generate_packmol_input
	variable file_type

	set packmol_output ""
	destroy .packmolview.all.first.system.output.output.notebook
        ttk::notebook .packmolview.all.first.system.output.output.notebook
        frame .packmolview.all.first.system.output.output.notebook.framework
        scrollbar .packmolview.all.first.system.output.output.notebook.framework.scrolly -command [list ".packmolview.all.first.system.output.output.notebook.framework.text" yview]
        text .packmolview.all.first.system.output.output.notebook.framework.text -relief ridge -yscrollcommand [list ".packmolview.all.first.system.output.output.notebook.framework.scrolly" set] -height 12 -width 68
        grid .packmolview.all.first.system.output.output.notebook.framework.text -column 0 -row 0 -sticky news
        grid .packmolview.all.first.system.output.output.notebook.framework.scrolly -column 1 -row 0 -sticky ns
        .packmolview.all.first.system.output.output.notebook.framework.text insert 1.0 $packmol_output
        .packmolview.all.first.system.output.output.notebook add .packmolview.all.first.system.output.output.notebook.framework -text "Output"
        pack .packmolview.all.first.system.output.output.notebook -fill both

	if {$generate_packmol_input==""} {
		return
	}

	set inp_name "Packmol-GUI-tempfile.inp"
	set inp_name_quote [format "\"%s\"" $inp_name]
	set f_inp [open $inp_name w]
	puts $f_inp $generate_packmol_input
	close $f_inp

	set output_dir_filename [file join $outputdir $outputfilename]
	if {$system=="Linux"} {
		if {[catch {set packmol_name [exec which packmol]}]} {
			set msg "Please install packmol first"
			tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
			return
		}

		set f [open generate_output.sh w]
		set packmol_name_quote [format "\"%s\"" $packmol_name]
		set use_packmol [format "%s < %s" $packmol_name_quote $inp_name_quote]
		puts $f $use_packmol
		close $f

		exec chmod +x generate_output.sh
		set packmol_output [exec ./generate_output.sh]
		if {$checkbox=="yes"} {
			if {[catch {mol new $output_dir_filename type $file_type}]} {
				file delete generate_output.sh
			} else {
				::packmol::refresh
			}
		}
		file delete generate_output.sh
	}

	if {$system=="Windows"} {
		if {$packmol_name==""} {
			set msg "Please set packmol directory first"
			tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
			return
		}

		set packmol_name_quote [format "\"%s\"" $packmol_name]
		set use_packmol [format "%s < %s" $packmol_name_quote $inp_name_quote]

		set tcl_library_windows_pwd [info library]
		set vmd_windows_pwd_dir [file dirname $tcl_library_windows_pwd]
		set vmd_windows_pwd_dir [file dirname $vmd_windows_pwd_dir]
		set bat_info_str "generate_output.bat"
		set vmd_bat_json_pwd [file join $vmd_windows_pwd_dir $bat_info_str]

		set f [open $vmd_bat_json_pwd w]
		puts $f $use_packmol
		close $f

		set packmol_output [exec $vmd_bat_json_pwd]
		if {$checkbox=="yes"} {
			if {[catch {mol new $output_dir_filename type $file_type}]} {
				file delete $vmd_bat_json_pwd
			} else {
				::packmol::refresh
			}
		}
		file delete $vmd_bat_json_pwd
	}

	destroy .packmolview.all.first.system.output.output.notebook
	ttk::notebook .packmolview.all.first.system.output.output.notebook
	frame .packmolview.all.first.system.output.output.notebook.framework
	scrollbar .packmolview.all.first.system.output.output.notebook.framework.scrolly -command [list ".packmolview.all.first.system.output.output.notebook.framework.text" yview]
	text .packmolview.all.first.system.output.output.notebook.framework.text -relief ridge -yscrollcommand [list ".packmolview.all.first.system.output.output.notebook.framework.scrolly" set] -height 12 -width 68
	grid .packmolview.all.first.system.output.output.notebook.framework.text -column 0 -row 0 -sticky news
	grid .packmolview.all.first.system.output.output.notebook.framework.scrolly -column 1 -row 0 -sticky ns
	.packmolview.all.first.system.output.output.notebook.framework.text insert 1.0 $packmol_output
	.packmolview.all.first.system.output.output.notebook add .packmolview.all.first.system.output.output.notebook.framework -text "Output"
	pack .packmolview.all.first.system.output.output.notebook -fill both
	file delete "Packmol-GUI-tempfile.inp"
}

proc ::packmol::file_start_edit {tbl row col text} {
	variable filelist

	set packmol [$tbl editwinpath]

	switch [$tbl columncget $col -name] {
		Number {
			$packmol configure -from 0 -to 100000 -increment 1
		}
		Resnumber {
			set values {0 1 2 3}
			$packmol configure -values $values -state readonly -style protocol.TCombobox
		}
		Changechains {
			set values {yes no}
			$packmol configure -values $values -state readonly -style protocol.TCombobox 
		}
		Chain {
			set file_single_info [lindex $filelist $row]
			set changchains_value [lindex $file_single_info 6]
			if {$changchains_value=="yes"} {
				set text_empty ""
				$packmol configure -text $text_empty -state disable
			} else {
				$packmol configure -state normal
			}
		}
	}
	return $text
}

proc ::packmol::file_end_edit {tbl row col text} {
	variable molid
	variable mol_sel
	variable structure_num_list
	variable resnumber_list
	variable restart_from_list
	variable restart_to_list
	variable changechains_list
	variable chain_list
	variable filelist
	variable segid_list
	variable maxmove_list
	variable constrain_volume_list
        variable molecular_volume_list
        variable nvmax_list
        variable surface_area_list
        variable apl_list
        variable nsmax_list

	set packmol [$tbl editwinpath]

	switch [$tbl columncget $col -name] {
		Number {
			if {[catch {set is_none [expr $text / 1]}]} {
				set text 0
			}
			set text [expr int($text)]
			set val $text
			set id [lindex $molid $mol_sel]
			lset structure_num_list $id $val
			::packmol::refresh_filelist
		}
		Resnumber {
			set text [expr int($text)]
                        set val $text
                        set id [lindex $molid $mol_sel]
                        lset resnumber_list $id $val
                        ::packmol::refresh_filelist
		}
		"Restart from" {
			set val $text
                        set id [lindex $molid $mol_sel]
			lset restart_from_list $id $val
			::packmol::refresh_filelist
		}
		"Restart to" {
			set val $text
                        set id [lindex $molid $mol_sel]
                        lset restart_to_list $id $val
                        ::packmol::refresh_filelist
		}
		Changechains {
			set val $text
			set id [lindex $molid $mol_sel]
			lset changechains_list $id $val
			if {$val=="yes"} {
				lset chain_list $id ""
				::packmol::refresh_filelist
			}
			::packmol::refresh_filelist
			return [$tbl cellcget $row,$col -text]
		}
		Chain {
			set val $text
			set id [lindex $molid $mol_sel]
			lset chain_list $id $val
			::packmol::refresh_filelist
		}
		Segid {
			set val $text
			set id [lindex $molid $mol_sel]
			lset segid_list $id $val
			::packmol::refresh_filelist
		}
		Maxmove {
                        set val $text
			if {$val==""} {
				return
			}
			set id [lindex $molid $mol_sel]
			set maxmove_max [lindex $structure_num_list $id]
			if {![regexp {^[0-9]+$} $val]} {
				set msg "Maxmove must be a non-negative integer."
				tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
				set val ""
				set text ""
				lset maxmove_list $id $val
				::packmol::refresh_filelist
				return [$tbl cellcget $row,$col -text]
			}
			if {$val > $maxmove_max} {
				set msg "Maxmove must be less than or equal to Number."
				tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
				set val ""
				set text ""
				lset maxmove_list $id $val
                                ::packmol::refresh_filelist
                                return [$tbl cellcget $row,$col -text]
			}

                        lset maxmove_list $id $val
                        ::packmol::refresh_filelist
		}
		"Constrains Volume" {
			set val $text
			if {$val==""} {
                                return
                        }
                        set id [lindex $molid $mol_sel]
			if {[string is double -strict $val]} {
				if {$val<0} {
					set msg "Constrains Volume must be a real number greater than or equal to 0."
					tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
                                	set val ""
                                	set text ""
                                	lset constrain_volume_list $id $val
                                	::packmol::refresh_filelist
                                	return [$tbl cellcget $row,$col -text]
				}
			} else {
				set msg "Constrains Volume must be a real number greater than or equal to 0."
				tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
				set val ""
				set text ""
				lset constrain_volume_list $id $val
				::packmol::refresh_filelist
				return [$tbl cellcget $row,$col -text]
			}
			set val [format "%.2f" $val]
			lset constrain_volume_list $id $val
			set molecular_volume_each [lindex $molecular_volume_list $id]
			if {[catch {set nvmax_each_f [expr $val / $molecular_volume_each]}]} {
#				::packmol::refresh_filelist
			} else {
				set nvmax_each [expr int(ceil($nvmax_each_f))]
				lset nvmax_list $id $nvmax_each
			}
			::packmol::refresh_filelist
			return [$tbl cellcget $row,$col -text]
		}
		"Molecular Volume" {
			set val $text
			if {$val==""} {
                                return
                        }
                        set id [lindex $molid $mol_sel]
			if {[string is double -strict $val]} {
				if {$val<=0} {
	                                set msg "Molecular Volume must be a real number greater than 0."
	                                tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
	                                set val ""
					set text ""
					lset molecular_volume_list $id $val
	                                ::packmol::refresh_filelist
	                                return [$tbl cellcget $row,$col -text]
				}
                        }
			set val [format "%.2f" $val]
			lset molecular_volume_list $id $val
			set constrain_volume_each [lindex $constrain_volume_list $id]
                        if {[catch {set nvmax_each_f [expr $constrain_volume_each / $val]}]} {
#                               ::packmol::refresh_filelist
                        } else {
				set nvmax_each [expr int(ceil($nvmax_each_f))]
                                lset nvmax_list $id $nvmax_each
                        }
			::packmol::refresh_filelist
			return [$tbl cellcget $row,$col -text]
		}
		"Surface Area" {
			set val $text
			if {$val==""} {
                                return
                        }
                        set id [lindex $molid $mol_sel]
			if {[string is double -strict $val]} {
				if {$val<0} {
					set msg "Surface Area must be a real number greater than or equal to 0."
					tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
					set val ""
					set text ""
					lset surface_area_list $id $val
					::packmol::refresh_filelist
					return [$tbl cellcget $row,$col -text]
				}
                        } else {
                                set msg "Surface Area must be a real number greater than or equal to 0."
                                tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
                                set val ""
				set text ""
				lset surface_area_list $id $val
                                ::packmol::refresh_filelist
                                return [$tbl cellcget $row,$col -text]
                        }
			set val [format "%.2f" $val]
			lset surface_area_list $id $val
			set apl_each [lindex $apl_list $id]
			if {[catch {set nsmax_each_f [expr $val / $apl_each]}]} {
#                               ::packmol::refresh_filelist
                        } else {
				set nsmax_each [expr int(ceil($nsmax_each_f))]
                                lset nsmax_list $id $nsmax_each
                        }
			::packmol::refresh_filelist
			return [$tbl cellcget $row,$col -text]
		}
		APL {
			set val $text
			if {$val==""} {
                                return
                        }
                        set id [lindex $molid $mol_sel]
                        if {[string is double -strict $val]} {
				if {$val<=0} {
	                                set msg "APL must be a real number greater than 0."
	                                tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
	                                set val ""
					set text ""
					lset apl_list $id $val
	                                ::packmol::refresh_filelist
	                                return [$tbl cellcget $row,$col -text]
				}
                        }
			set val [format "%.2f" $val]
			lset apl_list $id $val
			set surface_area_each [lindex $surface_area_list $id]
                        if {[catch {set nsmax_each_f [expr $surface_area_each / $val]}]} {
#                               ::packmol::refresh_filelist
                        } else {
				set nsmax_each [expr int(ceil($nsmax_each_f))]
                                lset nsmax_list $id $nsmax_each
                        }
			::packmol::refresh_filelist
			return [$tbl cellcget $row,$col -text]
		}
	}
	return $text
}

proc ::packmol::get_constrain_volume {} {
	variable molid
	variable thesefile
	variable apl_list
	variable molecular_volume_list

	set mollength [llength $molid]
        set number 0
        while {$number<$mollength} {
		set id_each [lindex $molid $number]
		set filename_each [lindex $thesefile $number]
		set file_id [open $filename_each r]
		while {[gets $file_id line] >= 0} {
			if {[string match "REMARK 990*" $line]} {
				if {[string match "*APL:*" $line]} {
					set apl_value_s [lindex [split $line ":"] 1]
					set apl_value_f [string trim $apl_value_s]
					if {[string is double -strict $apl_value_f]} {
						set apl_value [format "%.2f" $apl_value_f]
						lset apl_list $id_each $apl_value
						::packmol::refresh_filelist
					}
				}
				if {[string match "*VOLUME:*" $line]} {
					set volume_value_s [lindex [split $line ":"] 1]
					set volume_value_f [string trim $volume_value_s]
					if {[string is double -strict $volume_value_f]} {
						set volume_value [format "%.2f" $volume_value_f]
						lset molecular_volume_list $id_each $volume_value
						::packmol::refresh_filelist
					}
				}
			}
		}
		close $file_id
		incr number
	}
}

proc ::packmol::refresh_filelist {} {
	variable molid
	variable file_name_list
	variable structure_num_list
        variable resnumber_list
        variable restart_from_list
        variable restart_to_list
        variable changechains_list
	variable chain_list
	variable filelist
	variable segid_list
	variable maxmove_list
	variable constrain_volume_list
        variable molecular_volume_list
        variable nvmax_list
        variable surface_area_list
        variable apl_list
        variable nsmax_list

	set filelist {}

	set mollength [llength $molid]
        set number 0
        while {$number<$mollength} {
                set id_info [lindex $molid $number]
                set id_info_list [list $id_info]

                set file_name_info [lindex $file_name_list $number]
                set file_name_info_list [list $file_name_info]

                set mol_number [lindex $molid $number]
                set structure_num_info [lindex $structure_num_list $mol_number]
                set structure_num_info_list [list $structure_num_info]

                set resnumber_info [lindex $resnumber_list $mol_number]
                set resnumber_info_list [list $resnumber_info]

                set restart_from_info [lindex $restart_from_list $mol_number]
                set restart_from_info_list [list $restart_from_info]

                set restart_to_info [lindex $restart_to_list $mol_number]
                set restart_to_info_list [list $restart_to_info]

                set changechains_info [lindex $changechains_list $mol_number]
                set changechains_info_list [list $changechains_info]

		set chain_info [lindex $chain_list $mol_number]
		set chain_info_list [list $chain_info]

		set segid_info [lindex $segid_list $mol_number]
		set segid_info_list [list $segid_info]

		set maxmove_info [lindex $maxmove_list $mol_number]
		set maxmove_info_list [list $maxmove_info]

		set constrain_volume_info [lindex $constrain_volume_list $mol_number]
		set constrain_volume_info_list [list $constrain_volume_info]

		set molecular_volume_info [lindex $molecular_volume_list $mol_number]
		set molecular_volume_info_list [list $molecular_volume_info]

		set nvmax_info [lindex $nvmax_list $mol_number]
		set nvmax_info_list [list $nvmax_info]

		set surface_area_info [lindex $surface_area_list $mol_number]
		set surface_area_info_list [list $surface_area_info]

		set apl_info [lindex $apl_list $mol_number]
		set apl_info_list [list $apl_info]

		set nsmax_info [lindex $nsmax_list $mol_number]
		set nsmax_info_list [list $nsmax_info]

                set msg [format "%s   %s   %s   %s   %s   %s   %s   %s   %s   %s   %s   %s   %s   %s   %s   %s" $id_info_list $file_name_info_list $structure_num_info_list $resnumber_info_list $restart_from_info_list $restart_to_info_list $changechains_info_list $chain_info_list $segid_info_list $maxmove_info_list $constrain_volume_info_list $molecular_volume_info_list $nvmax_info_list $surface_area_info_list $apl_info_list $nsmax_info_list]
                lappend ::packmol::filelist $msg
                incr number
        }
}

proc ::packmol::del_sel_sit_line_label {} {
	variable molid
	variable mol_sel
        variable sit_sel
        variable need_to_reset
	variable graphic_label_list
	variable graphic_line_list
	variable res_moleculelist

        set res_id [lindex $res_moleculelist $sit_sel]
	if {$need_to_reset==1} {
		set empty_list {}
		set need_to_delete_list [lindex $graphic_label_list $sit_sel]
		set need_to_delete_list_len [llength $need_to_delete_list]
		set number 0
		while {$number < $need_to_delete_list_len} {
			set need_to_delete [lindex $need_to_delete_list $number]
			graphics $res_id delete $need_to_delete
			incr number
		}
		lset graphic_label_list $sit_sel $empty_list

		set need_to_delete_list [lindex $graphic_line_list $sit_sel]
		set need_to_delete_list_len [llength $need_to_delete_list]
		set number 0
		while {$number < $need_to_delete_list_len} {
			set need_to_delete [lindex $need_to_delete_list $number]
			graphics $res_id delete $need_to_delete
			incr number
		}
	        lset graphic_line_list $sit_sel $empty_list
	}
}

proc ::packmol::change_graphic_info {} {
	variable cube_start_x
        variable cube_start_y
        variable cube_start_z
        variable cube_size
	variable box_start_x
        variable box_start_y
        variable box_start_z
        variable box_end_x
        variable box_end_y
        variable box_end_z
        variable sphere_x
        variable sphere_y
        variable sphere_z
        variable sphere_r
        variable ellipsoid_a1
        variable ellipsoid_b1
        variable ellipsoid_c1
        variable ellipsoid_a2
        variable ellipsoid_b2
        variable ellipsoid_c2
        variable ellipsoid_d
        variable plane_a
        variable plane_b
        variable plane_c
        variable plane_d
        variable cylinder_fir_circle_x
        variable cylinder_fir_circle_y
        variable cylinder_fir_circle_z
        variable cylinder_sec_circle_x
        variable cylinder_sec_circle_y
        variable cylinder_sec_circle_z
        variable cylinder_r
        variable cylinder_length
	variable gaussian_a1
	variable gaussian_a2
	variable gaussian_b1
	variable gaussian_b2
	variable gaussian_c
	variable gaussian_h
	variable change_which_graphic
	variable graphic_info_list
	variable molid
	variable mol_sel
	variable sit_sel
	variable need_to_reset
	
	set id [lindex $molid $mol_sel]
	if {$change_which_graphic=="cube"} {
		if {$need_to_reset==1} {
			set graphic_info_single_update {6 0 0 0 0 1 0}
			set cube_start_x 0
			set cube_start_y 0
			set cube_start_z 0
			set cube_size 0
			lset graphic_info_list $sit_sel $graphic_info_single_update
		}
	}
	if {$change_which_graphic=="box"} {
		if {$need_to_reset==1} {
			set graphic_info_single_update {0 0 0 0 0 0 0 1 0}
			set box_start_x 0
			set box_start_y 0
			set box_start_z 0
			set box_end_x 0
			set box_end_y 0
			set box_end_z 0
			lset graphic_info_list $sit_sel $graphic_info_single_update
		}
	}
	if {$change_which_graphic=="sphere"} {
		if {$need_to_reset==1} {
			set graphic_info_single_update {1 0 0 0 0 0 30}
			set sphere_x 0
			set sphere_y 0
			set sphere_z 0
			set sphere_r 0
                        lset graphic_info_list $sit_sel $graphic_info_single_update
		}
	}
	if {$change_which_graphic=="ellipsoid"} {
		if {$need_to_reset==1} {
			set graphic_info_single_update {2 0 0 0 0 0 0 0 0 2}
			set ellipsoid_a1 0
			set ellipsoid_b1 0
			set ellipsoid_c1 0
			set ellipsoid_a2 0
			set ellipsoid_b2 0
			set ellipsoid_c2 0
			set ellipsoid_d 0
                        lset graphic_info_list $sit_sel $graphic_info_single_update
		}
	}
	if {$change_which_graphic=="plane"} {
		if {$need_to_reset==1} {
			set graphic_info_single_update {3 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0}
			set plane_a 0
			set plane_b 0
			set plane_c 0
			set plane_d 0
                        lset graphic_info_list $sit_sel $graphic_info_single_update
		}
	}
	if {$change_which_graphic=="cylinder"} {
		if {$need_to_reset==1} {
			set graphic_info_single_update {4 0 0 0 0 0 0 0 0 0 30 0 0 0}
			set cylinder_fir_circle_x 0
			set cylinder_fir_circle_y 0
			set cylinder_fir_circle_z 0
			set cylinder_sec_circle_x 0
			set cylinder_sec_circle_y 0
			set cylinder_sec_circle_z 0
			set cylinder_r 0
			set cylinder_length 0
                        lset graphic_info_list $sit_sel $graphic_info_single_update
		}
	}
	if {$change_which_graphic=="xygauss"} {
		if {$need_to_reset==1} {
			set graphic_info_single_update {5 "" "" "" "" "" ""}
			set gaussian_a1 ""
			set gaussian_a2 ""
			set gaussian_c ""
			set gaussian_b1 ""
			set gaussian_b2 ""
			set gaussian_h ""
			lset graphic_info_list $sit_sel $graphic_info_single_update
		}
	}
}

proc ::packmol::radius_start_edit {tbl row col text} {
	variable radiuslist
	variable radiuslist_sel
	variable relativelist
	variable relativelist_sel
	variable molid
	variable mol_sel
	variable sitlist
        variable sitlist_sel
        variable geolist
        variable geolist_sel
        variable geo_sitlist_radius_sel
	variable res_moleculelist
        variable res_moleculelist_sel

	set packmol [$tbl editwinpath]

	switch [$tbl columncget $col -name] {
		Molecule {
			set values $molid
			$packmol configure -values $values -state readonly -style protocol.TCombobox
		}
		Type {
                        set values {cube box sphere ellipsoid plane cylinder xygauss}
                        $packmol configure -values $values -state readonly -style protocol.TCombobox
                }
		Location {
			set values {inside outside over below}
			$packmol configure -values $values -state readonly -style protocol.TCombobox
		}
		Radius {
			$packmol configure -from 0 -to 100000 -increment 1
		}
	}
	return $text
}

proc ::packmol::radius_end_edit {tbl row col text} {
	variable radiuslist
	variable relativelist
	variable molid
	variable mol_sel
	variable sit_sel
	variable sitlist
	variable geo_sitlist_radius_sel
	variable change_which_graphic
	variable need_to_reset
	variable fscalelist
        variable short_radiuslist
        variable short_radius_scalelist
	variable res_moleculelist
	variable res_atomlist
	variable graphic_info_list
	variable graphic_line_list
        variable graphic_label_list
	variable draw_label
	variable draw_shape

	set new_molid [molinfo list]
        set new_molid_length [llength $new_molid]
        set molid_length [llength $molid]
        if {$new_molid_length!=$molid_length} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

        set need_to_refresh 0
        if {$new_molid_length==$molid_length} {
                set molid_index 0
                while {$molid_index<$molid_length} {
                        set this_molid [lindex $molid $molid_index]
                        set this_new_molid [lindex $new_molid $molid_index]
                        if {$this_molid!=$this_new_molid} {
                                set need_to_refresh 1
                        }
                        incr molid_index
                }
        }
        if {$need_to_refresh==1} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

	set packmol [$tbl editwinpath]
	set geo_sitlist_radius_sel {}

	switch [$tbl columncget $col -name] {
		Molecule {
			set val $text

			set res_id [lindex $res_moleculelist $row]
			set need_to_del_list [lindex $graphic_line_list $row]
        		set need_to_del_list_len [llength $need_to_del_list]
        		set number 0
        		while {$number<$need_to_del_list_len} {
        		        set delete_num [lindex $need_to_del_list $number]
        		        graphics $res_id delete $delete_num
        		        incr number
        		}

        		set need_to_del_list [lindex $graphic_label_list $row]
        		set need_to_del_list_len [llength $need_to_del_list]
        		set number 0
        		while {$number<$need_to_del_list_len} {
        		        set delete_num [lindex $need_to_del_list $number]
        		        graphics $res_id delete $delete_num
        		        incr number
			}

			lset res_moleculelist $row $val
			::packmol::refresh_constrain_list
			::packmol::select_draw_label
			::packmol::select_draw_shape
		}
		Atom {
			set val $text
			lset res_atomlist $row $val
			::packmol::refresh_constrain_list
		}
		Type {
			set val $text
			set former_graphic [lindex $sitlist $row]
			if {$former_graphic!=$val} {
				set need_to_reset 1
			} else {
				set need_to_reset 0
			}
			lset sitlist $row $val
			::packmol::refresh_constrain_list
			set change_which_graphic $val
			::packmol::change_graphic_info
			::packmol::del_sel_sit_line_label
		}
		Location {
			set val $text
			lset relativelist $row $val
                        ::packmol::refresh_constrain_list
		}
		Radius {
			if {[catch {set is_none [expr $text / 1]}]} {
				set text 1
			}
			set val $text
			lset radiuslist $row $val
			::packmol::refresh_constrain_list
		}
		fscale {
			set val $text
			lset fscalelist $row $val
			::packmol::refresh_constrain_list
		}
		short_radius {
			set val $text
			lset short_radiuslist $row $val
			::packmol::refresh_constrain_list
		}
		short_radius_scale {
			set val $text
			lset short_radius_scalelist $row $val
			::packmol::refresh_constrain_list
		}
	}
	return $text
}

proc ::packmol::molinformation {} {
	variable molid
	variable all_mol
	variable filelist
	set filelist {}
	variable file_name_list
	set file_name_list {}
	variable mol_material
	variable thesefile
	variable graphic_line_list
	variable graphic_label_list
	variable graphic_info_list
	variable atomlist
	variable atom_serial_name_list
	variable structure_num_list
	variable center_fix_list
	variable constrain_list
	variable resnumber_list
	variable restart_from_list
	variable restart_to_list
	variable changechains_list
	variable chain_list
	variable position
	variable segid_list
	variable maxmove_list
	variable rep_list
	variable record_show_atomlist
	variable countlist
	variable constrain_volume_list
        variable molecular_volume_list
        variable nvmax_list
        variable surface_area_list
        variable apl_list
        variable nsmax_list
	
	::packmol::use_setted
	set all_mol [molinfo num]
	set thesefile {}
	if {$all_mol==0} {
		return
	}

	set flag 0
        set update_molid {}
        set update_molid [molinfo list]
        set number 0
        set newlength [llength $update_molid]
        set mollength [llength $molid]
        if {$newlength==$mollength} {
                while {$number<$mollength} {
                        set new [lindex $update_molid $number]
                        set old [lindex $molid $number]
                        if {$new!=$old} {
                                set flag 1
                                break
                        }
                        incr number
                }
        }
        if {$newlength!=$mollength} {
                set flag 1
        }

        if {$flag==1} {
                set molid $update_molid
                set number 0
                while {$number < $all_mol} {
                        #id
                        set id [lindex $molid $number]
                        set id_info_list [list $id]
                        #file
                        set file_name_all [molinfo $id get filename]
                        foreach single_split_file $file_name_all {
                                foreach single_file_name $single_split_file {
                                        set get_file_extension [file extension $single_file_name]
                                        if {$get_file_extension==".pdb"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
                                        if {$get_file_extension==".gro"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
                                        if {$get_file_extension==".mol2"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
					if {$get_file_extension==".xyz"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
					if {$get_file_extension==".txyz"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
                                        if {$get_file_extension==""} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
                                }
                        }
			lappend file_name_list $file_name
                        incr number
                }
        } else {
                set number 0
                while {$number < $all_mol} {
                        #id
                        set id [lindex $molid $number]
                        set id_info_list [list $id]
                        #file
                        set file_name_all [molinfo $id get filename]
                        foreach single_split_file $file_name_all {
                                foreach single_file_name $single_split_file {
                                        set get_file_extension [file extension $single_file_name]
                                        if {$get_file_extension==".pdb"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
                                        if {$get_file_extension==".gro"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
                                        if {$get_file_extension==".mol2"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
					if {$get_file_extension==".xyz"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
					if {$get_file_extension==".txyz"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
                                        if {$get_file_extension==""} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
                                }
                        }
			lappend file_name_list $file_name
			incr number
		}
        }

	set mollength [llength $molid]
	set maxid [lindex $molid [expr $mollength - 1]]
	set number 0
	while {$number<=$maxid} {
		lappend countlist ""
		lappend mol_material "Opaque"

		lappend structure_num_list 0
		lappend resnumber_list 0
		lappend restart_from_list ""
		lappend restart_to_list ""
		lappend changechains_list "no"
		lappend chain_list ""
		lappend segid_list ""
		lappend maxmove_list ""
		lappend constrain_volume_list ""
		lappend molecular_volume_list ""
		lappend nvmax_list ""
		lappend surface_area_list ""
		lappend apl_list ""
		lappend nsmax_list ""
		lappend rep_list ""
		lappend record_show_atomlist ""

		set center_fix_single {0 0 0 0 0 0 0}
		lappend center_fix_list $center_fix_single

		set constrain_single {0 0 0 0 0 0 0}
		lappend constrain_list $constrain_single

		incr number
	}

	set atom_sel [atomselect $id all]
        set atomlist [$atom_sel get serial]
        set atom_name_list [$atom_sel get name]
        set atomlist_len [llength $atomlist]
        set number 0
        while {$number<$atomlist_len} {
                set atom_serial_single [lindex $atomlist $number]
                set atom_name_single [lindex $atom_name_list $number]
                set atom_serial_name_single [format "%d %s" $atom_serial_single $atom_name_single]
                set atom_serial_name_single_empty_list {}
                lappend atom_serial_name_single_empty_list $atom_serial_name_single
                lappend atom_serial_name_list $atom_serial_name_single_empty_list
                incr number
        }

	::packmol::get_constrain_volume
	::packmol::refresh_filelist
	#position
	set number 0
	while {$number<$all_mol} {
		set is_exist 0
		set id [lindex $molid $number]
		foreach val $position {
			if {$val==$id} {
				set is_exist 1
			}
		}
		if {$is_exist==0} {
			set sel [atomselect $id all]
			set apos [$sel get {x y z}]
			lappend position $id
			lappend position $apos
		}
		incr number
	}
}

proc ::packmol::able_disable {} {
	variable molid
	variable mol_sel
	variable sitlist
	variable sit_sel

	set graphic [lindex $sitlist $sit_sel]

	# cube
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.start.startx_spin.spinbox_start_x configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.start.starty_spin.spinbox_start_y configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.start.startz_spin.spinbox_start_z configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.size.spinbox configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.width.spinbox configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.color.color configure -state disable


	# box
	.packmolview.all.first.sel.up_down.graphics.all_graphics.box.start.startx_spin.spinbox_start_x configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.box.start.starty_spin.spinbox_start_y configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.box.start.startz_spin.spinbox_start_z configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.box.end.endx_spin.spinbox_end_x configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.box.end.endy_spin.spinbox_end_y configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.box.end.endz_spin.spinbox_end_z configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.box.width_color.width_spin.spinbox_width configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.box.width_color.color.color configure -state disable

	# sphere
	.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.center.x.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.center.y.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.center.z.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.r.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.color.color configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.material.material configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.resolution.spin configure -state disable

	# ellipsoid
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.a1.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.b1.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.c1.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.a2.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.b2.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.c2.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.d.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.color.color configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.material.material configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.resolution.spin configure -state disable

	# plane
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.abc.a.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.abc.b.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.abc.c.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.d.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.color.color configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.material.material configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.max.max_a.spinbox configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.max.max_b.spinbox configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.max.max_c.spinbox configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.min.min_a.spinbox configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.min.min_b.spinbox configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.min.min_c.spinbox configure -state disable

	# cylinder
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_x.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_y.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_z.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_x.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_y.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_z.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.r.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.color.color configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.material.material configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.length.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.resolution.spin configure -state disable

	# gaussian surface
	.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.aone_spin.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.atwo_spin.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.c_spin.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.bone_spin.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.btwo_spin.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.h_spin.spin configure -state disable

	if {$graphic=="cube"} {
		# cube
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.start.startx_spin.spinbox_start_x configure -state normal
	        .packmolview.all.first.sel.up_down.graphics.all_graphics.cube.start.starty_spin.spinbox_start_y configure -state normal
	        .packmolview.all.first.sel.up_down.graphics.all_graphics.cube.start.startz_spin.spinbox_start_z configure -state normal
	        .packmolview.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.size.spinbox configure -state normal
	        .packmolview.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.width.spinbox configure -state normal
	        .packmolview.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.color.color configure -state normal

		.packmolview.all.first.sel.up_down.graphics.all_graphics select .packmolview.all.first.sel.up_down.graphics.all_graphics.cube
	}

	if {$graphic=="box"} {
		# box
		.packmolview.all.first.sel.up_down.graphics.all_graphics.box.start.startx_spin.spinbox_start_x configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.box.start.starty_spin.spinbox_start_y configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.box.start.startz_spin.spinbox_start_z configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.box.end.endx_spin.spinbox_end_x configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.box.end.endy_spin.spinbox_end_y configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.box.end.endz_spin.spinbox_end_z configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.box.width_color.width_spin.spinbox_width configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.box.width_color.color.color configure -state normal

		.packmolview.all.first.sel.up_down.graphics.all_graphics select .packmolview.all.first.sel.up_down.graphics.all_graphics.box
	}

	if {$graphic=="sphere"} {
		# sphere
		.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.center.x.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.center.y.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.center.z.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.r.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.color.color configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.material.material configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.resolution.spin configure -state normal

		.packmolview.all.first.sel.up_down.graphics.all_graphics select .packmolview.all.first.sel.up_down.graphics.all_graphics.sphere
	}

	if {$graphic=="ellipsoid"} {
		# ellipsoid
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.a1.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.b1.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.c1.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.a2.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.b2.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.c2.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.d.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.color.color configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.material.material configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.resolution.spin configure -state normal

		.packmolview.all.first.sel.up_down.graphics.all_graphics select .packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid
	}

	if {$graphic=="plane"} {
		# plane
		.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.abc.a.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.abc.b.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.abc.c.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.d.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.color.color configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.material.material configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.max.max_a.spinbox configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.max.max_b.spinbox configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.max.max_c.spinbox configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.min.min_a.spinbox configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.min.min_b.spinbox configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.min.min_c.spinbox configure -state normal

		.packmolview.all.first.sel.up_down.graphics.all_graphics select .packmolview.all.first.sel.up_down.graphics.all_graphics.plane
	}

	if {$graphic=="cylinder"} {
		# cylinder
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_x.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_y.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_z.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_x.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_y.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_z.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.r.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.color.color configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.material.material configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.length.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.resolution.spin configure -state normal

		.packmolview.all.first.sel.up_down.graphics.all_graphics select .packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder
	}

	if {$graphic=="xygauss"} {
		.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.aone_spin.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.atwo_spin.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.c_spin.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.bone_spin.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.btwo_spin.spin configure -state normal
		.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.h_spin.spin configure -state normal

		.packmolview.all.first.sel.up_down.graphics.all_graphics select .packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian
	}

	if {$graphic==""} {
                # cube
                .packmolview.all.first.sel.up_down.graphics.all_graphics.cube.start.startx_spin.spinbox_start_x configure -state disable
                .packmolview.all.first.sel.up_down.graphics.all_graphics.cube.start.starty_spin.spinbox_start_y configure -state disable
                .packmolview.all.first.sel.up_down.graphics.all_graphics.cube.start.startz_spin.spinbox_start_z configure -state disable
                .packmolview.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.size.spinbox configure -state disable
                .packmolview.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.width.spinbox configure -state disable
                .packmolview.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.color.color configure -state disable

                .packmolview.all.first.sel.up_down.graphics.all_graphics select .packmolview.all.first.sel.up_down.graphics.all_graphics.cube
        }
}

proc ::packmol::show_select_sit {} {
	variable cube_start_x
        variable cube_start_y
        variable cube_start_z
        variable cube_size
	variable cube_color
	variable cube_width
	variable box_start_x
        variable box_start_y
        variable box_start_z
        variable box_end_x
        variable box_end_y
        variable box_end_z
        variable box_width
        variable box_color
        variable sphere_x
        variable sphere_y
        variable sphere_z
        variable sphere_r
        variable sphere_resolution
        variable sphere_color
        variable ellipsoid_a1
        variable ellipsoid_b1
        variable ellipsoid_c1
        variable ellipsoid_a2
        variable ellipsoid_b2
        variable ellipsoid_c2
        variable ellipsoid_d
        variable ellipsoid_color
        variable ellipsoid_resolution
        variable plane_a
        variable plane_b
        variable plane_c
        variable plane_d
        variable plane_color
        variable plane_min_a
        variable plane_min_b
        variable plane_min_c
        variable plane_max_a
        variable plane_max_b
        variable plane_max_c
        variable cylinder_fir_circle_x
        variable cylinder_fir_circle_y
        variable cylinder_fir_circle_z
        variable cylinder_sec_circle_x
        variable cylinder_sec_circle_y
        variable cylinder_sec_circle_z
        variable cylinder_r
        variable cylinder_color
        variable cylinder_resolution
        variable cylinder_length
	variable gaussian_a1
        variable gaussian_a2
        variable gaussian_b1
        variable gaussian_b2
        variable gaussian_c
        variable gaussian_h
	variable molid
	variable mol_sel
	variable sit_sel
	variable sitlist
	variable graphic_info_list
	variable all_color_list
	variable mol_material
	variable sel_material
	variable res_moleculelist

	set res_id [lindex $res_moleculelist $sit_sel]
	set sel_material [lindex $mol_material $res_id]
	set graphic_info_single_sel [lindex $graphic_info_list $sit_sel]
	set which_graphic [lindex $graphic_info_single_sel 0]
	if {$which_graphic==6} {
		set cube_start_x [lindex $graphic_info_single_sel 1]
		set cube_start_y [lindex $graphic_info_single_sel 2]
		set cube_start_z [lindex $graphic_info_single_sel 3]
		set cube_size [lindex $graphic_info_single_sel 4]
		set cube_width [lindex $graphic_info_single_sel 5]
		set cube_color_id [lindex $graphic_info_single_sel 6]
		set cube_color [lindex $all_color_list $cube_color_id]
	}
	if {$which_graphic==0} {
		set box_start_x [lindex $graphic_info_single_sel 1]
		set box_start_y [lindex $graphic_info_single_sel 2]
		set box_start_z [lindex $graphic_info_single_sel 3]
		set box_end_x [lindex $graphic_info_single_sel 4]
		set box_end_y [lindex $graphic_info_single_sel 5]
		set box_end_z [lindex $graphic_info_single_sel 6]
		set box_width [lindex $graphic_info_single_sel 7]
		set box_color_id [lindex $graphic_info_single_sel 8]
		set box_color [lindex $all_color_list $box_color_id]
	}

	if {$which_graphic==1} {
		set sphere_x [lindex $graphic_info_single_sel 1]
		set sphere_y [lindex $graphic_info_single_sel 2]
		set sphere_z [lindex $graphic_info_single_sel 3]
		set sphere_r [lindex $graphic_info_single_sel 4]
		set sphere_color_id [lindex $graphic_info_single_sel 5]
		set sphere_color [lindex $all_color_list $sphere_color_id]
#		set sphere_material_id [lindex $graphic_info_single_sel 6]
#		set sphere_material [lindex $all_material_list $sphere_material_id]
		set sphere_resolution [lindex $graphic_info_single_sel 6]
	}

	if {$which_graphic==2} {
		set ellipsoid_a1 [lindex $graphic_info_single_sel 1]
		set ellipsoid_b1 [lindex $graphic_info_single_sel 2]
		set ellipsoid_c1 [lindex $graphic_info_single_sel 3]
		set ellipsoid_a2 [lindex $graphic_info_single_sel 4]
		set ellipsoid_b2 [lindex $graphic_info_single_sel 5]
		set ellipsoid_c2 [lindex $graphic_info_single_sel 6]
		set ellipsoid_d [lindex $graphic_info_single_sel 7]
		set ellipsoid_color_id [lindex $graphic_info_single_sel 8]
		set ellipsoid_color [lindex $all_color_list $ellipsoid_color_id]
		set ellipsoid_resolution [lindex $graphic_info_single_sel 9]
	}

	if {$which_graphic==3} {
		set plane_a [lindex $graphic_info_single_sel 1]
		set plane_b [lindex $graphic_info_single_sel 2]
		set plane_c [lindex $graphic_info_single_sel 3]
		set plane_d [lindex $graphic_info_single_sel 4]
		set plane_color_id [lindex $graphic_info_single_sel 5]
		set plane_color [lindex $all_color_list $plane_color_id]
	}
	if {$which_graphic==4} {
		set cylinder_fir_circle_x [lindex $graphic_info_single_sel 1]
		set cylinder_fir_circle_y [lindex $graphic_info_single_sel 2]
		set cylinder_fir_circle_z [lindex $graphic_info_single_sel 3]
		set cylinder_sec_circle_x [lindex $graphic_info_single_sel 4]
		set cylinder_sec_circle_y [lindex $graphic_info_single_sel 5]
		set cylinder_sec_circle_z [lindex $graphic_info_single_sel 6]
		set cylinder_r [lindex $graphic_info_single_sel 7]
		set cylinder_length [lindex $graphic_info_single_sel 8]
		set cylinder_color_id [lindex $graphic_info_single_sel 9]
		set cylinder_color [lindex $all_color_list $cylinder_color_id]
		set cylinder_resolution [lindex $graphic_info_single_sel 10]
	}
	if {$which_graphic==5} {
		set gaussian_a1 [lindex $graphic_info_single_sel 1]
		set gaussian_b1 [lindex $graphic_info_single_sel 2]
		set gaussian_a2 [lindex $graphic_info_single_sel 3]
		set gaussian_b2 [lindex $graphic_info_single_sel 4]
		set gaussian_c [lindex $graphic_info_single_sel 5]
		set gaussian_h [lindex $graphic_info_single_sel 6]
	}
}

proc ::packmol::getmol_sit {W} {
	variable mol_sel
	variable molid
	variable sitlist
	variable res_moleculelist
        variable res_atomlist
	variable radiuslist
	variable fscalelist
        variable short_radiuslist
        variable short_radius_scalelist
	variable relativelist
	variable geo_sitlist_radius_sel
	variable mol_material
	variable sel_material
	variable sit_sel
	variable cube_start_x
        variable cube_start_y
        variable cube_start_z
        variable cube_size
        variable cube_color
        variable cube_width
	variable box_start_x
        variable box_start_y
        variable box_start_z
        variable box_end_x
        variable box_end_y
        variable box_end_z
        variable box_width
        variable box_color
        variable sphere_x
        variable sphere_y
        variable sphere_z
        variable sphere_r
        variable sphere_resolution
        variable sphere_color
        variable ellipsoid_a1
        variable ellipsoid_b1
        variable ellipsoid_c1
        variable ellipsoid_a2
        variable ellipsoid_b2
        variable ellipsoid_c2
        variable ellipsoid_d
        variable ellipsoid_color
        variable ellipsoid_resolution
        variable plane_a
        variable plane_b
        variable plane_c
        variable plane_d
        variable plane_color
	variable plane_min_a
	variable plane_min_b
	variable plane_min_c
	variable plane_max_a
	variable plane_max_b
	variable plane_max_c
        variable cylinder_fir_circle_x
        variable cylinder_fir_circle_y
        variable cylinder_fir_circle_z
        variable cylinder_sec_circle_x
        variable cylinder_sec_circle_y
        variable cylinder_sec_circle_z
        variable cylinder_r
        variable cylinder_color
        variable cylinder_resolution
	variable cylinder_length
	variable gaussian_a1
        variable gaussian_a2
        variable gaussian_b1
        variable gaussian_b2
        variable gaussian_c
        variable gaussian_h
	variable graphic_info_list
	variable all_color_list
	variable all_material_list
#	variable structure_num
	variable structure_num_list
	variable is_fixed
        variable fix_x
        variable fix_y
        variable fix_z
        variable fix_alpha
        variable fix_beta
        variable fix_gamma
	variable center_fix_list
	variable is_constrain
        variable constrain_x
        variable constrain_y
        variable constrain_z
        variable constrain_x_plus
        variable constrain_y_plus
        variable constrain_z_plus
	variable constrain_list

	set new_molid [molinfo list]
	foreach index [$W curselection] {
		set mol_sel $index
		set sit_sel 0
		set id [lindex $molid $index]
                set need_to_refresh 1
                foreach val $new_molid {
                        if {$val==$id} {
                                set need_to_refresh 0
                        }
                }
                if {$need_to_refresh==1} {
			set msg "File does not exist, please refresh the list"
			tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg

			set is_fixed 0
			set fix_x 0
			set fix_y 0
			set fix_z 0
			set fix_alpha 0
			set fix_beta 0
			set fix_gamma 0

			set is_constrain 0
			set constrain_x 0
			set constrain_y 0
			set constrain_z 0
			set constrain_x_plus 0
			set constrain_y_plus 0
			set constrain_z_plus 0
			::packmol::reset_zero

			set sel_material "Opaque"
			set graphic "cube"
			set tolerance 2
#			set geo_sitlist_radius_sel {}
			set structure_num 0

			# cube
	        	.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.start.startx_spin.spinbox_start_x configure -state disable
	 		.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.start.starty_spin.spinbox_start_y configure -state disable
	        	.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.start.startz_spin.spinbox_start_z configure -state disable
	        	.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.size.spinbox configure -state disable
	        	.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.width.spinbox configure -state disable
	        	.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.color.color configure -state disable

			# box
			.packmolview.all.first.sel.up_down.graphics.all_graphics.box.start.startx_spin.spinbox_start_x configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.box.start.starty_spin.spinbox_start_y configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.box.start.startz_spin.spinbox_start_z configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.box.end.endx_spin.spinbox_end_x configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.box.end.endy_spin.spinbox_end_y configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.box.end.endz_spin.spinbox_end_z configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.box.width_color.width_spin.spinbox_width configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.box.width_color.color.color configure -state disable

			# sphere
			.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.center.x.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.center.y.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.center.z.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.r.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.color.color configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.material.material configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.resolution.spin configure -state disable

			# ellipsoid
			.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.a1.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.b1.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.c1.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.a2.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.b2.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.c2.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.d.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.color.color configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.material.material configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.resolution.spin configure -state disable

			# plane
			.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.abc.a.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.abc.b.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.abc.c.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.d.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.color.color configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.material.material configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.max.max_a.spinbox configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.max.max_b.spinbox configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.max.max_c.spinbox configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.min.min_a.spinbox configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.min.min_b.spinbox configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.min.min_c.spinbox configure -state disable

			# cylinder
			.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_x.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_y.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_z.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_x.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_y.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_z.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.r.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.color.color configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.material.material configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.length.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.resolution.spin configure -state disable

			# gaussian surface
			.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.aone_spin.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.atwo_spin.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.c_spin.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.bone_spin.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.btwo_spin.spin configure -state disable
			.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.h_spin.spin configure -state disable

			.packmolview.all.first.sel.up_down.graphics.all_graphics select .packmolview.all.first.sel.up_down.graphics.all_graphics.cube

			return
		}

		set new_molid [molinfo list]
        	set new_molid_length [llength $new_molid]
        	set molid_length [llength $molid]
        	if {$new_molid_length!=$molid_length} {
        	        set msg "File list has changed, please refresh."
        	        tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
        	        return
        	}

        	set need_to_refresh 0
        	if {$new_molid_length==$molid_length} {
        	        set molid_index 0
        	        while {$molid_index<$molid_length} {
        	                set this_molid [lindex $molid $molid_index]
        	                set this_new_molid [lindex $new_molid $molid_index]
        	                if {$this_molid!=$this_new_molid} {
        	                        set need_to_refresh 1
        	                }
        	                incr molid_index
        	        }
        	}
        	if {$need_to_refresh==1} {
        	        set msg "File list has changed, please refresh."
        	        tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
        	        return
		}

		# get fix info
		set fix_info_single [lindex $center_fix_list $id]
		set is_fixed [lindex $fix_info_single 0]
		set fix_x [lindex $fix_info_single 1]
		set fix_y [lindex $fix_info_single 2]
		set fix_z [lindex $fix_info_single 3]
		set fix_alpha [lindex $fix_info_single 4]
		set fix_beta [lindex $fix_info_single 5]
		set fix_gamma [lindex $fix_info_single 6]

		# get constrain info
		set constrain_info_single [lindex $constrain_list $id]
		set is_constrain [lindex $constrain_info_single 0]
		set constrain_x [lindex $constrain_info_single 1]
		set constrain_y [lindex $constrain_info_single 2]
		set constrain_z [lindex $constrain_info_single 3]
		set constrain_x_plus [lindex $constrain_info_single 4]
		set constrain_y_plus [lindex $constrain_info_single 5]
		set constrain_z_plus [lindex $constrain_info_single 6]
	}
}

proc ::packmol::getatom_list {W} {
	variable atomlist
	variable atom_serial_name_list
	variable molid
	variable sitlist
	variable radiuslist
	variable relativelist
	variable geo_sitlist_radius_sel

	set atomlist {}
	set atom_serial_name_list {}
	set new_molid [molinfo list]
	foreach index [$W curselection] {
		set id [lindex $molid $index]
                set need_to_refresh 1
                foreach val $new_molid {
                        if {$val==$id} {
                                set need_to_refresh 0
                        }
                }
		if {$need_to_refresh==1} {
			return
		}

		set atom_sel [atomselect $id all]
		set atomlist [$atom_sel get serial]
		set atom_name_list [$atom_sel get name]
		set atomlist_len [llength $atomlist]
		set number 0
		while {$number<$atomlist_len} {
			set atom_serial_single [lindex $atomlist $number]
			set atom_name_single [lindex $atom_name_list $number]
			set atom_serial_name_single [format "%d %s" $atom_serial_single $atom_name_single]
			set atom_serial_name_single_empty_list {}
			lappend atom_serial_name_single_empty_list $atom_serial_name_single
			lappend atom_serial_name_list $atom_serial_name_single_empty_list
			incr number
		}
	}
}

proc ::packmol::import_mol {} {
	variable import_file_dir
	variable packmol_name
	variable system
	global env

	set vmd_Linux_pwd_dir $env(PACKMOLDIR)
	set vmd_Linux_pwd_dir [file dirname $vmd_Linux_pwd_dir]
	set vmd_Linux_pwd_dir [file dirname $vmd_Linux_pwd_dir]
	set vmd_Linux_pwd_dir [file dirname $vmd_Linux_pwd_dir]
	set vmd_Linux_pwd_dir [file dirname $vmd_Linux_pwd_dir]
	set packmol_info_str "plugins/noarch/tcl/packmol1.0/packmol_info.json"
	set vmd_packmol_json_pwd [file join $vmd_Linux_pwd_dir $packmol_info_str]
	if {[catch {set f [open $vmd_packmol_json_pwd r]}]} {
		::packmol::general_setting
	} else {
		set row 0
		set all_row_info ""
		while {[gets $f line] >= 0} {
			incr row
			set single_row_info [set list($row) $line]
			append all_row_info $single_row_info
		}
		close $f
		set all_row_info [regsub -all ": " $all_row_info " "]
		set all_row_info [regsub -all ",\"" $all_row_info " \""]
		set generate_dict_order "set dict_info "
		append generate_dict_order $all_row_info
		eval $generate_dict_order
		set import_file_dir [dict get $dict_info "packmol_import"]
	}

	set import_filename [tk_getOpenFile -filetypes {{PDB .pdb} {GRO .gro} {MOL2 .mol2} {XYZ .xyz} {TXYZ .txyz} {All *}} -initialdir $import_file_dir]
	if {$import_filename==""} {
		return
	}

	set import_mol_filetype ""
	set import_filename_tail [file extension $import_filename]
	set import_file_dir [file dirname $import_filename]
	if {$import_filename_tail==".pdb"} {
		set import_mol_filetype "pdb"
	}
	if {$import_filename_tail==".gro"} {
		set import_mol_filetype "gro"
	}
	if {$import_filename_tail==".mol2"} {
		set import_mol_filetype "mol2"
	}
	if {$import_filename_tail==".xyz"} {
		set import_mol_filetype "xyz"
	}
	if {$import_filename_tail==".txyz"} {
		set import_mol_filetype "tinker"
	}

	if {$import_mol_filetype==""} {
		set msg "File types: pdb, gro, mol2, xyz, txyz"
		tk_messageBox -title "File Type Error" -parent .packmolview -type ok -message $msg
		return
	}

	mol new $import_filename type $import_mol_filetype
	::packmol::refresh
	::packmol::change_general_setting
}

proc ::packmol::delete_mol {} {
	variable molid
	variable mol_sel
	variable geo_sitlist_radius_sel
	variable sitlist
	variable geolist
	variable radiuslist
	variable relativelist
	variable mol_material
	variable sitlist_sel
	variable geolist_sel
	variable radiuslist_sel
	variable relativelist_sel
	variable sel_material

	set molid_length [llength $molid]
	if {$molid_length==0} {
		return
	}

	set id [lindex $molid $mol_sel]
	mol delete $id
	::packmol::refresh
	::packmol::show_atom_selection
}

proc ::packmol::refresh {} {
	variable molid
	variable all_mol
	variable filelist
        set filelist {}
	variable file_name_list
	set file_name_list {}
	variable mol_material
	variable mol_sel
	variable sit_sel
	variable countlist
	variable thesefile
	variable graphic_line_list
	variable graphic_label_list
	variable graphic_info_list
	variable atomlist
	variable atom_serial_name_list
	variable structure_num_list
	variable resnumber_list
	variable restart_from_list
	variable restart_to_list
	variable changechains_list
	variable chain_list
	variable segid_list
	variable maxmove_list
	variable constrain_volume_list
        variable molecular_volume_list
        variable nvmax_list
        variable surface_area_list
        variable apl_list
        variable nsmax_list
	variable rep_list
	variable center_fix_list
	variable is_fixed
        variable fix_x
        variable fix_y
        variable fix_z
        variable fix_alpha
        variable fix_beta
        variable fix_gamma
        variable center_fix_list
	variable is_constrain
        variable constrain_x
        variable constrain_y
        variable constrain_z
        variable constrain_x_plus
        variable constrain_y_plus
        variable constrain_z_plus
	variable constrain_list
	variable record_show_atomlist

	variable graphic
	variable sel_material
	variable cube_start_x
        variable cube_start_y
        variable cube_start_z
        variable cube_size
        variable cube_color
        variable cube_width
	variable box_start_x
        variable box_start_y
        variable box_start_z
        variable box_end_x
        variable box_end_y
        variable box_end_z
        variable box_width
        variable box_color
        variable sphere_x
        variable sphere_y
        variable sphere_z
        variable sphere_r
        variable sphere_resolution
        variable sphere_color
        variable ellipsoid_a1
        variable ellipsoid_b1
        variable ellipsoid_c1
        variable ellipsoid_a2
        variable ellipsoid_b2
        variable ellipsoid_c2
        variable ellipsoid_d
        variable ellipsoid_color
        variable ellipsoid_resolution
        variable plane_a
        variable plane_b
        variable plane_c
        variable plane_d
        variable plane_color
	variable plane_min_a
        variable plane_min_b
        variable plane_min_c
        variable plane_max_a
        variable plane_max_b
        variable plane_max_c
        variable cylinder_fir_circle_x
        variable cylinder_fir_circle_y
        variable cylinder_fir_circle_z
        variable cylinder_sec_circle_x
        variable cylinder_sec_circle_y
        variable cylinder_sec_circle_z
        variable cylinder_r
        variable cylinder_color
        variable cylinder_resolution
	variable cylinder_length
	variable gaussian_a1
        variable gaussian_a2
        variable gaussian_b1
        variable gaussian_b2
        variable gaussian_c
        variable gaussian_h

	variable tolerance
	variable structure_num
	variable position

	variable cube_value
	variable box_value
	variable sphere_value
	variable ellipsoid_value
	variable cylinder_value

	variable packmol_output
	variable generate_packmol_input

	set is_fixed 0
	set fix_x 0
	set fix_y 0
	set fix_z 0
	set fix_alpha 0
	set fix_beta 0
	set fix_gamma 0

	set is_constrain 0
	set constrain_x 0
	set constrain_y 0
	set constrain_z 0
	set constrain_x_plus 0
	set constrain_y_plus 0
	set constrain_z_plus 0

#	set packmol_output ""
#	set generate_packmol_input ""

	set thesefile {}
	set atomlist {}
	set atom_serial_name_list {}
	set all_mol [molinfo num]
	if {$all_mol==0} {
		set molid {}

		set cube_start_x 0
		set cube_start_y 0
		set cube_start_z 0
		set cube_size 0
		set cube_width 1
		set cube_color "0 blue"

		set box_start_x 0
		set box_start_y 0
		set box_start_z 0
		set box_end_x 0
		set box_end_y 0
		set box_end_z 0
		set box_width 1
		set box_color "0 blue"

		set sphere_x 0
		set sphere_y 0
		set sphere_z 0
		set sphere_r 0
		set sphere_resolution 30
		set sphere_color "0 blue"

		set ellipsoid_a1 0
		set ellipsoid_b1 0
		set ellipsoid_c1 0
		set ellipsoid_a2 0
		set ellipsoid_b2 0
		set ellipsoid_c2 0
		set ellipsoid_d 0
		set ellipsoid_color "0 blue"
		set ellipsoid_resolution 2

		set plane_a 0
		set plane_b 0
		set plane_c 0
		set plane_d 0
		set plane_color "0 blue"
		set plane_min_a 0.0
		set plane_min_b 0.0
		set plane_min_c 0.0
		set plane_max_a 5.0
		set plane_max_b 5.0
		set plane_max_c 5.0

		set cylinder_fir_circle_x 0
		set cylinder_fir_circle_y 0
		set cylinder_fir_circle_z 0
		set cylinder_sec_circle_x 0
		set cylinder_sec_circle_y 0
		set cylinder_sec_circle_z 0
		set cylinder_r 0
		set cylinder_color "0 blue"
		set cylinder_resolution 30
		set cylinder_length 0

		set gaussian_a1 ""
		set gaussian_a2 ""
		set gaussian_b1 ""
		set gaussian_b2 ""
		set gaussian_c ""
		set gaussian_h ""

		set cube_value 0.00
		set box_value 0.00
		set sphere_value 0.00
		set ellipsoid_value 0.00
		set cylinder_value 0.00

		set sel_material "Opaque"
		set graphic "cube"
#		set tolerance 2
		set structure_num 0

		# cube
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.start.startx_spin.spinbox_start_x configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.start.starty_spin.spinbox_start_y configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.start.startz_spin.spinbox_start_z configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.size.spinbox configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.width.spinbox configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.color.color configure -state disable

		# box
		.packmolview.all.first.sel.up_down.graphics.all_graphics.box.start.startx_spin.spinbox_start_x configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.box.start.starty_spin.spinbox_start_y configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.box.start.startz_spin.spinbox_start_z configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.box.end.endx_spin.spinbox_end_x configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.box.end.endy_spin.spinbox_end_y configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.box.end.endz_spin.spinbox_end_z configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.box.width_color.width_spin.spinbox_width configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.box.width_color.color.color configure -state disable

		# sphere
		.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.center.x.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.center.y.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.center.z.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.r.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.color.color configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.material.material configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.resolution.spin configure -state disable

		# ellipsoid
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.a1.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.b1.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.c1.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.a2.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.b2.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.c2.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.d.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.color.color configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.material.material configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.resolution.spin configure -state disable

		# plane
		.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.abc.a.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.abc.b.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.abc.c.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.d.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.color.color configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.material.material configure -state disable

		# cylinder
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_x.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_y.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_z.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_x.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_y.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_z.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.r.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.color.color configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.material.material configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.length.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.resolution.spin configure -state disable

		# gaussian surface
		.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.aone_spin.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.atwo_spin.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.c_spin.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.bone_spin.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.btwo_spin.spin configure -state disable
		.packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.h_spin.spin configure -state disable

		.packmolview.all.first.sel.up_down.graphics.all_graphics select .packmolview.all.first.sel.up_down.graphics.all_graphics.cube

		::packmol::del_mol_constrainlist_refresh
		return
	}

	set flag 0
        set update_molid {}
	set update_molid [molinfo list]
	set number 0
	set newlength [llength $update_molid]
	set mollength [llength $molid]
	if {$newlength==$mollength} {
		while {$number<$mollength} {
			set new [lindex $update_molid $number]
			set old [lindex $molid $number]
			if {$new!=$old} {
				set flag 1
				break
			}
			incr number
		}
	}
	if {$newlength!=$mollength} {
		set flag 1
	}

        if {$flag==1} {
                set molid $update_molid
                set number 0
                while {$number < $all_mol} {
                        #id
                        set id [lindex $molid $number]
                        set id_info_list [list $id]
                        #file
                        set file_name_all [molinfo $id get filename]
                        foreach single_split_file $file_name_all {
                                foreach single_file_name $single_split_file {
                                        set get_file_extension [file extension $single_file_name]
                                        if {$get_file_extension==".pdb"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
                                        if {$get_file_extension==".gro"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
                                        if {$get_file_extension==".mol2"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
					if {$get_file_extension==".xyz"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
					if {$get_file_extension==".txyz"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
                                        if {$get_file_extension==""} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
                                }
                        }
			lappend file_name_list $file_name
                        incr number
                }
        } else {
                set number 0
                while {$number < $all_mol} {
                        #id
                        set id [lindex $molid $number]
                        set id_info_list [list $id]
                        #file
                        set file_name_all [molinfo $id get filename]
                        foreach single_split_file $file_name_all {
                                foreach single_file_name $single_split_file {
                                        set get_file_extension [file extension $single_file_name]
                                        if {$get_file_extension==".pdb"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
                                        if {$get_file_extension==".gro"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
                                        if {$get_file_extension==".mol2"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
					if {$get_file_extension==".xyz"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
					if {$get_file_extension==".txyz"} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
                                        if {$get_file_extension==""} {
                                                lappend thesefile $single_file_name
                                                set file_name [file tail $single_file_name]
                                        }
                                }
                        }
			lappend file_name_list $file_name
			incr number
                }
        }
	set old_sitlist_len [llength $countlist]
	set mollength [llength $molid]
	set maxid [lindex $molid [expr $mollength - 1]]
	set need_to_append [expr $maxid + 1 - $old_sitlist_len]
	set number 0
	while {$number<$need_to_append} {
		lappend countlist ""
		lappend mol_material "Opaque"

		lappend structure_num_list 0
		lappend resnumber_list 0
		lappend restart_from_list ""
		lappend restart_to_list ""
		lappend changechains_list "no"
		lappend chain_list ""
		lappend segid_list ""
		lappend maxmove_list ""
		lappend constrain_volume_list ""
                lappend molecular_volume_list ""
                lappend nvmax_list ""
                lappend surface_area_list ""
                lappend apl_list ""
                lappend nsmax_list ""
		lappend rep_list ""
		lappend record_show_atomlist ""

		set center_fix_single {0 0 0 0 0 0 0}
		lappend center_fix_list $center_fix_single

		set constrain_single {0 0 0 0 0 0 0}
		lappend constrain_list $constrain_single

		incr number
	}

	set mol_sel 0
	set id [lindex $molid $mol_sel]
	::packmol::del_mol_constrainlist_refresh

	set fix_info_single [lindex $center_fix_list $id]
	set is_fixed [lindex $fix_info_single 0]
	set fix_x [lindex $fix_info_single 1]
	set fix_y [lindex $fix_info_single 2]
	set fix_z [lindex $fix_info_single 3]
	set fix_alpha [lindex $fix_info_single 4]
	set fix_beta [lindex $fix_info_single 5]
	set fix_gamma [lindex $fix_info_single 6]

	set constrain_info_single [lindex $constrain_list $id]
	set is_constrain [lindex $constrain_info_single 0]
	set constrain_x [lindex $constrain_info_single 1]
	set constrain_y [lindex $constrain_info_single 2]
	set constrain_z [lindex $constrain_info_single 3]
	set constrain_x_plus [lindex $constrain_info_single 4]
	set constrain_y_plus [lindex $constrain_info_single 5]
	set constrain_z_plus [lindex $constrain_info_single 6]

	set atom_sel [atomselect $id all]
	set atomlist [$atom_sel get serial]
	set atom_name_list [$atom_sel get name]
	set atomlist_len [llength $atomlist]
	set number 0
	while {$number<$atomlist_len} {
		set atom_serial_single [lindex $atomlist $number]
		set atom_name_single [lindex $atom_name_list $number]
		set atom_serial_name_single [format "%d %s" $atom_serial_single $atom_name_single]
		set atom_serial_name_single_empty_list {}
		lappend atom_serial_name_single_empty_list $atom_serial_name_single
		lappend atom_serial_name_list $atom_serial_name_single_empty_list
		incr number
	}

	::packmol::get_constrain_volume
	::packmol::refresh_filelist
	#position
	set number 0
	while {$number<$all_mol} {
		set is_exist 0
		set id [lindex $molid $number]
		foreach val $position {
			if {$val==$id} {
				set is_exist 1
			}
		}
		if {$is_exist==0} {
			set sel [atomselect $id all]
			set apos [$sel get {x y z}]
			lappend position $id
			lappend position $apos
		}
		incr number
	}
	set sit_sel 0
	::packmol::show_select_sit
	::packmol::able_disable
	::packmol::get_cube_volume
	::packmol::get_box_volume
	::packmol::get_sphere_volume
	::packmol::get_ellipsoid_volume
	::packmol::get_cylinder_volume
	::packmol::get_cube_xyarea
	::packmol::get_box_area
	::packmol::get_sphere_area
	::packmol::get_ellipsoid_area
	::packmol::get_cylinder_area

	.packmolview.all.first.mol_try.all.mol.molecule.file.listbox selection clear 0 end
	.packmolview.all.first.mol_try.all.mol.molecule.file.listbox selection set 0
	.packmolview.all.first.mol_try.all.mol.molecule.file.listbox see 0
#	.packmolview.all.first.mol_try.all.mol.molecule.atom.listbox selection clear 0 end
	::packmol::show_atom_selection
}

proc ::packmol::show_atom_selection {} {
	variable record_show_atomlist
	variable molid
	variable mol_sel
	variable rep_list

	.packmolview.all.first.mol_try.all.mol.molecule.atom.listbox selection clear 0 end
	set all_mol [molinfo num]
        if {$all_mol==0} {
                return
        }

        set new_molid [molinfo list]
        set id [lindex $molid $mol_sel]
        set need_to_refresh 1
        foreach val $new_molid {
                if {$val==$id} {
                        set need_to_refresh 0
                }
        }
        if {$need_to_refresh==1} {
                set msg "File does not exist, please refresh the list"
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

	set molid_length [llength $molid]
        set mol_number 0
        while {$mol_number<$molid_length} {
                set each_id [lindex $molid $mol_number]
                set each_rep_id [lindex $rep_list $each_id]
                if {$each_rep_id!=""} {
                        mol showrep $each_id $each_rep_id off
                }
                incr mol_number
        }

	set need_show_atom_str [lindex $record_show_atomlist $id]
	set need_show_atom_list [split $need_show_atom_str " "]
	set need_show_atom_list_len [llength $need_show_atom_list]

	set compare_atom_sel [atomselect $id all]
	set compare_atomlist [$compare_atom_sel get index]
	set number 0
	set atom_str_info ""
	while {$number < $need_show_atom_list_len} {
		set need_show_atom_each [lindex $need_show_atom_list $number]
		set same_index [lsearch -exact $compare_atomlist $need_show_atom_each]
		if {$same_index!=-1} {
			.packmolview.all.first.mol_try.all.mol.molecule.atom.listbox selection set $same_index
			.packmolview.all.first.mol_try.all.mol.molecule.atom.listbox see $same_index
			append atom_str_info " " $need_show_atom_each
		}
		incr number
	}

	set rep_id [lindex $rep_list $id]
	if {$atom_str_info!=""} {
		mol showrep $id $rep_id on
		mol modselect $rep_id $id [format "index%s" $atom_str_info]
		# 4 yellow
		mol modcolor $rep_id $id ColorID 4
		mol modstyle $rep_id $id "Licorice"
	} else {
		set is_select_mol_rep_none [lindex $rep_list $id]
                if {$is_select_mol_rep_none!=""} {
                        set rep_id [lindex $rep_list $id]
                        mol showrep $id $rep_id off
                }
	}
}

proc ::packmol::draw_atom {W} {
        variable radiuslist
        variable relativelist
        variable geo_sitlist_radius_sel
        variable atomlist
        variable mol_sel
        variable molid
	variable rep_list
	variable record_show_atomlist

        set new_molid [molinfo list]
        set new_molid_length [llength $new_molid]
        set molid_length [llength $molid]
        if {$new_molid_length!=$molid_length} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

        set need_to_refresh 0
        if {$new_molid_length==$molid_length} {
                set molid_index 0
                while {$molid_index<$molid_length} {
                        set this_molid [lindex $molid $molid_index]
                        set this_new_molid [lindex $new_molid $molid_index]
                        if {$this_molid!=$this_new_molid} {
                                set need_to_refresh 1
                        }
                        incr molid_index
                }
        }
        if {$need_to_refresh==1} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

	set all_mol [molinfo num]
        if {$all_mol==0} {
                return
        }

	set id [lindex $molid $mol_sel]
	set molid_length [llength $molid]
        set mol_number 0
        while {$mol_number<$molid_length} {
                set each_id [lindex $molid $mol_number]
                set each_rep_id [lindex $rep_list $each_id]
                if {$each_rep_id!=""} {
                        mol showrep $each_id $each_rep_id off
                }
                incr mol_number
        }

	set atom_str_info ""
	foreach index [$W curselection] {
		set atom_id [expr [lindex $atomlist $index] - 1]
		append atom_str_info " " $atom_id
	}
	lset record_show_atomlist $id $atom_str_info

	set is_select_mol_rep_none [lindex $rep_list $id]
	if {$is_select_mol_rep_none==""} {
		set rep_id [molinfo $id get numreps]
		lset rep_list $id $rep_id

		if {$atom_str_info!=""} {
			mol selection [format "index%s" $atom_str_info]
			mol color ColorID 4
			mol representation "Licorice"
			mol addrep $id
		} else {
			mol addrep $id
		}
	} else {
		set rep_id [lindex $rep_list $id]
		if {$atom_str_info!=""} {
			mol showrep $id $rep_id on
			mol modselect $rep_id $id [format "index%s" $atom_str_info]
			# 4 yellow
			mol modcolor $rep_id $id ColorID 4
			mol modstyle $rep_id $id "Licorice"
		} else {
			mol showrep $id $rep_id off
		}
	}
}

proc ::packmol::change_constrain {} {
	variable is_constrain
	variable constrain_x
        variable constrain_y
        variable constrain_z
        variable constrain_x_plus
        variable constrain_y_plus
	variable constrain_z_plus
	variable molid
	variable all_mol
	variable mol_sel
	variable constrain_list

	set new_molid [molinfo list]
        set new_molid_length [llength $new_molid]
        set molid_length [llength $molid]
        if {$new_molid_length!=$molid_length} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

        set need_to_refresh 0
        if {$new_molid_length==$molid_length} {
                set molid_index 0
                while {$molid_index<$molid_length} {
                        set this_molid [lindex $molid $molid_index]
                        set this_new_molid [lindex $new_molid $molid_index]
                        if {$this_molid!=$this_new_molid} {
                                set need_to_refresh 1
                        }
                        incr molid_index
                }
        }
        if {$need_to_refresh==1} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

	set all_mol [molinfo num]
        if {$all_mol==0} {
                return
        }

	if {[catch {set is_none [expr $constrain_x / 1]}]} {
		set constrain_x 0
	}
	if {[catch {set is_none [expr $constrain_y / 1]}]} {
		set constrain_y 0
	}
	if {[catch {set is_none [expr $constrain_z / 1]}]} {
		set constrain_z 0
	}
	if {[catch {set is_none [expr $constrain_x_plus / 1]}]} {
		set constrain_x_plus 0
	}
	if {[catch {set is_none [expr $constrain_y_plus / 1]}]} {
		set constrain_y_plus 0
	}
	if {[catch {set is_none [expr $constrain_z_plus / 1]}]} {
		set constrain_z_plus 0
	}

	set id [lindex $molid $mol_sel]
	set constrain_single {}
	lappend constrain_single $is_constrain
	lappend constrain_single $constrain_x
	lappend constrain_single $constrain_y
	lappend constrain_single $constrain_z
	lappend constrain_single $constrain_x_plus
	lappend constrain_single $constrain_y_plus
	lappend constrain_single $constrain_z_plus
	lset constrain_list $id $constrain_single
}

proc ::packmol::change_fixed {} {
	variable molid
	variable all_mol
	variable is_fixed
	variable fix_x
	variable fix_y
	variable fix_z
	variable fix_alpha
	variable fix_beta
	variable fix_gamma
	variable center_fix_list
	variable mol_sel
	variable position

	set new_molid [molinfo list]
        set new_molid_length [llength $new_molid]
        set molid_length [llength $molid]
        if {$new_molid_length!=$molid_length} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

        set need_to_refresh 0
        if {$new_molid_length==$molid_length} {
                set molid_index 0
                while {$molid_index<$molid_length} {
                        set this_molid [lindex $molid $molid_index]
                        set this_new_molid [lindex $new_molid $molid_index]
                        if {$this_molid!=$this_new_molid} {
                                set need_to_refresh 1
                        }
                        incr molid_index
                }
        }
        if {$need_to_refresh==1} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

	set all_mol [molinfo num]
        if {$all_mol==0} {
                return
        }

	if {[catch {set is_none [expr $fix_x / 1]}]} {
		set fix_x 0
	}
	if {[catch {set is_none [expr $fix_y / 1]}]} {
		set fix_y 0
	}
	if {[catch {set is_none [expr $fix_z / 1]}]} {
		set fix_z 0
	}
	if {[catch {set is_none [expr $fix_alpha / 1]}]} {
		set fix_alpha 0
	}
	if {[catch {set is_none [expr $fix_beta / 1]}]} {
		set fix_beta 0
	}
	if {[catch {set is_none [expr $fix_gamma / 1]}]} {
		set fix_gamma 0
	}

	set id [lindex $molid $mol_sel]
	set fix_center_single {}
	lappend fix_center_single $is_fixed
	lappend fix_center_single $fix_x
	lappend fix_center_single $fix_y
	lappend fix_center_single $fix_z
	lappend fix_center_single $fix_alpha
	lappend fix_center_single $fix_beta
	lappend fix_center_single $fix_gamma
	lset center_fix_list $id $fix_center_single

	# default
	set sel [atomselect $id all]
	set id_number [lsearch $position $id]
	set pos_number [expr $id_number + 1]

	set apos [lindex $position $pos_number]
	$sel set {x y z} $apos

	if {$is_fixed==0} {
		# fix
		set sel [atomselect $id all]
		set acen [measure center $sel]
		$sel move [trans center $acen axis x $fix_alpha]
		$sel move [trans center $acen axis y $fix_beta]
		$sel move [trans center $acen axis z $fix_gamma]

		set trans_matrix {}
		lappend trans_matrix $fix_x
		lappend trans_matrix $fix_y
		lappend trans_matrix $fix_z
		$sel moveby $trans_matrix
	} else {
		# center fix
		set sel [atomselect $id all]
		set acen [measure center $sel]
		$sel move [trans center $acen axis x $fix_alpha]
		$sel move [trans center $acen axis y $fix_beta]
		$sel move [trans center $acen axis z $fix_gamma]

		set center_x [lindex $acen 0]
		set center_y [lindex $acen 1]
		set center_z [lindex $acen 2]
		set trans_matrix {}
		lappend trans_matrix [expr $fix_x - $center_x]
		lappend trans_matrix [expr $fix_y - $center_y]
		lappend trans_matrix [expr $fix_z - $center_z]
		$sel moveby $trans_matrix
	}
}

proc ::packmol::change_number {} {
	variable molid
	variable mol_sel
        variable sit_sel
	variable structure_num
	variable structure_num_list

	set id [lindex $molid $mol_sel]
	lset structure_num_list $id $structure_num
}

proc ::packmol::change_resnumber {} {
	variable molid
        variable mol_sel
        variable sit_sel
        variable resnumber
        variable resnumber_list

        set id [lindex $molid $mol_sel]
	set resnumber_list $id $resnumber
}

proc ::packmol::reset_zero {} {
	variable cube_start_x
        variable cube_start_y
        variable cube_start_z
        variable cube_size
        variable cube_color
        variable cube_width
	variable box_start_x
        variable box_start_y
        variable box_start_z
        variable box_end_x
        variable box_end_y
        variable box_end_z
        variable box_width
        variable box_color
        variable sphere_x
        variable sphere_y
        variable sphere_z
        variable sphere_r
        variable sphere_resolution
        variable sphere_color
        variable ellipsoid_a1
        variable ellipsoid_b1
        variable ellipsoid_c1
        variable ellipsoid_a2
        variable ellipsoid_b2
        variable ellipsoid_c2
        variable ellipsoid_d
        variable ellipsoid_color
        variable ellipsoid_resolution
        variable plane_a
        variable plane_b
        variable plane_c
        variable plane_d
        variable plane_color
        variable plane_min_a
        variable plane_min_b
        variable plane_min_c
        variable plane_max_a
        variable plane_max_b
        variable plane_max_c
        variable cylinder_fir_circle_x
        variable cylinder_fir_circle_y
        variable cylinder_fir_circle_z
        variable cylinder_sec_circle_x
        variable cylinder_sec_circle_y
        variable cylinder_sec_circle_z
        variable cylinder_r
        variable cylinder_color
        variable cylinder_resolution
	variable cylinder_length
	variable gaussian_a1
        variable gaussian_a2
        variable gaussian_b1
        variable gaussian_b2
        variable gaussian_c
        variable gaussian_h
	variable box_value
	variable sphere_value
	variable ellipsoid_value
	variable cylinder_value
	variable cube_value

	set cube_start_x 0
	set cube_start_y 0
	set cube_start_z 0
	set cube_size 0
	set cube_width 1
	set cube_color "0 blue"

	set box_start_x 0
        set box_start_y 0
        set box_start_z 0
        set box_end_x 0
        set box_end_y 0
        set box_end_z 0
        set box_width 1
        set box_color "0 blue"

        set sphere_x 0
        set sphere_y 0
        set sphere_z 0
        set sphere_r 0
        set sphere_resolution 30
        set sphere_color "0 blue"

        set ellipsoid_a1 0
        set ellipsoid_b1 0
        set ellipsoid_c1 0      
        set ellipsoid_a2 0
        set ellipsoid_b2 0
        set ellipsoid_c2 0
        set ellipsoid_d 0
        set ellipsoid_color "0 blue"
        set ellipsoid_resolution 2

        set plane_a 0
        set plane_b 0
        set plane_c 0
        set plane_d 0
        set plane_color "0 blue"
#	set plane_min_a 0.0
#	set plane_min_b 0.0                
#	set plane_min_c 0.0
#	set plane_max_a 5.0
#	set plane_max_b 5.0
#	set plane_max_c 5.0

        set cylinder_fir_circle_x 0
        set cylinder_fir_circle_y 0
        set cylinder_fir_circle_z 0                
        set cylinder_sec_circle_x 0
        set cylinder_sec_circle_y 0
        set cylinder_sec_circle_z 0
        set cylinder_r 0
        set cylinder_length 0
        set cylinder_color "0 blue"
        set cylinder_resolution 30

	set gaussian_a1 ""
	set gaussian_a2 ""
	set gaussian_b1 ""
	set gaussian_b2 ""
	set gaussian_c ""
	set gaussian_h ""

	set cube_value 0.00
	set box_value 0.00
	set sphere_value 0.00
	set ellipsoid_value 0.00
	set cylinder_value 0.00
}

proc ::packmol::add_sit {} {
	variable sitlist
	variable res_moleculelist
        variable res_atomlist
	variable radiuslist
	variable fscalelist
        variable short_radiuslist
        variable short_radius_scalelist
	variable relativelist
	variable sit_sel
	variable all_mol
	variable graphic_line_list
	variable graphic_label_list
	variable graphic_info_list
	variable graphic
	variable cube_start_x
        variable cube_start_y
        variable cube_start_z
        variable cube_size
        variable cube_color
        variable cube_width
	variable mol_material
	variable molid
	variable mol_sel
	variable draw_label
	variable label_size

	::packmol::reset_zero
	set all_mol [molinfo num]
        if {$all_mol==0} {
                return
        }

	set new_molid [molinfo list]
        set new_molid_length [llength $new_molid]
        set molid_length [llength $molid]
        if {$new_molid_length!=$molid_length} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

        set need_to_refresh 0
        if {$new_molid_length==$molid_length} {
                set molid_index 0
                while {$molid_index<$molid_length} {
                        set this_molid [lindex $molid $molid_index]
                        set this_new_molid [lindex $new_molid $molid_index]
                        if {$this_molid!=$this_new_molid} {
                                set need_to_refresh 1
                        }
                        incr molid_index
                }
        }
        if {$need_to_refresh==1} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

	set cube_start_x 0
        set cube_start_y 0
        set cube_start_z 0
        set cube_size 0
        set cube_width 1
        set cube_color "0 blue"

	set new_sit "cube"
	lappend sitlist $new_sit

	set id [lindex $molid $mol_sel]
	lappend res_moleculelist $id

	set new_atom ""
	lappend res_atomlist $new_atom

	set new_radius 1
	lappend radiuslist $new_radius

	set new_fscale ""
	lappend fscalelist $new_fscale

	set new_short_radius ""
	lappend short_radiuslist $new_short_radius

	set new_short_radius_scale ""
	lappend short_radius_scalelist $new_short_radius_scale

	set new_relative "inside"
	lappend relativelist $new_relative
	::packmol::refresh_constrain_list

	set number 0
	set graphic_line_single {}
	while {$number < 12} {
		set line_flag [graphics $id line "0 0 0" "0 0 0" width 0]
		lappend graphic_line_single $line_flag
		incr number
	}
	lappend graphic_line_list $graphic_line_single

	set graphic_label_single {}
	if {$draw_label=="yes"} {
		set label_flag [graphics $id point {0 0 0}]
		lappend graphic_label_single $label_flag
		set label_flag [graphics $id text {0 0 0} "(0, 0, 0)" size $label_size]
		lappend graphic_label_single $label_flag
	}
	lappend graphic_label_list $graphic_label_single

	set graphic "cube"
	# cube
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.start.startx_spin.spinbox_start_x configure -state normal
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.start.starty_spin.spinbox_start_y configure -state normal
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.start.startz_spin.spinbox_start_z configure -state normal
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.size.spinbox configure -state normal
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.width.spinbox configure -state normal
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cube.size_color_width.color.color configure -state normal

	# box
	.packmolview.all.first.sel.up_down.graphics.all_graphics.box.start.startx_spin.spinbox_start_x configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.box.start.starty_spin.spinbox_start_y configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.box.start.startz_spin.spinbox_start_z configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.box.end.endx_spin.spinbox_end_x configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.box.end.endy_spin.spinbox_end_y configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.box.end.endz_spin.spinbox_end_z configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.box.width_color.width_spin.spinbox_width configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.box.width_color.color.color configure -state disable

	# sphere
	.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.center.x.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.center.y.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.center.z.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.r.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.color.color configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.radius_col_mat.material.material configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.sphere.res_serial_number.resolution.spin configure -state disable

	# ellipsoid
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.a1.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.b1.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc1.c1.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.a2.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.b2.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.abc2.c2.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.d.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.color.color configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.d_col_mat.material.material configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.ellipsoid.res_serial_number.resolution.spin configure -state disable

	# plane
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.abc.a.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.abc.b.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.abc.c.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.d.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.color.color configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.d_col_mat.material.material configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.max.max_a.spinbox configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.max.max_b.spinbox configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.max.max_c.spinbox configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.min.min_a.spinbox configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.min.min_b.spinbox configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.plane.min.min_c.spinbox configure -state disable

	# cylinder
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_x.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_y.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.fir.fir_circle_z.spin configure -state disable
 	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_x.spin configure -state disable
 	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_y.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.sec.sec_circle_z.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.r.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.color.color configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.r_col_mat.material.material configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.length.spin configure -state disable
	.packmolview.all.first.sel.up_down.graphics.all_graphics.cylinder.res_serial_number.resolution.spin configure -state disable

	# gaussian surface
        .packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.aone_spin.spin configure -state disable
        .packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.atwo_spin.spin configure -state disable
        .packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.fir.c_spin.spin configure -state disable
        .packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.bone_spin.spin configure -state disable
        .packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.btwo_spin.spin configure -state disable
        .packmolview.all.first.sel.up_down.graphics.all_graphics.gaussian.sec.h_spin.spin configure -state disable

	.packmolview.all.first.sel.up_down.graphics.all_graphics select .packmolview.all.first.sel.up_down.graphics.all_graphics.cube

	# add line info
	set graphic_info_single {}
	lappend graphic_info_single 6
	lappend graphic_info_single 0
	lappend graphic_info_single 0
	lappend graphic_info_single 0
	lappend graphic_info_single 0
	lappend graphic_info_single 1
	lappend graphic_info_single 0
	lappend graphic_info_list $graphic_info_single

	set sitlist_len [llength $sitlist]
	set sit_sel [expr $sitlist_len - 1]
	.packmolview.all.first.sel.sit_list.sitlist.listbox selection clear 0 end
	.packmolview.all.first.sel.sit_list.sitlist.listbox selection set $sit_sel
}

proc ::packmol::del_sit {} {
        variable sitlist
	variable res_moleculelist
        variable res_atomlist
	variable radiuslist
	variable fscalelist
        variable short_radiuslist
        variable short_radius_scalelist
	variable relativelist
	variable geo_sitlist_radius_sel
	variable sit_sel
	variable mol_sel
	variable all_mol
	variable graphic_line_list
	variable graphic_label_list
	variable graphic_info_list
	variable molid

	::packmol::reset_zero
	set all_mol [molinfo num]
        if {$all_mol==0} {
                return
        }

	set new_molid [molinfo list]
        set new_molid_length [llength $new_molid]
        set molid_length [llength $molid]
        if {$new_molid_length!=$molid_length} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

        set need_to_refresh 0
        if {$new_molid_length==$molid_length} {
                set molid_index 0
                while {$molid_index<$molid_length} {
                        set this_molid [lindex $molid $molid_index]
                        set this_new_molid [lindex $new_molid $molid_index]
                        if {$this_molid!=$this_new_molid} {
                                set need_to_refresh 1
                        }
                        incr molid_index
                }
        }
        if {$need_to_refresh==1} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

	set sitlist_len [llength $sitlist]
        if {$sitlist_len==0} {
                return
        }

	set res_id [lindex $res_moleculelist $sit_sel]
	set sitlist [lreplace $sitlist $sit_sel $sit_sel]
	set res_moleculelist [lreplace $res_moleculelist $sit_sel $sit_sel]
	set res_atomlist [lreplace $res_atomlist $sit_sel $sit_sel]
	set relativelist [lreplace $relativelist $sit_sel $sit_sel]
	set radiuslist [lreplace $radiuslist $sit_sel $sit_sel]
	set fscalelist [lreplace $fscalelist $sit_sel $sit_sel]
	set short_radiuslist [lreplace $short_radiuslist $sit_sel $sit_sel]
	set short_radius_scalelist [lreplace $short_radius_scalelist $sit_sel $sit_sel]

	::packmol::refresh_constrain_list

	set need_to_del_list [lindex $graphic_line_list $sit_sel]
	set need_to_del_list_len [llength $need_to_del_list]
	set number 0
	while {$number<$need_to_del_list_len} {
		set delete_num [lindex $need_to_del_list $number]
		graphics $res_id delete $delete_num
		incr number
	}
	set graphic_line_list [lreplace $graphic_line_list $sit_sel $sit_sel]

	set need_to_del_list [lindex $graphic_label_list $sit_sel]
	set need_to_del_list_len [llength $need_to_del_list]
	set number 0
	while {$number<$need_to_del_list_len} {
		set delete_num [lindex $need_to_del_list $number]
		graphics $res_id delete $delete_num
		incr number
	}
	set graphic_label_list [lreplace $graphic_label_list $sit_sel $sit_sel]
	set graphic_info_list [lreplace $graphic_info_list $sit_sel $sit_sel]

	set sit_sel 0
	.packmolview.all.first.sel.sit_list.sitlist.listbox selection clear 0 end
	.packmolview.all.first.sel.sit_list.sitlist.listbox selection set $sit_sel
	::packmol::able_disable
	::packmol::show_select_sit
	::packmol::get_cube_volume
	::packmol::get_box_volume
	::packmol::get_sphere_volume
	::packmol::get_ellipsoid_volume
	::packmol::get_cylinder_volume
	::packmol::get_cube_xyarea
	::packmol::get_box_area
	::packmol::get_sphere_area
	::packmol::get_ellipsoid_area
	::packmol::get_cylinder_area
}

proc ::packmol::getsit_info {W} {
	variable sitlist
	variable radiuslist
	variable relativelist
	variable geo_sitlist_radius_sel
	variable mol_sel
	variable sit_sel
	variable graphic_info_list
	variable cube_start_x
        variable cube_start_y
        variable cube_start_z
        variable cube_size
        variable cube_color
        variable cube_width
	variable box_start_x
        variable box_start_y
        variable box_start_z
        variable box_end_x
        variable box_end_y
        variable box_end_z
	variable box_width
        variable box_color
	variable sphere_x
        variable sphere_y
        variable sphere_z
        variable sphere_r
        variable sphere_resolution
        variable sphere_color
	variable ellipsoid_a1
        variable ellipsoid_b1
        variable ellipsoid_c1
        variable ellipsoid_a2
        variable ellipsoid_b2
        variable ellipsoid_c2
        variable ellipsoid_d
        variable ellipsoid_color
        variable ellipsoid_resolution
	variable plane_a
        variable plane_b
        variable plane_c
        variable plane_d
        variable plane_color
	variable cylinder_fir_circle_x
        variable cylinder_fir_circle_y
        variable cylinder_fir_circle_z
        variable cylinder_sec_circle_x
        variable cylinder_sec_circle_y
        variable cylinder_sec_circle_z
        variable cylinder_r
	variable cylinder_length
        variable cylinder_color
        variable cylinder_resolution
	variable gaussian_a1
        variable gaussian_a2
        variable gaussian_b1
        variable gaussian_b2
        variable gaussian_c
        variable gaussian_h
	variable graphic
	variable all_color_list
	variable all_material_list
	variable graphic
	variable molid

	set new_molid [molinfo list]
	foreach index [$W curselection] {
		set sit_sel $index

		set id [lindex $molid $mol_sel]
                set need_to_refresh 1
                foreach val $new_molid {
                        if {$val==$id} {
                                set need_to_refresh 0
                        }
                }
                if {$need_to_refresh==1} {
                        set msg "File list has changed, please refresh the list."
                        tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                        return
                }

		::packmol::refresh_constrain_list
		::packmol::show_select_sit
		::packmol::able_disable
		::packmol::get_cube_volume
		::packmol::get_box_volume
		::packmol::get_sphere_volume
		::packmol::get_ellipsoid_volume
		::packmol::get_cylinder_volume
		::packmol::get_cube_xyarea
		::packmol::get_box_area
		::packmol::get_sphere_area
		::packmol::get_ellipsoid_area
		::packmol::get_cylinder_area
	}
}

proc ::packmol::select_draw_label {} {
        variable graphic_info_list
        variable graphic_label_list
	variable draw_label
	variable all_color_list
	variable mol_material
	variable res_moleculelist
	variable molid
	variable label_size

        set new_molid [molinfo list]
        set new_molid_length [llength $new_molid]
        set molid_length [llength $molid]
        if {$new_molid_length!=$molid_length} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

        set need_to_refresh 0
        if {$new_molid_length==$molid_length} {
                set molid_index 0
                while {$molid_index<$molid_length} {
                        set this_molid [lindex $molid $molid_index]
                        set this_new_molid [lindex $new_molid $molid_index]
                        if {$this_molid!=$this_new_molid} {
                                set need_to_refresh 1
                        }
                        incr molid_index
                }
        }
        if {$need_to_refresh==1} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

	set graphic_label_list_len [llength $graphic_label_list]
	set number_fir 0
	while {$number_fir < $graphic_label_list_len} {
		set res_id [lindex $res_moleculelist $number_fir]
		set graphic_label_list_single [lindex $graphic_label_list $number_fir]
		set graphic_label_list_single_len [llength $graphic_label_list_single]
		set number_sec 0
		while {$number_sec < $graphic_label_list_single_len} {
			set need_to_delete [lindex $graphic_label_list_single $number_sec]
			graphics $res_id delete $need_to_delete
			incr number_sec
		}
		incr number_fir
	}

	if {$draw_label == "yes"} {
		set res_moleculelist_len [llength $res_moleculelist]
		set number_fir 0
		while {$number_fir < $res_moleculelist_len} {
			set res_id [lindex $res_moleculelist $number_fir]
			set each_material [lindex $mol_material $res_id]
			set graphic_info_list_single [lindex $graphic_info_list $number_fir]
			set graphic_label_list_single [lindex $graphic_label_list $number_fir]
			set graphic_info_list_single_len [llength $graphic_info_list_single]

			set each_graphic [lindex $graphic_info_list_single 0]
			if {$each_graphic == 6} {
				set each_cube_start_x [lindex $graphic_info_list_single 1]
				set each_cube_start_y [lindex $graphic_info_list_single 2]
				set each_cube_start_z [lindex $graphic_info_list_single 3]
				set each_cube_size [lindex $graphic_info_list_single 4]
				set each_cube_color_id [lindex $graphic_info_list_single 6]
				set each_cube_color [lindex $all_color_list $each_cube_color_id]
				set color_list [split $each_cube_color " "]
				graphics $res_id color [lindex $color_list 0]

				set each_cube_end_x [expr $each_cube_start_x + $each_cube_size]
				set each_cube_end_y [expr $each_cube_start_y + $each_cube_size]
				set each_cube_end_z [expr $each_cube_start_z + $each_cube_size]

				set cube_label_list {}
				set cube_start_list {}
				lappend cube_start_list $each_cube_start_x $each_cube_start_y $each_cube_start_z
				set cube_end_list {}
				lappend cube_end_list $each_cube_end_x $each_cube_end_y $each_cube_end_z
				set cube_label [graphics $res_id point $cube_start_list]
				lappend cube_label_list $cube_label
				set cube_label [graphics $res_id text $cube_start_list "($each_cube_start_x, $each_cube_start_y, $each_cube_start_z)" size $label_size]
				lappend cube_label_list $cube_label

				set cube_label [graphics $res_id point $cube_end_list]
				lappend cube_label_list $cube_label
				set cube_label [graphics $res_id text $cube_end_list "($each_cube_end_x, $each_cube_end_y, $each_cube_end_z)" size $label_size]
				lappend cube_label_list $cube_label

				lset graphic_label_list $number_fir $cube_label_list
			}
			if {$each_graphic == 0} {
				set each_box_start_x [lindex $graphic_info_list_single 1]
				set each_box_start_y [lindex $graphic_info_list_single 2]
				set each_box_start_z [lindex $graphic_info_list_single 3]
				set each_box_end_x [lindex $graphic_info_list_single 4]
				set each_box_end_y [lindex $graphic_info_list_single 5]
				set each_box_end_z [lindex $graphic_info_list_single 6]
				set each_box_color_id [lindex $graphic_info_list_single 8]
				set each_box_color [lindex $all_color_list $each_box_color_id]
				set color_list [split $each_box_color " "]
				graphics $res_id color [lindex $color_list 0]

				set box_label_list {}
				set box_start_list {}
				lappend box_start_list $each_box_start_x $each_box_start_y $each_box_start_z
				set box_end_list {}
				lappend box_end_list $each_box_end_x $each_box_end_y $each_box_end_z
 				set box_label [graphics $res_id point $box_start_list]
				lappend box_label_list $box_label
				set box_label [graphics $res_id text $box_start_list "($each_box_start_x, $each_box_start_y, $each_box_start_z)" size $label_size]
				lappend box_label_list $box_label

				set box_label [graphics $res_id point $box_end_list]
				lappend box_label_list $box_label
				set box_label [graphics $res_id text $box_end_list "($each_box_end_x, $each_box_end_y, $each_box_end_z)" size $label_size]
				lappend box_label_list $box_label

				lset graphic_label_list $number_fir $box_label_list
			}
			if {$each_graphic == 1} {
				set each_sphere_x [lindex $graphic_info_list_single 1]
				set each_sphere_y [lindex $graphic_info_list_single 2]
                                set each_sphere_z [lindex $graphic_info_list_single 3]
				set each_sphere_r [lindex $graphic_info_list_single 4]
				set each_sphere_color_id [lindex $graphic_info_list_single 5]
				set each_sphere_color [lindex $all_color_list $each_sphere_color_id]
                                set color_list [split $each_sphere_color_id " "]
                                graphics $res_id color [lindex $color_list 0]

				set sphere_label_list {}
				set sphere_center_list {}
				lappend sphere_center_list $each_sphere_x $each_sphere_y $each_sphere_z

				set sphere_label [graphics $res_id point $sphere_center_list]
				lappend sphere_label_list $sphere_label

				set sphere_label [graphics $res_id text $sphere_center_list "($each_sphere_x, $each_sphere_y, $each_sphere_z)" size $label_size]
				lappend sphere_label_list $sphere_label

				set each_sphere_surface_x [expr $each_sphere_x + $each_sphere_r]
				set sphere_surface_list {}
				lappend sphere_surface_list $each_sphere_surface_x $each_sphere_y $each_sphere_z
				set sphere_label [graphics $res_id point $sphere_surface_list]
				lappend sphere_label_list $sphere_label

				set sphere_label [graphics $res_id text $sphere_surface_list "Mol#$res_id" size $label_size]
				lappend sphere_label_list $sphere_label

				lset graphic_label_list $number_fir $sphere_label_list
			}
			if {$each_graphic == 2} {
				set each_ellipsoid_a1 [lindex $graphic_info_list_single 1]
				set each_ellipsoid_b1 [lindex $graphic_info_list_single 2]
				set each_ellipsoid_c1 [lindex $graphic_info_list_single 3]
				set each_ellipsoid_color_id [lindex $graphic_info_list_single 8]
				set each_ellipsoid_color [lindex $all_color_list $each_ellipsoid_color_id]
				set color_list [split $each_ellipsoid_color " "]
				set each_ellipsoid_a2 [lindex $graphic_info_list_single 4]
                                set each_ellipsoid_b2 [lindex $graphic_info_list_single 5]
                                set each_ellipsoid_c2 [lindex $graphic_info_list_single 6]
                                set each_ellipsoid_d [lindex $graphic_info_list_single 7]

				if {$each_ellipsoid_a2==0 || $each_ellipsoid_b2==0 || $each_ellipsoid_c2==0 || $each_ellipsoid_d==0} {
                                        set emptylist {}
                                        lset graphic_label_list $number_fir $emptylist
                                        return
                                }

				graphics $res_id color [lindex $color_list 0]

				set ellipsoid_label_list {}
				set ellipsoid_center_list {}
				lappend ellipsoid_center_list $each_ellipsoid_a1 $each_ellipsoid_b1 $each_ellipsoid_c1

				set ellipsoid_label [graphics $res_id point $ellipsoid_center_list]
				lappend ellipsoid_label_list $ellipsoid_label
				set ellipsoid_label [graphics $res_id text $ellipsoid_center_list "($each_ellipsoid_a1, $each_ellipsoid_b1, $each_ellipsoid_c1)" size $label_size]
				lappend ellipsoid_label_list $ellipsoid_label

				lset graphic_label_list $number_fir $ellipsoid_label_list
			}
			if {$each_graphic == 3} {
				set each_plane_a [lindex $graphic_info_list_single 1]
                                set each_plane_b [lindex $graphic_info_list_single 2]
                                set each_plane_c [lindex $graphic_info_list_single 3]

                                if {$each_plane_a==0 && $each_plane_b==0 && $each_plane_b==0} {
                                        set emptylist {}
                                        lset graphic_label_list $number_fir $emptylist
                                        return
                                }

				set each_plane_color_id [lindex $graphic_info_list_single 5]
				set each_plane_color [lindex $all_color_list $each_plane_color_id]
				set color_list [split $each_plane_color " "]
				graphics $res_id color [lindex $color_list 0]
				set each_plane_center_x [lindex $graphic_info_list_single 6]
				set each_plane_center_y [lindex $graphic_info_list_single 7]
				set each_plane_center_z [lindex $graphic_info_list_single 8]

				set plane_label_list {}
				set plane_center_list {}
				lappend plane_center_list $each_plane_center_x $each_plane_center_y $each_plane_center_z

				set plane_label [graphics $res_id point $plane_center_list]
				lappend plane_label_list $plane_label

				set plane_label [graphics $res_id text $plane_center_list "($each_plane_center_x, $each_plane_center_y, $each_plane_center_z)" size $label_size]
				lappend plane_label_list $plane_label

				lset graphic_label_list $number_fir $plane_label_list
			}
			if {$each_graphic == 4} {
				set each_cylinder_fir_circle_x [lindex $graphic_info_list_single 1]
				set each_cylinder_fir_circle_y [lindex $graphic_info_list_single 2]
				set each_cylinder_fir_circle_z [lindex $graphic_info_list_single 3]
				set each_cylinder_sec_circle_x [lindex $graphic_info_list_single 11]
				set each_cylinder_sec_circle_y [lindex $graphic_info_list_single 12]
				set each_cylinder_sec_circle_z [lindex $graphic_info_list_single 13]
				set each_cylinder_color_id [lindex $graphic_info_list_single 9]
				set each_cylinder_color [lindex $all_color_list $each_cylinder_color_id]
				set color_list [split $each_cylinder_color " "]
				graphics $res_id color [lindex $color_list 0]

				set cylinder_label_list {}
				set cylinder_center_fir_list {}
				lappend cylinder_center_fir_list $each_cylinder_fir_circle_x $each_cylinder_fir_circle_y $each_cylinder_fir_circle_z

				set cylinder_label [graphics $res_id point $cylinder_center_fir_list]
				lappend cylinder_label_list $cylinder_label

				set cylinder_label [graphics $res_id text $cylinder_center_fir_list "($each_cylinder_fir_circle_x, $each_cylinder_fir_circle_y, $each_cylinder_fir_circle_z)" size $label_size]
				lappend cylinder_label_list $cylinder_label

				set cylinder_center_sec_list {}
				lappend cylinder_center_sec_list $each_cylinder_sec_circle_x $each_cylinder_sec_circle_y $each_cylinder_sec_circle_z

				set cylinder_label [graphics $res_id point $cylinder_center_sec_list]
				lappend cylinder_label_list $cylinder_label

				set cylinder_label [graphics $res_id text $cylinder_center_sec_list "($each_cylinder_sec_circle_x, $each_cylinder_sec_circle_y, $each_cylinder_sec_circle_z)" size $label_size]
				lappend cylinder_label_list $cylinder_label

				lset graphic_label_list $number_fir $cylinder_label_list
			}
			incr number_fir
		}	
	}
}

proc ::packmol::select_draw_shape {} {
        variable graphic_info_list
	variable graphic_line_list
	variable draw_shape
        variable all_color_list
	variable mol_material
	variable res_moleculelist
	variable molid

        set new_molid [molinfo list]
        set new_molid_length [llength $new_molid]
        set molid_length [llength $molid]
        if {$new_molid_length!=$molid_length} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

        set need_to_refresh 0
        if {$new_molid_length==$molid_length} {
                set molid_index 0
                while {$molid_index<$molid_length} {
                        set this_molid [lindex $molid $molid_index]
                        set this_new_molid [lindex $new_molid $molid_index]
                        if {$this_molid!=$this_new_molid} {
                                set need_to_refresh 1
                        }
                        incr molid_index
                }
        }
        if {$need_to_refresh==1} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

	set graphic_line_list_len [llength $graphic_line_list]
	set number_fir 0
	while {$number_fir < $graphic_line_list_len} {
		set res_id [lindex $res_moleculelist $number_fir]
                set graphic_line_list_single [lindex $graphic_line_list $number_fir]
                set graphic_line_list_single_len [llength $graphic_line_list_single]
                set number_sec 0
                while {$number_sec < $graphic_line_list_single_len} {
			set need_to_delete [lindex $graphic_line_list_single $number_sec]
			graphics $res_id delete $need_to_delete
                        incr number_sec
                }
                incr number_fir
	}

	if {$draw_shape == "yes"} {
		set res_moleculelist_len [llength $res_moleculelist]
                set number_fir 0
                while {$number_fir < $res_moleculelist_len} {
			set res_id [lindex $res_moleculelist $number_fir]
                        set each_material [lindex $mol_material $res_id]
                        set graphic_info_list_single [lindex $graphic_info_list $number_fir]
                        set graphic_line_single [lindex $graphic_line_list $number_fir]
                        set graphic_info_list_single_len [llength $graphic_info_list_single]

			set each_graphic [lindex $graphic_info_list_single 0]
			if {$each_graphic == 6} {
				set each_cube_start_x [lindex $graphic_info_list_single 1]
                                set each_cube_start_y [lindex $graphic_info_list_single 2]
                                set each_cube_start_z [lindex $graphic_info_list_single 3]
                                set each_cube_size [lindex $graphic_info_list_single 4]
				set each_cube_width [lindex $graphic_info_list_single 5]
                                set each_cube_color_id [lindex $graphic_info_list_single 6]
                                set each_cube_color [lindex $all_color_list $each_cube_color_id]
                                set color_list [split $each_cube_color " "]
                                graphics $res_id color [lindex $color_list 0]

                                set each_cube_end_x [expr $each_cube_start_x + $each_cube_size]
                                set each_cube_end_y [expr $each_cube_start_y + $each_cube_size]
                                set each_cube_end_z [expr $each_cube_start_z + $each_cube_size]

				set cube_line_list {}
                                set cube_line [graphics $res_id line "$each_cube_start_x $each_cube_end_y $each_cube_start_z" "$each_cube_end_x $each_cube_end_y $each_cube_start_z" width $each_cube_width]
                                lappend cube_line_list $cube_line
                                set cube_line [graphics $res_id line "$each_cube_end_x $each_cube_end_y $each_cube_start_z" "$each_cube_end_x $each_cube_start_y $each_cube_start_z" width $each_cube_width]
                                lappend cube_line_list $cube_line
                                set cube_line [graphics $res_id line "$each_cube_end_x $each_cube_start_y $each_cube_start_z" "$each_cube_start_x $each_cube_start_y $each_cube_start_z" width $each_cube_width]
                                lappend cube_line_list $cube_line
                                set cube_line [graphics $res_id line "$each_cube_start_x $each_cube_start_y $each_cube_start_z" "$each_cube_start_x $each_cube_end_y $each_cube_start_z" width $each_cube_width]
                                lappend cube_line_list $cube_line

                                set cube_line [graphics $res_id line "$each_cube_start_x $each_cube_end_y $each_cube_end_z" "$each_cube_end_x $each_cube_end_y $each_cube_end_z" width $each_cube_width]
                                lappend cube_line_list $cube_line
                                set cube_line [graphics $res_id line "$each_cube_end_x $each_cube_end_y $each_cube_end_z" "$each_cube_end_x $each_cube_start_y $each_cube_end_z" width $each_cube_width]
                                lappend cube_line_list $cube_line
                                set cube_line [graphics $res_id line "$each_cube_end_x $each_cube_start_y $each_cube_end_z" "$each_cube_start_x $each_cube_start_y $each_cube_end_z" width $each_cube_width]
                                lappend cube_line_list $cube_line
                                set cube_line [graphics $res_id line "$each_cube_start_x $each_cube_start_y $each_cube_end_z" "$each_cube_start_x $each_cube_end_y $each_cube_end_z" width $each_cube_width]
                                lappend cube_line_list $cube_line

                                set cube_line [graphics $res_id line "$each_cube_start_x $each_cube_end_y $each_cube_start_z" "$each_cube_start_x $each_cube_end_y $each_cube_end_z" width $each_cube_width]
                                lappend cube_line_list $cube_line
                                set cube_line [graphics $res_id line "$each_cube_end_x $each_cube_end_y $each_cube_start_z" "$each_cube_end_x $each_cube_end_y $each_cube_end_z" width $each_cube_width]
                                lappend cube_line_list $cube_line
                                set cube_line [graphics $res_id line "$each_cube_end_x $each_cube_start_y $each_cube_start_z" "$each_cube_end_x $each_cube_start_y $each_cube_end_z" width $each_cube_width]
                                lappend cube_line_list $cube_line
                                set cube_line [graphics $res_id line "$each_cube_start_x $each_cube_start_y $each_cube_start_z" "$each_cube_start_x $each_cube_start_y $each_cube_end_z" width $each_cube_width]
                                lappend cube_line_list $cube_line

                                lset graphic_line_list $number_fir $cube_line_list
			}

			if {$each_graphic == 0} {
                                set each_box_start_x [lindex $graphic_info_list_single 1]
                                set each_box_start_y [lindex $graphic_info_list_single 2]
                                set each_box_start_z [lindex $graphic_info_list_single 3]
                                set each_box_end_x [lindex $graphic_info_list_single 4]
                                set each_box_end_y [lindex $graphic_info_list_single 5]
                                set each_box_end_z [lindex $graphic_info_list_single 6]
				set each_box_width [lindex $graphic_info_list_single 7]
                                set each_box_color_id [lindex $graphic_info_list_single 8]
                                set each_box_color [lindex $all_color_list $each_box_color_id]
                                set color_list [split $each_box_color " "]

				graphics $res_id color [lindex $color_list 0]
				set box_line_list {}
				set box_line [graphics $res_id line "$each_box_start_x $each_box_end_y $each_box_start_z" "$each_box_end_x $each_box_end_y $each_box_start_z" width $each_box_width]
				lappend box_line_list $box_line
				set box_line [graphics $res_id line "$each_box_end_x $each_box_end_y $each_box_start_z" "$each_box_end_x $each_box_start_y $each_box_start_z" width $each_box_width]
				lappend box_line_list $box_line
				set box_line [graphics $res_id line "$each_box_end_x $each_box_start_y $each_box_start_z" "$each_box_start_x $each_box_start_y $each_box_start_z" width $each_box_width]
				lappend box_line_list $box_line
				set box_line [graphics $res_id line "$each_box_start_x $each_box_start_y $each_box_start_z" "$each_box_start_x $each_box_end_y $each_box_start_z" width $each_box_width]
				lappend box_line_list $box_line

				set box_line [graphics $res_id line "$each_box_start_x $each_box_end_y $each_box_end_z" "$each_box_end_x $each_box_end_y $each_box_end_z" width $each_box_width]
				lappend box_line_list $box_line
				set box_line [graphics $res_id line "$each_box_end_x $each_box_end_y $each_box_end_z" "$each_box_end_x $each_box_start_y $each_box_end_z" width $each_box_width]
				lappend box_line_list $box_line
				set box_line [graphics $res_id line "$each_box_end_x $each_box_start_y $each_box_end_z" "$each_box_start_x $each_box_start_y $each_box_end_z" width $each_box_width]
				lappend box_line_list $box_line
				set box_line [graphics $res_id line "$each_box_start_x $each_box_start_y $each_box_end_z" "$each_box_start_x $each_box_end_y $each_box_end_z" width $each_box_width]
				lappend box_line_list $box_line

				set box_line [graphics $res_id line "$each_box_start_x $each_box_end_y $each_box_start_z" "$each_box_start_x $each_box_end_y $each_box_end_z" width $each_box_width]
				lappend box_line_list $box_line
				set box_line [graphics $res_id line "$each_box_end_x $each_box_end_y $each_box_start_z" "$each_box_end_x $each_box_end_y $each_box_end_z" width $each_box_width]
				lappend box_line_list $box_line
				set box_line [graphics $res_id line "$each_box_end_x $each_box_start_y $each_box_start_z" "$each_box_end_x $each_box_start_y $each_box_end_z" width $each_box_width]
				lappend box_line_list $box_line
				set box_line [graphics $res_id line "$each_box_start_x $each_box_start_y $each_box_start_z" "$each_box_start_x $each_box_start_y $each_box_end_z" width $each_box_width]
				lappend box_line_list $box_line

				lset graphic_line_list $number_fir $box_line_list
			}
			if {$each_graphic == 1} {
				set each_sphere_x [lindex $graphic_info_list_single 1]
                                set each_sphere_y [lindex $graphic_info_list_single 2]
                                set each_sphere_z [lindex $graphic_info_list_single 3]
				set each_sphere_r [lindex $graphic_info_list_single 4]
                                set each_sphere_color_id [lindex $graphic_info_list_single 5]
                                set each_sphere_color [lindex $all_color_list $each_sphere_color_id]
                                set color_list [split $each_sphere_color_id " "]
                                graphics $res_id color [lindex $color_list 0]
				set each_sphere_resolution [lindex $graphic_info_list_single 6]

				set sphere_line_list {}
				set sphere_line [graphics $res_id sphere "$each_sphere_x $each_sphere_y $each_sphere_z" radius $each_sphere_r resolution $each_sphere_resolution]
				lappend sphere_line_list $sphere_line

				lset graphic_line_list $number_fir $sphere_line_list
			}
			if {$each_graphic == 2} {
				set each_ellipsoid_a1 [lindex $graphic_info_list_single 1]
                                set each_ellipsoid_b1 [lindex $graphic_info_list_single 2]
                                set each_ellipsoid_c1 [lindex $graphic_info_list_single 3]
				set each_ellipsoid_a2 [lindex $graphic_info_list_single 4]
				set each_ellipsoid_b2 [lindex $graphic_info_list_single 5]
				set each_ellipsoid_c2 [lindex $graphic_info_list_single 6]
				set each_ellipsoid_d [lindex $graphic_info_list_single 7]
                                set each_ellipsoid_color_id [lindex $graphic_info_list_single 8]

				if {$each_ellipsoid_a2==0 || $each_ellipsoid_b2==0 || $each_ellipsoid_c2==0 || $each_ellipsoid_d==0} {
					set emptylist {}
					lset graphic_info_list $number_fir $emptylist
					return
				}

                                set each_ellipsoid_color [lindex $all_color_list $each_ellipsoid_color_id]
                                set color_list [split $each_ellipsoid_color " "]
                                graphics $res_id color [lindex $color_list 0]
				set each_ellipsoid_resolution [lindex $graphic_info_list_single 9]

				set a2_d [expr $each_ellipsoid_a2 * $each_ellipsoid_d]
				set b2_d [expr $each_ellipsoid_b2 * $each_ellipsoid_d]
				set c2_d [expr $each_ellipsoid_c2 * $each_ellipsoid_d]

				set ellipsoid_line_list [::packmol::approx_ellipsoid $res_id $each_ellipsoid_resolution "$a2_d $b2_d $c2_d" "$each_ellipsoid_a1 $each_ellipsoid_b1 $each_ellipsoid_c1"]
				lset graphic_line_list $number_fir $ellipsoid_line_list
			}
			if {$each_graphic == 3} {
				set each_plane_a [lindex $graphic_info_list_single 1]
                                set each_plane_b [lindex $graphic_info_list_single 2]
                                set each_plane_c [lindex $graphic_info_list_single 3]

                                if {$each_plane_a==0 && $each_plane_b==0 && $each_plane_b==0} {
                                        set emptylist {}
                                        lset graphic_info_list $number_fir $emptylist
                                        return
                                }

				set each_plane_color_id [lindex $graphic_info_list_single 5]
                                set each_plane_color [lindex $all_color_list $each_plane_color_id]
                                set color_list [split $each_plane_color " "]
                                graphics $res_id color [lindex $color_list 0]
                                set each_one_x [lindex $graphic_info_list_single 9]
                                set each_one_y [lindex $graphic_info_list_single 10]
                                set each_one_z [lindex $graphic_info_list_single 11]
                                set each_two_x [lindex $graphic_info_list_single 12]
                                set each_two_y [lindex $graphic_info_list_single 13]
                                set each_two_z [lindex $graphic_info_list_single 14]
                                set each_three_x [lindex $graphic_info_list_single 15]
                                set each_three_y [lindex $graphic_info_list_single 16]
                                set each_three_z [lindex $graphic_info_list_single 17]
                                set each_four_x [lindex $graphic_info_list_single 18]
                                set each_four_y [lindex $graphic_info_list_single 19]
                                set each_four_z [lindex $graphic_info_list_single 20]

				set plane_line_list {}
				set plane_line [graphics $res_id triangle "$each_one_x $each_one_y $each_one_z" "$each_two_x $each_two_y $each_two_z" "$each_three_x $each_three_y $each_three_z"]
				lappend plane_line_list $plane_line
				set plane_line [graphics $res_id triangle "$each_two_x $each_two_y $each_two_z" "$each_three_x $each_three_y $each_three_z" "$each_four_x $each_four_y $each_four_z"]
				lappend plane_line_list $plane_line

				lset graphic_line_list $number_fir $plane_line_list
			}
			if {$each_graphic == 4} {
				set each_cylinder_fir_circle_x [lindex $graphic_info_list_single 1]
                                set each_cylinder_fir_circle_y [lindex $graphic_info_list_single 2]
                                set each_cylinder_fir_circle_z [lindex $graphic_info_list_single 3]
				set each_cylinder_r [lindex $graphic_info_list_single 7]
				set each_cylinder_length [lindex $graphic_info_list_single 8]
                                set each_cylinder_sec_circle_x [lindex $graphic_info_list_single 11]
                                set each_cylinder_sec_circle_y [lindex $graphic_info_list_single 12]
                                set each_cylinder_sec_circle_z [lindex $graphic_info_list_single 13]
                                set each_cylinder_color_id [lindex $graphic_info_list_single 9]
                                set each_cylinder_color [lindex $all_color_list $each_cylinder_color_id]
                                set color_list [split $each_cylinder_color " "]
                                graphics $res_id color [lindex $color_list 0]
				set each_cylinder_resolution [lindex $graphic_info_list_single 10]

				set cylinder_line_list {}
				set cylinder_line [graphics $res_id cylinder "$each_cylinder_fir_circle_x $each_cylinder_fir_circle_y $each_cylinder_fir_circle_z" "$each_cylinder_sec_circle_x $each_cylinder_sec_circle_y $each_cylinder_sec_circle_z" radius $each_cylinder_r resolution $each_cylinder_resolution]
				lappend cylinder_line_list $cylinder_line

				lset graphic_line_list $number_fir $cylinder_line_list
			}
                        incr number_fir
                }
	}
}

proc ::packmol::get_cube_volume {} {
	variable cube_size
	variable cube_value

	set cube_value_f [expr $cube_size * $cube_size * $cube_size]
	set cube_value [format "%.2f" $cube_value_f]
}

proc ::packmol::get_cube_xyarea {} {
	variable cube_size
	variable cube_xyarea

	set cube_xyarea_f [expr $cube_size * $cube_size]
	set cube_xyarea [format "%.2f" $cube_xyarea_f]
}

proc ::packmol::get_box_volume {} {
	variable box_start_x
	variable box_start_y
	variable box_start_z
	variable box_end_x
	variable box_end_y
	variable box_end_z
	variable box_value

	set minus_x [expr $box_end_x - $box_start_x]
	set minus_y [expr $box_end_y - $box_start_y]
	set minus_z [expr $box_end_z - $box_start_z]
	set box_value_f [expr $minus_x * $minus_y * $minus_z]
	set box_value [format "%.2f" $box_value_f]
}

proc ::packmol::get_box_area {} {
	variable box_xyarea
	variable box_xzarea
	variable box_yzarea
	variable box_start_x
        variable box_start_y
        variable box_start_z
        variable box_end_x
        variable box_end_y
        variable box_end_z

	set minus_x [expr $box_end_x - $box_start_x]
        set minus_y [expr $box_end_y - $box_start_y]
        set minus_z [expr $box_end_z - $box_start_z]

	set box_xyarea_f [expr $minus_x * $minus_y]
	set box_xyarea [format "%.2f" $box_xyarea_f]

	set box_xzarea_f [expr $minus_x * $minus_z]
	set box_xzarea [format "%.2f" $box_xzarea_f]

	set box_yzarea_f [expr $minus_y * $minus_z]
	set box_yzarea [format "%.2f" $box_yzarea_f]
}

proc ::packmol::draw_cube {} {
	variable cube_start_x
        variable cube_start_y
        variable cube_start_z
        variable cube_size
        variable cube_color
        variable cube_width
	variable mol_sel
        variable sit_sel
        variable sitlist
        variable radiuslist
        variable relativelist
        variable geo_sitlist_radius_sel
        variable graphic_info_list
        variable graphic_line_list
        variable graphic
        variable molid
        variable cube_value
        variable draw_shape
	variable res_moleculelist

        set new_molid [molinfo list]
        set new_molid_length [llength $new_molid]
        set molid_length [llength $molid]
        if {$new_molid_length!=$molid_length} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

        set need_to_refresh 0
        if {$new_molid_length==$molid_length} {
                set molid_index 0
                while {$molid_index<$molid_length} {
                        set this_molid [lindex $molid $molid_index]
                        set this_new_molid [lindex $new_molid $molid_index]
                        if {$this_molid!=$this_new_molid} {
                                set need_to_refresh 1
                        }
                        incr molid_index
                }
        }
        if {$need_to_refresh==1} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

        set sitlist_len [llength $sitlist]
        if {$sitlist_len==0} {
                return
        }

	set res_id [lindex $res_moleculelist $sit_sel]

	if {[catch {set is_none [expr $cube_start_x / 1]}]} {
                set cube_start_x 0
        }
        if {[catch {set is_none [expr $cube_start_y / 1]}]} {
                set cube_start_y 0
        }
        if {[catch {set is_none [expr $cube_start_z / 1]}]} {
                set cube_start_z 0
        }
        if {[catch {set is_none [expr $cube_size / 1]}]} {
                set cube_size 0
        }
        if {[catch {set is_none [expr $cube_width / 1]}]} {
                set cube_width 1
        }

	set color_list [split $cube_color " "]
        set cube_info_single_update {}
        set cube_flag 6
        lappend cube_info_single_update $cube_flag
        lappend cube_info_single_update $cube_start_x
        lappend cube_info_single_update $cube_start_y
        lappend cube_info_single_update $cube_start_z
        lappend cube_info_single_update $cube_size
        lappend cube_info_single_update $cube_width
        lappend cube_info_single_update [lindex $color_list 0]
        lset graphic_info_list $sit_sel $cube_info_single_update
        ::packmol::get_cube_volume
	::packmol::get_cube_xyarea

        ::packmol::draw_cube_label
        set need_to_del_list [lindex $graphic_line_list $sit_sel]
        set need_to_del_list_len [llength $need_to_del_list]
        set number 0
        while {$number<$need_to_del_list_len} {
                set delete_num [lindex $need_to_del_list $number]
                graphics $res_id delete $delete_num
                incr number
        }

	if {$draw_shape == "no"} {
                set cube_line_list {}
                lset graphic_line_list $sit_sel $cube_line_list
                return
        }

	set cube_end_x [expr $cube_start_x + $cube_size]
	set cube_end_y [expr $cube_start_y + $cube_size]
	set cube_end_z [expr $cube_start_z + $cube_size]

        graphics $res_id color [lindex $color_list 0]
        set cube_line_list {}
        set cube_line [graphics $res_id line "$cube_start_x $cube_end_y $cube_start_z" "$cube_end_x $cube_end_y $cube_start_z" width $cube_width]
        lappend cube_line_list $cube_line
        set cube_line [graphics $res_id line "$cube_end_x $cube_end_y $cube_start_z" "$cube_end_x $cube_start_y $cube_start_z" width $cube_width]
        lappend cube_line_list $cube_line
        set cube_line [graphics $res_id line "$cube_end_x $cube_start_y $cube_start_z" "$cube_start_x $cube_start_y $cube_start_z" width $cube_width]
        lappend cube_line_list $cube_line
        set cube_line [graphics $res_id line "$cube_start_x $cube_start_y $cube_start_z" "$cube_start_x $cube_end_y $cube_start_z" width $cube_width]
        lappend cube_line_list $cube_line

        set cube_line [graphics $res_id line "$cube_start_x $cube_end_y $cube_end_z" "$cube_end_x $cube_end_y $cube_end_z" width $cube_width]
        lappend cube_line_list $cube_line
        set cube_line [graphics $res_id line "$cube_end_x $cube_end_y $cube_end_z" "$cube_end_x $cube_start_y $cube_end_z" width $cube_width]
        lappend cube_line_list $cube_line
        set cube_line [graphics $res_id line "$cube_end_x $cube_start_y $cube_end_z" "$cube_start_x $cube_start_y $cube_end_z" width $cube_width]
        lappend cube_line_list $cube_line
        set cube_line [graphics $res_id line "$cube_start_x $cube_start_y $cube_end_z" "$cube_start_x $cube_end_y $cube_end_z" width $cube_width]
        lappend cube_line_list $cube_line

        set cube_line [graphics $res_id line "$cube_start_x $cube_end_y $cube_start_z" "$cube_start_x $cube_end_y $cube_end_z" width $cube_width]
        lappend cube_line_list $cube_line
        set cube_line [graphics $res_id line "$cube_end_x $cube_end_y $cube_start_z" "$cube_end_x $cube_end_y $cube_end_z" width $cube_width]
        lappend cube_line_list $cube_line
        set cube_line [graphics $res_id line "$cube_end_x $cube_start_y $cube_start_z" "$cube_end_x $cube_start_y $cube_end_z" width $cube_width]
        lappend cube_line_list $cube_line
        set cube_line [graphics $res_id line "$cube_start_x $cube_start_y $cube_start_z" "$cube_start_x $cube_start_y $cube_end_z" width $cube_width]
        lappend cube_line_list $cube_line

        lset graphic_line_list $sit_sel $cube_line_list
}

proc ::packmol::draw_cube_label {} {
	variable cube_start_x
        variable cube_start_y
        variable cube_start_z
        variable cube_size
        variable cube_color
	variable mol_sel
        variable sit_sel
        variable graphic_label_list
        variable molid
        variable draw_label
	variable res_moleculelist
	variable label_size

	set res_id [lindex $res_moleculelist $sit_sel]
        set need_to_del_list [lindex $graphic_label_list $sit_sel]
        set need_to_del_list_len [llength $need_to_del_list]
        set number 0
        while {$number<$need_to_del_list_len} {
                set delete_num [lindex $need_to_del_list $number]
                graphics $res_id delete $delete_num
                incr number
        }

        if {$draw_label == "no"} {
                set cube_label_list {}
                lset graphic_label_list $sit_sel $cube_label_list
                return
        }

        set color_list [split $cube_color " "]
        graphics $res_id color [lindex $color_list 0]

	set cube_end_x [expr $cube_start_x + $cube_size]
	set cube_end_y [expr $cube_start_y + $cube_size]
	set cube_end_z [expr $cube_start_z + $cube_size]

	set cube_label_list {}
        set cube_start_list {}
        lappend cube_start_list $cube_start_x $cube_start_y $cube_start_z
        set cube_end_list {}
        lappend cube_end_list $cube_end_x $cube_end_y $cube_end_z
        set cube_label [graphics $res_id point $cube_start_list]
        lappend cube_label_list $cube_label
        set cube_label [graphics $res_id text $cube_start_list "($cube_start_x, $cube_start_y, $cube_start_z)" size $label_size]
        lappend cube_label_list $cube_label

        set cube_label [graphics $res_id point $cube_end_list]
        lappend cube_label_list $cube_label
        set cube_label [graphics $res_id text $cube_end_list "($cube_end_x, $cube_end_y, $cube_end_z)" size $label_size]
        lappend cube_label_list $cube_label

        lset graphic_label_list $sit_sel $cube_label_list
}

proc ::packmol::draw_box {} {
	variable box_start_x
	variable box_start_y
	variable box_start_z
	variable box_end_x
	variable box_end_y
	variable box_end_z
	variable box_color
	variable box_info
	variable box_width
	variable mol_sel
	variable sit_sel
	variable sitlist
	variable radiuslist
	variable relativelist
	variable geo_sitlist_radius_sel
	variable graphic_info_list
	variable graphic_line_list
	variable graphic
	variable molid
	variable box_value
	variable draw_shape
	variable res_moleculelist

        set new_molid [molinfo list]
        set new_molid_length [llength $new_molid]
        set molid_length [llength $molid]
        if {$new_molid_length!=$molid_length} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

        set need_to_refresh 0
        if {$new_molid_length==$molid_length} {
                set molid_index 0
                while {$molid_index<$molid_length} {
                        set this_molid [lindex $molid $molid_index]
                        set this_new_molid [lindex $new_molid $molid_index]
                        if {$this_molid!=$this_new_molid} {
                                set need_to_refresh 1
                        }
                        incr molid_index
                }
        }
        if {$need_to_refresh==1} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

	set sitlist_len [llength $sitlist]
	if {$sitlist_len==0} {
		return
	}

	set res_id [lindex $res_moleculelist $sit_sel]

	if {[catch {set is_none [expr $box_start_x / 1]}]} {
		set box_start_x 0
	}
	if {[catch {set is_none [expr $box_start_y / 1]}]} {
		set box_start_y 0
	}
	if {[catch {set is_none [expr $box_start_z / 1]}]} {
		set box_start_z 0
	}
	if {[catch {set is_none [expr $box_end_x / 1]}]} {
		set box_end_x 0
	}
	if {[catch {set is_none [expr $box_end_y / 1]}]} {
		set box_end_y 0
	}
	if {[catch {set is_none [expr $box_end_z / 1]}]} {
		set box_end_z 0
	}
	if {[catch {set is_none [expr $box_width / 1]}]} {
		set box_width 1
	}

	set minus_x [expr $box_end_x - $box_start_x]
	set minus_y [expr $box_end_y - $box_start_y]
	set minus_z [expr $box_end_z - $box_start_z]
	if {$minus_x<0 || $minus_y<0 || $minus_z<0} {
		set msg "box start larger than box end"
		tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
		return
	}

	set color_list [split $box_color " "]
	set box_info_single_update {}
        set box_flag 0
        lappend box_info_single_update $box_flag
        lappend box_info_single_update $box_start_x
        lappend box_info_single_update $box_start_y
        lappend box_info_single_update $box_start_z
        lappend box_info_single_update $box_end_x
        lappend box_info_single_update $box_end_y
        lappend box_info_single_update $box_end_z
        lappend box_info_single_update $box_width
        lappend box_info_single_update [lindex $color_list 0]
        lset graphic_info_list $sit_sel $box_info_single_update
        ::packmol::get_box_volume
	::packmol::get_box_area

	::packmol::draw_box_label

	set need_to_del_list [lindex $graphic_line_list $sit_sel]
	set need_to_del_list_len [llength $need_to_del_list]
	set number 0
	while {$number<$need_to_del_list_len} {
		set delete_num [lindex $need_to_del_list $number]
		graphics $res_id delete $delete_num
		incr number
	}

	if {$draw_shape == "no"} {
		set box_line_list {}
		lset graphic_line_list $sit_sel $box_line_list
		return
	}

	graphics $res_id color [lindex $color_list 0]
	set box_line_list {}
	set box_line [graphics $res_id line "$box_start_x $box_end_y $box_start_z" "$box_end_x $box_end_y $box_start_z" width $box_width]
	lappend box_line_list $box_line
	set box_line [graphics $res_id line "$box_end_x $box_end_y $box_start_z" "$box_end_x $box_start_y $box_start_z" width $box_width]
	lappend box_line_list $box_line
	set box_line [graphics $res_id line "$box_end_x $box_start_y $box_start_z" "$box_start_x $box_start_y $box_start_z" width $box_width]
	lappend box_line_list $box_line
	set box_line [graphics $res_id line "$box_start_x $box_start_y $box_start_z" "$box_start_x $box_end_y $box_start_z" width $box_width]
	lappend box_line_list $box_line

	set box_line [graphics $res_id line "$box_start_x $box_end_y $box_end_z" "$box_end_x $box_end_y $box_end_z" width $box_width]
	lappend box_line_list $box_line
	set box_line [graphics $res_id line "$box_end_x $box_end_y $box_end_z" "$box_end_x $box_start_y $box_end_z" width $box_width]
	lappend box_line_list $box_line
	set box_line [graphics $res_id line "$box_end_x $box_start_y $box_end_z" "$box_start_x $box_start_y $box_end_z" width $box_width]
	lappend box_line_list $box_line
	set box_line [graphics $res_id line "$box_start_x $box_start_y $box_end_z" "$box_start_x $box_end_y $box_end_z" width $box_width]
	lappend box_line_list $box_line

	set box_line [graphics $res_id line "$box_start_x $box_end_y $box_start_z" "$box_start_x $box_end_y $box_end_z" width $box_width]
	lappend box_line_list $box_line
	set box_line [graphics $res_id line "$box_end_x $box_end_y $box_start_z" "$box_end_x $box_end_y $box_end_z" width $box_width]
	lappend box_line_list $box_line
	set box_line [graphics $res_id line "$box_end_x $box_start_y $box_start_z" "$box_end_x $box_start_y $box_end_z" width $box_width]
	lappend box_line_list $box_line
	set box_line [graphics $res_id line "$box_start_x $box_start_y $box_start_z" "$box_start_x $box_start_y $box_end_z" width $box_width]
	lappend box_line_list $box_line

	lset graphic_line_list $sit_sel $box_line_list
}

proc ::packmol::draw_box_label {} {
	variable box_start_x
        variable box_start_y
        variable box_start_z
        variable box_end_x
        variable box_end_y
        variable box_end_z
        variable box_color
        variable mol_sel
        variable sit_sel
	variable graphic_label_list
        variable molid
	variable draw_label
	variable res_moleculelist
	variable label_size

	set res_id [lindex $res_moleculelist $sit_sel]
	set need_to_del_list [lindex $graphic_label_list $sit_sel]
	set need_to_del_list_len [llength $need_to_del_list]
	set number 0
	while {$number<$need_to_del_list_len} {
		set delete_num [lindex $need_to_del_list $number]
		graphics $res_id delete $delete_num
		incr number
	}

	if {$draw_label == "no"} {
		set box_label_list {}
		lset graphic_label_list $sit_sel $box_label_list
		return
	}

	set color_list [split $box_color " "]
	graphics $res_id color [lindex $color_list 0]

	set box_label_list {}
	set box_start_list {}
	lappend box_start_list $box_start_x $box_start_y $box_start_z
	set box_end_list {}
	lappend box_end_list $box_end_x $box_end_y $box_end_z
	set box_label [graphics $res_id point $box_start_list]
	lappend box_label_list $box_label
	set box_label [graphics $res_id text $box_start_list "($box_start_x, $box_start_y, $box_start_z)" size $label_size]
	lappend box_label_list $box_label

	set box_label [graphics $res_id point $box_end_list]
	lappend box_label_list $box_label
	set box_label [graphics $res_id text $box_end_list "($box_end_x, $box_end_y, $box_end_z)" size $label_size]
	lappend box_label_list $box_label

        lset graphic_label_list $sit_sel $box_label_list
}

proc ::packmol::get_sphere_volume {} {
	variable sphere_x
	variable sphere_y
	variable sphere_z
	variable sphere_r
	variable sphere_value

	set pi 3.1415926
	set sphere_value_f [expr $pi * $sphere_r * $sphere_r * $sphere_r * 4 / 3]
	set sphere_value [format "%.2f" $sphere_value_f]
}

proc ::packmol::get_sphere_area {} {
        variable sphere_r
	variable sphere_area

	set pi 3.1415926
	set sphere_area_f [expr 4 * $pi * $sphere_r * $sphere_r]
	set sphere_area [format "%.2f" $sphere_area_f]
}

proc ::packmol::draw_sphere {} {
	variable sphere_x
	variable sphere_y
	variable sphere_z
	variable sphere_r
	variable sphere_resolution
	variable sphere_color
#	variable sphere_material
	variable all_material_list
	variable mol_sel
	variable sit_sel
	variable graphic_line_list
	variable graphic_info_list
	variable sitlist
	variable radiuslist
	variable relativelist
        variable geo_sitlist_radius_sel
	variable graphic
	variable sel_material
	variable molid
	variable mol_material
	variable draw_shape
	variable res_moleculelist

        set new_molid [molinfo list]
        set new_molid_length [llength $new_molid]
        set molid_length [llength $molid]
        if {$new_molid_length!=$molid_length} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

        set need_to_refresh 0
        if {$new_molid_length==$molid_length} {
                set molid_index 0
                while {$molid_index<$molid_length} {
                        set this_molid [lindex $molid $molid_index]
                        set this_new_molid [lindex $new_molid $molid_index]
                        if {$this_molid!=$this_new_molid} {
                                set need_to_refresh 1
                        }
                        incr molid_index
                }
        }
        if {$need_to_refresh==1} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

	set sitlist_len [llength $sitlist]
        if {$sitlist_len==0} {
                return
        }

	set res_id [lindex $res_moleculelist $sit_sel]

	if {[catch {set is_none [expr $sphere_x / 1]}]} {
		set sphere_x 0
	}
	if {[catch {set is_none [expr $sphere_y / 1]}]} {
		set sphere_y 0
	}
	if {[catch {set is_none [expr $sphere_z / 1]}]} {
		set sphere_z 0
	}
	if {[catch {set is_none [expr $sphere_r / 1]}]} {
		set sphere_r 0
	}
	if {[catch {set is_none [expr $sphere_resolution / 1]}]} {
		set sphere_resolution 30
	}

	set color_list [split $sphere_color " "]
	set sphere_info_single_update {}
        set sphere_flag 1
        lappend sphere_info_single_update $sphere_flag
        lappend sphere_info_single_update $sphere_x
        lappend sphere_info_single_update $sphere_y
        lappend sphere_info_single_update $sphere_z
        lappend sphere_info_single_update $sphere_r
        lappend sphere_info_single_update [lindex $color_list 0]
        lappend sphere_info_single_update $sphere_resolution
        lset graphic_info_list $sit_sel $sphere_info_single_update
        ::packmol::get_sphere_volume
	::packmol::get_sphere_area

	::packmol::draw_sphere_label

        set need_to_del_list [lindex $graphic_line_list $sit_sel]
        set need_to_del_list_len [llength $need_to_del_list]
        set number 0
        while {$number<$need_to_del_list_len} {
                set delete_num [lindex $need_to_del_list $number]
                graphics $res_id delete $delete_num
                incr number
        }

	if {$draw_shape == "no"} {
                set sphere_line_list {}
                lset graphic_line_list $sit_sel $sphere_line_list
                return
        }

	graphics $res_id color [lindex $color_list 0]
        graphics $res_id material $sel_material
	lset mol_material $res_id $sel_material
	set sphere_line_list {}
	set sphere_line [graphics $res_id sphere "$sphere_x $sphere_y $sphere_z" radius $sphere_r resolution $sphere_resolution]
	lappend sphere_line_list $sphere_line

        lset graphic_line_list $sit_sel $sphere_line_list
}

proc ::packmol::draw_sphere_label {} {
	variable sphere_x
        variable sphere_y
        variable sphere_z
	variable sphere_r
	variable sphere_color
        variable mol_sel
        variable sit_sel
	variable graphic_label_list
        variable molid
        variable draw_label
	variable res_moleculelist
	variable label_size

	set res_id [lindex $res_moleculelist $sit_sel]
        set need_to_del_list [lindex $graphic_label_list $sit_sel]
        set need_to_del_list_len [llength $need_to_del_list]
        set number 0
        while {$number<$need_to_del_list_len} {
                set delete_num [lindex $need_to_del_list $number]
                graphics $res_id delete $delete_num
                incr number
        }

        if {$draw_label == "no"} {
                set sphere_label_list {}
                lset graphic_label_list $res_id $sphere_label_list
                return
        }

	set color_list [split $sphere_color " "]
        graphics $res_id color [lindex $color_list 0]

	set sphere_label_list {}
	set sphere_center_list {}
	lappend sphere_center_list $sphere_x $sphere_y $sphere_z

	set sphere_label [graphics $res_id point $sphere_center_list]
	lappend sphere_label_list $sphere_label

	set sphere_label [graphics $res_id text $sphere_center_list "($sphere_x, $sphere_y, $sphere_z)" size $label_size]
	lappend sphere_label_list $sphere_label

	set sphere_surface_x [expr $sphere_x + $sphere_r]
	set sphere_surface_list {}
	lappend sphere_surface_list $sphere_surface_x $sphere_y $sphere_z
	set sphere_label [graphics $res_id point $sphere_surface_list]
	lappend sphere_label_list $sphere_label

	set sphere_label [graphics $res_id text $sphere_surface_list "Mol#$res_id" size $label_size]
	lappend sphere_label_list $sphere_label

        lset graphic_label_list $sit_sel $sphere_label_list
}

proc ::packmol::draw_plane {} {
	variable plane_a
	variable plane_b
	variable plane_c
	variable plane_d
	variable plane_color
	variable plane_material
	variable all_material_list
	variable mol_sel
        variable sit_sel
        variable graphic_line_list
        variable graphic_info_list
	variable graphic_label_list
        variable sitlist
	variable radiuslist
	variable relativelist
        variable geo_sitlist_radius_sel
        variable graphic
	variable sel_material
	variable molid
	variable mol_material
	variable plane_max_a
	variable plane_max_b
	variable plane_max_c
	variable plane_min_a
	variable plane_min_b
	variable plane_min_c
	variable draw_shape
	variable plane_center_x
        variable plane_center_y
        variable plane_center_z
	variable res_moleculelist

        set new_molid [molinfo list]
        set new_molid_length [llength $new_molid]
        set molid_length [llength $molid]
        if {$new_molid_length!=$molid_length} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

        set need_to_refresh 0
        if {$new_molid_length==$molid_length} {
                set molid_index 0
                while {$molid_index<$molid_length} {
                        set this_molid [lindex $molid $molid_index]
                        set this_new_molid [lindex $new_molid $molid_index]
                        if {$this_molid!=$this_new_molid} {
                                set need_to_refresh 1
                        }
                        incr molid_index
                }
        }
        if {$need_to_refresh==1} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

	set sitlist_len [llength $sitlist]
        if {$sitlist_len==0} {
                return
        }

	set res_id [lindex $res_moleculelist $sit_sel]

	if {[catch {set is_none [expr $plane_a / 1]}]} {
		set plane_a 0
	}
	if {[catch {set is_none [expr $plane_b / 1]}]} {
		set plane_b 0
	}
	if {[catch {set is_none [expr $plane_c / 1]}]} {
		set plane_c 0
	}
	if {[catch {set is_none [expr $plane_d / 1]}]} {
		set plane_d 0
	}
	if {[catch {set is_none [expr $plane_max_a / 1]}]} {
		set plane_max_a 5
	}
	if {[catch {set is_none [expr $plane_max_b / 1]}]} {
		set plane_max_b 5
	}
	if {[catch {set is_none [expr $plane_max_c / 1]}]} {
		set plane_max_c 5
	}
	if {[catch {set is_none [expr $plane_min_a / 1]}]} {
		set plane_min_a 0
	}
	if {[catch {set is_none [expr $plane_min_b / 1]}]} {
		set plane_min_b 0
	}
	if {[catch {set is_none [expr $plane_min_c / 1]}]} {
		set plane_min_c 0
	}

	set max_a $plane_max_a
	set max_b $plane_max_b
	set max_c $plane_max_c
	set min_a $plane_min_a
	set min_b $plane_min_b
	set min_c $plane_min_c
	set plane_a_f [expr $plane_a + 0.0]
	set plane_b_f [expr $plane_b + 0.0]
	set plane_c_f [expr $plane_c + 0.0]
	set plane_d_f [expr $plane_d + 0.0]
	set color_list [split $plane_color " "]

	if {$plane_a_f==0 && $plane_b_f==0 && $plane_c_f==0} {
		set need_to_del_list [lindex $graphic_line_list $sit_sel]
		set need_to_del_list_len [llength $need_to_del_list]
		set number 0
		while {$number<$need_to_del_list_len} {
			set delete_num [lindex $need_to_del_list $number]
			graphics $res_id delete $delete_num
			incr number
		}

		set plane_info_single_update {}
		set plane_flag 3
		lappend plane_info_single_update $plane_flag
		lappend plane_info_single_update $plane_a
		lappend plane_info_single_update $plane_b
		lappend plane_info_single_update $plane_c
		lappend plane_info_single_update $plane_d
		lappend plane_info_single_update [lindex $color_list 0]
		lset graphic_info_list $sit_sel $plane_info_single_update

		set res_id [lindex $res_moleculelist $sit_sel]
        	set need_to_del_list [lindex $graphic_label_list $sit_sel]
        	set need_to_del_list_len [llength $need_to_del_list]
        	set number 0
        	while {$number<$need_to_del_list_len} {
        	        set delete_num [lindex $need_to_del_list $number]
        	        graphics $res_id delete $delete_num
			incr number
		}

		return
	}

	if {$plane_a_f==0 && $plane_b_f==0 && $plane_c_f!=0} {
		set one_x $min_a
		set one_y $min_b
		set one_z [expr (0 - $plane_d_f) / $plane_c_f]

		set two_x $min_a
		set two_y $max_b
		set two_z [expr (0 - $plane_d_f) / $plane_c_f]

		set three_x $max_a
		set three_y $min_b
		set three_z [expr (0 - $plane_d_f) / $plane_c_f]

		set four_x $max_a
		set four_y $max_b
		set four_z [expr (0 - $plane_d_f) / $plane_c_f]
	}

	if {$plane_a_f==0 && $plane_b_f!=0 && $plane_c_f==0} {
		set one_x $min_a
		set one_y [expr (0 - $plane_d_f) / $plane_b_f]
		set one_z $min_c

		set two_x $min_a
		set two_y [expr (0 - $plane_d_f) / $plane_b_f]
		set two_z $max_c

		set three_x $max_a
		set three_y [expr (0 - $plane_d_f) / $plane_b_f]
		set three_z $min_c

		set four_x $max_a
		set four_y [expr (0 - $plane_d_f) / $plane_b_f]
		set four_z $max_c
	}

	if {$plane_a_f==0 && $plane_b_f!=0 && $plane_c_f!=0} {
		set one_x $min_a
		set one_y $min_b
		set one_z [expr (0 - $plane_d_f - $plane_b_f * $min_b) / $plane_c_f]

		set two_x $max_a
		set two_y $min_b
		set two_z [expr (0 - $plane_d_f - $plane_b_f * $min_b) / $plane_c_f]

		set three_x $min_a
		set three_y $max_b
		set three_z [expr (0 - $plane_d_f - $plane_b_f * $max_b) / $plane_c_f]

		set four_x $max_a
		set four_y $max_b
		set four_z [expr (0 - $plane_d_f - $plane_b_f * $max_b) / $plane_c_f]
	}

	if {$plane_a_f!=0 && $plane_b_f==0 && $plane_c_f==0} {
		set one_x [expr $plane_d_f / $plane_a_f]
		set one_y $min_b
		set one_z $min_c

		set two_x [expr $plane_d_f / $plane_a_f]
		set two_y $min_b
		set two_z $max_c

		set three_x [expr $plane_d_f / $plane_a_f]
		set three_y $max_b
		set three_z $min_c

		set four_x [expr $plane_d_f / $plane_a_f]
		set four_y $max_b
		set four_z $max_c
	}

	if {$plane_a_f!=0 && $plane_b_f==0 && $plane_c_f!=0} {
		set one_x $min_a
		set one_y $min_b
		set one_z [expr (0 - $plane_d_f - $plane_a_f * $min_a) / $plane_c_f]

		set two_x $min_a
		set two_y $max_b
		set two_z [expr (0 - $plane_d_f - $plane_a_f * $min_a) / $plane_c_f]

		set three_x $max_a
		set three_y $min_b
		set three_z [expr (0 - $plane_d_f - $plane_a_f * $max_a) / $plane_c_f]

		set four_x $max_a
		set four_y $max_b
		set four_z [expr (0 - $plane_d_f - $plane_a_f * $max_a) / $plane_c_f]
	}

	if {$plane_a_f!=0 && $plane_b_f!=0 && $plane_c_f==0} {
		set one_x $min_a
		set one_y [expr (0 - $plane_d_f - $plane_a_f * $min_a) / $plane_b_f]
		set one_z $min_c

		set two_x $min_a
		set two_y [expr (0 - $plane_d_f - $plane_a_f * $min_a) / $plane_b_f]
		set two_z $max_c

		set three_x $max_a
		set three_y [expr (0 - $plane_d_f - $plane_a_f * $max_a) / $plane_b_f]
		set three_z $min_c

		set four_x $max_a
		set four_y [expr (0 - $plane_d_f - $plane_a_f * $max_a) / $plane_b_f]
		set four_z $max_c
	}

	if {$plane_a_f!=0 && $plane_b_f!=0 && $plane_c_f!=0} {
		set one_x $min_a
		set one_y $min_b
		set one_z [expr (0 - $plane_d_f - $plane_a_f * $min_a - $plane_b_f * $min_b) / $plane_c_f]

		set two_x $min_a
		set two_y $max_b
		set two_z [expr (0 - $plane_d_f - $plane_a_f * $min_a - $plane_b_f * $max_b) / $plane_c_f]

		set three_x $max_a
		set three_y $min_b
		set three_z [expr (0 - $plane_d_f - $plane_a_f * $max_a - $plane_b_f * $min_b) / $plane_c_f]

		set four_x $max_a
		set four_y $max_b
		set four_z [expr (0 - $plane_d_f - $plane_a_f * $max_a - $plane_b_f * $max_b) / $plane_c_f]
	}

	set plane_center_x_f [expr ($one_x + $two_x + $three_x + $four_x) / 4.0]
	set plane_center_y_f [expr ($one_y + $two_y + $three_y + $four_y) / 4.0]
	set plane_center_z_f [expr ($one_z + $two_z + $three_z + $four_z) / 4.0]
	set plane_center_x [format "%.2f" $plane_center_x_f]
	set plane_center_y [format "%.2f" $plane_center_y_f]
	set plane_center_z [format "%.2f" $plane_center_z_f]

	set plane_info_single_update {}
        set plane_flag 3
        lappend plane_info_single_update $plane_flag
        lappend plane_info_single_update $plane_a
        lappend plane_info_single_update $plane_b
        lappend plane_info_single_update $plane_c
        lappend plane_info_single_update $plane_d
        lappend plane_info_single_update [lindex $color_list 0]
	lappend plane_info_single_update $plane_center_x
	lappend plane_info_single_update $plane_center_y
	lappend plane_info_single_update $plane_center_z
	lappend plane_info_single_update $one_x
	lappend plane_info_single_update $one_y
	lappend plane_info_single_update $one_z
	lappend plane_info_single_update $two_x
	lappend plane_info_single_update $two_y
	lappend plane_info_single_update $two_z
	lappend plane_info_single_update $three_x
	lappend plane_info_single_update $three_y
	lappend plane_info_single_update $three_z
	lappend plane_info_single_update $four_x
	lappend plane_info_single_update $four_y
	lappend plane_info_single_update $four_z
        lset graphic_info_list $sit_sel $plane_info_single_update

	::packmol::draw_plane_label

        set need_to_del_list [lindex $graphic_line_list $sit_sel]
        set need_to_del_list_len [llength $need_to_del_list]
        set number 0
        while {$number<$need_to_del_list_len} {
                set delete_num [lindex $need_to_del_list $number]
                graphics $res_id delete $delete_num
                incr number
        }

        if {$draw_shape == "no"} {
                set plane_line_list {}
                lset graphic_line_list $sit_sel $plane_line_list
                return
        }

	graphics $res_id color [lindex $color_list 0]
        graphics $res_id material $sel_material
        lset mol_material $res_id $sel_material
        set plane_line_list {}
        set plane_line [graphics $res_id triangle "$one_x $one_y $one_z" "$two_x $two_y $two_z" "$three_x $three_y $three_z"]
        lappend plane_line_list $plane_line
	set plane_line [graphics $res_id triangle "$two_x $two_y $two_z" "$three_x $three_y $three_z" "$four_x $four_y $four_z"]
        lappend plane_line_list $plane_line

        lset graphic_line_list $sit_sel $plane_line_list
}

proc ::packmol::draw_plane_label {} {
	variable plane_center_x
	variable plane_center_y
	variable plane_center_z
	variable plane_color
        variable mol_sel
        variable sit_sel
        variable graphic_label_list
        variable molid
	variable draw_label
	variable res_moleculelist
	variable label_size

	set res_id [lindex $res_moleculelist $sit_sel]
        set need_to_del_list [lindex $graphic_label_list $sit_sel]
        set need_to_del_list_len [llength $need_to_del_list]
        set number 0
        while {$number<$need_to_del_list_len} {
                set delete_num [lindex $need_to_del_list $number]
                graphics $res_id delete $delete_num
                incr number
        }

        if {$draw_label == "no"} {
                set plane_label_list {}
                lset graphic_label_list $sit_sel $plane_label_list
                return
        }

	set color_list [split $plane_color " "]
        graphics $res_id color [lindex $color_list 0]

        set plane_label_list {}
        set plane_center_list {}
        lappend plane_center_list $plane_center_x $plane_center_y $plane_center_z

        set plane_label [graphics $res_id point $plane_center_list]
        lappend plane_label_list $plane_label

        set plane_label [graphics $res_id text $plane_center_list "($plane_center_x, $plane_center_y, $plane_center_z)" size $label_size]
        lappend plane_label_list $plane_label

        lset graphic_label_list $sit_sel $plane_label_list
}

proc ::packmol::get_cylinder_volume {} {
	variable cylinder_fir_circle_x
	variable cylinder_fir_circle_y
	variable cylinder_fir_circle_z
	variable cylinder_sec_circle_x
	variable cylinder_sec_circle_y
	variable cylinder_sec_circle_z
	variable cylinder_r
	variable cylinder_length
	variable cylinder_value

	set pi 3.1415926
	set bottom [expr $pi * $cylinder_r * $cylinder_r]
	set cylinder_value_f [expr $bottom * $cylinder_length]
	set cylinder_value [format "%.2f" $cylinder_value_f]
}

proc ::packmol::get_cylinder_area {} {
	variable cylinder_r
	variable cylinder_area

	set pi 3.1415926
	set cylinder_area_f [expr $pi * $cylinder_r * $cylinder_r]
	set cylinder_area [format "%.2f" $cylinder_area_f]
}

proc ::packmol::draw_cylinder {} {
	variable cylinder_fir_circle_x
	variable cylinder_fir_circle_y
	variable cylinder_fir_circle_z
	variable cylinder_sec_circle_x
	variable cylinder_sec_circle_y
	variable cylinder_sec_circle_z
	variable cylinder_r
	variable cylinder_color
	variable cylinder_length
	variable cylinder_resolution
	variable cylinder_material
	variable all_material_list
	variable mol_sel
	variable sit_sel
	variable graphic_line_list
	variable graphic_info_list
	variable sitlist
	variable sitlist_sel
	variable geolist
        variable geolist_sel
	variable radiuslist
        variable radiuslist_sel
	variable relativelist
	variable relativelist_sel
        variable geo_sitlist_radius_sel
	variable graphic
	variable sel_material
	variable molid
	variable mol_material
	variable draw_shape
	variable cylinder_sec_circle_x_new
	variable cylinder_sec_circle_y_new
	variable cylinder_sec_circle_z_new
	variable res_moleculelist

        set new_molid [molinfo list]
        set new_molid_length [llength $new_molid]
        set molid_length [llength $molid]
        if {$new_molid_length!=$molid_length} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

        set need_to_refresh 0
        if {$new_molid_length==$molid_length} {
                set molid_index 0
                while {$molid_index<$molid_length} {
                        set this_molid [lindex $molid $molid_index]
                        set this_new_molid [lindex $new_molid $molid_index]
                        if {$this_molid!=$this_new_molid} {
                                set need_to_refresh 1
                        }
                        incr molid_index
                }
        }
        if {$need_to_refresh==1} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

	set sitlist_len [llength $sitlist]
        if {$sitlist_len==0} {
                return
        }

	set res_id [lindex $res_moleculelist $sit_sel]

	if {[catch {set is_none [expr $cylinder_fir_circle_x / 1]}]} {
		set cylinder_fir_circle_x 0
	}
	if {[catch {set is_none [expr $cylinder_fir_circle_y / 1]}]} {
		set cylinder_fir_circle_y 0
	}
	if {[catch {set is_none [expr $cylinder_fir_circle_z / 1]}]} {
		set cylinder_fir_circle_z 0
	}
	if {[catch {set is_none [expr $cylinder_sec_circle_x / 1]}]} {
		set cylinder_sec_circle_x 0
	}
	if {[catch {set is_none [expr $cylinder_sec_circle_y / 1]}]} {
		set cylinder_sec_circle_y 0
	}
	if {[catch {set is_none [expr $cylinder_sec_circle_z / 1]}]} {
		set cylinder_sec_circle_z 0
	}
	if {[catch {set is_none [expr $cylinder_r / 1]}]} {
		set cylinder_r 0
	}
	if {[catch {set is_none [expr $cylinder_length / 1]}]} {
		set cylinder_length 0
	}
	if {[catch {set is_none [expr $cylinder_resolution / 1]}]} {
		set cylinder_resolution 30
	}

	if {$cylinder_sec_circle_x==0 && $cylinder_sec_circle_y==0 && $cylinder_sec_circle_z==0} {
		set msg "x2, y2, z2 zero"
		tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
		return
	}

	set x_plus [expr $cylinder_length * $cylinder_sec_circle_x / sqrt($cylinder_sec_circle_x * $cylinder_sec_circle_x + $cylinder_sec_circle_y * $cylinder_sec_circle_y + $cylinder_sec_circle_z * $cylinder_sec_circle_z)]
	set y_plus [expr $cylinder_length * $cylinder_sec_circle_y / sqrt($cylinder_sec_circle_x * $cylinder_sec_circle_x + $cylinder_sec_circle_y * $cylinder_sec_circle_y + $cylinder_sec_circle_z * $cylinder_sec_circle_z)]
	set z_plus [expr $cylinder_length * $cylinder_sec_circle_z / sqrt($cylinder_sec_circle_x * $cylinder_sec_circle_x + $cylinder_sec_circle_y * $cylinder_sec_circle_y + $cylinder_sec_circle_z * $cylinder_sec_circle_z)]

	set cylinder_sec_circle_x_new_f [expr $cylinder_fir_circle_x + $x_plus]
	set cylinder_sec_circle_x_new [format "%.2f" $cylinder_sec_circle_x_new_f]
	set cylinder_sec_circle_y_new_f [expr $cylinder_fir_circle_y + $y_plus]
	set cylinder_sec_circle_y_new [format "%.2f" $cylinder_sec_circle_y_new_f]
	set cylinder_sec_circle_z_new_f [expr $cylinder_fir_circle_z + $z_plus]
	set cylinder_sec_circle_z_new [format "%.2f" $cylinder_sec_circle_z_new_f]

	set color_list [split $cylinder_color " "]
        set cylinder_info_single_update {}
        set cylinder_flag 4
        lappend cylinder_info_single_update $cylinder_flag
        lappend cylinder_info_single_update $cylinder_fir_circle_x
        lappend cylinder_info_single_update $cylinder_fir_circle_y
        lappend cylinder_info_single_update $cylinder_fir_circle_z
        lappend cylinder_info_single_update $cylinder_sec_circle_x
        lappend cylinder_info_single_update $cylinder_sec_circle_y
        lappend cylinder_info_single_update $cylinder_sec_circle_z
        lappend cylinder_info_single_update $cylinder_r
        lappend cylinder_info_single_update $cylinder_length
        lappend cylinder_info_single_update [lindex $color_list 0]
        lappend cylinder_info_single_update $cylinder_resolution
	lappend cylinder_info_single_update $cylinder_sec_circle_x_new
	lappend cylinder_info_single_update $cylinder_sec_circle_y_new
	lappend cylinder_info_single_update $cylinder_sec_circle_z_new
        lset graphic_info_list $sit_sel $cylinder_info_single_update
        ::packmol::get_cylinder_volume
	::packmol::get_cylinder_area

        ::packmol::draw_cylinder_label

        set need_to_del_list [lindex $graphic_line_list $sit_sel]
        set need_to_del_list_len [llength $need_to_del_list]
        set number 0
        while {$number<$need_to_del_list_len} {
                set delete_num [lindex $need_to_del_list $number]
                graphics $res_id delete $delete_num
                incr number
        }

        if {$draw_shape == "no"} {
                set cylinder_line_list {}
                lset graphic_line_list $sit_sel $cylinder_line_list
                return
        }

	graphics $res_id color [lindex $color_list 0]
        graphics $res_id material $sel_material
        lset mol_material $res_id $sel_material
	set cylinder_line_list {}
	set cylinder_line [graphics $res_id cylinder "$cylinder_fir_circle_x $cylinder_fir_circle_y $cylinder_fir_circle_z" "$cylinder_sec_circle_x_new $cylinder_sec_circle_y_new $cylinder_sec_circle_z_new" radius $cylinder_r resolution $cylinder_resolution]
	lappend cylinder_line_list $cylinder_line

	lset graphic_line_list $sit_sel $cylinder_line_list
}

proc ::packmol::draw_cylinder_label {} {
	variable cylinder_fir_circle_x
        variable cylinder_fir_circle_y
        variable cylinder_fir_circle_z
        variable cylinder_sec_circle_x_new
        variable cylinder_sec_circle_y_new
        variable cylinder_sec_circle_z_new
        variable cylinder_color
        variable mol_sel
        variable sit_sel
        variable graphic_label_list
        variable molid
	variable draw_label
	variable res_moleculelist
	variable label_size

        set res_id [lindex $res_moleculelist $sit_sel]
        set need_to_del_list [lindex $graphic_label_list $sit_sel]
        set need_to_del_list_len [llength $need_to_del_list]
        set number 0
        while {$number<$need_to_del_list_len} {
                set delete_num [lindex $need_to_del_list $number]
                graphics $res_id delete $delete_num
                incr number
        }

	if {$draw_label == "no"} {
                set cylinder_label_list {}
                lset graphic_label_list $sit_sel $cylinder_label_list
                return
        }

	set color_list [split $cylinder_color " "]
        graphics $res_id color [lindex $color_list 0]

        set cylinder_label_list {}
        set cylinder_center_fir_list {}
        lappend cylinder_center_fir_list $cylinder_fir_circle_x $cylinder_fir_circle_y $cylinder_fir_circle_z

        set cylinder_label [graphics $res_id point $cylinder_center_fir_list]
        lappend cylinder_label_list $cylinder_label

        set cylinder_label [graphics $res_id text $cylinder_center_fir_list "($cylinder_fir_circle_x, $cylinder_fir_circle_y, $cylinder_fir_circle_z)" size $label_size]
        lappend cylinder_label_list $cylinder_label

	set cylinder_center_sec_list {}
        lappend cylinder_center_sec_list $cylinder_sec_circle_x_new $cylinder_sec_circle_y_new $cylinder_sec_circle_z_new

        set cylinder_label [graphics $res_id point $cylinder_center_sec_list]
        lappend cylinder_label_list $cylinder_label

        set cylinder_label [graphics $res_id text $cylinder_center_sec_list "($cylinder_sec_circle_x_new, $cylinder_sec_circle_y_new, $cylinder_sec_circle_z_new)" size $label_size]
        lappend cylinder_label_list $cylinder_label

        lset graphic_label_list $sit_sel $cylinder_label_list
}

proc ::packmol::record_xygauss {} {
	variable gaussian_a1
        variable gaussian_a2
        variable gaussian_b1
        variable gaussian_b2
        variable gaussian_c
        variable gaussian_h
	variable mol_sel
        variable sit_sel
        variable graphic_line_list
        variable graphic_info_list
        variable sitlist
        variable radiuslist
        variable relativelist
        variable geo_sitlist_radius_sel
        variable graphic
	variable molid
	variable res_moleculelist

        set new_molid [molinfo list]
        set new_molid_length [llength $new_molid]
        set molid_length [llength $molid]
        if {$new_molid_length!=$molid_length} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

        set need_to_refresh 0
        if {$new_molid_length==$molid_length} {
                set molid_index 0
                while {$molid_index<$molid_length} {
                        set this_molid [lindex $molid $molid_index]
                        set this_new_molid [lindex $new_molid $molid_index]
                        if {$this_molid!=$this_new_molid} {
                                set need_to_refresh 1
                        }
                        incr molid_index
                }
        }
        if {$need_to_refresh==1} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

        set sitlist_len [llength $sitlist]
        if {$sitlist_len==0} {
                return
        }

	set res_id [lindex $res_moleculelist $sit_sel]

	set xygauss_info_single_update {}
        set xygauss_flag 5
	lappend xygauss_info_single_update $xygauss_flag
	lappend xygauss_info_single_update $gaussian_a1
	lappend xygauss_info_single_update $gaussian_b1
	lappend xygauss_info_single_update $gaussian_a2
	lappend xygauss_info_single_update $gaussian_b2
	lappend xygauss_info_single_update $gaussian_c
	lappend xygauss_info_single_update $gaussian_h
        lset graphic_info_list $sit_sel $xygauss_info_single_update
}

proc ::packmol::get_ellipsoid_volume {} {
	variable ellipsoid_a1
	variable ellipsoid_b1
	variable ellipsoid_c1
	variable ellipsoid_a2
	variable ellipsoid_b2
	variable ellipsoid_c2
	variable ellipsoid_d
	variable ellipsoid_value

	set pi 3.1415926
	set ellipsoid_value_f [expr $ellipsoid_a2 * $ellipsoid_d * $ellipsoid_b2 * $ellipsoid_d * $ellipsoid_c2 * $ellipsoid_d * $pi * 4 / 3]
	set ellipsoid_value [format "%.2f" $ellipsoid_value_f]
}

proc ::packmol::get_ellipsoid_area {} {
	variable ellipsoid_a1
        variable ellipsoid_b1
        variable ellipsoid_c1
        variable ellipsoid_a2
        variable ellipsoid_b2
        variable ellipsoid_c2
        variable ellipsoid_d
        variable ellipsoid_area

        set pi 3.1415926
	set ellipsoid_area_f [expr ($ellipsoid_a2 * $ellipsoid_d * $ellipsoid_b2 * $ellipsoid_d + $ellipsoid_a2 * $ellipsoid_d * $ellipsoid_c2 * $ellipsoid_d + $ellipsoid_b2 * $ellipsoid_d * $ellipsoid_c2 * $ellipsoid_d) * $pi * 4 / 3]
	set ellipsoid_area [format "%.2f" $ellipsoid_area_f]
}

proc ::packmol::draw_ellipsoid {} {
	variable ellipsoid_a1
        variable ellipsoid_b1
        variable ellipsoid_c1
        variable ellipsoid_a2
        variable ellipsoid_b2
        variable ellipsoid_c2
        variable ellipsoid_d
	variable ellipsoid_color
	variable ellipsoid_resolution
	variable ellipsoid_material
	variable all_material_list
	variable mol_sel
	variable sit_sel
	variable graphic_line_list
	variable graphic_info_list
	variable graphic_label_list
	variable graphic
	variable sitlist
	variable radiuslist
	variable relativelist
        variable geo_sitlist_radius_sel
	variable sel_material
	variable molid
	variable mol_material
	variable draw_shape
	variable res_moleculelist

        set new_molid [molinfo list]
        set new_molid_length [llength $new_molid]
        set molid_length [llength $molid]
        if {$new_molid_length!=$molid_length} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

        set need_to_refresh 0
        if {$new_molid_length==$molid_length} {
                set molid_index 0
                while {$molid_index<$molid_length} {
                        set this_molid [lindex $molid $molid_index]
                        set this_new_molid [lindex $new_molid $molid_index]
                        if {$this_molid!=$this_new_molid} {
                                set need_to_refresh 1
                        }
                        incr molid_index
                }
        }
        if {$need_to_refresh==1} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

	set sitlist_len [llength $sitlist]
        if {$sitlist_len==0} {
                return
        }

	set res_id [lindex $res_moleculelist $sit_sel]

	if {[catch {set is_none [expr $ellipsoid_a1 / 1]}]} {
		set ellipsoid_a1 0
	}
	if {[catch {set is_none [expr $ellipsoid_b1 / 1]}]} {
		set ellipsoid_b1 0
	}
	if {[catch {set is_none [expr $ellipsoid_c1 / 1]}]} {
		set ellipsoid_c1 0
	}
	if {[catch {set is_none [expr $ellipsoid_a2 / 1]}]} {
		set ellipsoid_a2 0
	}
	if {[catch {set is_none [expr $ellipsoid_b2 / 1]}]} {
		set ellipsoid_b2 0
	}
	if {[catch {set is_none [expr $ellipsoid_c2 / 1]}]} {
		set ellipsoid_c2 0
	}
	if {[catch {set is_none [expr $ellipsoid_d / 1]}]} {
		set ellipsoid_d 0
	}
	if {[catch {set is_none [expr $ellipsoid_resolution / 1]}]} {
		set ellipsoid_resolution 2
	}

	if {$ellipsoid_a2==0 || $ellipsoid_b2==0 || $ellipsoid_c2==0 || $ellipsoid_d==0} {
		set need_to_del_list [lindex $graphic_line_list $sit_sel]
		set need_to_del_list_len [llength $need_to_del_list]
		set number 0
		while {$number<$need_to_del_list_len} {
			set delete_num [lindex $need_to_del_list $number]
			graphics $res_id delete $delete_num
			incr number
		}
		set ellipsoid_info_single_update {}
		set ellipsoid_flag 2
		set color_list [split $ellipsoid_color " "]
		lappend ellipsoid_info_single_update $ellipsoid_flag
		lappend ellipsoid_info_single_update $ellipsoid_a1
		lappend ellipsoid_info_single_update $ellipsoid_b1
		lappend ellipsoid_info_single_update $ellipsoid_c1
		lappend ellipsoid_info_single_update $ellipsoid_a2
		lappend ellipsoid_info_single_update $ellipsoid_b2
		lappend ellipsoid_info_single_update $ellipsoid_c2
		lappend ellipsoid_info_single_update $ellipsoid_d
		lappend ellipsoid_info_single_update [lindex $color_list 0]
		lappend ellipsoid_info_single_update $ellipsoid_resolution
		lset graphic_info_list $sit_sel $ellipsoid_info_single_update

		set res_id [lindex $res_moleculelist $sit_sel]
                set need_to_del_list [lindex $graphic_label_list $sit_sel]
                set need_to_del_list_len [llength $need_to_del_list]
                set number 0
                while {$number<$need_to_del_list_len} {
                        set delete_num [lindex $need_to_del_list $number]
                        graphics $res_id delete $delete_num
                        incr number
                }

		return
	}

	set a2_d [expr $ellipsoid_a2 * $ellipsoid_d]
	set b2_d [expr $ellipsoid_b2 * $ellipsoid_d]
	set c2_d [expr $ellipsoid_c2 * $ellipsoid_d]

	set color_list [split $ellipsoid_color " "]
	set ellipsoid_info_single_update {}
        set ellipsoid_flag 2
        lappend ellipsoid_info_single_update $ellipsoid_flag
        lappend ellipsoid_info_single_update $ellipsoid_a1
        lappend ellipsoid_info_single_update $ellipsoid_b1
        lappend ellipsoid_info_single_update $ellipsoid_c1
        lappend ellipsoid_info_single_update $ellipsoid_a2
        lappend ellipsoid_info_single_update $ellipsoid_b2
        lappend ellipsoid_info_single_update $ellipsoid_c2
        lappend ellipsoid_info_single_update $ellipsoid_d
        lappend ellipsoid_info_single_update [lindex $color_list 0]
        lappend ellipsoid_info_single_update $ellipsoid_resolution
        lset graphic_info_list $sit_sel $ellipsoid_info_single_update
        ::packmol::get_ellipsoid_volume
	::packmol::get_ellipsoid_area
	
	::packmol::draw_ellipsoid_label

        set need_to_del_list [lindex $graphic_line_list $sit_sel]
        set need_to_del_list_len [llength $need_to_del_list]
        set number 0
        while {$number<$need_to_del_list_len} {
                set delete_num [lindex $need_to_del_list $number]
                graphics $res_id delete $delete_num
                incr number
        }

	if {$draw_shape == "no"} {
                set ellipsoid_line_list {}
                lset graphic_line_list $sit_sel $ellipsoid_line_list
                return
	}

	graphics $res_id color [lindex $color_list 0]
        graphics $res_id material $sel_material
        lset mol_material $res_id $sel_material
	set ellipsoid_line_list [::packmol::approx_ellipsoid $res_id $ellipsoid_resolution "$a2_d $b2_d $c2_d" "$ellipsoid_a1 $ellipsoid_b1 $ellipsoid_c1"]
        lset graphic_line_list $sit_sel $ellipsoid_line_list
}

proc ::packmol::draw_ellipsoid_label {} {
	variable ellipsoid_a1
        variable ellipsoid_b1
        variable ellipsoid_c1
        variable ellipsoid_color
        variable mol_sel
        variable sit_sel
        variable graphic_label_list
        variable molid
	variable draw_label
	variable res_moleculelist
	variable label_size

	set res_id [lindex $res_moleculelist $sit_sel]
        set need_to_del_list [lindex $graphic_label_list $sit_sel]
        set need_to_del_list_len [llength $need_to_del_list]
        set number 0
        while {$number<$need_to_del_list_len} {
                set delete_num [lindex $need_to_del_list $number]
                graphics $res_id delete $delete_num
                incr number
        }

        if {$draw_label == "no"} {
                set ellipsoid_label_list {}
                lset graphic_label_list $sit_sel $ellipsoid_label_list
                return
        }

	set color_list [split $ellipsoid_color " "]
        graphics $res_id color [lindex $color_list 0]

        set ellipsoid_label_list {}
        set ellipsoid_center_list {}
        lappend ellipsoid_center_list $ellipsoid_a1 $ellipsoid_b1 $ellipsoid_c1

        set ellipsoid_label [graphics $res_id point $ellipsoid_center_list]
        lappend ellipsoid_label_list $ellipsoid_label

        set ellipsoid_label [graphics $res_id text $ellipsoid_center_list "($ellipsoid_a1, $ellipsoid_b1, $ellipsoid_c1)" size $label_size]
        lappend ellipsoid_label_list $ellipsoid_label

        lset graphic_label_list $sit_sel $ellipsoid_label_list
}

proc ::packmol::approx_ellipsoid {mol level {radius {1.0 1.0 1.0}} {center {0.0 0.0 0.0}} {orient {1.0 0.0 0.0 0.0}}} {
	set gid {}

	# vertices of an octahedron inscribed
	# in a sphere with radius 1.0.
	set vec1 {-1.0  0.0  0.0}
	set vec2 { 1.0  0.0  0.0}
	set vec3 { 0.0 -1.0  0.0}
	set vec4 { 0.0  1.0  0.0}
	set vec5 { 0.0  0.0 -1.0}
	set vec6 { 0.0  0.0  1.0}

	# build list of triangles representing
	# the octahedron. the points of the 
	# triangles have to be given clockwise from
	# looking at the surface from the outside.
	set trilist [list \
                 [list $vec1 $vec4 $vec5] \
                 [list $vec5 $vec4 $vec2] \
                 [list $vec2 $vec4 $vec6] \
                 [list $vec6 $vec4 $vec1] \
                 [list $vec5 $vec3 $vec1] \
                 [list $vec2 $vec3 $vec5] \
                 [list $vec6 $vec3 $vec2] \
                 [list $vec1 $vec3 $vec6] ]

	# refinement iterations to approximate a sphere:
	# each triangle is split into 4 subtriangles
	#        p2
	#        /\
	#       /  \
	#    pb/____\pc
	#     /\    /\
	#    /  \  /  \
	#   /____\/____\
	# p1     pa    p3
	#
	# we construct vectors to the three midpoints and rescale
	# them to unit length. then build new triangles enumerating
	# the points in clockwise order again.
	for {set i 0} {$i < $level} {incr i} {
		set newlist {}
		foreach tri $trilist {
			foreach {p1 p2 p3} $tri {}
			set pa [vecnorm [vecadd $p1 $p3]]
			set pb [vecnorm [vecadd $p1 $p2]]
			set pc [vecnorm [vecadd $p2 $p3]]
			lappend newlist [list $p1 $pb $pa]
			lappend newlist [list $pb $p2 $pc]
			lappend newlist [list $pa $pb $pc]
			lappend newlist [list $pa $pc $p3]
		}
		set trilist $newlist
	}

	# compute vertex scaling factor to deform a sphere to an ellipsoid
	proc radscale {radius vector} {
		foreach {a b c} $radius {}
		foreach {x y z} $vector {}
		return [expr {sqrt(1.0/($x/$a*$x/$a+$y/$b*$y/$b+$z/$c*$z/$c))}]
	}

	# convert quaternion to rotation matrix
	proc quattorot {quat} {
		foreach {w x y z} $quat {}
		set norm [expr {$w*$w + $x*$x + $y*$y +$z*$z}]
		set sc 0.0
		if {$norm > 0.0} { set s [expr {2.0/$norm}] }
		set X [expr {$x*$s}]
		set Y [expr {$y*$s}]
		set Z [expr {$z*$s}]
		return [list \
			[list [expr {1.0-($y*$y*$s + $z*$z*$s)}] \
			[expr {$x*$y*$s - $w*$z*$s}] \
			[expr {$x*$z*$s + $w*$y*$s}] ] \
			[list [expr {$x*$y*$s + $w*$z*$s}] \
			[expr {1.0-($x*$x*$s + $z*$z*$s)}] \
			[expr {$y*$z*$s - $w*$x*$s}] ] \
			[list [expr {$x*$z*$s - $w*$y*$s}] \
			[expr {$y*$z*$s + $w*$x*$s}] \
			[expr {1.0-($x*$x*$s + $y*$y*$s)}] ] ]
	}

	# apply rotation matrix to vector
	proc rotvec {mat vec} {
		set new {}
		foreach c $mat {
			lappend new [vecdot $c $vec]
		}
        	return $new
	}

	foreach tri $trilist {
		foreach {vec1 vec2 vec3} $tri {}
		# rescale to desired radius
		set rad1 [radscale $radius $vec1]
		set rad2 [radscale $radius $vec2]
		set rad3 [radscale $radius $vec3]
		# get and apply rotation matrix
		set mat [quattorot $orient]
		set vec1 [rotvec $mat $vec1]
		set vec2 [rotvec $mat $vec2]
		set vec3 [rotvec $mat $vec3]
		# deform sphereoid and translate
		set pos1 [vecadd [vecscale $rad1 $vec1] $center]
		set pos2 [vecadd [vecscale $rad2 $vec2] $center]
		set pos3 [vecadd [vecscale $rad3 $vec3] $center]
		# since the original vectors to the vertices are those of
		# a unit sphere, we can use them directly as surface normals.
		lappend gid [graphics $mol trinorm $pos1 $pos2 $pos3 $vec1 $vec2 $vec3]
	}
	return $gid
}

proc ::packmol::get_maxit_int {} {
	variable maxit
	set maxit [expr int($maxit)]
}

proc ::packmol::get_seed_int {} {
	variable seed
	set seed [expr int($seed)]
}

proc ::packmol::get_nloop_int {} {
	variable nloop
	set nloop [expr int($nloop)]
}

proc ::packmol::get_writeout_int {} {
	variable writeout
	set writeout [expr int($writeout)]
}

proc ::packmol::show_packmol_input {} {
	variable tolerance
        variable thesefile
        variable graphic_info_list
        variable sitlist
	variable res_moleculelist
	variable res_atomlist
        variable radiuslist
	variable fscalelist
        variable short_radiuslist
        variable short_radius_scalelist
        variable relativelist
        variable molid
        variable structure_num_list
        variable resnumber_list
        variable restart_from_list
        variable restart_to_list
        variable changechains_list
        variable center_fix_list
        variable file_type
        variable add_amber_ter
        variable box_sides
        variable sidemax
        variable seed
        variable use_randominitialpoint
        variable avoid_overlap
        variable discale
        variable maxit
        variable movebadrandom
        variable nloop
        variable precision
        variable writeout
        variable writebad
        variable iprint1
        variable iprint2
        variable check
        variable fbins
        variable chkgrad
        variable outputfilename_write
        variable outputdir
        variable constrain_list
        variable format_wrong
        variable chain_list
	variable segid_list
	variable maxmove_list
	variable generate_packmol_input
	variable is_writecrd
	variable writecrdname_write
	variable pbc_xmin
	variable pbc_xmax
	variable pbc_ymin
	variable pbc_ymax
	variable pbc_zmin
	variable pbc_zmax
	variable use_short_tol
        variable short_tol_dist
        variable short_tol_scale
        variable movefrac
        variable connect
	variable is_writecrd
	variable ellipsoid_return_flag
        variable plane_return_flag
	variable xygauss_number_return_flag
        variable xygauss_zero_return_flag
	variable fscale_short_radius_scale_wrong
	variable res_atom_flag
	variable click_save

        set tab "\t"
        set pi 3.1415926
	set ellipsoid_return_flag 0
        set plane_return_flag 0
        set xygauss_number_return_flag 0
        set xygauss_zero_return_flag 0
	set fscale_short_radius_scale_wrong 0
#	set generate_packmol_input ""

	set new_molid [molinfo list]
        set new_molid_length [llength $new_molid]
        set molid_length [llength $molid]
        if {$new_molid_length!=$molid_length} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

        set need_to_refresh 0
        if {$new_molid_length==$molid_length} {
                set molid_index 0
                while {$molid_index<$molid_length} {
                        set this_molid [lindex $molid $molid_index]
                        set this_new_molid [lindex $new_molid $molid_index]
                        if {$this_molid!=$this_new_molid} {
                                set need_to_refresh 1
                        }
                        incr molid_index
                }
        }
        if {$need_to_refresh==1} {
                set msg "File list has changed, please refresh."
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

	set filelength [llength $thesefile]
	set mollength [llength $molid]
	if {$filelength==0} {
		return
	}

        ::packmol::check_format
        if {$format_wrong==1} {
                return
        }
	::packmol::check_res_atom
	if {$res_atom_flag==1} {
		return
	}
        if {$outputfilename_write==""} {
                set msg "Please set filename first"
                tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
                return
        }

	if {$is_writecrd==1 && $writecrdname_write==""} {
		set msg "Please set writecrd first"
		tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
		return
	}

	set show_str ""
	set return_flag "\n"
	set tolerance_str "tolerance"
        set tolerance_str_info [format "%s %.2f%s" $tolerance_str $tolerance $return_flag]
        append show_str $tolerance_str_info

        set filetype_str "filetype"
        set filetype_str_info [format "%s %s%s" $filetype_str $file_type $return_flag]
        append show_str $filetype_str_info

	if {$is_writecrd==1} {
		set writecrd_str "writecrd"
		set writecrd_str_info [format "%s %s%s" $writecrd_str "\"$writecrdname_write\"" $return_flag]
		append show_str $writecrd_str_info
	}

	set output_str "output"
	set output_dir_filename [file join $outputdir $outputfilename_write]
	set output_str_info [format "%s %s%s" $output_str "\"$output_dir_filename\"" $return_flag]
        append show_str $output_str_info

	if {$pbc_xmin!=0 || $pbc_xmax!=0 || $pbc_ymin!=0 || $pbc_ymax!=0 || $pbc_zmin!=0 || $pbc_zmax!=0} {
		set pbc_str "pbc"
		set pbc_str_info [format "%s %.2f %.2f %.2f %.2f %.2f %.2f%s" $pbc_str $pbc_xmin $pbc_ymin $pbc_zmin $pbc_xmax $pbc_ymax $pbc_zmax $return_flag]
		append show_str $pbc_str_info
	}

	set res_res_moleculelist_unique [lsort -unique $res_moleculelist]
	set res_res_moleculelist_unique_len [llength $res_res_moleculelist_unique]
	set res_moleculelist_len [llength $res_moleculelist]

	set res_unique_number 0
	while {$res_unique_number<$res_res_moleculelist_unique_len} {
		set res_unique_number_id [lindex $res_res_moleculelist_unique $res_unique_number]

        set res_number 0
	set same_number 0
        while {$res_number<$res_moleculelist_len} {
		set res_number_id [lindex $res_moleculelist $res_number]
		if {$res_number_id==$res_unique_number_id} {
		set molid_index [lsearch $molid $res_number_id]
                set file_name_single [lindex $thesefile $molid_index]
		
		if {$same_number==0} {
                set structure "structure"
                set structure_str_info [format "%s %s%s" $structure "\"$file_name_single\"" $return_flag]
               	append show_str $structure_str_info

                set number_str "number"
                set number_each [lindex $structure_num_list $res_number_id]
                set number_str_info [format "%s%s %d%s" $tab $number_str $number_each $return_flag]
                append show_str $number_str_info

                set resnumber_str "resnumbers"
                set resnumber_each [lindex $resnumber_list $res_number_id]
                if {$resnumber_each!=0} {
                        set resnumber_str_info [format "%s%s %s%s" $tab $resnumber_str $resnumber_each $return_flag]
                        append show_str $resnumber_str_info
                }

                set restart_from_str "restart_from"
                set restart_from_each [lindex $restart_from_list $res_number_id]
                if {$restart_from_each!=""} {
                        set restart_from_str_info [format "%s%s %s%s" $tab $restart_from_str $restart_from_each $return_flag]
                        append show_str $restart_from_str_info
                }

                set restart_to_str "restart_to"
                set restart_to_each [lindex $restart_to_list $res_number_id]
                if {$restart_to_each!=""} {
                        set restart_to_str_info [format "%s%s %s%s" $tab $restart_to_str $restart_to_each $return_flag]
			append show_str $restart_to_str_info
                }

		set changechains_str "changechains"
                set changechains_each [lindex $changechains_list $res_number_id]
                if {$changechains_each!="no"} {
                        set changechains_str_info [format "%s%s%s" $tab $changechains_str $return_flag]
                        append show_str $changechains_str_info
                } else {
                        set chain_str "chain"
                        set chain_each [lindex $chain_list $res_number_id]
                        if {$chain_each!=""} {
                                set chain_str_info [format "%s%s %s%s" $tab $chain_str $chain_each $return_flag]
                                append show_str $chain_str_info
                        }
                }

		set segid_str "segid"
		set segid_each [lindex $segid_list $res_number_id]
		if {$is_writecrd!=0} {
			if {$segid_each!=""} {
				set segid_str_info [format "%s%s %s%s" $tab $segid_str $segid_each $return_flag]
				append show_str $segid_str_info
			}
		}

		set maxmove_str "maxmove"
		set maxmove_each [lindex $maxmove_list $res_number_id]
		if {$maxmove_each!=""} {
			set maxmove_str_info [format "%s%s %s%s" $tab $maxmove_str $maxmove_each $return_flag]
			append show_str $maxmove_str_info
		}

                set center_fix_single_info [lindex $center_fix_list $res_number_id]
                set need_to_center_fix [lindex $center_fix_single_info 0]
                set need_to_fix_x [lindex $center_fix_single_info 1]
                set need_to_fix_y [lindex $center_fix_single_info 2]
                set need_to_fix_z [lindex $center_fix_single_info 3]
                set need_to_fix_alpha [lindex $center_fix_single_info 4]
                set need_to_fix_beta [lindex $center_fix_single_info 5]
                set need_to_fix_gamma [lindex $center_fix_single_info 6]
                set need_to_fix_alpha_radian [expr $need_to_fix_alpha / 180.0 * $pi]
                set need_to_fix_beta_radian [expr $need_to_fix_beta / 180.0 * $pi]
                set need_to_fix_gamma_radian [expr $need_to_fix_gamma / 180.0 * $pi]

                if {$need_to_fix_x!=0||$need_to_fix_y!=0||$need_to_fix_z!=0||$need_to_fix_alpha!=0||$need_to_fix_beta!=0||$need_to_fix_gamma!=0||$need_to_center_fix==1} {
                        if {$need_to_center_fix==1} {
                                set center_str "center"
                                set center_str_info [format "%s%s%s" $tab $center_str $return_flag]
                                append show_str $center_str_info
                        }
                        set fixed_str "fixed"
                        set need_to_fix_str_info [format "%s%s %.2f %.2f %.2f %.2f %.2f %.2f%s" $tab $fixed_str $need_to_fix_x $need_to_fix_y $need_to_fix_z $need_to_fix_alpha_radian $need_to_fix_beta_radian $need_to_fix_gamma_radian $return_flag]
                        append show_str $need_to_fix_str_info
                }

		set constrain_single_info [lindex $constrain_list $res_number_id]
                set need_to_constrain [lindex $constrain_single_info 0]
                if {$need_to_constrain==1} {
                        set need_to_constrain_x [lindex $constrain_single_info 1]
                        set need_to_constrain_y [lindex $constrain_single_info 2]
                        set need_to_constrain_z [lindex $constrain_single_info 3]
                        set need_to_constrain_x_plus [lindex $constrain_single_info 4]
                        set need_to_constrain_y_plus [lindex $constrain_single_info 5]
                        set need_to_constrain_z_plus [lindex $constrain_single_info 6]

                        if {$need_to_constrain_x!=0||$need_to_constrain_x_plus!=0} {
                                set constrain_x_str "constrain_rotation x"
                                set constrain_x_str_info [format "%s%s %.2f %.2f%s" $tab $constrain_x_str $need_to_constrain_x $need_to_constrain_x_plus $return_flag]
                                append show_str $constrain_x_str_info
                        }
                        if {$need_to_constrain_y!=0||$need_to_constrain_y_plus!=0} {
                                set constrain_y_str "constrain_rotation y"
                                set constrain_y_str_info [format "%s%s %.2f %.2f%s" $tab $constrain_y_str $need_to_constrain_y $need_to_constrain_y_plus $return_flag]
                                append show_str $constrain_y_str_info
                        }
                        if {$need_to_constrain_z!=0||$need_to_constrain_z_plus!=0} {
                                set constrain_z_str "constrain_rotation z"
                                set constrain_z_str_info [format "%s%s %.2f %.2f%s" $tab $constrain_z_str $need_to_constrain_z $need_to_constrain_z_plus $return_flag]
                                append show_str $constrain_z_str_info
                        }
                }
		}
		incr same_number

		set atom_flag 0
		set sitlist_single_res [lindex $sitlist $res_number]
		set relative_single_res [lindex $relativelist $res_number]
		set sit_relative_single [format "%s %s" $relative_single_res $sitlist_single_res]

		set res_atomlist_single_res [lindex $res_atomlist $res_number]
		if {$res_atomlist_single_res!=""} {
			set atom_str "atoms"
			set atom_str_num [format "%s%s %s%s" $tab $atom_str $res_atomlist_single_res $return_flag]
			append show_str $atom_str_num
			set atom_flag 1
		}

		set radiuslist_single_res [lindex $radiuslist $res_number]
		if {$radiuslist_single_res!=1} {
			set radius_str "radius"
			if {$atom_flag==1} {
				set radius_str_info [format "%s%s%s %.2f%s" $tab $tab $radius_str $radiuslist_single_res $return_flag]
			} else {
				set radius_str_info [format "%s%s %.2f%s" $tab $radius_str $radiuslist_single_res $return_flag]
			}
			append show_str $radius_str_info
		}

		set fscalelist_single_res [lindex $fscalelist $res_number]
		if {$fscalelist_single_res!=""} {
			if {[string is double -strict $fscalelist_single_res] == 1} {
				set fscale_str "fscale"

				if {$atom_flag==1} {
					set fscale_str_info [format "%s%s%s %s%s" $tab $tab $fscale_str $fscalelist_single_res $return_flag]
				} else {
					set fscale_str_info [format "%s%s %s%s" $tab $fscale_str $fscalelist_single_res $return_flag]
				}
				append show_str $fscale_str_info
			} else {
				set msg "fscale must be a real number."
				tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
				set fscale_short_radius_scale_wrong 1
				return
			}
		}

		set short_radiuslist_single_res [lindex $short_radiuslist $res_number]
		if {$short_radiuslist_single_res!=""} {
			if {[string is double -strict $short_radiuslist_single_res] == 1} {
				set short_radius_str "short_radius"
	
				if {$atom_flag==1} {
					set short_radius_str_info [format "%s%s%s %s%s" $tab $tab $short_radius_str $short_radiuslist_single_res $return_flag]
				} else {
					set short_radius_str_info [format "%s%s %s%s" $tab $short_radius_str $short_radiuslist_single_res $return_flag]
				}
				append show_str $short_radius_str_info
			} else {
				set msg "short_radius must be a real number."
				tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
				set fscale_short_radius_scale_wrong 1
				return
			}
		}

		set short_radius_scalelist_single_res [lindex $short_radius_scalelist $res_number]
		if {$short_radius_scalelist_single_res!=""} {
			if {[string is double -strict $short_radius_scalelist_single_res] == 1} {
				set short_radius_scale_str "short_radius_scale"

				if {$atom_flag==1} {
					set short_radius_scale_str_info [format "%s%s%s %s%s" $tab $tab $short_radius_scale_str $short_radius_scalelist_single_res $return_flag]
				} else {
					set short_radius_scale_str_info [format "%s%s %s%s" $tab $short_radius_scale_str $short_radius_scalelist_single_res $return_flag]
				}
				append show_str $short_radius_scale_str_info
			} else {
				set msg "short_radius_scale must be a real number."
                                tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
				set fscale_short_radius_scale_wrong 1
                                return
			}
		}

		set graphic_info_list_single_res [lindex $graphic_info_list $res_number]
                set which_graphic [lindex $graphic_info_list_single_res 0]
		if {$which_graphic==6} {
			set single_cube_start_x [lindex $graphic_info_list_single_res 1]
			set single_cube_start_y [lindex $graphic_info_list_single_res 2]
			set single_cube_start_z [lindex $graphic_info_list_single_res 3]
			set single_cube_size [lindex $graphic_info_list_single_res 4]
			set single_str_info [format "%s %.2f %.2f %.2f %.2f%s" $sit_relative_single $single_cube_start_x $single_cube_start_y $single_cube_start_z $single_cube_size $return_flag]
		}
                if {$which_graphic==0} {
                        set single_box_start_x [lindex $graphic_info_list_single_res 1]
                        set single_box_start_y [lindex $graphic_info_list_single_res 2]
                        set single_box_start_z [lindex $graphic_info_list_single_res 3]
                        set single_box_end_x [lindex $graphic_info_list_single_res 4]
                        set single_box_end_y [lindex $graphic_info_list_single_res 5]
                        set single_box_end_z [lindex $graphic_info_list_single_res 6]

                        set single_str_info [format "%s %.2f %.2f %.2f %.2f %.2f %.2f%s" $sit_relative_single $single_box_start_x $single_box_start_y $single_box_start_z $single_box_end_x $single_box_end_y $single_box_end_z $return_flag]
                }

                if {$which_graphic==1} {
                        set single_sphere_x [lindex $graphic_info_list_single_res 1]
                        set single_sphere_y [lindex $graphic_info_list_single_res 2]
                        set single_sphere_z [lindex $graphic_info_list_single_res 3]
                        set single_sphere_r [lindex $graphic_info_list_single_res 4]

                        set single_str_info [format "%s %.2f %.2f %.2f %.2f%s" $sit_relative_single $single_sphere_x $single_sphere_y $single_sphere_z $single_sphere_r $return_flag]
                }

		if {$which_graphic==2} {
                        set single_ellipsoid_a1 [lindex $graphic_info_list_single_res 1]
                        set single_ellipsoid_b1 [lindex $graphic_info_list_single_res 2]
                        set single_ellipsoid_c1 [lindex $graphic_info_list_single_res 3]
                        set single_ellipsoid_a2 [lindex $graphic_info_list_single_res 4]
                        set single_ellipsoid_b2 [lindex $graphic_info_list_single_res 5]
                        set single_ellipsoid_c2 [lindex $graphic_info_list_single_res 6]
                        set single_ellipsoid_d [lindex $graphic_info_list_single_res 7]

			if {$single_ellipsoid_a2==0||$single_ellipsoid_b2==0||$single_ellipsoid_c2==0||$single_ellipsoid_d==0} {
				set msg "ellipsoid: a2, b2, c2, d > 0"
				tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
				set ellipsoid_return_flag 1
				return
			}

                        set single_str_info [format "%s %.2f %.2f %.2f %.2f %.2f %.2f %.2f%s" $sit_relative_single $single_ellipsoid_a1 $single_ellipsoid_b1 $single_ellipsoid_c1 $single_ellipsoid_a2 $single_ellipsoid_b2 $single_ellipsoid_c2 $single_ellipsoid_d $return_flag]
                }

		if {$which_graphic==3} {
                        set single_plane_a [lindex $graphic_info_list_single_res 1]
                        set single_plane_b [lindex $graphic_info_list_single_res 2]
                	set single_plane_c [lindex $graphic_info_list_single_res 3]
 		        set single_plane_d [lindex $graphic_info_list_single_res 4]
			if {$single_plane_a==0&&$single_plane_b==0&&$single_plane_c==0} {
				set msg "plane: a>0 or b>0 or c>0"
				tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
                                set plane_return_flag 1
				return
                         }

                         set single_str_info [format "%s %.2f %.2f %.2f %.2f%s" $sit_relative_single $single_plane_a $single_plane_b $single_plane_c $single_plane_d $return_flag]
                }

                if {$which_graphic==4} {
			set single_cylinder_fir_circle_x [lindex $graphic_info_list_single_res 1]
                        set single_cylinder_fir_circle_y [lindex $graphic_info_list_single_res 2]
                        set single_cylinder_fir_circle_z [lindex $graphic_info_list_single_res 3]
                        set single_cylinder_sec_circle_x [lindex $graphic_info_list_single_res 4]
                        set single_cylinder_sec_circle_y [lindex $graphic_info_list_single_res 5]
                        set single_cylinder_sec_circle_z [lindex $graphic_info_list_single_res 6]
                        set single_cylinder_r [lindex $graphic_info_list_single_res 7]
                        set single_cylinder_length [lindex $graphic_info_list_single_res 8]

                        set single_str_info [format "%s %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f%s" $sit_relative_single $single_cylinder_fir_circle_x $single_cylinder_fir_circle_y $single_cylinder_fir_circle_z $single_cylinder_sec_circle_x $single_cylinder_sec_circle_y $single_cylinder_sec_circle_z $single_cylinder_r $single_cylinder_length $return_flag]
                }

		if {$which_graphic==5} {
			set single_gauss_a1 [lindex $graphic_info_list_single_res 1]
			set single_gauss_b1 [lindex $graphic_info_list_single_res 2]
			set single_gauss_a2 [lindex $graphic_info_list_single_res 3]
			set single_gauss_b2 [lindex $graphic_info_list_single_res 4]
			set single_gauss_c [lindex $graphic_info_list_single_res 5]
			set single_gauss_h [lindex $graphic_info_list_single_res 6]

			if {[string is double -strict $single_gauss_a1] == 0 || [string is double -strict $single_gauss_b1] == 0 || [string is double -strict $single_gauss_a2] == 0 || [string is double -strict $single_gauss_b2] == 0 || [string is double -strict $single_gauss_c] == 0 || [string is double -strict $single_gauss_h] == 0} {
				set msg "xygauss: a1, a2, b1, b2, c, h must be real numbers."
                                tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
				set xygauss_number_return_flag 1
                                return
			}

			if {$single_gauss_a2==0||$single_gauss_b2==0} {
				set msg "xygauss: a2, b2 cannot be 0"
				tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
				set xygauss_zero_return_flag 1
				return
			}

			set single_str_info [format "%s %.2f %.2f %.2f %.2f %.2f %.2f%s" $sit_relative_single $single_gauss_a1 $single_gauss_b1 $single_gauss_a2 $single_gauss_b2 $single_gauss_c $single_gauss_h $return_flag]
		}

                if {$atom_flag==1&&$single_str_info!=""} {
                        set single_str_add_tab_info [format "%s%s%s" $tab $tab $single_str_info]
                }
		if {$atom_flag!=1&&$single_str_info!=""} {
                        set single_str_add_tab_info [format "%s%s" $tab $single_str_info]
                }
                append show_str $single_str_add_tab_info

                if {$atom_flag==1} {
                	set end_atom_str "end atoms"
                        set end_atom_str_info [format "%s%s%s" $tab $end_atom_str $return_flag]
                        append show_str $end_atom_str_info
                }
		}
		incr res_number
	}
		set end_structure "end structure\n"
		append show_str $end_structure

		incr res_unique_number
	}

	if {$add_amber_ter=="yes"} {
                set add_amber_ter_str "add_amber_ter\n"
                append show_str $add_amber_ter_str
        }
        if {$box_sides!=0} {
                set add_box_sides_str "add_box_sides"
                set add_box_sides_str_info [format "%s %s%s" $add_box_sides_str $box_sides $return_flag]
                append show_str $add_box_sides_str_info
        }
        if {$sidemax!=1000} {
                set sidemax_str "sidemax"
                set sidemax_str_info [format "%s %s%s" $sidemax_str $sidemax $return_flag]
                append show_str $sidemax_str_info
        }
        if {$seed!=0} {
                set seed_str "seed"
                set seed_str_info [format "%s %s%s" $seed_str $seed $return_flag]
                append show_str $seed_str_info
        }
        if {$use_randominitialpoint=="yes"} {
                set randominitialpoint_str "randominitialpoint\n"
                append show_str $randominitialpoint_str
        }
        if {$avoid_overlap=="yes"} {
                set avoid_overlap_str "avoid_overlap"
                set yes_str "yes"
                set avoid_overlap_yes_str [format "%s %s%s" $avoid_overlap_str $yes_str $return_flag]
                append show_str $avoid_overlap_yes_str
        }
        if {$discale!=0} {
                set discale_str "discale"
                set discale_str_info [format "%s %s%s" $discale_str $discale $return_flag]
                append show_str $discale_str_info
        }
        if {$maxit!=20} {
                set maxit_str "maxit"
                set maxit_str_info [format "%s %s%s" $maxit_str $maxit $return_flag]
                append show_str $maxit_str_info
        }
        if {$movebadrandom=="yes"} {
                set movebadrandom_str "movebadrandom\n"
                append show_str $movebadrandom_str
        }
        if {$nloop!=0} {
                set nloop_str "nloop"
                set nloop_str_info [format "%s %s%s" $nloop_str $nloop $return_flag]
                append show_str $nloop_str_info
        }
	if {$precision!=0.01} {
                set precision_str "precision"
                set precision_str_info [format "%s %s%s" $precision_str $precision $return_flag]
                append show_str $precision_str_info
        }
        if {$writeout!=0} {
                set writeout_str "writeout"
                set writeout_str_info [format "%s %s%s" $writeout_str $writeout $return_flag]
                append show_str $writeout_str_info
        }
        if {$writebad=="yes"} {
                set writebad_str "writebad\n"
                append show_str $writebad_str
        }
        if {$check=="yes"} {
                set check_str "check\n"
                append show_str $check_str
        }
        if {$iprint1==0||$iprint1==1||$iprint1==2||$iprint1==3} {
                set iprint1_str "iprint1"
                set iprint1_str_info [format "%s %s%s" $iprint1_str $iprint1 $return_flag]
                append show_str $iprint1_str_info
        }
        if {$iprint2==0||$iprint2==1||$iprint2==2||$iprint2==3} {
                set iprint2_str "iprint2"
                set iprint2_str_info [format "%s %s%s" $iprint2_str $iprint2 $return_flag]
                append show_str $iprint2_str_info
        }
        if {$fbins!=1.7321} {
                set fbins_str "fbins"
                set fbins_str_info [format "%s %s%s" $fbins_str $fbins $return_flag]
                append show_str $fbins_str_info
        }
        if {$chkgrad=="yes"} {
                set chkgrad_str "chkgrad\n"
                append show_str $chkgrad_str
        }
	if {$use_short_tol=="yes"} {
		set use_short_tol_str "use_short_tol\n"
		append show_str $use_short_tol_str

		set short_tol_dist_str "short_tol_dist"
		set short_tol_dist_str_info [format "%s %s%s" $short_tol_dist_str $short_tol_dist $return_flag]
		append show_str $short_tol_dist_str_info

		set short_tol_scale_str "short_tol_scale"
		set short_tol_scale_str_info [format "%s %s%s" $short_tol_scale_str $short_tol_scale $return_flag]
		append show_str $short_tol_scale_str_info
	}
	if {$movefrac!=0.05} {
		set movefrac_str "movefrac"
		set movefrac_str_info [format "%s %s%s" $movefrac_str $movefrac $return_flag]
		append show_str $movefrac_str_info
	}
	if {$connect!="yes"} {
		set connect_str "connect"
		set connect_str_info [format "%s %s%s" $connect_str $connect $return_flag]
		append show_str $connect_str_info
	}

	set generate_packmol_input $show_str
	if {$click_save==0} {
		set timestamp [clock format [clock seconds] -format "%Y%m%d_%H%M%S"]
		set packmol_timestamp_file [format "packmol-%s.inp" $timestamp]
		set f_packmol_timestamp_file [open $packmol_timestamp_file w]
		puts $f_packmol_timestamp_file $generate_packmol_input
		close $f_packmol_timestamp_file
	} else {
		set click_save 0
	}

	destroy .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook
	ttk::notebook .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook
	frame .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar
	scrollbar .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.scrolly -command [list ".packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.text" yview]
        text .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.text -relief ridge -state normal -yscrollcommand [list ".packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.scrolly" set] -height 12 -width 68
	grid .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.text -column 0 -row 0 -sticky news
	grid .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.scrolly -column 1 -row 0 -sticky ns
        .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar.text insert 1.0 $generate_packmol_input
        .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook add .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook.text_scrollbar -text "Packmol Input File"
        pack .packmolview.all.first.system.system_fra.packmol_input_show.show.notebook -fill both
}

proc ::packmol::generate_output {} {
	variable tolerance
	variable thesefile
	variable graphic_info_list
	variable sitlist
	variable geolist
	variable res_moleculelist
        variable res_atomlist
	variable radiuslist
	variable fscalelist
        variable short_radiuslist
        variable short_radius_scalelist
	variable relativelist
	variable molid
	variable structure_num_list
	variable resnumber_list
        variable restart_from_list
        variable restart_to_list
        variable changechains_list
	variable center_fix_list
	variable file_type
	variable add_amber_ter
	variable box_sides
	variable sidemax
	variable seed
	variable use_randominitialpoint
	variable avoid_overlap
	variable discale
	variable maxit
	variable movebadrandom
	variable nloop
	variable precision
	variable writeout
	variable writebad
	variable iprint1
	variable iprint2
	variable check
	variable fbins
	variable chkgrad
	variable outputfilename_write
	variable outputdir
	variable constrain_list
	variable format_wrong
	variable chain_list
	variable segid_list
	variable maxmove_list
	variable generate_packmol_input
	variable ellipsoid_return_flag
	variable plane_return_flag
	variable xygauss_number_return_flag
        variable xygauss_zero_return_flag
	variable is_writecrd
        variable writecrdname_write
	variable pbc_xmin
        variable pbc_xmax
        variable pbc_ymin
        variable pbc_ymax
        variable pbc_zmin
        variable pbc_zmax
	variable use_short_tol
        variable short_tol_dist
        variable short_tol_scale
        variable movefrac
        variable connect
	variable is_writecrd
	variable fscale_short_radius_scale_wrong
	variable res_atom_flag
	variable click_save

	set tab "\t"
	set pi 3.1415926
#	set generate_packmol_input ""

	set new_molid [molinfo list]
	set new_molid_length [llength $new_molid]
	set molid_length [llength $molid]
	if {$new_molid_length!=$molid_length} {
		set msg "File list has changed, please refresh."
		tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
		return
	}

	set need_to_refresh 0
	if {$new_molid_length==$molid_length} {
		set molid_index 0
		while {$molid_index<$molid_length} {
			set this_molid [lindex $molid $molid_index]
			set this_new_molid [lindex $new_molid $molid_index]
			if {$this_molid!=$this_new_molid} {
				set need_to_refresh 1
			}
			incr molid_index
		}
	}
	if {$need_to_refresh==1} {
		set msg "File list has changed, please refresh."
		tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
		return
	}

	set filelength [llength $thesefile]
	if {$filelength==0} {
		return
	}

	set mol_number 0
	set mollength [llength $molid]

	::packmol::check_format
	if {$format_wrong==1} {
		return
	}
	::packmol::check_res_atom
	if {$res_atom_flag==1} {
		return
	}
	if {$outputfilename_write==""} {
		set msg "Please set output first"
		tk_messageBox -title "File name Error" -parent .packmolview -type ok -message $msg
		return
	}
	set click_save 1
	::packmol::show_packmol_input
	if {$fscale_short_radius_scale_wrong==1} {
		return
	}

	if {$ellipsoid_return_flag ==1 || $plane_return_flag == 1 || $xygauss_number_return_flag == 1 || $xygauss_zero_return_flag == 1} {
		return
	}

	set filename [tk_getSaveFile -filetypes  {{INP .inp} {All *}}]
	if {$filename==""} {
		return
	}
	set f [open $filename w]

	set tolerance_str "tolerance"
	set tolerance_str_info [format "%s %.2f" $tolerance_str $tolerance]
	puts $f $tolerance_str_info

	set filetype_str "filetype"
	set filetype_str_info [format "%s %s" $filetype_str $file_type]
	puts $f $filetype_str_info

	if {$is_writecrd==1} {
		set writecrd_str "writecrd"
		set writecrd_str_info [format "%s %s" $writecrd_str "\"$writecrdname_write\""]
		puts $f $writecrd_str_info
	}

	set output_str "output"
	set output_dir_filename [file join $outputdir $outputfilename_write]
	set output_str_info [format "%s %s" $output_str "\"$output_dir_filename\""]
	puts $f $output_str_info

	if {$pbc_xmin!=0 || $pbc_xmax!=0 || $pbc_ymin!=0 || $pbc_ymax!=0 || $pbc_zmin!=0 || $pbc_zmax!=0} {
		set pbc_str "pbc"
		set pbc_str_info [format "%s %.2f %.2f %.2f %.2f %.2f %.2f" $pbc_str $pbc_xmin $pbc_ymin $pbc_zmin $pbc_xmax $pbc_ymax $pbc_zmax]
		puts $f $pbc_str_info
        }

	set res_res_moleculelist_unique [lsort -unique $res_moleculelist]
        set res_res_moleculelist_unique_len [llength $res_res_moleculelist_unique]
	set res_moleculelist_len [llength $res_moleculelist]

	set res_unique_number 0
        while {$res_unique_number<$res_res_moleculelist_unique_len} {
                set res_unique_number_id [lindex $res_res_moleculelist_unique $res_unique_number]

        set res_number 0
	set same_number 0
        while {$res_number<$res_moleculelist_len} {
                set res_number_id [lindex $res_moleculelist $res_number]
		if {$res_number_id==$res_unique_number_id} {
                set molid_index [lsearch $molid $res_number_id]
                set file_name_single [lindex $thesefile $molid_index]

		if {$same_number==0} {
                set structure "structure"
                set structure_str_info [format "%s %s" $structure "\"$file_name_single\""]
                puts $f $structure_str_info

                set number_str "number"
                set number_each [lindex $structure_num_list $res_number_id]
                set number_str_info [format "%s%s %d" $tab $number_str $number_each]
                puts $f $number_str_info

                set resnumber_str "resnumbers"
                set resnumber_each [lindex $resnumber_list $res_number_id]
                if {$resnumber_each!=0} {
                        set resnumber_str_info [format "%s%s %s" $tab $resnumber_str $resnumber_each]
                        puts $f $resnumber_str_info
                }

                set restart_from_str "restart_from"
                set restart_from_each [lindex $restart_from_list $res_number_id]
                if {$restart_from_each!=""} {
                        set restart_from_str_info [format "%s%s %s" $tab $restart_from_str $restart_from_each]
                        puts $f $restart_from_str_info
                }

                set restart_to_str "restart_to"
                set restart_to_each [lindex $restart_to_list $res_number_id]
                if {$restart_to_each!=""} {
                        set restart_to_str_info [format "%s%s %s" $tab $restart_to_str $restart_to_each]
                        puts $f $restart_to_str_info
                }

		set changechains_str "changechains"
                set changechains_each [lindex $changechains_list $res_number_id]
                if {$changechains_each!="no"} {
                        set changechains_str_info [format "%s%s" $tab $changechains_str]
                        puts $f $changechains_str_info
                } else {
                        set chain_str "chain"
                        set chain_each [lindex $chain_list $res_number_id]
                        if {$chain_each!=""} {
                                set chain_str_info [format "%s%s %s" $tab $chain_str $chain_each]
                                puts $f $chain_str_info
                        }
                }

                set segid_str "segid"
                set segid_each [lindex $segid_list $res_number_id]
                if {$is_writecrd!=0} {
                        if {$segid_each!=""} {
                                set segid_str_info [format "%s%s %s" $tab $segid_str $segid_each]
                                puts $f $segid_str_info
                        }
                }

                set maxmove_str "maxmove"
                set maxmove_each [lindex $maxmove_list $res_number_id]
                if {$maxmove_each!=""} {
                        set maxmove_str_info [format "%s%s %s" $tab $maxmove_str $maxmove_each]
                        puts $f $maxmove_str_info
                }

		set center_fix_single_info [lindex $center_fix_list $res_number_id]
                set need_to_center_fix [lindex $center_fix_single_info 0]
                set need_to_fix_x [lindex $center_fix_single_info 1]
                set need_to_fix_y [lindex $center_fix_single_info 2]
                set need_to_fix_z [lindex $center_fix_single_info 3]
                set need_to_fix_alpha [lindex $center_fix_single_info 4]
                set need_to_fix_beta [lindex $center_fix_single_info 5]
                set need_to_fix_gamma [lindex $center_fix_single_info 6]
                set need_to_fix_alpha_radian [expr $need_to_fix_alpha / 180.0 * $pi]
                set need_to_fix_beta_radian [expr $need_to_fix_beta / 180.0 * $pi]
                set need_to_fix_gamma_radian [expr $need_to_fix_gamma / 180.0 * $pi]

                if {$need_to_fix_x!=0||$need_to_fix_y!=0||$need_to_fix_z!=0||$need_to_fix_alpha!=0||$need_to_fix_beta!=0||$need_to_fix_gamma!=0||$need_to_center_fix==1} {
                        if {$need_to_center_fix==1} {
                                set center_str "center"
                                set center_str_info [format "%s%s" $tab $center_str]
                                puts $f $center_str_info
                        }
                        set fixed_str "fixed"
                        set need_to_fix_str_info [format "%s%s %.2f %.2f %.2f %.2f %.2f %.2f" $tab $fixed_str $need_to_fix_x $need_to_fix_y $need_to_fix_z $need_to_fix_alpha_radian $need_to_fix_beta_radian $need_to_fix_gamma_radian]
                        puts $f $need_to_fix_str_info
                }

		set constrain_single_info [lindex $constrain_list $res_number_id]
                set need_to_constrain [lindex $constrain_single_info 0]
                if {$need_to_constrain==1} {
                        set need_to_constrain_x [lindex $constrain_single_info 1]
                        set need_to_constrain_y [lindex $constrain_single_info 2]
                        set need_to_constrain_z [lindex $constrain_single_info 3]
                        set need_to_constrain_x_plus [lindex $constrain_single_info 4]
                        set need_to_constrain_y_plus [lindex $constrain_single_info 5]
                        set need_to_constrain_z_plus [lindex $constrain_single_info 6]

                        if {$need_to_constrain_x!=0||$need_to_constrain_x_plus!=0} {
                                set constrain_x_str "constrain_rotation x"
                                set constrain_x_str_info [format "%s%s %.2f %.2f" $tab $constrain_x_str $need_to_constrain_x $need_to_constrain_x_plus]
                                puts $f $constrain_x_str_info
                        }
                        if {$need_to_constrain_y!=0||$need_to_constrain_y_plus!=0} {
                                set constrain_y_str "constrain_rotation y"
                                set constrain_y_str_info [format "%s%s %.2f %.2f" $tab $constrain_y_str $need_to_constrain_y $need_to_constrain_y_plus]
                                puts $f $constrain_y_str_info
                        }
                        if {$need_to_constrain_z!=0||$need_to_constrain_z_plus!=0} {
                                set constrain_z_str "constrain_rotation z"
                                set constrain_z_str_info [format "%s%s %.2f %.2f" $tab $constrain_z_str $need_to_constrain_z $need_to_constrain_z_plus]
                                puts $f $constrain_z_str_info
                        }
                }
		}
		incr same_number

		set atom_flag 0
                set sitlist_single_res [lindex $sitlist $res_number]
                set relative_single_res [lindex $relativelist $res_number]
                set sit_relative_single [format "%s %s" $relative_single_res $sitlist_single_res]

                set res_atomlist_single_res [lindex $res_atomlist $res_number]
                if {$res_atomlist_single_res!=""} {
                        set atom_str "atoms"
                        set atom_str_num [format "%s%s %s" $tab $atom_str $res_atomlist_single_res]
                        puts $f $atom_str_num
                        set atom_flag 1
                }

                set radiuslist_single_res [lindex $radiuslist $res_number]
                if {$radiuslist_single_res!=1} {
                        set radius_str "radius"
                        if {$atom_flag==1} {
                                set radius_str_info [format "%s%s%s %.2f" $tab $tab $radius_str $radiuslist_single_res]
                        } else {
                                set radius_str_info [format "%s%s %.2f" $tab $radius_str $radiuslist_single_res]
                        }
                        puts $f $radius_str_info
                }

		set fscalelist_single_res [lindex $fscalelist $res_number]
                if {$fscalelist_single_res!=""} {
                        if {[string is double -strict $fscalelist_single_res] == 1} {
                                set fscale_str "fscale"

                                if {$atom_flag==1} {
                                        set fscale_str_info [format "%s%s%s %s" $tab $tab $fscale_str $fscalelist_single_res]
                                } else {
                                        set fscale_str_info [format "%s%s %s" $tab $fscale_str $fscalelist_single_res]
                                }
                                puts $f $fscale_str_info
                        } else {
                                set msg "fscale must be a real number."
                                tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
                                set fscale_short_radius_scale_wrong 1
                                return
                        }
                }

                set short_radiuslist_single_res [lindex $short_radiuslist $res_number]
                if {$short_radiuslist_single_res!=""} {
                        if {[string is double -strict $short_radiuslist_single_res] == 1} {
                                set short_radius_str "short_radius"

                                if {$atom_flag==1} {
                                        set short_radius_str_info [format "%s%s%s %s" $tab $tab $short_radius_str $short_radiuslist_single_res]
                                } else {
                                        set short_radius_str_info [format "%s%s %s" $tab $short_radius_str $short_radiuslist_single_res]
                                }
                                puts $f $short_radius_str_info
                        } else {
                                set msg "short_radius must be a real number."
                                tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
                                set fscale_short_radius_scale_wrong 1
                                return
                        }
                }

		set short_radius_scalelist_single_res [lindex $short_radius_scalelist $res_number]
                if {$short_radius_scalelist_single_res!=""} {
                        if {[string is double -strict $short_radius_scalelist_single_res] == 1} {
                                set short_radius_scale_str "short_radius_scale"

                                if {$atom_flag==1} {
                                        set short_radius_scale_str_info [format "%s%s%s %s" $tab $tab $short_radius_scale_str $short_radius_scalelist_single_res]
                                } else {
                                        set short_radius_scale_str_info [format "%s%s %s" $tab $short_radius_scale_str $short_radius_scalelist_single_res]
                                }
                                puts $f $short_radius_scale_str_info
                        } else {
                                set msg "short_radius_scale must be a real number."
                                tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
                                set fscale_short_radius_scale_wrong 1
                                return
                        }
                }

                set graphic_info_list_single_res [lindex $graphic_info_list $res_number]
                set which_graphic [lindex $graphic_info_list_single_res 0]
                if {$which_graphic==6} {
                        set single_cube_start_x [lindex $graphic_info_list_single_res 1]
                        set single_cube_start_y [lindex $graphic_info_list_single_res 2]
                        set single_cube_start_z [lindex $graphic_info_list_single_res 3]
                        set single_cube_size [lindex $graphic_info_list_single_res 4]
                        set single_str_info [format "%s %.2f %.2f %.2f %.2f" $sit_relative_single $single_cube_start_x $single_cube_start_y $single_cube_start_z $single_cube_size]
                }

		if {$which_graphic==0} {
                        set single_box_start_x [lindex $graphic_info_list_single_res 1]
                        set single_box_start_y [lindex $graphic_info_list_single_res 2]
                        set single_box_start_z [lindex $graphic_info_list_single_res 3]
                        set single_box_end_x [lindex $graphic_info_list_single_res 4]
                        set single_box_end_y [lindex $graphic_info_list_single_res 5]
                        set single_box_end_z [lindex $graphic_info_list_single_res 6]

                        set single_str_info [format "%s %.2f %.2f %.2f %.2f %.2f %.2f" $sit_relative_single $single_box_start_x $single_box_start_y $single_box_start_z $single_box_end_x $single_box_end_y $single_box_end_z]
                }

                if {$which_graphic==1} {
                        set single_sphere_x [lindex $graphic_info_list_single_res 1]
                        set single_sphere_y [lindex $graphic_info_list_single_res 2]
                        set single_sphere_z [lindex $graphic_info_list_single_res 3]
                        set single_sphere_r [lindex $graphic_info_list_single_res 4]

                        set single_str_info [format "%s %.2f %.2f %.2f %.2f" $sit_relative_single $single_sphere_x $single_sphere_y $single_sphere_z $single_sphere_r]
                }

                if {$which_graphic==2} {
                        set single_ellipsoid_a1 [lindex $graphic_info_list_single_res 1]
                        set single_ellipsoid_b1 [lindex $graphic_info_list_single_res 2]
                        set single_ellipsoid_c1 [lindex $graphic_info_list_single_res 3]
                        set single_ellipsoid_a2 [lindex $graphic_info_list_single_res 4]
                        set single_ellipsoid_b2 [lindex $graphic_info_list_single_res 5]
                        set single_ellipsoid_c2 [lindex $graphic_info_list_single_res 6]
                        set single_ellipsoid_d [lindex $graphic_info_list_single_res 7]

                        if {$single_ellipsoid_a2==0||$single_ellipsoid_b2==0||$single_ellipsoid_c2==0||$single_ellipsoid_d==0} {
                                set msg "ellipsoid: a2, b2, c2, d > 0"
                                tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
                                set ellipsoid_return_flag 1
                                return
                        }

                        set single_str_info [format "%s %.2f %.2f %.2f %.2f %.2f %.2f %.2f" $sit_relative_single $single_ellipsoid_a1 $single_ellipsoid_b1 $single_ellipsoid_c1 $single_ellipsoid_a2 $single_ellipsoid_b2 $single_ellipsoid_c2 $single_ellipsoid_d]
                }

		if {$which_graphic==3} {
                        set single_plane_a [lindex $graphic_info_list_single_res 1]
                        set single_plane_b [lindex $graphic_info_list_single_res 2]
                        set single_plane_c [lindex $graphic_info_list_single_res 3]
                        set single_plane_d [lindex $graphic_info_list_single_res 4]
                        if {$single_plane_a==0&&$single_plane_b==0&&$single_plane_c==0} {
                                set msg "plane: a>0 or b>0 or c>0"
                                tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
                                set plane_return_flag 1
                                return
                         }

                         set single_str_info [format "%s %.2f %.2f %.2f %.2f" $sit_relative_single $single_plane_a $single_plane_b $single_plane_c $single_plane_d]
                }

                if {$which_graphic==4} {
                        set single_cylinder_fir_circle_x [lindex $graphic_info_list_single_res 1]
                        set single_cylinder_fir_circle_y [lindex $graphic_info_list_single_res 2]
                        set single_cylinder_fir_circle_z [lindex $graphic_info_list_single_res 3]
                        set single_cylinder_sec_circle_x [lindex $graphic_info_list_single_res 4]
                        set single_cylinder_sec_circle_y [lindex $graphic_info_list_single_res 5]
                        set single_cylinder_sec_circle_z [lindex $graphic_info_list_single_res 6]
                        set single_cylinder_r [lindex $graphic_info_list_single_res 7]
                        set single_cylinder_length [lindex $graphic_info_list_single_res 8]

                        set single_str_info [format "%s %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f" $sit_relative_single $single_cylinder_fir_circle_x $single_cylinder_fir_circle_y $single_cylinder_fir_circle_z $single_cylinder_sec_circle_x $single_cylinder_sec_circle_y $single_cylinder_sec_circle_z $single_cylinder_r $single_cylinder_length]
                }

		if {$which_graphic==5} {
                        set single_gauss_a1 [lindex $graphic_info_list_single_res 1]
                        set single_gauss_b1 [lindex $graphic_info_list_single_res 2]
                        set single_gauss_a2 [lindex $graphic_info_list_single_res 3]
                        set single_gauss_b2 [lindex $graphic_info_list_single_res 4]
                        set single_gauss_c [lindex $graphic_info_list_single_res 5]
                        set single_gauss_h [lindex $graphic_info_list_single_res 6]

                        if {[string is double -strict $single_gauss_a1] == 0 || [string is double -strict $single_gauss_b1] == 0 || [string is double -strict $single_gauss_a2] == 0 || [string is double -strict $single_gauss_b2] == 0 || [string is double -strict $single_gauss_c] == 0 || [string is double -strict $single_gauss_h] == 0} {
                                set msg "xygauss: a1, a2, b1, b2, c, h must be real numbers."
                                tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
                                set xygauss_number_return_flag 1
                                return
                        }

                        if {$single_gauss_a2==0||$single_gauss_b2==0} {
                                set msg "xygauss: a2, b2 cannot be 0"
                                tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
                                set xygauss_zero_return_flag 1
                                return
                        }

                        set single_str_info [format "%s %.2f %.2f %.2f %.2f %.2f %.2f" $sit_relative_single $single_gauss_a1 $single_gauss_b1 $single_gauss_a2 $single_gauss_b2 $single_gauss_c $single_gauss_h]
                }

		if {$atom_flag==1&&$single_str_info!=""} {
                        set single_str_add_tab_info [format "%s%s%s" $tab $tab $single_str_info]
                }
                if {$atom_flag!=1&&$single_str_info!=""} {
                        set single_str_add_tab_info [format "%s%s" $tab $single_str_info]
                }
                puts $f $single_str_add_tab_info

                if {$atom_flag==1} {
                        set end_atom_str "end atoms"
                        set end_atom_str_info [format "%s%s" $tab $end_atom_str]
                        puts $f $end_atom_str_info
                }
		}
                incr res_number
	}
		set end_structure "end structure"
		puts $f $end_structure

		incr res_unique_number
	}

	if {$add_amber_ter=="yes"} {
		set add_amber_ter_str "add_amber_ter"
		puts $f $add_amber_ter_str
	}
	if {$box_sides!=0} {
		set add_box_sides_str "add_box_sides"
		set add_box_sides_str_info [format "%s %s" $add_box_sides_str $box_sides]
		puts $f $add_box_sides_str_info
	}
	if {$sidemax!=1000} {
		set sidemax_str "sidemax"
		set sidemax_str_info [format "%s %s" $sidemax_str $sidemax]
		puts $f $sidemax_str_info
	}
	if {$seed!=0} {
		set seed_str "seed"
		set seed_str_info [format "%s %s" $seed_str $seed]
		puts $f $seed_str_info
	}
	if {$use_randominitialpoint=="yes"} {
		set randominitialpoint_str "randominitialpoint"
		puts $f $randominitialpoint_str
	}
	if {$avoid_overlap=="yes"} {
		set avoid_overlap_str "avoid_overlap"
		set yes_str "yes"
		set avoid_overlap_yes_str [format "%s %s" $avoid_overlap_str $yes_str]
		puts $f $avoid_overlap_yes_str
	}
#	if {$avoid_overlap=="no"} {
#		set avoid_overlap_str "avoid_overlap"
#		set no_str "no"
#		set avoid_overlap_no_str [format "%s %s" $avoid_overlap_str $no_str]
#		puts $f $avoid_overlap_no_str
#	}
	if {$discale!=0} {
		set discale_str "discale"
		set discale_str_info [format "%s %s" $discale_str $discale]
		puts $f $discale_str_info
	}
	if {$maxit!=20} {
		set maxit_str "maxit"
		set maxit_str_info [format "%s %s" $maxit_str $maxit]
		puts $f $maxit_str_info
	}
	if {$movebadrandom=="yes"} {
		set movebadrandom_str "movebadrandom"
		puts $f $movebadrandom_str
	}
	if {$nloop!=0} {
		set nloop_str "nloop"
		set nloop_str_info [format "%s %s" $nloop_str $nloop]
		puts $f $nloop_str_info
	}
	if {$precision!=0.01} {
		set precision_str "precision"
		set precision_str_info [format "%s %s" $precision_str $precision]
		puts $f $precision_str_info
	}
	if {$writeout!=0} {
		set writeout_str "writeout"
		set writeout_str_info [format "%s %s" $writeout_str $writeout]
		puts $f $writeout_str_info
	}
	if {$writebad=="yes"} {
		set writebad_str "writebad"
		puts $f $writebad_str
	}
	if {$check=="yes"} {
		set check_str "check"
		puts $f $check_str
	}
	if {$iprint1==0||$iprint1==1||$iprint1==2||$iprint1==3} {
		set iprint1_str "iprint1"
		set iprint1_str_info [format "%s %s" $iprint1_str $iprint1]
		puts $f $iprint1_str_info
	}
	if {$iprint2==0||$iprint2==1||$iprint2==2||$iprint2==3} {
		set iprint2_str "iprint2"
		set iprint2_str_info [format "%s %s" $iprint2_str $iprint2]
		puts $f $iprint2_str_info
	}
	if {$fbins!=1.7321} {
		set fbins_str "fbins"
		set fbins_str_info [format "%s %s" $fbins_str $fbins]
		puts $f $fbins_str_info
	}
	if {$chkgrad=="yes"} {
		set chkgrad_str "chkgrad"
		puts $f $chkgrad_str
	}
	if {$use_short_tol=="yes"} {
                set use_short_tol_str "use_short_tol"
                puts $f $use_short_tol_str

                set short_tol_dist_str "short_tol_dist"
                set short_tol_dist_str_info [format "%s %s" $short_tol_dist_str $short_tol_dist]
		puts $f $short_tol_dist_str_info

                set short_tol_scale_str "short_tol_scale"
                set short_tol_scale_str_info [format "%s %s" $short_tol_scale_str $short_tol_scale]
		puts $f $short_tol_scale_str_info
        }
        if {$movefrac!=0.05} {
                set movefrac_str "movefrac"
                set movefrac_str_info [format "%s %s" $movefrac_str $movefrac]
		puts $f $movefrac_str_info
        }
        if {$connect!="yes"} {
                set connect_str "connect"
                set connect_str_info [format "%s %s" $connect_str $connect]
		puts $f $connect_str_info
        }
	close $f
}

proc ::packmol::check_format {} {
	variable sitlist
        variable relativelist
        variable molid
	variable format_wrong

	set format_wrong 0
	set sitlist_len [llength $sitlist]
	set res_number 0
	while {$res_number<$sitlist_len} {
		set relative_list_single [lindex $relativelist $res_number]
		set sit_list_single [lindex $sitlist $res_number]
		if {$relative_list_single=="inside"||$relative_list_single=="outside"} {
			if {$sit_list_single=="plane"||$sit_list_single=="xygauss"} {
				set msg "over/below plane, xygauss or inside/outside cube, box, sphere, ellipsoid, cylinder"
				tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
				set format_wrong 1
				return
			}
		}
		if {$relative_list_single=="over"||$relative_list_single=="below"} {
			if {$sit_list_single=="cube"||$sit_list_single=="box"||$sit_list_single=="sphere"||$sit_list_single=="ellipsoid"||$sit_list_single=="cylinder"} {
				set msg "over/below plane, xygauss or inside/outside cube, box, sphere, ellipsoid, cylinder"
				tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
				set format_wrong 1
				return
			}
		}
		incr res_number
	}
}

proc ::packmol::check_res_atom {} {
	variable molid
	variable res_moleculelist
	variable res_atomlist
	variable res_atom_flag

	set res_atomlist_len [llength $res_atomlist]
        set res_number 0
	set res_atom_flag 0
	while {$res_number<$res_atomlist_len} {
		set res_id [lindex $res_moleculelist $res_number]

		set res_atomlist_each [lindex $res_atomlist $res_number]
		if {$res_atomlist_each!=""} {
			if {[string is space $res_atomlist_each]} {
				set num_sit [expr $res_number + 1]
				set msg [format "The %sth atomic constraints are spaces." $num_sit]
				set res_atom_flag 1
				return
			}
			set compare_atom_sel [atomselect $res_id all]
			set compare_atomlist [$compare_atom_sel get serial]
			set res_atomlist_each_list [split $res_atomlist_each " "]
			set res_atomlist_each_list_len [llength $res_atomlist_each_list]
			set single_number 0
			while {$single_number < $res_atomlist_each_list_len} {
				set res_atomlist_each_list_check [lindex $res_atomlist_each_list $single_number]
				if {[lsearch $compare_atomlist $res_atomlist_each_list_check] == -1} {
					if {$res_atomlist_each_list_check!=""} {
						set msg [format "%s is not in molecule %s." $res_atomlist_each $res_id]
						tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
						set res_atom_flag 1
						return
					}
				}
				incr single_number
			}
		}
		incr res_number
	}
}

proc ::packmol::general_setting {} {
	variable import_file_dir
	variable packmol_name
	variable system
	global env
	variable tolerance
	variable file_type
	variable add_amber_ter
	variable box_sides
	variable sidemax
	variable seed
	variable use_randominitialpoint
	variable avoid_overlap
	variable discale
	variable maxit
	variable movebadrandom
	variable nloop
	variable precision
	variable writeout
	variable writebad
	variable check
	variable iprint1
	variable iprint2
	variable fbins
	variable chkgrad
	variable outputdir
        variable outputfilename_write
	variable checkbox
	variable use_short_tol
        variable short_tol_dist
        variable short_tol_scale
	variable movefrac
	variable connect

	set vmd_Linux_pwd_dir $env(PACKMOLDIR)
	set vmd_Linux_pwd_dir [file dirname $vmd_Linux_pwd_dir]
	set vmd_Linux_pwd_dir [file dirname $vmd_Linux_pwd_dir]
	set vmd_Linux_pwd_dir [file dirname $vmd_Linux_pwd_dir]
	set vmd_Linux_pwd_dir [file dirname $vmd_Linux_pwd_dir]
	set packmol_info_str "plugins/noarch/tcl/packmol1.0/packmol_info.json"
	set vmd_packmol_json_pwd [file join $vmd_Linux_pwd_dir $packmol_info_str]
	if {[catch {set f [open $vmd_packmol_json_pwd r]}]} {
		if {$system=="Linux"} {
			set f_new [open $vmd_packmol_json_pwd w]
			set dict_info [dict create "packmol_import" "\"$import_file_dir\"" "outputdir" "\"$outputdir\"" "outputfilename" "\"$outputfilename_write\"" "tolerance" $tolerance "filetype" $file_type "add_amber_ter" $add_amber_ter "add_box_sides" $box_sides "sidemax" $sidemax "seed" $seed "randominitialpoint" $use_randominitialpoint "avoid_overlap" $avoid_overlap "discale" $discale "maxit" $maxit "movebadrandom" $movebadrandom "nloop" $nloop "precision" $precision "writeout" $writeout "writebad" $writebad "check" $check "iprint1" $iprint1 "iprint2" $iprint2 "fbins" $fbins "chkgrad" $chkgrad "load_output_structure" $checkbox "use_short_tol" $use_short_tol "short_tol_dist" $short_tol_dist "short_tol_scale" $short_tol_scale "movefrac" $movefrac "connect" $connect]
			set packmol_pwd [::packmol::dict2json $dict_info]
			puts $f_new $packmol_pwd
			close $f_new
		}
		if {$system=="Windows"} {
			set f_new [open $vmd_packmol_json_pwd w]
			set dict_info [dict create "packmol_pwd" "\"$packmol_name\"" "packmol_import" "\"$import_file_dir\"" "outputdir" "\"$outputdir\"" "outputfilename" "\"$outputfilename_write\"" "tolerance" $tolerance "filetype" $file_type "add_amber_ter" $add_amber_ter "add_box_sides" $box_sides "sidemax" $sidemax "seed" $seed "randominitialpoint" $use_randominitialpoint "avoid_overlap" $avoid_overlap "discale" $discale "maxit" $maxit "movebadrandom" $movebadrandom "nloop" $nloop "precision" $precision "writeout" $writeout "writebad" $writebad "check" $check "iprint1" $iprint1 "iprint2" $iprint2 "fbins" $fbins "chkgrad" $chkgrad "load_output_structure" $checkbox "use_short_tol" $use_short_tol "short_tol_dist" $short_tol_dist "short_tol_scale" $short_tol_scale "movefrac" $movefrac "connect" $connect]
			set packmol_pwd [::packmol::dict2json $dict_info]
			puts $f_new $packmol_pwd
			close $f_new
		}
	}
}

proc ::packmol::change_general_setting {} {
	variable import_file_dir
        variable packmol_name
        variable system
        global env
        variable tolerance
        variable file_type
        variable add_amber_ter
        variable box_sides
        variable sidemax
        variable seed
        variable use_randominitialpoint
        variable avoid_overlap
        variable discale
        variable maxit
        variable movebadrandom
        variable nloop
        variable precision
        variable writeout
        variable writebad
        variable check
        variable iprint1
        variable iprint2
        variable fbins
        variable chkgrad
	variable outputdir
	variable outputfilename_write
	variable checkbox
	variable use_short_tol
	variable short_tol_dist
	variable short_tol_scale
	variable movefrac
	variable connect

	set vmd_Linux_pwd_dir $env(PACKMOLDIR)
	set vmd_Linux_pwd_dir [file dirname $vmd_Linux_pwd_dir]
	set vmd_Linux_pwd_dir [file dirname $vmd_Linux_pwd_dir]
	set vmd_Linux_pwd_dir [file dirname $vmd_Linux_pwd_dir]
	set vmd_Linux_pwd_dir [file dirname $vmd_Linux_pwd_dir]
	set packmol_info_str "plugins/noarch/tcl/packmol1.0/packmol_info.json"
	set vmd_packmol_json_pwd [file join $vmd_Linux_pwd_dir $packmol_info_str]

	if {$system=="Linux"} {
		set f_new [open $vmd_packmol_json_pwd w]
		set dict_info [dict create "packmol_import" "\"$import_file_dir\"" "outputdir" "\"$outputdir\"" "outputfilename" "\"$outputfilename_write\"" "tolerance" $tolerance "filetype" $file_type "add_amber_ter" $add_amber_ter "add_box_sides" $box_sides "sidemax" $sidemax "seed" $seed "randominitialpoint" $use_randominitialpoint "avoid_overlap" $avoid_overlap "discale" $discale "maxit" $maxit "movebadrandom" $movebadrandom "nloop" $nloop "precision" $precision "writeout" $writeout "writebad" $writebad "check" $check "iprint1" $iprint1 "iprint2" $iprint2 "fbins" $fbins "chkgrad" $chkgrad "load_output_structure" $checkbox "use_short_tol" $use_short_tol "short_tol_dist" $short_tol_dist "short_tol_scale" $short_tol_scale "movefrac" $movefrac "connect" $connect]
		set packmol_pwd [::packmol::dict2json $dict_info]
		puts $f_new $packmol_pwd
		close $f_new
        }

	if {$system=="Windows"} {
		set f_new [open $vmd_packmol_json_pwd w]
		set dict_info [dict create "packmol_pwd" "\"$packmol_name\"" "packmol_import" "\"$import_file_dir\"" "outputdir" "\"$outputdir\"" "outputfilename" "\"$outputfilename_write\"" "tolerance" $tolerance "filetype" $file_type "add_amber_ter" $add_amber_ter "add_box_sides" $box_sides "sidemax" $sidemax "seed" $seed "randominitialpoint" $use_randominitialpoint "avoid_overlap" $avoid_overlap "discale" $discale "maxit" $maxit "movebadrandom" $movebadrandom "nloop" $nloop "precision" $precision "writeout" $writeout "writebad" $writebad "check" $check "iprint1" $iprint1 "iprint2" $iprint2 "fbins" $fbins "chkgrad" $chkgrad "load_output_structure" $checkbox "use_short_tol" $use_short_tol "short_tol_dist" $short_tol_dist "short_tol_scale" $short_tol_scale "movefrac" $movefrac "connect" $connect]
		set packmol_pwd [::packmol::dict2json $dict_info]
		puts $f_new $packmol_pwd
		close $f_new
	}
}

proc ::packmol::use_setted {} {
	variable import_file_dir
        variable packmol_name
        variable system
        global env
        variable tolerance
        variable file_type
        variable add_amber_ter
        variable box_sides
        variable sidemax
        variable seed
        variable use_randominitialpoint
        variable avoid_overlap
        variable discale
        variable maxit
        variable movebadrandom
        variable nloop
        variable precision
        variable writeout
        variable writebad
        variable check
        variable iprint1
        variable iprint2
        variable fbins
        variable chkgrad
	variable outputdir
        variable outputfilename
        variable outputfilename_write
	variable before_outputname
	variable checkbox
	variable use_short_tol
        variable short_tol_dist
        variable short_tol_scale
	variable movefrac
	variable connect

	set vmd_Linux_pwd_dir $env(PACKMOLDIR)
	set vmd_Linux_pwd_dir [file dirname $vmd_Linux_pwd_dir]
	set vmd_Linux_pwd_dir [file dirname $vmd_Linux_pwd_dir]
	set vmd_Linux_pwd_dir [file dirname $vmd_Linux_pwd_dir]
	set vmd_Linux_pwd_dir [file dirname $vmd_Linux_pwd_dir]
	set packmol_info_str "plugins/noarch/tcl/packmol1.0/packmol_info.json"
	set vmd_packmol_json_pwd [file join $vmd_Linux_pwd_dir $packmol_info_str]
	if {[catch {set f [open $vmd_packmol_json_pwd r]}]} {
		::packmol::general_setting
	} else {
		set row 0
		set all_row_info ""
		while {[gets $f line] >= 0} {
			incr row
			set single_row_info [set list($row) $line]
			append all_row_info $single_row_info
		}
		close $f
		set all_row_info [regsub -all ": " $all_row_info " "]
		set all_row_info [regsub -all ",\"" $all_row_info " \""]
		set generate_dict_order "set dict_info "
		append generate_dict_order $all_row_info
		eval $generate_dict_order

		if {[catch {set import_file_dir [dict get $dict_info "packmol_import"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set tolerance [dict get $dict_info "tolerance"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set file_type [dict get $dict_info "filetype"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set add_amber_ter [dict get $dict_info "add_amber_ter"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set box_sides [dict get $dict_info "add_box_sides"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set sidemax [dict get $dict_info "sidemax"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set seed [dict get $dict_info "seed"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set use_randominitialpoint [dict get $dict_info "randominitialpoint"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set avoid_overlap [dict get $dict_info "avoid_overlap"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set discale [dict get $dict_info "discale"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set maxit [dict get $dict_info "maxit"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set movebadrandom [dict get $dict_info "movebadrandom"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set nloop [dict get $dict_info "nloop"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set precision [dict get $dict_info "precision"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set writeout [dict get $dict_info "writeout"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set writebad [dict get $dict_info "writebad"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set check [dict get $dict_info "check"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set iprint1 [dict get $dict_info "iprint1"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set iprint2 [dict get $dict_info "iprint2"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set fbins [dict get $dict_info "fbins"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set chkgrad [dict get $dict_info "chkgrad"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set checkbox [dict get $dict_info "load_output_structure"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set use_short_tol [dict get $dict_info "use_short_tol"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set short_tol_dist [dict get $dict_info "short_tol_dist"]}]} {
			file delete $vmd_packmol_json_pwd
                        ::packmol::general_setting
                        return
		}
		if {[catch {set short_tol_scale [dict get $dict_info "short_tol_scale"]}]} {
			file delete $vmd_packmol_json_pwd
                        ::packmol::general_setting
                        return
		}
		if {[catch {set movefrac [dict get $dict_info "movefrac"]}]} {
			file delete $vmd_packmol_json_pwd
                        ::packmol::general_setting
                        return
		}
		if {[catch {set connect [dict get $dict_info "connect"]}]} {
			file delete $vmd_packmol_json_pwd
                        ::packmol::general_setting
                        return
		}
		if {[catch {set outputdir [dict get $dict_info "outputdir"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {[catch {set outputfilename [dict get $dict_info "outputfilename"]}]} {
			file delete $vmd_packmol_json_pwd
			::packmol::general_setting
			return
		}
		if {$system=="Windows"} {
			if {[catch {set packmol_name [dict get $dict_info "packmol_pwd"]}]} {
				file delete $vmd_packmol_json_pwd
				::packmol::general_setting
				return
			}
		}
		set before_outputname $outputfilename
	}
}

proc ::packmol::default_setting {} {
	variable tolerance
        set tolerance 2
	variable file_type
        set file_type "pdb"
        variable add_amber_ter
        set add_amber_ter "no"
        variable box_sides
        set box_sides 1
        variable sidemax
        set sidemax 1000
        variable seed
        set seed -1
        variable use_randominitialpoint
        set use_randominitialpoint "no"
        variable avoid_overlap
        set avoid_overlap "no"
        variable discale
        set discale 0
        variable maxit
        set maxit 20
        variable movebadrandom
        set movebadrandom "no"
        variable nloop
        set nloop 0
        variable precision
        set precision 0.01
        variable writeout
        set writeout 0
        variable writebad
        set writebad "no"
        variable check
        set check "no"
        variable iprint1
        set iprint1 -1
        variable iprint2
        set iprint2 -1
        variable fbins
        set fbins 1.7321
        variable chkgrad
        set chkgrad "no"
	variable checkbox
	set checkbox "yes"
	variable use_short_tol
	set use_short_tol "no"
	variable short_tol_dist
	set short_tol_dist 1
	variable short_tol_scale
	set short_tol_scale 3
	variable connect
	set connect "yes"
	variable movefrac
	set movefrac 0.05
	variable pbc_xmin
	set pbc_xmin 0
	variable pbc_xmax
	set pbc_xmax 0
	variable pbc_ymin
	set pbc_ymin 0
	variable pbc_ymax
	set pbc_ymax 0
	variable pbc_zmin
	set pbc_zmin 0
	variable pbc_zmax
	set pbc_zmax 0

	.packmolview.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_dist.spinbox configure -state disable
	.packmolview.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_scale.spinbox configure -state disable

	::packmol::change_general_setting
}

proc ::packmol::check_tolerance {} {
	variable tolerance

	if {[catch {set is_none [expr $tolerance / 1]}]} {
		set tolerance 2
	}
}

proc ::packmol::check_add_box_sides {} {
	variable box_sides

	if {[catch {set is_none [expr $box_sides / 1]}]} {
		set box_sides 1
	}
}

proc ::packmol::check_seed {} {
	variable seed

	if {[catch {set is_none [expr $seed / 1]}]} {
		set seed 0
	}
}

proc ::packmol::check_pbcsize {} {
	variable pbc_xmin
        variable pbc_xmax
        variable pbc_ymin
        variable pbc_ymax
        variable pbc_zmin
        variable pbc_zmax

	if {$pbc_xmin==0&&$pbc_xmax==0&&$pbc_ymin==0&&$pbc_ymax==0&&$pbc_zmin==0&&$pbc_zmax==0} {
		return
	}
	if {$pbc_xmin!=0 || $pbc_xmax!=0} {
		if {$pbc_xmin>=$pbc_xmax} {
			set msg "xmin >= xmax"
			tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
			set pbc_xmin 0
			set pbc_xmax 0
			return
		}
	}
	if {$pbc_ymin!=0 || $pbc_ymax!=0} {
		if {$pbc_ymin>=$pbc_ymax} {
			set msg "ymin>=ymax"
			tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
			set pbc_ymin 0
			set pbc_ymax 0
                	return
		}
	}
	if {$pbc_zmin!=0 || $pbc_zmax!=0} {
		if {$pbc_zmin>=$pbc_zmax} {
			set msg "zmin>=zmax"
			tk_messageBox -title "Setting Error" -parent .packmolview -type ok -message $msg
			set pbc_zmin 0
			set pbc_zmax 0
                	return
		}
	}
}

proc ::packmol::check_sidemax {} {
	variable sidemax

	if {[catch {set is_none [expr $sidemax / 1]}]} {
		set sidemax 1000
	}
}

proc ::packmol::check_discale {} {
	variable discale

	if {[catch {set is_none [expr $discale / 1]}]} {
		set discale 0
	}
}

proc ::packmol::check_maxit {} {
	variable maxit

	if {[catch {set is_none [expr $maxit / 1]}]} {
		set maxit 20
	}
}

proc ::packmol::check_nloop {} {
	variable nloop

	if {[catch {set is_none [expr $nloop / 1]}]} {
		set nloop 0
	}
}

proc ::packmol::check_precision {} {
	variable precision

	if {[catch {set is_none [expr $precision / 1]}]} {
		set precision 0.01
	}
}

proc ::packmol::change_dist_scale {} {
	variable use_short_tol

	if {$use_short_tol=="yes"} {
		.packmolview.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_dist.spinbox configure -state normal
		.packmolview.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_scale.spinbox configure -state normal
		::packmol::change_general_setting
	} else {
		.packmolview.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_dist.spinbox configure -state disable
		.packmolview.all.first.general.tol_constrain.side_random_avoid.fra.short_tol_scale.spinbox configure -state disable
		::packmol::change_general_setting
	}
}

proc ::packmol::check_writeout {} {
	variable writeout

	if {[catch {set is_none [expr $writeout / 1]}]} {
		set writeout 0
	}
}

proc ::packmol::check_fbins {} {
	variable fbins

	if {[catch {set is_none [expr $fbins / 1]}]} {
		set fbins 1.7321
	}
}

proc packmol_tk {} {
	::packmol::packmolview
	return $::packmol::packmol
}

