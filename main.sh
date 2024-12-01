a="⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
b="⠀⠀⠀⢀⣴⣾⣦⣀⣀⣠⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
c="⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
d="⠀⠀⠀⢀⣾⣿⡿⠋⠁⠈⠙⢿⣿⣷⣶⣶⡆⠀⠀⠀⠀⠀⠀⠀ "
e="⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀ "
f="⠀⠘⠛⠛⠻⣿⣷⣤⣀⣀⣴⣿⣿⠏           "
g="⠀⠀⠀⠀⠀⣾⣿⣿⡿⠿⢿⣿⣿⣷           "
h="⠀⠀⠀⠀⠸⠿⣿⡿⠀⠀⠀⠻⠿⠋           "


gpu=$(sudo lshw -C display | grep "product" | awk -F': ' '{print $2}')
gpu=$(echo "$gpu" | sed -E 's/.*\[(.*)\]/\1/')

vram_kb=$(grep -P -o -i "(?<=memory:).*(?=kbytes)" /var/log/Xorg.0.log)
x=$((vram_kb / 1024 / 1000))

mobo=$(dmidecode -t 2 | grep "Product Name" | cut -d: -f2 | sed 's/^ *//')

cpu=$(lscpu | sed -n 's/^Model name: *\(.*\)/\1/p')

threads=$(lscpu | sed -n 's/^CPU(s): *\(.*\)/\1/p')

ram=$(echo $(($(getconf _PHYS_PAGES) * $(getconf PAGE_SIZE) / (1024 * 1024 * 1000))))


echo -e "\e[1;31m$a\e[0m    \e[1;31mhardfetch\e[0m"
echo -e "\e[1;31m$b\e[0m   ----------------------"
echo -e "\e[1;31m$c\e[0m    \e[1mGPU\e[0m: $gpu"
echo -e "\e[1;31m$d\e[0m    \e[1mVRAM\e[0m: $x Gb"
echo -e "\e[1;31m$e\e[0m    \e[1mmotherboard\e[0m: $mobo"
echo -e "\e[1;31m$f\e[0m    \e[1mCPU\e[0m: $cpu"
echo -e "\e[1;31m$g\e[0m    \e[1mthreads\e[0m: $threads"
echo -e "\e[1;31m$h\e[0m    \e[1mram\e[0m: $ram Gb"


