import os

def print_data():
    os.system('clear')
    print(f'Ticker:\033[32m {ticker or "..."}\033[0m')
    print(f'Maximum supply:\033[32m {max_supply or "..."}\033[0m')
    print(f'Transfer limit:\033[32m {limit_amount or "..."}\033[0m\n')

# Ask for user input
ticker = ""
max_supply = ""
limit_amount = ""
while len(ticker) > 4 or int(max_supply or 0) > 21000000 or int(limit_amount or 0) > int(max_supply or 0) or not ticker or not max_supply or not limit_amount:
    print_data()
    if len(ticker) > 4:
        print("\033[31mTicker symbol must be 4 letters or less.\033[0m")
    if int(max_supply or 0) > 21000000:
        print("\033[31mMaximum supply cannot exceed 21,000,000.\033[0m")
    if int(limit_amount or 0) > int(max_supply or 0):
        print("\033[31mTransfer limit cannot exceed the maximum supply.\033[0m")
    ticker = input("Enter the ticker symbol for your token (maximum 4 letters):\n\033[32m> \033[0m")
    os.system('clear')
    print_data()
    max_supply = input("Enter the maximum supply of your token (maximum 21,000,000):\n\033[32m> \033[0m")
    os.system('clear')
    print_data()
    limit_amount = input("Enter the maximum amount that can be transferred in a single transaction (cannot exceed the maximum supply):\n\033[32m> \033[0m")
    print_data()

# Generate the deploy script
deploy_script = {
    "p": "brc-20",
    "op": "deploy",
    "tick": ticker,
    "max": max_supply,
    "lim": limit_amount
}

# Save the deploy script to a file
filename = f'{ticker}-deploy.json'
with open(filename, 'w') as f:
    f.write(str(deploy_script))
print(f'Deploy script saved to {filename}')
