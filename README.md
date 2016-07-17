# TraditionalMitigation
Traditional Mitigation in GCC to defend memory corruption

Memory Corruption Mitigation Methods In My Mind

- Stack Protector
    - `gcc ­-fstack-protector`

- Heap protection

- Libc pointer encryption

- FORTIFY_SOURCE
    - `gcc ­-D_FORTIFY_SOURCE=2 ­-O2`

- Format String Protection
    - `gcc ­-Wformat ­-Wformat-security`

- PIE
    - `ld -pie / gcc ­-fPIE`

- RELEO
    - `ld ­-z relro -z now` 

- NX

- ASLR(Address Space Layout Randomization)
