#include <unistd.h>
#include <string.h>

int			main(int ac,char **av)
{
	size_t	size;

	(void)ac;
	size = strlen(av[0]);
	write(1, av[0], size);
    write(1, "\n", 1);
    return (0);
}