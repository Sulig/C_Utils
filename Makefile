# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sadoming <sadoming@student.42barcel>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/19 12:00:39 by sadoming          #+#    #+#              #
#    Updated: 2023/12/19 17:07:03 by sadoming         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a
# ------------------ #
# Flags:

CC = gcc
CFLAGS = -Wall -Wextra -Werror -g
# ------------------ #
# Directories:

OBJ_DIR = ./obj
DIR1 = ./ft_str
#DIR2 = ./

vpath %.c $(DIR1)
# ------------------- #
# Sorces:

MAK = Makefile
LIB = push_swap.h

SRC = ft_free.c

OBJ = $(addprefix $(OBJ_DIR)/, $(SRC:%.c=%.o))
# ******************************************************************************* #
#-------------------------------------------------------------#
all: obj_dir $(NAME)
#-------------------------------------------------------------#
#-------------------------------------------------------------#
help:
	@echo "\033[1;37m\n ~ Posible comands:\n"
	@echo "\t~ all  \t\t #-> Make $(NAME)\n"
	@echo "\t~ clean \t #-> Clean *.o\n"
	@echo "\t~ fclean \t #-> Clean all\n"
	@echo "\t~ clear \t #-> Clean all & clear\n"
	@echo "\t~ norm \t\t #-> Run norminette\n"
	@echo "\t~ re   \t\t #-> Redo $(NAME)\n"
	@make -s author

#-------------------------------------------------------------#
#-------------------------------------------------------------#
author:
	@echo "\033[1;34m\n~ **************************************** ~\n"
	@echo "\n   ~ \t      Made by Sadoming \t        ~\n"
	@echo "\n~ **************************************** ~\n\n"
#-------------------------------------------------------------#
#-------------------------------------------------------------#
norm:
	@echo "\n\033[1;93m\n~ Norminette:\n"
	@norminette
	@echo "\n~~~~~~~~~~~~~~~~~~~~~~\n"
	@norminette -R CheckForbiddenSourceHeader
	@echo "\033[1;32m\n ~ Norminette:\t~ OK\n"
	@echo "~~~~~~~~~~~~~~~~~~~~~~\n"
#-------------------------------------------------------------#
#-------------------------------------------------------------#
# ******************************************************************************* #
# Compiling Region:

obj_dir:
	@mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o: %.c $(LIB) $(MAK) | obj_dir
	$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJ)
	@ar rc $(NAME) $(OBJ)
	@echo "\033[1;32m Libft Compiled Successfully\033[1;97m\n"

# ********************************************************************************* #
# Clean region

clean:
	#@/bin/rm -f $(OBJ)
	@echo "\033[1;34m\n All obj removed\033[1;97m\n"


fclean: clean
	@/bin/rm -f $(NAME)
	@find . -name ".DS_Store" -type f -delete
	@echo "\033[1;34m All cleaned succesfully\033[1;97m\n"

clear: fclean
	@clear

re: fclean all
# -------------------- #
.PHONY: all clean clear fclean norm re
# ********************************************************************************** #
