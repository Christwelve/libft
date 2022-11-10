CC=cc
CFLAGS=-Wall -Wextra -Werror
NAME=libft.a
DEPS=libft.h
MANDATORY=ft_atoi.o ft_bzero.o ft_calloc.o ft_isalnum.o ft_isalpha.o ft_isascii.o ft_isdigit.o ft_isprint.o ft_itoa.o ft_memchr.o ft_memcmp.o ft_memcpy.o ft_memmove.o ft_memset.o ft_putchar_fd.o ft_putendl_fd.o ft_putnbr_fd.o ft_putstr_fd.o ft_split.o ft_strchr.o ft_strdup.o ft_striteri.o ft_strjoin.o ft_strlcat.o ft_strlcpy.o ft_strlen.o ft_strmapi.o ft_strncmp.o ft_strnstr.o ft_strrchr.o ft_strtrim.o ft_substr.o ft_tolower.o ft_toupper.o
BONUS=ft_lstnew.o ft_lstadd_front.o ft_lstsize.o ft_lstlast.o ft_lstadd_back.o ft_lstdelone.o ft_lstclear.o ft_lstiter.o ft_lstmap.o

%.o: %.c $(DEPS)
	$(CC) -c $(CFLAGS) -o $@ $<

all: $(NAME)

$(NAME): $(MANDATORY)
	ar -crs $(NAME) $^

bonus: $(MANDATORY) $(BONUS)
	ar -crs $(NAME) $^

test: $(MANDATORY) $(BONUS) main.o
	$(CC) -o $@ $^ && ./test

clean:
	rm -f *.o

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY:
	all bonus clean fclean re