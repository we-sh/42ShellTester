TARGET_DIR=../tmp

all:
	@mkdir -p $(TARGET_DIR)
	gcc -Wall -Werror -Wextra ./display-env/main.c -o $(TARGET_DIR)/display_env
	gcc -Wall -Werror -Wextra ./display-program-name/main.c -o $(TARGET_DIR)/display_program_name
	gcc -Wall -Werror -Wextra ./display-pwd/main.c -o $(TARGET_DIR)/display_pwd
	gcc -Wall -Werror -Wextra ./exit-with-status/main.c -o $(TARGET_DIR)/exit_with_status
	gcc -Wall -Werror -Wextra ./read-on-stdin/main.c -o $(TARGET_DIR)/read_on_stdin
	gcc -Wall -Werror -Wextra ./write-on-stdout/main.c -o $(TARGET_DIR)/write_on_stdout
	gcc -Wall -Werror -Wextra ./write-on-stdout-and-stderr/main.c -o $(TARGET_DIR)/write_on_stdout_and_sterr

re: fclean all

fclean:
	rm -f $(TARGET_DIR)/display_env
	rm -f $(TARGET_DIR)/display_program_name
	rm -f $(TARGET_DIR)/display_pwd
	rm -f $(TARGET_DIR)/exit_with_status
	rm -f $(TARGET_DIR)/read_on_stdin
	rm -f $(TARGET_DIR)/write_on_stdout
	rm -f $(TARGET_DIR)/write_on_stdout_and_sterr
