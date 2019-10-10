# Plato - A reduced version of the ls command

The first MP for this Rust section is going to be recreating a very reduced version of the `ls`
command. The functionality that will be required is 
- printing out the files and directories in the current directory
- printing out the permissions, owner, file size, time last modified, and the name of the file
- printing out the file size formatted to bytes, kbs, mbs, etc.
- accepting a directory or a file, similar to `ls my_file` and `ls my_directory` 

You will be responsible for filling in most of the functionality yourself! 

## Part 4
Finish up the MP! In `list.rs` there are some functions for printing the output.
Here we are going to get the args provided and call `create_list_items`. There are no unit tests for this, you should be able to see similar output to this for all of your commands. 

```Bash
Joshuas-MacBook-Pro-6:plato josh$ ./target/debug/plato
Cargo.toml	target	Cargo.lock	README.md	src	
Joshuas-MacBook-Pro-6:plato josh$ ./target/debug/plato -l
josh	247	 Aug 12 23:22	Cargo.toml
josh	0	 Sep 16 15:38	target
josh	12349	 Aug 12 23:29	Cargo.lock
josh	625	 Aug 19 00:27	README.md
josh	0	 Sep 17 15:47	src
Joshuas-MacBook-Pro-6:plato josh$ ./target/debug/plato -lh
josh	247 B	 Aug 12 23:22	Cargo.toml
josh	0 B	 Sep 16 15:38	target
josh	12.35 kB	 Aug 12 23:29	Cargo.lock
josh	625 B	 Aug 19 00:27	README.md
josh	0 B	 Sep 17 15:47	src
Joshuas-MacBook-Pro-6:plato josh$ ./target/debug/plato -lha
josh	6 B	 Aug 19 01:52	.hello
josh	247 B	 Aug 12 23:22	Cargo.toml
josh	0 B	 Sep 16 15:38	target
josh	12.35 kB	 Aug 12 23:29	Cargo.lock
josh	625 B	 Aug 19 00:27	README.md
josh	0 B	 Sep 16 17:34	.git
josh	0 B	 Sep 17 15:47	src
Joshuas-MacBook-Pro-6:plato josh$ ./target/debug/plato -a
.hello	Cargo.toml	target	Cargo.lock	README.md	.git	src	
Joshuas-MacBook-Pro-6:plato josh$ ./target/debug/plato src/
lib	main.rs	
Joshuas-MacBook-Pro-6:plato josh$ 
```

