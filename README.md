The PACKMOL-GUI was developed utilizing Tcl/Tk, the embedded development interface for VMD extensions. This GUI requires the version 1.9.3 of the VMD. Additionally, Furthermore, the PACKMOL-GUI supports the periodic boundary conditions and Gaussian surfaces that were introduced in version 20.15.1 of the PACKMOL program.

INSTALLATION
============
# **1. Download and Extract Files**<br>
Users can employ auxiliary tools such as DownGit (https://downgit.github.io/#/home), GitZip (https://gitzip.org/) or the GitHub API to download the specific folder. Download options are available for various user needs.<br>
------------------------------------------------------------------------------------------<br>
**Lite‌ Version**<br>
pakmol1.0<br>
------------------------------------------------------------------------------------------<br>
**Users of Biomolecular Modeling**<br>
packmol1.0<br>
datasets-Biox<br>
------------------------------------------------------------------------------------------<br>
**Users of Metal-Organic Frameworks Modeling**<br>
packmol1.0<br>
datasets-CoRE-MOFs<br>
Note: The datasets-CoRE-MOFs file is 135 MB compressed and 3.6 GB when extracted.<br>
To extract CoRE-MOFs-PDB file, use the following commands:<br>
cat CoRE-MOFs-PDB.tar.xz.part* > temp.xz<br>
tar -xvf temp.xz<br>
------------------------------------------------------------------------------------------<br>
For improved file organization, users are advised to place the **packmol1.0** folder in the plugins/noarch/tcl subdirectory of VMD installation directory, though they can choose any location they prefer.<br>
# **2. Configure VMD**<br>
Users are able to install PACKMOL-GUI from any location within the "Extension" menu. However, considering that PACKMOL serves as a modeling tool, it is recommended that users place it under the "Extension/Modeling" submenu for optimal organization and functionality.
Locate the VMD startup configuration file and add the following lines:<br>
__vmd_install_extension packmol packmol_tk "Modeling/PACKMOL"__<br>
The configuration file paths are:<br>
Windows: YOUR-vmd-installation-directory\vmd.rc<br>
Linux: YOUR-vmd-installation-directory/lib/vmd/.vmdrc<br>
macOS: YOUR-vmd-installation-directory/Contents/vmd/.vmdrc<br>
# 3. Launch VMD<br>
After starting VMD, you can access the PACKMOL-GUI via the Extensions -> Modeling -> PACKMOL submenu in the VMD Main menu.
