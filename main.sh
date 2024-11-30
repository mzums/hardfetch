a="⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
b="⠀⠀⠀⢀⣴⣾⣦⣀⣀⣠⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
c="⠀⠀⠀⠈⢻⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
d="⠀⠀⠀⢀⣾⣿⡿⠋⠁⠈⠙⢿⣿⣷⣶⣶⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
e="⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⢸⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
f="⠀⠘⠛⠛⠻⣿⣷⣤⣀⣀⣴⣿⣿⠏⢀⣀⠀⠀⠀⠀⣾⣿⣿⡇⠀⠀⠀⠀⣀⠀"
g="⠀⠀⠀⠀⠀⣾⣿⣿⡿⠿⢿⣿⣿⣷⣿⣿⣧⠀⣀⣀⣿⣿⣿⣇⣀⡀⠀⣼⣿⠀"
h="⠀⠀⠀⠀⠸⠿⣿⡿⠀⠀⠀⠻⠿⠋⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀"
i="⠀⠀⠀⠀⠀⠀⠀⠁⢀⣴⣤⣀⢀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀"
j="⠀⠀⠀⠀⠀⠀⠀⠀⠺⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀"
k="⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣿⠀"
l="⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⠀"
m="⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀"
n="⠀⠀⠀⠀⠀⠀⠘⠛⠛⠻⣿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⠀⠀⠀⣠⣿⣿⣿⠀"

echo -e "\e[31m$a\e[0m"
echo -e "\e[31m$b\e[0m"
echo -e "\e[31m$c\e[0m"
echo -e "\e[31m$d\e[0m    hardfetch"

gpu=$(sudo lshw -C display | grep "product" | awk -F': ' '{print $2}')
gpu=$(echo "$gpu" | sed -E 's/.*\[(.*)\]/\1/')
echo "GPU: $gpu"

vram_kb=$(grep -P -o -i "(?<=memory:).*(?=kbytes)" /var/log/Xorg.0.log)
x=$((vram_kb / 1024 / 1000))
echo "VRAM: $x Gb"

mobo=$(dmidecode -t 2 | grep "Product Name" | cut -d: -f2 | sed 's/^ *//')
echo "motherboard: $mobo"

cpu=$(lscpu | sed -n 's/^Model name: *\(.*\)/\1/p')
echo "CPU: $cpu"

cores=$(lscpu | sed -n 's/^CPU(s): *\(.*\)/\1/p')
echo "cores: $cores"