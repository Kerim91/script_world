#!/bin/bash

# Sistem kaynak kullanımını izle
monitor_system() {
    while true; do
        clear
        echo "🖥️ Sistem Durumu $(date)"
        echo "-------------------"
        
        # CPU kullanımı
        echo "CPU Kullanımı:"
        top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4 "%"}'
        
        # Bellek kullanımı
        echo -e "\nBellek Kullanımı:"
        free -h | grep Mem
        
        # Disk kullanımı
        echo -e "\nDisk Kullanımı:"
        df -h | grep "/$"
        
        # Her 5 saniyede bir güncelle
        echo "güncellik 30 saniyede bir olarak ayarlanmıstır."
	sleep 30
    done
}

# Scripti çalıştır
monitor_system
