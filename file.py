#!/usr/bin/env python3

import os

def list_files_in_directory(dosya_yolu, file_extension=None):
    try:
        # Klasördeki dosyaları al
        files = os.listdir(dosya_yolu)
        
        # Dosya uzantısını kontrol et ve filtrele
        if file_extension:
            files = [file for file in files if file.endswith(file_extension)]
        
        # Dosya adlarını yazdır
        if files:
            print(f"Bulunan dosyalar ({file_extension if file_extension else 'tümü'}):")
            for file in files:
                print(file)
        else:
            print(f"'{file_extension if file_extension else 'tümü'}' uzantısına sahip dosya bulunamadı.")
    
    except FileNotFoundError:
        print(f"Verilen yol bulunamadı,tekrar dener misiniz: {dosya_yolu}")
    except Exception as e:
        print(f"adminin öngöremediği bir hata oluştu: {e}")

# Kullanıcıdan klasör yolu ve dosya uzantısını al
directory = input("Dosyaların listeleneceği klasörün yolunu girin:(/home/user/...) ")
extension = input("Filtrelemek istediğiniz dosya uzantısını (örneğin .txt) girin (opsiyonel): ")

# Uzantı boşsa, tüm dosyaları listele
list_files_in_directory(directory, extension if extension else None)
