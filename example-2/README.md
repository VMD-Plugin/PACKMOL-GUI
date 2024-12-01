Step-by-Step Guide
===============
## 1. Import SCU-103 and Set Periodic Boundary Conditions
Import the SCU-103-NO3.pdb molecule using VMD or the "Import" button in the Molecule Loading module. Set the constraint box parameters based on its unit cell parameters: (-28.20, -23.95, -4.10) and (28.20, 23.95, 4.10).
Set the minimum and maximum values for periodic boundary conditions: (-28.20, -23.95, -70) and (28.20, 23.95, 70).<br><br>
![case-2-1](https://github.com/MSM-RAD-X-VMD-Plugin/PACKMOL-GUI/blob/main/annotated-recording-examples/Example-2-1.gif)
## 2. Load Ions Above SCU-103
Import hydroxide.pdb, sulfate.pdb, nitrate.pdb, pertechnetate.pdb, NH4.pdb, and NA.pdb molecules, positioning them above the SCU-103 region with molecule counts of 12, 12, 12, 12, 12, 48, respectively.Given that the initial positions of these ions are set 12 Å (the cutoff distance of non-bonded interaction) away from the SCU-103 surface, the upper and lower boundary values for these ions are -16.10 Å and 16.10 Å, respectively. Set the box minimum and maximum values as (-28.20, -23.95, 16.10) and (28.20, 23.95, 70.00). Use Molcontroller to move ions to the designated regions and render as needed.<br><br>
![case-2-1](https://github.com/MSM-RAD-X-VMD-Plugin/PACKMOL-GUI/blob/main/annotated-recording-examples/Example-2-2.gif)
## 3. Load Ions Below SCU-103
Repeat the import process for these molecules, positioning them below the SCU-103 region with the same molecule counts. Set the box minimum and maximum values as (-28.20, -23.95, -70.00) and (28.20, 23.95, -16.10).<br><br>
![case-2-1](https://github.com/MSM-RAD-X-VMD-Plugin/PACKMOL-GUI/blob/main/annotated-recording-examples/Example-2-3.gif)
## 4. Apply water constraints, create input files, and run the simulation
Water molecules were confined within a box with coordinates (-28.20, -23.95, -70) to (28.20, 23.95, 70). After confirming the constraints, the 'generate' button created the input files, and the 'run' button started the simulation. Once PACKMOL finished, the GUI displayed the final mixed system.<br><br>
![case-2-1](https://github.com/MSM-RAD-X-VMD-Plugin/PACKMOL-GUI/blob/main/annotated-recording-examples/Example-2-4.gif)
