#include <stdio.h>

// void	hello();
// int		ft_strlen();
char*		ft_strcpy();

int		main(void)
{
	char a[10];
	// char b[10];

	// a = 0;
	// hello();
	// a = ft_strlen("rrrr");
	printf("return : %s\n", ft_strcpy(a, "rrrr"));
	printf("out : \n\n -> %s", a);

	return (0);
}