
1. Download and Extract Files
Download and extract the required files. Note: The files in the CoRE-MOFs-PDB directory have been expanded with Periodic Boundary Conditions (PBC), resulting in a total size of 3.6 GB. If you do not require this dataset, you can either delete or skip extracting it. To extract this file, use the following commands:
cat CoRE-MOFs-PDB.tar.xz.part* > temp.xz
tar -xvf temp.xz
2. Set Up Environment
Define $VMD_HOME as your VMD installation path.
Move the packmol1.0 folder to the $VMD_HOME/plugins/noarch/tcl subdirectory.
3. Configure VMD
Locate the VMD startup configuration file and add the following lines:
vmd_install_extension packmol packmol_tk "Modeling/PACKMOL"
The configuration file paths are:
Windows: $VMD_HOME\vmd.rc
Linux: $VMD_HOME/lib/vmd/.vmdrc
macOS: $VMD_HOME/Contents/vmd/.vmdrc
4. Launch VMD
After starting VMD, you can access the PACKMOL-GUI via the Extensions -> Modeling -> PACKMOL submenu in the VMD Main menu.
