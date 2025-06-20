#!/bin/bash

tampilkanJudul() {
    clear
    figlet "Menu Simple"
    echo -e "\n\033[1;33mSelamat datang di Menu Terminal Interaktif\033[0m\n"
}

pause() {
    echo -e "\n\033[0;32mTekan Enter untuk kembali ke menu...\033[0m"
    read -r
}

pilihan=0
while [[ $pilihan -ne 4 ]]; do
    tampilkanJudul
    echo "pilih opsi:"
    echo -e "\033[1;36m1. Tampilkan Kehidupan Saat Ini\033[0m"
    echo -e "\033[1;36m2. Tampilkan Daftar Direktori\033[0m"
    echo -e "\033[1;36m3. Informasi User\033[0m"
    echo -e "\033[1;36m4. Keluar\033[0m"
    echo -n "pilihan anda [1-4]: "
    read -r input
    pilihan=${input:-0}  # default ke 0 jika kosong

    tampilkanJudul

    case $pilihan in
        1)
            echo "Menampilkan status sistem..."
            date
            ;;
        2)
            echo "Daftar isi direktori:"
            ls -1ha
            ;;
        3)
            echo "Informasi user aktif:"
            NAMA_LENGKAP=$(getent passwd $(whoami) | cut -d: -f5 | cut -d, -f1)
	    # Jika nama lengkap belum diatur (kosong), maka gunakan username sebagai gantinya
	    if [ -z "$NAMA_LENGKAP" ]; then
		NAMA_LENGKAP=$(whoami)
	    fi

	    printf "Username $(whoami)\n"
	    printf "User ID $(id -u)\n"
	    # 'id -g' digunakan untuk mendapatkan ID grup primer (primary group ID) pengguna.
	    printf "Group ID $(id -g)\n"
	    printf "Group User $(id -Gn)\n"
	    printf "Nama Lengkap $NAMA_LENGKAP\n"
	    printf "Shell $SHELL\n"
	    printf "Home Directory $HOME\n"
		    ;;
        4)
            echo -e "\n\033[1;31mTerima kasih telah menggunakan menu simple!\033[0m"
            ;;
        *)
            echo -e "\033[1;31mInput tidak valid!\033[0m"
            ;;
    esac

    if [[ $pilihan -ne 4 ]]; then
        pause
    fi
done

