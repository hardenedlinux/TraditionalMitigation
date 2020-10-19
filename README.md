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

- RELEO
    - `-Wl,-z,relro,-z,now` 

- Stack clash protection
    - `-fstack-clash-protection`

-------------------------------------------------

## Kernel space

- Stack Protector
    - implement in Linux Kernel

- Heap protection
    - implement in Linux Kernel

- FORTIFY_SOURCE
    - implement in Linux Kernel

- NX
    - implement in Linux Kernel

- ASLR(Address Space Layout Randomization)
    - implement in Linux Kernel

# References

[1] [Secure Programming with GCC and GLibc](https://cansecwest.com/csw08/csw08-holtmann.pdf)
