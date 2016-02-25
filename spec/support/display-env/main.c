#include <unistd.h>
#include <string.h>

int main(int argc, char **argv, char **envp)
{
  (void)argc;
  (void)argv;
  write(1, "START DISPLAYING ENVIRONMENT VARIABLES\n", 39);
  while (*envp)
  {
    write(1, *envp, strlen(*envp));
    write(1, &"\n", 1);
    envp++;
  }
  write(1, "END DISPLAYING ENVIRONMENT VARIABLES\n", 37);
  return (0);
}