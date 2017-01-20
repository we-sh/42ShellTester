# ./exit_with_status

A binary that immediately exits with the status given as first argument.

```c
#include <stdlib.h>

int	main(int argc, char **argv)
{
	(void)argc;
	if (argc == 2)
		return (atoi(argv[1]));
	return (0);
}
```
