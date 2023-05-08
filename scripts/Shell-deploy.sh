#!/bin/bash

function print_data {
    clear
    printf "Ticker:\e[32m ${ticker:-...}\n\e[0m"
    printf "Maximum supply:\e[32m ${max_supply:-...}\n\e[0m"
    printf "Transfer limit:\e[32m ${limit_amount:-...}\n\e[0m"
    printf "\n"
}

# Ask for user input
ticker=""
max_supply=""
limit_amount=""
while [[ ${#ticker} -gt 4 || $max_supply -gt 21000000 || $limit_amount -gt $max_supply || -z $ticker || -z $max_supply || -z $limit_amount ]]; do
    print_data
    if [[ ${#ticker} -gt 4 ]]; then
        printf "\e[31mTicker symbol must be 4 letters or less.\e[0m\n"
    fi
    if [[ $max_supply -gt 21000000 ]]; then
        printf "\e[31mMaximum supply cannot exceed 21,000,000.\e[0m\n"
    fi
    if [[ $limit_amount -gt $max_supply ]]; then
        printf "\e[31mTransfer limit cannot exceed the maximum supply.\e[0m\n"
    fi
    printf "Enter the ticker symbol for your token (maximum 4 letters): \n\e[32m"
    read -p "> " ticker
    printf "\e[0m"
    clear
    print_data
    printf "Enter the maximum supply of your token (maximum 21,000,000): \n\e[32m"
    read -p "> " max_supply
    printf "\e[0m"
    clear
    print_data
    printf "Enter the maximum amount that can be transferred in a single transaction (cannot exceed the maximum supply): \n\e[32m"
    read -p "> " limit_amount
    printf "\e[0m"
    print_data
done

# Generate the deploy script
deploy_script="{\"p\": \"brc-20\",
\"op\": \"deploy\",
\"tick\": \"$ticker\",
\"max\": \"$max_supply\",
\"lim\": \"$limit_amount\"}"

# Save the deploy script to a file
filename="$ticker-deploy.json"
echo $deploy_script > $filename
echo "Deploy script saved to $filename"
