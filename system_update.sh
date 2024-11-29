#!/bin/bash

# Sistemi güncelle
update_system() {
    # Root izni gerektirir
    if [ "$EUID" -ne 0 ]; then
        echo "Lütfen scripti root olarak çalıştırın(sudo ./system_update.sh)"
        exit
    fi

    echo "🔄 Sistem Güncelleştirmeleri Başlıyor,internet hızınıza göre sürebilir..."
    
    # Paket listelerini güncelle
    apt update
    
    # Yükseltmeleri yap
    apt upgrade -y
    
    # Gereksiz paketleri temizle
    apt autoremove -y
    
    echo "✅ Güncelleme Tamamlandı"
}

# Scripti çalıştır
update_system
