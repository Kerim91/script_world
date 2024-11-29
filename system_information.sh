#!/bin/bash

# Sistem bilgilerini topla
echo "admin notu:bazı sistemlerde,uyusmazlıklar olabiliyor."

echo "İşletim Sistemi: $(uname -s)"
echo "Bilgisayar Adı: $(hostname)"
echo "İşlemci: $(uname -p)"
echo "Toplam Bellek: $(free -h | grep Mem: | awk '{print $2}')"
echo "Kullanılabilir Bellek: $(free -h | grep Mem: | awk '{print $7}')"
echo "Disk Kullanımı: $(df -h / | awk '/\// {print $5}')"
