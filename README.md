INSTALLATION
============
# **1. Download and Extract Files**<br>
Download and extract the required files. Note: The files in the CoRE-MOFs-PDB directory have been expanded with Periodic Boundary Conditions (PBC), resulting in a total size of 3.6 GB. If you do not require this dataset (dataset/CoRE-MOF-PDB.tar.xz.part*), you can either delete or skip extracting it. To extract this file, use the following commands:<br>
cat CoRE-MOFs-PDB.tar.xz.part* > temp.xz<br>
tar -xvf temp.xz<br>
# **2. Set Up Environment**<br>
Define $VMD_HOME as your VMD installation path.
Move the packmol1.0 folder to the $VMD_HOME/plugins/noarch/tcl subdirectory.<br>
# **3. Configure VMD**<br>
Locate the VMD startup configuration file and add the following lines:<br>
vmd_install_extension packmol packmol_tk "Modeling/PACKMOL"<br>
The configuration file paths are:<br>
Windows: $VMD_HOME\vmd.rc<br>
Linux: $VMD_HOME/lib/vmd/.vmdrc<br>
macOS: $VMD_HOME/Contents/vmd/.vmdrc<br>
# 4. Launch VMD<br>
After starting VMD, you can access the PACKMOL-GUI via the Extensions -> Modeling -> PACKMOL submenu in the VMD Main menu.
