                                            
#!/bin/bash

#  gizli kısım  için
echo "I am waiting..."
read -s klavye_vuruslari

# Yazıyı bir dosyaya kaydet,var olan bilgilerin ise üstüne...
echo "$klavye_vuruslari" >> your_art.txt

echo "done"

