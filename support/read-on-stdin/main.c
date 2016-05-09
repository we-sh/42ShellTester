#include <unistd.h>
#include <string.h>

int main(void)
{
  char buf[1];
  int ret;
  write(1, "START READING ON STDIN@\n", 24);
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
  write(1, "END READING ON STDIN@\n", 22);
  return (0);
}
