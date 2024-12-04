
#!/bin/bash


#  gizli kısım  için
echo "I am waiting..."
read -s klavye_vuruslari


#admin tavsiyesi değildir
# Girişin boş olmadığını kontrol edin
#if [ -z "$klavye_vuruslari" ]; then
 #   echo "Giriş boş olamaz!"
  #  exit 1
#fi



# Tarihi alın
current_date=$(date '+%Y-%m-%d %H:%M:%S')

# Girdiyi şifreleme (modern PBKDF2 yöntemi ile)
# "yourpassword" kısmını kendi belirlediğiniz güçlü bir şifre ile değiştirin,default bırakma riskli anlatmaya gerek yok sanırım...
encrypted_input=$(echo "$klavye_vuruslari" | openssl enc -aes-256-cbc -a -salt -pbkdf2 -pass pass:yourpassword)  #ufak bir openssl sıkıntısı es geçildi(şimdilik)

# Tarihi ve şifreli girişi dosyaya yazma
echo "$current_date - $encrypted_input" >> your_art.txt

# İşlem tamamlandığında bilgilendirme
echo echo "done!"

