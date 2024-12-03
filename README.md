# Dependency Confusion Takeover
A very small  helper script for your dependency confusion attack which helps in checking and taking over dependency   

## TL;DR: Dependency Confusion

**Dependency Confusion** occurs when a package manager installs a malicious package from a public registry instead of the intended private package due to conflicting or ambiguous version names. This can happen when:

- Private dependencies are named the same as public ones.
- Malicious actors publish a package with a higher version number in a public registry, causing the manager to fetch the wrong package.

For more, refer to this article - https://medium.com/@alex.birsan/dependency-confusion-4a5d60fec610 by [@alxbrsn](https://x.com/alxbrsn)

## Pre-requisites : 
- Should have `npm` installed in your system
- Must be using this script on linux/unix based system

## Installation and setup :
```
git clone https://github.com/0xaudron/dependency-confusion 
cd dependency-confusion 
chmod +x dependency-takeover.sh
export $NPM_TOKEN=<NPM-TOKEN> 
```

## Usage (with examples) :
Run the following command after installation and setting up section:
```
./dependency-takeover.sh <dependency-name>
```
### Example 1 (successful takeover)
![image](https://github.com/user-attachments/assets/81c0d6cd-d4c2-46a3-af4f-6e628e408090)

### Example 2 (unsuccessful takeover)
![image](https://github.com/user-attachments/assets/9cc095ce-882c-4a5e-a3a7-2ae633d45652)





## How to get \<NPM-TOKEN\> 
1. Sign in/Sign up at https://www.npmjs.com
2. Navigate via Click on profile avatar > Access Tokens > Generate New Token > Classic Token > Provide a `Name` for token , Select `Publish` under `Select Type`
3. Now copy the TOKEN and do as mentioned in Installation steps.
