Step-by-Step Guide
===========
##  1. Import Molecules<br>
Import water.pdb and palmitoil.pdb twice, resulting in a total of 4 molecules: water-0, palmitoil-1, palmitoil-2, and water-3.<br><br>
![GIF-1](https://github.com/MSM-RAD-X-VMD-Plugin/PACKMOL-GUI/blob/main/annotated-recording-examples/Example-1-1.gif)
##  2. Add Spherical Constraint to Water-0
In the geometric constraints panel, click "Add" to apply a spherical constraint to water-0.
Select sphere from the Type dropdown menu, enter 13 as the radius in the spherical parameters user panel, and press Enter. The default center is set to (0,0,0).
The volume is calculated as 9202.77 Å³. Drag the slider to Constrains Volume and enter 9202.77, revealing that the maximum number of water molecules that can fit within this volume is 308, matching the PACKMOL tutorial. Enter 308 as the Number value in the molecular constraints. Use Molcontroller to move water-0 inside the spherical constraint.<br><br>
![GIF-2](https://github.com/MSM-RAD-X-VMD-Plugin/PACKMOL-GUI/blob/main/annotated-recording-examples/Example-1-2.gif)
## 3. Add Constraints to Palmitoil-1
Use the VMD distance measurement tool (press 2 on the numeric keypad) to select the carbon atoms of the palmitoil head carboxyl and tail methyl groups, measuring a distance of 12.51 Å. If considering hydrogen atoms, the length is approximately 13-14 Å. We use the 12 Å value provided by PACKMOL.
Select the palmitoil-1 molecule and click on atom 37, which is highlighted as a small yellow sphere. Add an interior spherical constraint with the center at (0,0,0) and a radius of 14 Å. Click on atom 5, highlighted similarly, and add an exterior spherical constraint with the center at (0,0,0) and a radius of 26 Å. The constraint volume is calculated as the difference between the larger and smaller sphere volumes: (73622.18 - 11494.04) = 62128.14 Å³. Enter this value in Constrains Volume to get Nvmax=230. This value is higher than the 90 provided on the PACKMOL website. We found that entering 230 also converges. Similarly, use Molcontroller to move palmitoil-1 into the constrained spherical shell and render it.<br><br>
![GIF-3](https://github.com/MSM-RAD-X-VMD-Plugin/PACKMOL-GUI/blob/main/annotated-recording-examples/Example-1-3.gif)
## 4. Add Constraints to Palmitoil-2
Select the palmitoil-2 molecule and add an interior spherical constraint for atom 5 (hydrophobic end) with a radius of 29 Å. Note the ~3 Å tolerance between this and the inner membrane.
Add an exterior spherical constraint for atom 37 (hydrophilic end) with a radius of 41 Å. The constrained volume is calculated as (288695.60 - 102160.40) = 186535.2 Å³, yielding Nvmax=689, which is greater than the 300 provided by PACKMOL. Use Molcontroller to move palmitoil-2 into the corresponding constrained spherical shell.<br><br>
![GIF-4](https://github.com/MSM-RAD-X-VMD-Plugin/PACKMOL-GUI/blob/main/annotated-recording-examples/Example-1-4.gif)
## 5. Add Box Constraint to Water-3
Add a box constraint to water-3 with minimum and maximum boundary coordinates of (-47.5, -47.5, -47.5) and (47.5, 47.5, 47.5), respectively.
Additionally, add an external spherical constraint by selecting outside sphere with a center at (0,0,0) and a radius of 43 Å. The constrained volume is calculated as (857375.00 - 333038.14) Å³, with Nvmax= 17,537, matching the number of water molecules provided by PACKMOL. Move water-3 into the water box and render it to obtain the corresponding figure from our article.<br><br>
![GIF-5](https://github.com/MSM-RAD-X-VMD-Plugin/PACKMOL-GUI/blob/main/annotated-recording-examples/Example-1-5.gif)
## 6. Generate the input file and run it.
Once all molecular constraints have been verified for accuracy, users should select the "generate" button to produce the input file. To mitigate the risk of users neglecting to save or inadvertently losing files, PACKMOL-GUI autonomously generates input files within the working directory, appending a timestamp upon activation of the "generate" button. For systems exceeding 50,000 atoms, users have the option to click the "save" button to store the input file in a designated location. This allows for the direct invocation of PACKMOL, thereby minimizing the workload on the GUI. After confirming all parameters and constraints, users may proceed by selecting the "run" button, allowing the GUI backend to initiate PACKMOL for execution. Upon completion of the run, the program autonomously loads the generated results. Given that this case comprises approximately 90,000 atoms, we generated and saved the input file before directly executing the PACKMOL program in the backend. This approach was adopted to reduce the computational burden on the front-end GUI.
![GIF-6](https://github.com/MSM-RAD-X-VMD-Plugin/PACKMOL-GUI/blob/main/annotated-recording-examples/Example-1-6.gif)
