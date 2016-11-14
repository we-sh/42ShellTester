TARGET_DIR=../../tmp

all:
	make TARGET_DIR=$(TARGET_DIR) -C ./display-env
	make TARGET_DIR=$(TARGET_DIR) -C ./display-program-name
	make TARGET_DIR=$(TARGET_DIR) -C ./display-pwd
	make TARGET_DIR=$(TARGET_DIR) -C ./exit-with-status
	make TARGET_DIR=$(TARGET_DIR) -C ./read-on-stdin
	make TARGET_DIR=$(TARGET_DIR) -C ./sleep-and-exit-with-status
	make TARGET_DIR=$(TARGET_DIR) -C ./sleep-and-write-on-stderr
	make TARGET_DIR=$(TARGET_DIR) -C ./write-all-arguments-on-stdout
	make TARGET_DIR=$(TARGET_DIR) -C ./write-on-stderr
	make TARGET_DIR=$(TARGET_DIR) -C ./write-on-stdout
	make TARGET_DIR=$(TARGET_DIR) -C ./write-on-stdout-and-stderr

re: fclean all

fclean:
	make TARGET_DIR=$(TARGET_DIR) fclean -C ./display-env
	make TARGET_DIR=$(TARGET_DIR) fclean -C ./display-program-name
	make TARGET_DIR=$(TARGET_DIR) fclean -C ./display-pwd
	make TARGET_DIR=$(TARGET_DIR) fclean -C ./exit-with-status
	make TARGET_DIR=$(TARGET_DIR) fclean -C ./read-on-stdin
	make TARGET_DIR=$(TARGET_DIR) fclean -C ./sleep-and-exit-with-status
	make TARGET_DIR=$(TARGET_DIR) fclean -C ./sleep-and-write-on-stderr
	make TARGET_DIR=$(TARGET_DIR) fclean -C ./write-all-arguments-on-stdout
	make TARGET_DIR=$(TARGET_DIR) fclean -C ./write-on-stderr
	make TARGET_DIR=$(TARGET_DIR) fclean -C ./write-on-stdout
	make TARGET_DIR=$(TARGET_DIR) fclean -C ./write-on-stdout-and-stderr
