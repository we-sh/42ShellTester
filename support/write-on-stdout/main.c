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
