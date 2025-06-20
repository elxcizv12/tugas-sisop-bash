#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void tampilkanJudul() {
	system("clear");
	system("figlet Menu Simple");
	printf("\n\033[1;33mSelamat datang di Menu Terminal Interaktif\033[0m\n\n");
}

void pause() {
	printf("\n\033[0;32mTekan Enter untuk kembali ke menu...\033[0m");
	getchar(); getchar();
}

int main(){
	int pilihan;
	char input[10];

	do {
		tampilkanJudul();
		printf("pilih opsi:\n");
		printf("\033[1;36m1. Tampilkan Kehidupan Saat Ini\033[0m\n");
		printf("\033[1;36m2. Tampilkan Daftar Direktori\033[0m\n");
		printf("\033[1;36m3. Informasi User\033[0m\n");
		printf("\033[1;36m4. Keluar\033[0m\n");
		printf("pilihan anda [1-4]: ");
		fgets(input,sizeof(input), stdin);
		pilihan = atoi(input);

		tampilkanJudul();

		switch (pilihan) {
			case 1:
				printf("Menampilkan status sistem...\n");
				system("top -n 1 | head -15");
				break;
			case 2:
				printf("Daftar isi direktori:\n");
				system("ls -1h");
				break;
			case 3:
				printf("Informasi user aktif:\n");
				system("whoami && groups");
				break;
			case 4:
				printf("\n\033[1;31mTerima kasih telah menggunakan menu simple!\033[0m\n");
				break;
			default:
				printf("\033[1;31mInput tidak valid!\033[0m\n");
		}

		if (pilihan != 4) pause();
	} while (pilihan != 4);

	return 0;
}
