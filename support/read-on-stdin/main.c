#include <unistd.h>
#include <string.h>

int main(void)
{
  char buf[1024];
  int ret;
  while ((ret = read(0, buf, 1014)) > 0)
    write(1, buf, ret);
  if (ret < 0)
    write(2, "STDIN READ ERROR\n", 17);
  return (0);
}
