The PACKMOL-GUI was developed utilizing Tcl/Tk, the embedded development interface for VMD extensions. This GUI requires the version 1.9.3 or above of the VMD. Additionally, Furthermore, the PACKMOL-GUI supports the periodic boundary conditions and Gaussian surfaces that were introduced in version 20.15.1 of the PACKMOL program.

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
_**Note**_: This dataset expands the CoRE MOFs to encompass unit cell dimensions exceeding 2.4 nm and transforms them into PDB format, rendering it suitable for molecular dynamics simulations. The datasets-CoRE-MOFs file is 135 MB compressed and 3.6 GB when extracted.<br>
To extract CoRE-MOFs-PDB file, use the following commands:<br>
cat CoRE-MOFs-PDB.tar.xz.part* > temp.xz<br>
tar -xvf temp.xz<br>
------------------------------------------------------------------------------------------<br>
To prevent file path issues during installation, it is strongly recommended that users place the **packmol1.0** folder in the **YOUR-VMD-Installation-Directory/plugins/noarch/tcl**. Alternatively, users can choose any location but must use the **lappend auto_path** command to specify the absolute file path..<br>
# **2. Configure VMD**<br>
Users are able to install PACKMOL-GUI from any location within the "Extension" menu. However, considering that PACKMOL serves as a modeling tool, it is recommended that users place it under the "Extension/Modeling" submenu for optimal organization and functionality.
Locate the VMD startup configuration file and add the following lines:<br>
__vmd_install_extension packmol packmol_tk "Modeling/PACKMOL"__<br>
The configuration file paths are:<br>
Windows: YOUR-VMD-Installation-Directory\vmd.rc<br>
Linux: YOUR-VMD-Installation-Directory/lib/vmd/.vmdrc<br>
macOS: YOUR-VMD-Installation-Directory/Contents/vmd/.vmdrc<br>
Note: If Windows users place packmol1.0 in another folder with spaces, please remember to use the escape character "\\".<br> 
For example, "lappend auto_path C:/Program Files/packmol1.0" should be written as “lappend auto_path C:/Program\ Files/packmol1.0”.<br>
# 3. Launch VMD<br>
After starting VMD, you can access the PACKMOL-GUI via the Extensions -> Modeling -> PACKMOL submenu in the VMD Main menu.
