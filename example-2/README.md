Step-by-Step Guide
===============
## 1. Import SCU-103 and Set Periodic Boundary Conditions
Import the SCU-103-NO3.pdb molecule using VMD or the "Import" button in the Molecule Loading module. Set the constraint box parameters based on its unit cell parameters: (-27.65, -23.95, -4.10) and (27.65, 23.95, 4.10).<br>
Set the minimum and maximum values for periodic boundary conditions: (-27.65, -23.95, -70) and (28.20, 23.95, 70).
## 2. Load Ions Above SCU-103
Import hydroxide.pdb, sulfate.pdb, nitrate.pdb, pertechnetate.pdb, NH4.pdb, and NA.pdb molecules, positioning them above the SCU-103 region with molecule counts of 12, 12, 12, 12, 12, 48, respectively.Given that the initial positions of these ions are set 12 Å (the cutoff distance of non-bonded interaction) away from the SCU-103 surface, the upper and lower boundary values for these ions are -16.10 Å and 16.10 Å, respectively. Set the box minimum and maximum values as (-28.20, -23.95, 16.10) and (28.20, 23.95, 70.00).
## 3. Load Ions Below SCU-103
Repeat the import process for these molecules, positioning them below the SCU-103 region with the same molecule counts. Set the box minimum and maximum values as (-28.20, -23.95, -70.00) and (28.20, 23.95, -16.10).
## 4. Adjust Positioning
Use Molcontroller to move SCU-103 and ions to the designated regions and render as needed.
