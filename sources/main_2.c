#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

void    ft_list_push_front(t_list **list, void *data);
char    *ft_strdup(char *src);

typedef struct	s_list
{
	void *data;
	struct s_list *next;
} 				t_list;

int main(void)
{
    t_list *head;
    t_list *temp;
    head = 0;
    ft_list_push_front(&head, ft_strdup(“123"));
    ft_list_push_front(&head, ft_strdup(“456”));
    ft_list_push_front(&head, ft_strdup(“789"));
    temp = head;
    while (temp)
    {
        printf(“[%s]“, (char *)temp->data);
        if (temp->next)
            printf(” -> “);
        temp = temp->next;
    }
}