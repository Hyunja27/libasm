#include <stdio.h>

int		ft_strlen();
int		ft_strcmp();
char*	ft_strcpy();
int		ft_write();




int		main(void)
{
	char a[10];
	char b[10];

	// a = 0;
	// hello();
	// a = ft_strlen("rrrr");
	printf("return : %s\n", ft_strcpy(a, "rrrrr"));
	printf("return : %s\n", ft_strcpy(b, "zrrrr"));

	// printf("cmp : \n\n -> %d", ft_strcmp(a, b));
	
	printf("\nft_write's return: %d", ft_write(1, "aa", 1));

	return (0);
}