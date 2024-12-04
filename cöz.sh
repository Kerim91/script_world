#!/bin/bash

# Şifrelenmiş veriyi çöz ve göster
while IFS= read -r line; do
    # Tarihi ve şifreli kısmı ayır
    entry_date=$(echo "$line" | cut -d' ' -f1-2)
    encrypted_text=$(echo "$line" | cut -d' ' -f4-)

    # Şifre çözme (modern PBKDF2 yöntemi ile)
    decrypted_text=$(echo "$encrypted_text" | openssl enc -aes-256-cbc -d -a -salt -pbkdf2 -pass pass:yourpassword 2>/dev/null)

    # Şifre çözülemezse hata mesajı ver
    if [ $? -ne 0 ]; then
        decrypted_text="Şifre çözme başarısız!"
    fi

    echo "$entry_date - $decrypted_text"
done < your_art.txt
