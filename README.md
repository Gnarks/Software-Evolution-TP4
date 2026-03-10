# TP4

### 1.1
1. Very likely, as it is one of the main objective of a cryptographic hash function
2.  
3. 




### 2.2
1. hello-world: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=b450c18c9e94b394e375a16956cc7e2e0589c18a, for GNU/Linux 4.4.0, not stripped
2.  They are incomparable 
3. because the timestamp is never the same (not repr at build time)
etude@tp4% shasum -a 256 hello-world hello-world-other-time
ce58acd56139708b99da99ecb1554c7c2ce5f66ae52b6381d4cf0a56dd9715c5  hello-world
1409a226233a604df4c1243d7b2e7f551f9b43cfe81b255a4ad8056f50082854  hello-world-other-time

4. yes as the timestamp is saved in the compiled version of the source code (repr at run time)
5. No not with different architectures as the gcc compiler builds for the source architecture by default 
6. better source code for them to build the binary with respect to their architecture 
7. TODO




### 2.3
1. We have the same as the SEED of the source code randomness is the same (implicit, and we didn't change it)
2. Yes, it is at build and run time 



### 2.4
1. Yes, it is build time reproducible (no preprocessing everything is done in run time)
2. No, as the Seed is changed at run time, so it changes the output
3. Yes, the seed is changed at runtime 


### 2.5


### 2.6
1. Done
2. Yes, the higher the number of iterations, the higher the precision towards pi
3. No, it isn't reproducible in build time due to the  __DATE__, __TIME__ variables
etude@tp4% shasum -a 512 montecarlo-pi montecarlo-pi-other-time
d223c86e7a558d8496c9307517237234856f457f39614dd32341cdba291f24f10dd19ddb442cb2e33685874050599a48711804150dbd3b8d3614d61e68cc4099  montecarlo-pi
aa9764bc39ecfb57e280aff5e9c693f9fed02bf3c667f27189365bb758e435283328aa3ca380a7b606deb6c94fa87819947232955cfe59c2277374d18168184f  montecarlo-pi-other-time
4. No, it is not reproducible in run time due to the  `time_t started = time(NULL); srand(started);` instructions (the runtimeRep variant is runtime reproducible by setting `srand(started);` instruction)
5. By removing the __DATE__, __TIME__ variables, we have the build time reproducible property
etude@tp4% shasum -a 512 montecarlo-piRunBuildTimeRep montecarlo-piRunBuildTimeRep-other-time
50ac55c13bc75e4b91424d50f0df36b5489d276c065ff78eecbc66d9268fb594265fc2fa1afaa06f065f9f6718c17d1a91046d1947761d70a7d16e1744929874  montecarlo-piRunBuildTimeRep
50ac55c13bc75e4b91424d50f0df36b5489d276c065ff78eecbc66d9268fb594265fc2fa1afaa06f065f9f6718c17d1a91046d1947761d70a7d16e1744929874  montecarlo-piRunBuildTimeRep-other-time

### 2.7


### 2.4
1. Very likely, as it is one of the main objective of a cryptographic hash function
2.  
3. 

