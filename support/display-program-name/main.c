#include <unistd.h>
#include <string.h>

int	main(int ac, char **av)
{
	(void)ac;
	write(1, av[0], strlen(av[0]));
	write(1, "\n", 1);
	return (0);
}
