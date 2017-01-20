# ./sleep_and_write_on_stderr

A binary that sleeps for a duration in seconds given as first argument and then writes on STDERR the string given as second argument without EOL.

```c
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

int	main(int argc, char **argv)
{
	int	seconds;

	seconds = 1;
	if (argc > 1)
		seconds = atoi(argv[1]);
	sleep(seconds);
	if (argc > 2)
	{
		write(2, argv[2], strlen(argv[2]));
	}
	return (0);
}
```
