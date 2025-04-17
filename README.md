# dr-quine
42 post common-core project [dr-quine](https://projects.intra.42.fr/projects/42cursus-dr-quine)

The objective of this project is to write 3 quines, based on fixed rules.
Those should be written in C AND in x86-64 assembly.

I tried to do all of it with the bare minimum calls to outside functions (So no printf formatting abuse).
Thus, the ASM part is done only with linux syscalls. For C, only write is needed.
(TODO: rewrite Grace and Sully in C)

### Colleen : displays its source code on standard output.
	A main function,
	Another function which must be called,
	A comment inside of the main function,
	A comment outside of the program.

### Grace : copy its source code into Grace_kid file.
	No main declared,
	Only 3 macros,
	One comment.

### Sully : self replicate, compile and executes its copy, decrementing a counter variable.
	The counter must starts at 5,
	The original should create, compile and execute Sully_X, based on the counter,
	Stops when X hits 0. (Sully_0 execution wont create another file).

## Bonus part

The bonus part is about writing the same programs in other languages. Already have python, planning to add zig (WIP).

## Explanations

### Colleen
At first, the only way to replicate code inside code i tought of was something like `printf(code, code);` with code being a format string containing a `%s` to be replaced by itself.
Then i tought that if printf could do it, i can format my own string with my own rules.
Next part was to find:
- what characters would cause problem in code representation.
- what characters could i use as placeholders.

I finally came up with a fairly simple replacement system
| Format char  | Replacement  |
| ------------ | ------------ |
| A  | '\x09' tabulation |
| B  | '\x0a' newline |
| C  | '\x22' dquote |
| ?  | Code string  |

Now, iterating through the code string, i can choose to replace my format characters when encountering them, rewriting the non-formatted code string when finding the ? in the original one.
Once the printer code was wrote, the only thing left to do was to copy it, replace tabs with A's, newlines with B's, the dquotes with C's and finally the ? for the code.
Placing it as formatted string of the printer, it now prints itself !

### Grace
After the first one, this was pretty straightforward. I kept my printer from Colleen, then added some code to open a file, and replaced the file descriptor to be the "kid"'s one. With copy-pasting and formatting, Grace was finished.

### Sully
This one is a little bit tricky. Sully has to create Sully_4.XXX source code, compile it as Sully_4, and execute it, etc... until Sully_0.
I had a modification to make inside of the printer function, as i needed to change a variable inside of the source code directly. I followed what i did earlier and so took D as a placeholder for the Sully generation number. Once the printer was tweaked, i wrote the compilation/execution part. As for the others, the last part is simple, copy - format - paste into the source program and GO !
