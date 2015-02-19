# panda
Panda Key Exchange uses the Diffie-Hellman key exchange to generate a common passcode between two computers over a unsecured network.

## Installing
You'll need to compile panda from source, but don't worry, it ain't that hard.

### You'll need:
- GHC compiler
- Cabal
- A linux distro (Ubuntu preferably)

### Compiling
1. Clone the repo
2. Run "make.sh" as root, from the main directory
3. You should be able to use panda as a command!

## How to use
Panda works by using the Diffie-Hellman key exchange, which means you'll have to move the actual keys around yourself, but panda will generate them for you.

```shell
panda gen -n 202
```
Will generate a key, with a secret number of 202. This secret number should be much more random than this.

```shell
panda make -p PANDAKEY:8009-10007:5 -s PANDASECRET:31a3b
```
Will generate the result, p should be someone elses public key, and s should be your secret key.

## Command-line Arguments
. | Command | Information
--- | --- | ---
1. | `panda gen -n x` | Generate a public+private key pair, with secret x
2. | `panda gen ... -j` | Same as 1, but output in JSON format
3. | `panda gen ... -p` | Same as 1, but only outputs public key (can be used with 2 or 5)
4. | `panda gen ... -s` | Same as 1, but only outputs private key (can be used with 2 or 5)
5. | `panda gen ... -c` | Same as 1, but outputs with comments (can be used with 3 or 4)
6. | `panda gen ... --prime=primeNumber` | Same as 1, generates with a non-standard prime number (can be used with anything)
7. | `panda gen ... --root=primitiveRoot` | Same as 1, generates with a non-standard primitive root (can be used with 3 or 4)
8. | `panda make -p publicKey -s privateKey` | Calculates the common key between someone elses public key, and your private key
9. | `panda make ... -q` | Same as 6, but outputs in quiet mode
10. | `panda make ... -j` | Same as 6, but outputs in JSON format
11. | `panda -v` | Shows version and license info
12. | `panda ... --file=filePath` | Outputs into a file