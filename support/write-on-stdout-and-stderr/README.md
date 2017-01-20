# ./write_on_stdout_and_stderr

A binary that writes on standard output the first given argument, and writes on standard error the second given argument. If an argument is missing, it writes the strings "write on stdout" and "write on stderr".

```c
#include <unistd.h>
#include <string.h>

int	main(int argc, char **argv)
{
	if (argc == 3)
	{
		write(1, argv[1], strlen(argv[1]));
		write(1, "\n", 1);
		write(2, argv[2], strlen(argv[2]));
		write(2, "\n", 1);
	}
	else
	{
		write(1, "write on stdout\n", 16);
		write(2, "write on stderr\n", 16);
	}
	return (0);
}
```
