import os
import shutil

current_dir = os.getcwd()
target_folder = os.path.join(current_dir, 'executables')
if not os.path.exists(target_folder):
    os.makedirs(target_folder)
files = os.listdir(current_dir)
excluded_files = ['DEBUG.EXE', 'BIN2HEX.EXE', 'EXE2BIN.EXE', 'LINK.EXE', 'MASM.EXE', 'TASM.EXE', 'TD.EXE']
print(excluded_files)

for file in files:
    if file in excluded_files:
        continue
    if (file.endswith('.EXE') or file.endswith('.exe')):
        shutil.move(file, target_folder)
        print(f"Archivo {file} movido.")
    if file.endswith('.OBJ') or file.endswith('.asm'):
        if file.endswith('.asm'):
            shutil.copy(file, os.path.join(current_dir, 'backup'))
            print(f"Archivo {file} copiado a backup.")
        os.remove(file)
        print(f"Archivo {file} eliminado.")

print("Movimiento de archivos completado.")
