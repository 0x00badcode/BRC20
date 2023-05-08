# short overview of BRC20 standard

BRC20 tokens are digital assets that can be created and exchanged on the Bitcoin blockchain. They are similar to tokens on other blockchain platforms like Ethereum, but instead of using the ERC20 standard, they use the BRC20 standard. This standard allows developers to create their own tokens on the Bitcoin blockchain using the Ordinals technology.

BRC20 tokens can be used for a variety of purposes, including crowdfunding, reward systems, and in-game currencies. They can also be traded on cryptocurrency exchanges and used to pay for goods and services.

One of the advantages of using BRC20 tokens is the security and decentralization of the Bitcoin blockchain. Transactions on the Bitcoin blockchain are immutable and transparent, which means that they cannot be changed or altered once they are recorded. This provides a high level of security for token holders and prevents fraud and hacking.

Developers can use the BRC20 standard to create their own tokens with custom parameters, such as the token name, symbol, and total supply. They can also add advanced features like token freezing, minting and burning, and multi-token support.       
    
# content of the repo

This repo contains the [token](https://github.com/0x00badcode/BRC20/token) and [script](https://github.com/0x00badcode/BRC20/scripts) sections.

## /token

### **deploy.json:**
```
{
    "p": "brc-20",
    "op": "deploy",
    "tick": "TOKN",
    "max": "21000000",
    "lim": "1000"
}
```

### here is an overview of the different parameters :

| Parameter | usage |
| ------------- | ------------- |
| ```p```  | the protocol used (here it's BRC20)  |
| ```op```  | the operation we want to perform  |
| ```tick```  | max supply of your token, can't be over 21'000'000 |
| ```max``` | the amount to transfer  |
| ```lim``` | the token limit in one transfer, users won't be able to transfer more than this amount per transactionr  |


### **mint.json:**
```
{
    "p": "brc-20",
    "op": "mint",
    "tick": "TOKN",
    "amt": "1000"
}
```

### here is an overview of the different parameters :

| Parameter | usage |
| ------------- | ------------- |
| ```p```  | the protocol used (here it's BRC20)  |
| ```op```  | the operation we want to perform |
| ```tick```  | the ticker of your token, max 4 letters, it's not case sensitive  |
| ```amt```  | the amount to mint  |


### **transfer.json** 
```
{
    "p": "brc-20",
    "op": "transfer",
    "tick": "TOKN",
    "amt": "100"
}
```

### here is an overview of the different parameters :

| Parameter | usage |
| ------------- | ------------- |
| ```p```  | the protocol used (here it's BRC20)  |
| ```op```  | the operation we want to perform  |
| ```tick```  | the ticker of your token, max 4 letters, it's not case sensitive  |
| ```amt```  | the amount to transfer  |

## /scripts

You can find scripts that will generate you the deploy.json file automatically

to run **Shell-deploy.sh** run :
    
```chmod +x Shell-deploy.sh```
    
and then
    
```./Shell-deploy.sh```
   
and follow the instructions on screen.
    
    
to run **Python-deploy.py** run :

```python3 Python-deploy.py```

# info

i will try to update this repo with mods to the standard but i don't guarantee anything
