# ./sleep_and_exit_with_status

A binary that sleeps for a duration in seconds given as first argument and then exits with status given as second argument.

```c
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

int	main(int argc, char **argv)
{
	int seconds;

	seconds = 1;
	if (argc > 1)
		seconds = atoi(argv[1]);
	sleep(seconds);
	if (argc > 2)
		return (atoi(argv[2]));
	return (0);
}
```
