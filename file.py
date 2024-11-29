#!/bin/bash

# Sistem bilgileri için gelişmiş script
get_system_info() {
    echo "İşletim Sistemi: $(uname -s)"
    echo "Bilgisayar Adı: $(hostname)"
    echo "İşlemci: $(uname -m)"

    # Bellek bilgisi için farklı yöntemler
    if command -v free &> /dev/null; then
        echo "Toplam Bellek: $(free -h | grep Mem: | awk '{print $2}')"
        echo "Kullanılabilir Bellek: $(free -h | grep Mem: | awk '{print $7}')"
    else
        echo "Toplam Bellek: $(cat /proc/meminfo | grep MemTotal | awk '{print $2/1024/1024 " GB"}')"
        echo "Kullanılabilir Bellek: $(cat /proc/meminfo | grep MemAvailable | awk '{print $2/1024/1024 " GB"}')"
    fi

    # Disk kullanımı
    echo "Disk Kullanımı: $(df -h / | awk '/\// {print $5}')"
}

# Fonksiyonu çağır
get_system_info
