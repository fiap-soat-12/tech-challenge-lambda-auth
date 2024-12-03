#!/bin/bash

import os
import shutil
import zipfile

# Entrando na pasta src e compilando
print("Entrando na pasta src e preparando o empacotamento")
os.chdir('src')

# Caminho para o arquivo principal da função Lambda
main_script = "main.py"
output_file = "bootstrap"
zip_file = "bootstrap.zip"

# Garantir que o script principal existe
if not os.path.exists(main_script):
    raise FileNotFoundError(f"Arquivo '{main_script}' não encontrado na pasta src.")

# Renomeando o arquivo principal para `bootstrap`
shutil.copy(main_script, output_file)

# Empacotando o arquivo bootstrap em um zip
print(f"Criando o arquivo zip '{zip_file}'")
with zipfile.ZipFile(zip_file, 'w') as zipf:
    zipf.write(output_file)

# Movendo o arquivo para a pasta bin no nível correto
print("Movendo o arquivo zip para a pasta bin")
bin_dir = "../bin"
os.makedirs(bin_dir, exist_ok=True)
shutil.move(zip_file, os.path.join(bin_dir, zip_file))

# Limpeza do arquivo temporário bootstrap
os.remove(output_file)

# Confirmar que o arquivo foi movido
print(f"Arquivo '{zip_file}' movido para a pasta '{bin_dir}/'")
