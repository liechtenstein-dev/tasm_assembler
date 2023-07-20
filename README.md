# tasm_assembler
Using TASM.EXE to create .obj and LINK.EXE to create .exe. Adding python to automate creation 

## Python Scripts Used
<ul>
<li>
  <strong>asm_to_obj.py:</strong>
  <span>this script does a transformation on .asm code to .obj via TASM.EXE.</span>
</li>
  
<li>
  <strong>obj_to_exe.py</strong>
  <span>transform all .obj to .exe via LINK.EXE</span>
</li>

<li>
  <strong>move_executables.py:</strong>
  <span>moves all .exe files to '/executable' folder, removes .obj files and saves .asm code files into a '/backup' folder.</span>
</li>

</ul>
It is required to change constants inside each script to make them work as supposed. These scripts have only been tested on a Windows operating system and they require administrator privileges (to execute subprocesses).
