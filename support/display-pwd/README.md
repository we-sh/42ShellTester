# ./display_pwd

A binary that writes on standard output the absolute path of the current directory returned by `getcwd(3)`, encountered with the strings `PWD:` and `:PWD`.

```c
#include <unistd.h>
#include <string.h>

int	main(void)
{
	char	*pwd;

	pwd = getcwd(NULL, 0);
	write(1, "PWD:", 4);
	write(1, pwd, strlen(pwd));
	write(1, ":PWD\n", 5);
	return (0);
}
```
