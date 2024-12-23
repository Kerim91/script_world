#!/bin/bash

#bu script  çok fazla analiz edilecek txt,db,kaynak dosya kodları uzantıları fark etmeksizin detaylı bir kelime kullanım istatistiği sunan kodlardan oluşur,en azından benim işimi gördü :) 


# göz yormaması için olabildiğince renklendirme
function print_info() {
    echo -e "\e[34m[INFO]\e[0m $1"
}

function print_error() {
    echo -e "\e[31m[ERROR]\e[0m $1"
}


if [[ $# -lt 1 ]]; then
    print_error "lütfen şiklinde giriniz: $0 <dosya_adı>"
    exit 1
fi

FILE=$1

if [[ ! -f "$FILE" ]]; then
    print_error "Belirtilen dosya bulunamadı: $FILE"
    exit 1
fi


print_info "Dosya işleniyor: $FILE"


LINES=$(wc -l < "$FILE")
WORDS=$(wc -w < "$FILE")
CHARS=$(wc -m < "$FILE")


LETTERS=$(grep -o '[a-zA-Z]' "$FILE" | wc -l)
NUMBERS=$(grep -o '[0-9]' "$FILE" | wc -l)
SPECIALS=$(grep -o '[^a-zA-Z0-9[:space:]]' "$FILE" | wc -l)


WORD_LENGTHS=$(tr -s '[:space:]' '\n' < "$FILE" | awk 'NF > 0 {print length}' | sort | uniq -c)


LONGEST_WORD=$(tr -s '[:space:]' '\n' < "$FILE" | awk 'NF > 0 {print length, $0}' | sort -nr | head -1 | cut -d' ' -f2-)
SHORTEST_WORD=$(tr -s '[:space:]' '\n' < "$FILE" | awk 'NF > 0 {print length, $0}' | sort -n | head -1 | cut -d' ' -f2-)

echo -e "\n\e[32mDosya İstatistikleri:\e[0m"
echo "Satır Sayısı: $LINES"
echo "Kelime Sayısı: $WORDS"
echo "Karakter Sayısı: $CHARS"
echo "Harf Sayısı: $LETTERS"
echo "Rakam Sayısı: $NUMBERS"
echo "Özel Karakter Sayısı: $SPECIALS"

echo -e "\n\e[32mKelime Uzunluğu Dağılımı:\e[0m"
echo "$WORD_LENGTHS"

echo -e "\n\e[32mEn Uzun Kelime:\e[0m $LONGEST_WORD"
echo -e "\e[32mEn Kısa Kelime:\e[0m $SHORTEST_WORD"
