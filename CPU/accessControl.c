#include <stdio.h>
#define SIZE 4

void readPassword(int s[])
{
	int n = 0;

	printf("Digite a senha de %d digitos(pressione enter para cada tecla): ", SIZE);
	while(n < SIZE)
	{
		scanf("%d", &s[n]);
		n++;
	}
}


int equal(int s1[], int s2[])
{
	int i = 0;
	while(i < SIZE)
	{
		if(s1[i] != s2[i])
			return 0;
		i++;
	}

	return 1;
}


int main(void)
{
	char input = 0; 
	int password[SIZE];

	while(1)
	{
		printf("Cadastro (\"C\") ‐ Acesso (\"A\"): \n");
		scanf(" %c", &input);

		if(input == 'c' || input == 'C')
		{
			readPassword(password);
			printf("OK\n");
		}
		else if(input == 'a' || input == 'A')
		{
			int typedPassword[SIZE];
			readPassword(typedPassword);

			if(equal(password, typedPassword))
				printf("OK\n");
			else
				printf("Erro\n");
		}

		input = 0;
	}

	return 0;
}
