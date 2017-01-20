# ./write_on_stdout

A binary that writes on standard output the first given argument (the same behavior as `echo` but with only one argument). If no argument is given, it writes the string "write on stdout".

```c
#include <unistd.h>
#include <string.h>

int	main(int argc, char **argv)
{
	if (argc == 2)
	{
		write(1, argv[1], strlen(argv[1]));
		write(1, "\n", 1);
	}
	else
	{
		write(1, "write on stdout\n", 16);
	}
	return (0);
}
```
