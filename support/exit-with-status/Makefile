NAME=exit_with_status
TARGET_DIR=.

$(NAME): all

all:
	gcc -Wall -Werror -Wextra main.c -o "$(TARGET_DIR)/$(NAME)"

fclean:
	rm -f "$(TARGET_DIR)/$(NAME)"

re: fclean all
