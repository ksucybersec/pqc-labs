# Hands-On Post-Quantum Cryptography (PQC) Lab

## 🚀 Overview

Welcome to the Hands-On Post-Quantum Cryptography (PQC) Lab! This project provides a series of interactive Jupyter Notebooks designed to give you practical experience with emerging PQC algorithms. As quantum computers become more feasible, traditional cryptographic systems (like RSA and ECC) will be vulnerable. This lab explores the next generation of cryptographic primitives designed to be secure against both classical and quantum attackers.

**The primary purpose of this lab is to allow users to:**

1.  **Understand Key Concepts:** Grasp the fundamentals of PQC for both confidentiality (encryption/decryption) and authenticity/integrity (digital signatures).
2.  **Interact with Standardized Algorithms:** Work directly with PQC algorithms selected by NIST for standardization, such as:
    *   **ML-KEM (CRYSTALS-Kyber)** for Key Encapsulation Mechanisms.
    *   **ML-DSA (CRYSTALS-Dilithium)** and **SLH-DSA (SPHINCS+)** for Digital Signatures.
3.  **Perform Core Cryptographic Operations:**
    *   Generate PQC key pairs.
    *   Encrypt and decrypt messages using a KEM/DEM hybrid approach.
    *   Sign messages and verify PQC digital signatures.
    *   Observe the security properties in action, such as how tampering with data invalidates a signature.
4.  **Use [`liboqs-python`](https://github.com/open-quantum-safe/liboqs-python):** Gain familiarity with `liboqs-python`, a popular open-source library providing implementations of PQC algorithms.

This lab is structured as a series of sequential tasks, where outputs from one task often serve as inputs for the next, simulating a real cryptographic workflow.

## 🧪 Lab Structure

The lab is divided into two main parts:

*   **Part 1: PQC for Confidentiality (Encryption/Decryption using KEMs)**
    *   **Task 1:** Generating ML-KEM Key Pairs
    *   **Task 2:** Encrypting a Message (Encapsulation & Symmetric Encryption)
    *   **Task 3:** Decrypting a Message (Decapsulation & Symmetric Decryption)
*   **Part 2: PQC for Authenticity & Integrity (Digital Signatures)**
    *   **Task 4:** Signing a Message with PQC Digital Signatures
    *   **Task 5:** Verifying a PQC Digital Signature

## 🛠️ Setup Instructions

We provide a pre-configured Docker image containing all necessary dependencies (Python, Jupyter, liboqs, and required Python libraries). This is the easiest way to get started.

1.  **Install Docker:** If you don't have Docker installed, download and install it from [Docker's official website](https://www.docker.com/get-started).
2.  **Pull the Docker Image:** Open your terminal or command prompt and run:
    ```bash
    docker pull ksucyber/pqc-labs:latest
    ```
3.  **Run the Docker Container:**
    To run the lab and access Jupyter Notebook, use the following command. This command will map port `8888` on your host machine to port `8888` in the container.

    Open terminal (Command Prompt for Windows) and run
    ```bash
    docker run  -v labs:/home/oqs/labs:rw -p 8888:8888 ksucyber/pqc-labs
    ```

4.  **Access JupyterLab:** After running the command, Docker will output some logs. Look for a URL that looks like this:
    ```
    http://127.0.0.1:8888/lab
    ```
    Copy this URL and paste it into your web browser. You should see the JupyterLab interface with the lab notebooks in the `work` directory (which is your local directory).

5.  **Open the Master Notebook:** Navigate to and open the main lab notebook (`master.ipynb`).

6.  **Stopping the Container:** To stop the Docker container, you can usually press `Ctrl+C` in the terminal where it's running.

## 💻 How to Use the Lab

1.  Start with the main lab notebook (`master.ipynb`).
2.  Follow the instructions provided in the markdown cells.
3.  Run the Python code cells sequentially.
4.  Observe the outputs and interact with the widgets as prompted.
5.  You will often need to copy data (like Base64 encoded keys or ciphertexts) from the output of one task and paste it as input into a subsequent task.

Happy experimenting with Post-Quantum Cryptography!