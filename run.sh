#!/bin/bash

# Fungsi untuk menampilkan banner
print_banner() {
    echo -e "\e[38;2;255;0;0m                                                                                  
                                                                  ██              
                                                                    ▒▒            
                                                                      ██          
                                              ██    ██              ▒▒  ▒▒        
                                  ▒▒▓▓      ██░░▒▒░░░░░░██  ██      ▒▒▒▒▒▒    ▓▓██
                                  ▓▓  ▓▓▒▒  ████    ▒▒░░░░██  ██  ▒▒▒▒▒▒▒▒▒▒      
                                ▓▓      ▓▓▓▓░░          ░░░░░░░░██▒▒▒▒▒▒▒▒        
                  ▓▓▓▓▓▓▓▓██▓▓▓▓▓▓  ██████  ▓▓                ██      ▒▒  ▒▒██    
              ▓▓▓▓████          ▓▓██████████  ▓▓                ██        ██      
          ▒▒▓▓██        ████████  ▓▓██████████  ▓▓                  ██        ██  
        ▓▓████    ████████████████████▓▓██████████▓▓                ██            
      ▒▒██      ████████████████████████▓▓████████▓▓                              
      ▓▓██  ████████████████████████████████▓▓██▓▓                                
    ▓▓██  ████████████████████████████████████▓▓                                  
    ██    ██████████████████████████████████████▓▓                                
  ▓▓██  ██████████████████████████████████████████                                
  ▓▓    ██████████████████████████████████████████▓▓                              
  ▓▓  ████████████████████████████████████████████▓▓                              
  ▓▓  ████████████████████████████████████████████▓▓                              
  ▓▓  ████████████████████████████████████████████▓▓                              
  ▓▓  ████████████████████████████████████████████▓▓                              
  ▓▓  ████████████████████████████████████████████▓▓                              
  ▓▓██████████████████████████████████████████████▓▓                              
  ▓▓██████████████████████████████████████████████                                
    ██░░████████████████████████████████████████▓▓                                
    ▓▓██████████████████████████████████████████                                  
      ▓▓██████████████████████████████████████▓▓                                  
      ▒▒▓▓██████████████████████████████████▓▓                                    
          ▓▓████████████████████████████████░░                                    
            ▓▓██████████████████████████▓▓▓▓                                      
        ░░░░░░▓▓▓▓██████████████████▓▓▓▓░░░░░░░░                                  
    ░░░░░░░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▒▒░░░░░░░░░░░░░░░░                              
        ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░                                  
\e[0m"
}

# Fungsi untuk mengatur warna RGB acak
random_rgb() {
    r=$((RANDOM % 256))
    g=$((RANDOM % 256))
    b=$((RANDOM % 256))
    echo -e "\e[38;2;${r};${g};${b}m"  # Mengembalikan escape code warna RGB
}

# Fungsi untuk menampilkan teks dengan animasi mengetik
type_out() {
    text="$1"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:i:1}"  # Mencetak satu karakter
        sleep 0.05  # Delay untuk efek mengetik
    done
    echo ""  # Baris baru setelah selesai
}

# Fungsi untuk menampilkan menu dengan warna berkedip
show_menu() {
    clear
    print_banner
    echo ""

    options=("1) Jalankan Ddos" "2) Developer" "3) Keluar")

    # Tampilkan opsi dengan warna acak dan animasi mengetik
    for option in "${options[@]}"; do
        color=$(random_rgb)  # Warna acak
        echo -ne "${color}"  # Menerapkan warna acak
        type_out "$option"  # Tampilkan opsi dengan animasi mengetik
        echo -e "\e[0m"  # Reset warna setelah menampilkan opsi
    done

    echo ""

    # Membuat teks "Pilih opsi (1/2/3)" dengan warna RGB acak
    rgb_color=$(random_rgb)
    echo -ne "${rgb_color}Pilih opsi (1/2/3): \e[0m"
    
    read -p "" REPLY

    case $REPLY in
        1)
            echo -e "\e[32mMenjalankan script...\e[0m"
            python nano-script.py
            ;;
        2)
            echo -e "\e[34mMembuka tautan YouTube...\e[0m"
            xdg-open "https://youtube.com/@rendyx_solo-player?si=fXHfuD-qw43QNGvs" >/dev/null 2>&1  # Membuka link di browser
            ;;
        3)
            echo -e "\e[31mKeluar dari program.\e[0m"
            exit 0
            ;;
        *)
            echo -e "\e[33mPilihan tidak valid. Silakan coba lagi.\e[0m"
            ;;
    esac
}

# Loop menu
while true; do
    show_menu
done