pid=$(ps -u $USER -o pid,%mem,%cpu,comm | sort -b -k2 -r | sed -n '1!p' | awk 'NR==1 {print}; {print}' | awk 'NR<30 {print $0}' | rofi -dmenu -p 'Kill' -i -l 10 | awk '{print $1}')
kill -15 $pid 2>/dev/null
