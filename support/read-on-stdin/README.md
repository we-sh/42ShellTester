# ./read_on_stdin

A binary that reads on standard entry and write each line on standard output suffixed with the character `@` (e.g. same behavior as `cat -e` and the *newline* character). When `read(2)` returns `-1`, then the string `STDIN READ ERROR` is written on standard error.

```c
#include <unistd.h>
#include <string.h>

int	main(void)
{
	char	buf[1];
	int		ret;

	while ((ret = read(0, buf, 1)) > 0)
	{
		if (buf[0] == '\n')
			write(1, "@", 1);
		write(1, buf, ret);
	}
	if (ret < 0)
	{
		write(2, "STDIN READ ERROR\n", 17);
		return (1);
	}
	return (0);
}
```
