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
BNS_DIR = ./bonus

SRC = $(addprefix $(SRC_DIR)/, \
		main.c)

ASM_FILE = $(addprefix $(SRC_DIR)/, \
		ft_strlen.s\
		ft_strcpy.s\
		ft_strcmp.s\
		ft_write.s\
		ft_read.s\
		ft_strdup.s)

BNS_FILE = $(addprefix $(BNS_DIR)/, \
		ft_list_push_front.s\
		ft_list_size.s\
		ft_list_remove_if.s\
		ft_list_sort.s)

ASM_OBJ = $(addprefix $(SRC_DIR)/, $(notdir $(ASM_FILE:.s=.o)))
ASM_BONUS_OBJ = $(addprefix $(BNS_DIR)/, $(notdir $(BNS_FILE:.s=.o)))

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

$(BNS_DIR)/%.o : $(BNS_DIR)/%.s
	$(NASM) $(NASM_FLAG) $< -o $@

clean :
	@echo "${PURPLE}[${RED} cleaning ${PURPLE} : erase objects file.]"
	@echo "${PURPLE}->kill every objects.."
	@($(RM) $(ASM_OBJ))
	@($(RM) $(ASM_BONUS_OBJ))
	@echo "${PURPLE}->clearing dead bodys..."
	@echo "${MINT}cleaning Done."

fclean : clean
	@echo "${PURPLE}[${RED} fcleaning ${PURPLE} : erase objects & libasm file.]"
	@echo "${PURPLE}->kill all files... bye bye!"
	@($(RM) $(RMFLAGS) $(NAME))
	@echo "${MINT}fcleaning Done."

re : fclean
	@make

bonus : $(ASM_OBJ) $(ASM_BONUS_OBJ)
	@echo "${PURPLE}[${RED} Makefile${PURPLE} :starting.. ]"
	@echo "${PURPLE}->making ASM.o .."
	@$(AR) $(NAME) $(ASM_OBJ) $(ASM_BONUS_OBJ)
	@echo "${PURPLE}->resting.. drinking some coffee... hell asm.."
	@echo "${MINT}making Done."

test :
	@echo "${{BLINK}${MINT}->[Progam Test starting]"
	@echo "${MINT}"
	@echo "${RED}===========================================${MINT}"
	@echo "${MINT}"
	@$(CC) $(GCC_FLAG) $(SRC) -L./ -lasm
	@./a.out
	@echo "${MINT}"
	@echo "${MINT}"
	@echo "${RED}===========================================${MINT}"
