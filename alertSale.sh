#!/bin/bash

webpage=$(curl -s 'https://www.amazon.com/GAN-Magnetic-Speed-Stickerless-Magic/dp/B086PNKX2P/' -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101 Firefox/84.0')

price=$(echo '$webpage' | pup 'span#priceblock_ourprice text{}' | sed 's/^..//g' | cut -d. -f1)

echo $webpage
echo $price

# $(( ${price}<800 )) && notify-send "Buy cube it's cheaper now!"


