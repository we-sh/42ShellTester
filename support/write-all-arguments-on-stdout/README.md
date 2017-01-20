# ./write_all_arguments_on_stdout

A binary that writes on standard output each argument separated by the symbol `@`. If no argument is given, it writes the string "nothing to be written on stdout".

```c
#include <unistd.h>
#include <string.h>

int	main(int argc, char **argv)
{
	if (argc >= 2)
	{
		argv++;
		while (*argv)
		{
			write(1, *argv, strlen(*argv));
			write(1, "@", 1);
			argv++;
		}
		write(1, "\n", 1);
	}
	else
	{
		write(1, "nothing to be written on stdout\n", 32);
	}
	return (0);
}
```
