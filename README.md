# TraditionalMitigation

List all the traditional mitigations in compilers(GCC, Clang, etc.) to defend memory corruption

## User space

- Stack Protector
    - `-fstack-protector`, `-fstack-protector-all`, `-fstack-protector-strong`

- Heap protection
    - enable by default

- Double free checking
    - enable by default

- Libc pointer encryption
    - enable by default

- FORTIFY_SOURCE
    - `-D_FORTIFY_SOURCE=2­-O2`

- Format String Protection
    - `-Wformat ­-Wformat-security`

- PIC/PIE 
    - `-fPIC`, `-fPIE -pie`

- RELRO
    - `-Wl,-z,relro,-z,now` 

- Stack clash protection
    - `-fstack-clash-protection`

-------------------------------------------------

## Kernel space

- Stack Protector
    - implemented in Linux Kernel

- Slab/Slub/Slob Protection
    - implemented in Linux kernel

- FORTIFY_SOURCE
    - implemented in Linux Kernel

- NX
    - implemented in Linux Kernel

- SMAP/SMEP
    - implemented in Linux kernel

- ASLR(Address Space Layout Randomization)
    - implemented in Linux Kernel

- KASLR(Kernel Address Space Layout Randomization)
    - implemented in Linux Kernel

# References

[1] [Secure Programming with GCC and GLibc](https://cansecwest.com/csw08/csw08-holtmann.pdf)
