The PACKMOL-GUI was developed utilizing Tcl/Tk, the embedded development interface for VMD extensions. This GUI requires the version 1.9.3 or above of the VMD. Additionally, Furthermore, the PACKMOL-GUI supports the periodic boundary conditions and Gaussian surfaces that were introduced in version 20.15.1 of the PACKMOL program.

FILES STRUCTURE
======
**PACKMOL-Windows-20.15.0**: (Precompiled PACKMOL program and required dynamic link libraries for Win10 x64 system)<br>
 ---------- README.md<br>
 ---------- MIT License
 ---------- libifcoremd.dll<br> 
 ---------- libifportmd.dll<br>
 ---------- libmmd.dll<br>
 ---------- packmol.exe<br>
**Datasets**: (Datasets utilized for the molecular modeling of materials, biological molecules, gases, and liquids)<br>
 ---------- CoRE-MOFs-PDB.tar.xz.partaa (The split volume-a of CoRE-MOFs PDB format dataset)<br>
 ---------- CoRE-MOFs-PDB.tar.xz.partab (The split volume-b of CoRE-MOFs PDB format dataset)<br>
 ---------- CoRE-MOFs-PDB.tar.xz.partac (The split volume-c of CoRE-MOFs PDB format dataset)<br>
 ---------- packmol-biomolecules.tar (Phospholipids and derivatives, amino acids, nucleotides)<br>
 ---------- packmol-gas.tar (Gas molecules)<br>
 ---------- packmol-ions.tar (Common anions, cations, and some radioactive nuclide ions)<br>
 ---------- packmol-solvent.tar (Organic solvent and water molecule models)<br>
**example-1**: (Spherical palmitoyl vesicle model input/output files and step-by-step guide)<br>
 ---------- README.md (step-by-step guide)<br>
 ---------- palmitoil.pdb<br>
---------- spherical-comment.inp<br>
 ---------- spherical.pdb<br>
---------- water.pdb<br>
**example-2**: (Files for constructing the initial configuration of the SCU-103 enriched <sup>99</sup>TcO<sub>4</sub>‾ system)<br>
 ---------- README.md (step-by-step guide)<br>
---------- NA.pdb<br>
 ---------- NH4.pdb<br>
---------- SCU-103-NO3.pdb<br>
 ---------- example-2.inp<br>
---------- example-2.pdb<br>
---------- hydroxide.pdb<br>
 ---------- nitrate.pdb<br>
---------- pertechnetate.pdb<br>
---------- sulfate.pdb<br>
---------- tip3p.pdb<br>
**packmol1.0**: (Tcl/Tk code and user configuration files for PACKMOL-GUI.)<br>
 ---------- packmol.tcl<br>
---------- packmol_info.json (The user configuration files)<br>
 ---------- pkgIndex.tcl<br>


INSTALLATION
============
# **1. Download and Extract Files**<br>
Download and extract the required files. Note: The files in the CoRE-MOFs-PDB directory have been expanded with Periodic Boundary Conditions (PBC), resulting in a total size of 3.6 GB. If you do not require this dataset (datasets/CoRE-MOF-PDB.tar.xz.part*), you can either delete or skip extracting it. To extract this file, use the following commands:<br>
cat CoRE-MOFs-PDB.tar.xz.part* > temp.xz<br>
tar -xvf temp.xz<br>
Define $VMD_HOME as your VMD installation path. Move the **packmol1.0** folder to the **$VMD_HOME/plugins/noarch/tcl** subdirectory.<br>
# **2. Configure VMD**<br>
Locate the VMD startup configuration file and add the following lines:<br>
__vmd_install_extension packmol packmol_tk "Modeling/PACKMOL"__<br>
The configuration file paths are:<br>
Windows: $VMD_HOME\vmd.rc<br>
Linux: $VMD_HOME/lib/vmd/.vmdrc<br>
macOS: $VMD_HOME/Contents/vmd/.vmdrc<br>
# 3. Launch VMD<br>
After starting VMD, you can access the PACKMOL-GUI via the Extensions -> Modeling -> PACKMOL submenu in the VMD Main menu.
