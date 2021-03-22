NAME = libasm.a

NASM = nasm
CC = gcc
GCC_FLAG = -Wall -Wextra -Werror
AR = ar rc
NASM_FLAG = -f macho64
DEBUG_FLAG = -g3
RM = rm
RMFLAGS = -f

SRC_DIR = ./sources

SRC = $(addprefix $(SRC_DIR)/, \
		main.c)

ASM_FILE = $(addprefix $(SRC_DIR)/, \
		ft_strlen.s\
		ft_strcpy.s)

ASM_OBJ = $(addprefix $(SRC_DIR)/, $(notdir $(ASM_FILE:.s=.o)))

GREEN = \033[32m
PURPLE = \033[35m
MINT = \033[36m
RED = \033[31m
BLINK = \033[5m
BOLD = \033[1m
BACKGRAY = \033[100m
NO_COLOR = \e[0m

all :$(NAME)

$(NAME) : $(ASM_OBJ)
	@echo "${PURPLE}[${RED} Makefile${PURPLE} :starting.. ]"
	@echo "${PURPLE}->making ASM.o .."
	@$(AR) $(NAME) $(ASM_OBJ)
	@echo "${PURPLE}->resting.. drinking some coffee... hell asm.."
	@echo "${MINT}making Done."

$(SRC_DIR)/%.o : $(SRC_DIR)/%.s
	$(NASM) $(NASM_FLAG) $< -o $@

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

test : $(NAME)
	@echo "${{BLINK}${MINT}->[Progam Test starting]"
	@echo "${MINT}"
	@echo "${RED}===========================================${MINT}"
	@echo "${MINT}"
	@$(CC) $(GCC_FLAG) $(SRC) -L./ -lasm
	@./a.out
	@echo "${MINT}"
	@echo "${MINT}"
	@echo "${RED}===========================================${MINT}"
