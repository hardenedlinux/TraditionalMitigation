From [RELRO - A (not so well known) Memory Corruption Mitigation Technique](http://tk-blog.blogspot.com/2009/02/relro-not-so-well-known-memory.html)

## Testcase 1 (Ubuntu 14.04.4 LTS): Partial RELRO

#### File: testcase.c

This test program tries to write the value 0x41414141 at a given memory address.

Compiling "testcase" with partial RELRO:

    $ gcc -g -o partial testcase.c

Test binary:

    $ ./checkrelro.sh --file partial
      partial - partial RELRO

Get GOT entry of printf(3):

    $ readelf -r ./partial | grep printf
      0804a00c  00000407 R_386_JUMP_SLOT   00000000   printf

Try to modify the GOT address:

```sh
$ gdb -q ./partial
(gdb) r 0x0804a00c
Starting program: /home/mudongliang/Work/partial 0x0804a00c
 
Program received signal SIGSEGV, Segmentation fault.
0x41414141 in ?? ()
```

If only partial RELRO is used, it is still possible to modify arbitrary GOT entries to gain control of the execution flow of a process. 

## Testcase 2 (Ubuntu 14.04.4 LTS): Full RELRO

Compiling "testcase" with full RELRO:

    $ gcc -g -Wl,-z,relro,-z,now -o full testcase.c

Test binary:

    $ ./checkrelro.sh --file full
      full - full RELRO

Get GOT entry of printf(3):

    $ readelf -r ./full | grep printf
      08049fec  00000107 R_386_JUMP_SLOT   00000000   printf

Try to modify the GOT address:

```sh
$ gdb -q ./full
(gdb) r 0x08049fec
Starting program: /home/mudongliang/Work/full 0x08049fec
 
Program received signal SIGSEGV, Segmentation fault.
0x0804847e in main (argc=2, argv=0xbffff734) at testcase.c:5
8               p[0] = 0x41414141;

```

If full RELRO is enabled, the attempt to overwrite a GOT address leads to an error as the GOT section is mapped read-only.
