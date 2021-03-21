NAME = libasm

NASM = nasm
CC = gcc
GCC_FLAG = -Wall -Wextra -Werror
NASM_FLAG = -f macho64
DEBUG_FLAG = -g3
RM = rm
RMFLAGS = -f

SRC_DIR = ./sources

SRC = $(addprefix $(SRC_DIR)/, \
		main.c)

ASM_FILE = $(addprefix $(SRC_DIR)/, \
		ft_strlen.s)

ASM_OBJ = $(addprefix $(SRC_DIR)/, \
		ft_strlen.o)

GREEN = \033[32m
PURPLE = \033[35m
MINT = \033[36m
RED = \033[31m
BLINK = \033[5m
BOLD = \033[1m
BACKGRAY = \033[100m
NO_COLOR = \e[0m

all :$(NAME)

$(NAME) :
	@echo "${PURPLE}[${RED} Makefile${PURPLE} :starting.. ]"
	@echo "${PURPLE}->making ASM.o .."
	@($(NASM) $(NASM_FLAG) $(ASM_FILE))
	@echo "${PURPLE}->resting.. drinking some coffee... hell asm.."
	@($(CC) $(GCC_FLAG) $(SRC) $(ASM_OBJ) -o libasm)
	@echo "${MINT}making Done."

clean :
	@echo "${PURPLE}[${RED} cleaning ${PURPLE} : erase objects file.]"
	@echo "${PURPLE}->kill every objects.."
	@($(RM) $(ASM_OBJ))
	@echo "${PURPLE}->clearing dead bodys..."
	@echo "${MINT}cleaning Done."

fclean : clean
	@echo "${PURPLE}[${RED} fcleaning ${PURPLE} : erase objects & libasm file.]"
	@echo "${PURPLE}->kill all files... bye bye!"
	@($(RM) $(RMFLAGS) $(NAME))
	@echo "${MINT}fcleaning Done."

re : fclean
	@make

test : all
	@echo "${MINT}->[Progam Test starting]"
	@./libasm
