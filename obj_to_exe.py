import os
import subprocess
import shutil
import ctypes, sys

def is_admin():
    try:
        return ctypes.windll.shell32.IsUserAnAdmin()
    except:
        return False
    

def verify_folder(source_folder):
    # verifica si esa carpeta existe de ser así envia un mensaje diciendo que la encontro
    if os.path.exists(source_folder):
        print(f'La carpeta {source_folder} ya existe')
        return True
    else:
        print(f'La carpeta {source_folder} no existe')
        return False

def transform():
    target_folder = 'D:/Academy/DEBUG/executables'
    if not os.path.exists(target_folder):
        os.makedirs(target_folder)
    dosbox_executable = 'D:/Academy/DOSBox-0.74-3/DOSBox.exe'  
    mount_command = 'mount D D:/Academy/DOSBox-0.74-3'  
    current_directory = os.path.dirname(os.path.abspath(__file__))
    obj_files = [file for file in os.listdir(current_directory) if file.endswith('.OBJ')]
    print(f'Archivos .asm en el directorio actual: {obj_files}')
    for obj_file in obj_files:
        print(f'Transformando {obj_file}...')
        obj_file_name = os.path.splitext(obj_file)[0]
        exe_file_name = f'{obj_file_name}.exe'
        target_file = os.path.join(target_folder, exe_file_name)
        if os.path.exists(target_file):
            print(f'El archivo {exe_file_name} ya existe')
            continue
        else:
            print(f'Creando el archivo {exe_file_name}...')
            link_command = f'link {obj_file}'
            # que de a ENTER 3 veces seguidas
            subprocess.run([dosbox_executable, mount_command, '-c', link_command])

            print(f'El archivo {exe_file_name} fue creado')


if '__main__' == __name__:
    if is_admin():
        transform()
    else:
        ctypes.windll.shell32.ShellExecuteW(None, "runas", sys.executable, " ".join(sys.argv), None, 1)


