# TP4

### 1.1
1. Very likely, as it is one of the main objective of a cryptographic hash function
2. aac and ada 
3. 




### 2.2
1. hello-world: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=b450c18c9e94b394e375a16956cc7e2e0589c18a, for GNU/Linux 4.4.0, not stripped
2.  They are incomparable 
3. because the timestamp is never the same (not repr at build time)

```
etude@tp4% shasum -a 256 hello-world hello-world-other-time
ce58acd56139708b99da99ecb1554c7c2ce5f66ae52b6381d4cf0a56dd9715c5  hello-world
1409a226233a604df4c1243d7b2e7f551f9b43cfe81b255a4ad8056f50082854  hello-world-other-time
```

4. yes as the timestamp is saved in the compiled version of the source code (repr at run time)
5. No not with different architectures as the gcc compiler builds for the source architecture by default 
6. better source code for them to build the binary with respect to their architecture 
7. Not enough time




### 2.3
1. We have the same as the SEED of the source code randomness is the same (implicit, and we didn't change it)
2. Yes, it is at build and run time 



### 2.4
1. Yes, it is build time reproducible (no preprocessing everything is done in run time)
2. No, as the Seed is changed at run time, so it changes the output
3. Yes, the seed is changed at runtime 



### 2.6
1. Done
2. Yes, the higher the number of iterations, the higher the precision towards pi
3. No, it isn't reproducible in build time due to the  __DATE__, __TIME__ variables
```
etude@tp4% shasum -a 512 montecarlo-pi montecarlo-pi-other-time
d223c86e7a558d8496c9307517237234856f457f39614dd32341cdba291f24f10dd19ddb442cb2e33685874050599a48711804150dbd3b8d3614d61e68cc4099  montecarlo-pi
aa9764bc39ecfb57e280aff5e9c693f9fed02bf3c667f27189365bb758e435283328aa3ca380a7b606deb6c94fa87819947232955cfe59c2277374d18168184f  montecarlo-pi-other-time
```
4. No, it is not reproducible in run time due to the  `time_t started = time(NULL); srand(started);` instructions (the runtimeRep variant is runtime reproducible by setting `srand(started);` instruction)
5. By removing the __DATE__, __TIME__ variables, we have the build time reproducible property
```
etude@tp4% shasum -a 512 montecarlo-piRunBuildTimeRep montecarlo-piRunBuildTimeRep-other-time
50ac55c13bc75e4b91424d50f0df36b5489d276c065ff78eecbc66d9268fb594265fc2fa1afaa06f065f9f6718c17d1a91046d1947761d70a7d16e1744929874  montecarlo-piRunBuildTimeRep
50ac55c13bc75e4b91424d50f0df36b5489d276c065ff78eecbc66d9268fb594265fc2fa1afaa06f065f9f6718c17d1a91046d1947761d70a7d16e1744929874  montecarlo-piRunBuildTimeRep-other-time

```

### 3.3

1. 2 : 1 for the number of iterations and 1 for the runtime seed 
2. The listing 7 (localhost/random) is larger than the listing 8 (localhost/random2) 

```cmd
etude@section3% podman image ls
REPOSITORY                TAG         IMAGE ID      CREATED             SIZE
localhost/random2         latest      330c318301d3  6 seconds ago       8.75 MB
localhost/random          latest      5da091f89cca  About a minute ago  291 MB
```
3. 16144 Bytes for the compiled code and 8.75 MB for the image (normal it as to create a new entire environment)
4. The line requires the built binary in the "build" container 
5. not enough time
6. we all have the same results
7. Yes, we transfer the hash of a "screenshot" of our container 




### 4.1.6 
1. the resulting binary is the same (with someone sharing same OS/architecture)
2. No it isn't the same.
3. Yes, I seem to get the same result (at least the symlink doesn't change)
4. In the nix shell command you enter a shell with the hello nixpkgs. Whereas the profile command sets the hello nixpkgs as a user command (can be run in the user environment)
5. The role of the /nix/store directory is to be the only place nix can write files, binary, etc. For example if the hello nixpkgs is installed with the nix profile command, a symlink /usr/bin/hello will be created towards the corresponding binary inside the /nix/store directory
6. The nix flake lock command creates or updates the flake.lock file which consists of a declaration of the versions of the dependency used. It is critical for reproducibility as other version of dependencies may break the application So adding the flake.lock file makes sure that the dependencies don't break a subsequent.
7. The build wouldn't success due to the sandboxing. This restriction adds some protection and integrity to nix packages as they cannot interfere with system's files.
8. With the flake.lock file 
9.  As described underneath, and yes the flake.lock file is a good addition to ensure the dependencies versions are the wright one. 
``` 
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };
  outputs = inputs: {
    devShells.x86_64-linux.default =
      let
        pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
       in
       pkgs.mkShell {
         packages = [
           pkgs.gcc
           pkgs.jdk25_headless
         ];
       };
   };
 }
```

### 4.2
1. There is less overhead, as it doesn't have to containerize the packages used 
2. Yes, as long as you are sure of the files being copied 
3. Of course not, IA are complex and depending on the server handling the request, it might produce better or worse responses.  
4. I would do as described in the 4.1.4 section
5. Sure, why not, having good LaTeX templates is always a good thing
6. The content in itself is fascinating, it is clearly my favorite practical session. Though the only "black dot" would be the way of presenting it. 
I think having a full walk-through of a section then letting time for the questions isn't the best way of doing so. 
Letting time to experiment and respond to the questions then only explaining what was intended might be easier to follow.
As we had to, at the same time, listen, try the code and respond to the questions. 
I think the first 3 sections can be left for us on our own. The last section is much more interesting and the explanation is greatly appreciated, so keeping the walk-through might be relevant.   

