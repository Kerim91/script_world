#!/bin/bash

# Görevlerin saklanacağı dosya
TASK_FILE="tasks.txt"

# Görev dosyası yoksa oluştur
if [[ ! -f $TASK_FILE ]]; then
    touch "$TASK_FILE"
fi

add_task() {
    echo "Görev başlığını girin:"
    read task_title

    echo "Bitiş tarihi (YYYY-MM-DD) girin (opsiyonel):"
    read due_date

    echo "Bitiş saati (HH:MM) girin:"
    read due_time

    # Geçerli tarih formatı kontrolü
    if ! date -d "$due_date" +"%Y-%m-%d" >/dev/null 2>&1; then
        echo "Hatalı tarih formatı! Lütfen YYYY-AA-GG şeklinde giriniz."
        return
    fi

    # Geçerli saat formatı kontrolü
    if ! [[ "$due_time" =~ ^[0-9]{2}:[0-9]{2}$ ]]; then
        echo "Hatalı saat formatı! Lütfen SS:DD şeklinde giriniz."
        return
    fi

    # Tam tarih ve saat formatını oluştur
    full_due_datetime="$due_date $due_time"

    # Görev verilerini dosyaya kaydet
    echo "$task_title|$full_due_datetime|Tamamlanmadı" >> "$TASK_FILE"
    echo "Görev eklendi: $task_title - $full_due_datetime"

    # Yedek al
    cp "$TASK_FILE" "${TASK_FILE}.bak"
}

list_tasks() {
    if [[ ! -s $TASK_FILE ]]; then
        echo "Görev listesi boş!"
        return
    fi

    # Tablo başlıkları ve çizgilerini yazdır
    printf "\n%-6s | %-25s | %-20s | %-15s\n" "No" "Başlık" "Bitiş Tarihi ve Saat" "Durum"
    printf "%s\n" "---------------------------------------------------------------"

    # Görevleri numaralandırarak yazdır
    nl -w 2 -s "|" "$TASK_FILE" | while IFS= read -r line; do
        # Satırı ayır
        num="${line%%|*}"         # Numara
        rest="${line#*|}"         # Başlık, tarih ve durum

        # İçeriği ayır
        IFS='|' read -r title datetime status <<< "$rest"

        # Sütunları hizalayarak yazdır
        printf "%-6s | %-25s | %-20s | %-15s\n" "$num" "$title" "$datetime" "$status"
    done
}

# Görev durumunu güncelleme
update_task_status() {
    list_tasks

    echo "Durumunu güncellemek istediğiniz görev numarasını girin:"
    read task_no

    if ! [[ "$task_no" =~ ^[0-9]+$ ]] || ((task_no < 1 || task_no > $(wc -l < "$TASK_FILE"))); then
        echo "Geçersiz görev numarası! Lütfen görev listenizden görevinizin numarasını öğrenin."
        return
    fi

    # Satırı bul ve durumu değiştir
    if grep -q "Tamamlanmadı" <(sed -n "${task_no}p" "$TASK_FILE"); then
        sed -i "${task_no}s/Tamamlanmadı/Tamamlandı/" "$TASK_FILE"
    else
        sed -i "${task_no}s/Tamamlandı/Tamamlanmadı/" "$TASK_FILE"
    fi
    updated_line=$(sed -n "${task_no}p" "$TASK_FILE")
    echo "Güncellenen görev: $updated_line"

    # Yedek al
    cp "$TASK_FILE" "${TASK_FILE}.bak"
}

# Görev silme
delete_task() {
    list_tasks
    echo "Silmek istediğiniz görev numarasını girin:"
    read task_no

    if ! [[ "$task_no" =~ ^[0-9]+$ ]] || ((task_no < 1 || task_no > $(wc -l < "$TASK_FILE"))); then
        echo "Geçersiz görev numarası!"
        return
    fi

    sed -i "${task_no}d" "$TASK_FILE"
    echo "Görev silindi!"

    # Yedek al
    cp "$TASK_FILE" "${TASK_FILE}.bak"
}

# Yedekten geri yükleme
restore_backup() {
    if [[ -f "${TASK_FILE}.bak" ]]; then
        cp "${TASK_FILE}.bak" "$TASK_FILE"
        echo "Yedek geri yüklendi."
    else
        echo "Yedek dosyası bulunamadı!"
    fi
}

# Ana menü
while true; do
    echo -e "\n--- Görev Yönetim Sistemi ---"
    echo "1. Görev Ekle"
    echo "2. Görevleri Listele"
    echo "3. Görev Durumunu Güncelle"
    echo "4. Görev Sil"
    echo "5. Yedekten Geri Yükle"
    echo "6. Çıkış"
    echo -n "Seçiminiz: "
    read choice

    case $choice in
        1) add_task ;;
        2) list_tasks ;;
        3) update_task_status ;;
        4) delete_task ;;
        5) restore_backup ;;
        6) echo "Çıkılıyor..."; break ;;
        *) echo "Geçersiz seçim! Lütfen tekrar deneyin." ;;
    esac
done
