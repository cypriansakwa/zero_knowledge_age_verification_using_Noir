# Zero-Knowledge Age Verification using Noir

This project demonstrates a simple **Zero-Knowledge Proof (ZKP)** circuit written in [Noir](https://noir-lang.org/) that allows a user to prove their age lies within a specified range (e.g., between 18 and 60) without revealing the actual age.

## 📜 Circuit Description

The circuit checks that a given private `age` lies within the interval \([18, 60]\). This is a basic range proof and is the foundation for many privacy-preserving applications such as anonymous credentials, voting, or access control.

```rust
fn main(age: u32) {
    let min_age: u32 = 18;
    let max_age: u32 = 60;

    assert(age >= min_age);
    assert(age <= max_age);
}

#[test]
fn test_valid_age() {
    main(35); // Replace with test age
}
```
## 🛠️ Project Setup

Ensure you have **Nargo CLI** and **bb (Barretenberg CLI)** installed and accessible from your terminal.

Clone the repository:

```bash
git clone https://github.com/cypriansakwa/zero_knowledge_age_verification_using_Noir.git
cd zero_knowledge_age_verification_using_Noir
```

Install **Nargo CLI** and **Barretenberg CLI** if you haven’t already:

- [Nargo installation guide](https://noir-lang.org/docs/nargo/installing-nargo)
- [Barretenberg CLI GitHub](https://github.com/AztecProtocol/barretenberg)

---

### 🧪 Compile and Test the Circuit

```bash
nargo compile
nargo test
```
To provide private inputs, create a `Prover.toml` file in the root:
```toml
[main]
age = 35
```
Then execute:
```bash
nargo execute
```
## 🔐 Proof Generation and Verification
Generate the proof and verification key using bb:
```bash
mkdir -p ./target/proof_dir
bb prove --scheme ultra_honk \
    -b ./target/zero_knowledge_age_verification_using_Noir.json \
    -w ./target/zero_knowledge_age_verification_using_Noir.gz \
    -o ./target/proof_dir

mkdir -p ./target/vk_output
bb write_vk --scheme ultra_honk \
    -b ./target/zero_knowledge_age_verification_using_Noir.json \
    -o ./target/vk_output
```
Verify the proof:
```bash
bb verify --scheme ultra_honk \
    -k ./target/vk_output/vk \
    -p ./target/proof_dir/proof
```
## ⚙️ Solidity Verifier Generation
Generate a Solidity verifier smart contract:
```bash
bb write_solidity_verifier --scheme ultra_honk \
    -k ./target/vk_output/vk \
    -o ./target/solidity_verifier

mv ./target/solidity_verifier ./target/solidity_verifier.sol
```
This contract can be deployed to an Ethereum testnet like Sepolia and used to verify the ZKP on-chain.
## 🚀 Next Steps

- Deploy the Solidity verifier to a testnet using Remix, Hardhat, or Foundry.
- Create a frontend using `@noir-lang/noir_js` for browser-based proving.
- Extend the circuit logic (e.g., add modular checks or group membership conditions).
- Integrate with ZK identity frameworks like Semaphore, Sismo, or World ID.

---

## 📘 References

- [Noir Documentation](https://noir-lang.org/docs)
- [Barretenberg CLI](https://github.com/AztecProtocol/barretenberg)
- [zkLearning by Zama](https://github.com/zama-ai/zk-learning)

---

## 🧑‍💻 Author

Dr. Cyprian Omukhwaya Sakwa  
Lecturer, Cryptography Instructor, and ZK Researcher

