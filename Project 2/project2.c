#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int main(){

	char input[] = "To assist N.C. Division of Motor Vehicle customers and partners in dealing with the impact of the coronavirus pandemic, a provision included in the COVID-19 bill signed into law today by Governor Cooper grants a five-month extension of the expiration date on more than two dozen DMV credentials.";
	int i, c= 0, h = 0, a = 0, r = 0, g = 0, e = 0, o = 0, n = 0;
	
	for (i = 0; i < strlen(input); i++) {
		
		if (input[i] == 'C' || input[i] == 'c')
			c++;
		else if (input[i] == 'H' || input[i] == 'h')
			h++;
		else if (input[i] == 'A' || input[i] == 'a')
			a++;
		else if (input[i] == 'R' || input[i] == 'r')
			r++;
		else if (input[i] == 'G' || input[i] == 'g')
			g++;
		else if (input[i] == 'E' || input[i] == 'e')
			e++;
		else if (input[i] == 'O' || input[i] == 'o')
			o++;
		else if (input[i] == 'N' || input[i] == 'n')
			n++;
		else
			continue;
	}
	
	printf("C: %d\nH: %d\nA: %d\nR: %d\nG: %d\nE: %d\nO: %d\nN: %d\n\n", c, h, a, r, g, e, o, n);
	
	printf("C: ");
	for (i = 0; i < c; i++)
		printf("#");
		
	printf("\nH: ");
	for (i = 0; i < h; i++)
		printf("#");
		
	printf("\nA: ");
	for (i = 0; i < a; i++)
		printf("#");
		
	printf("\nR: ");
	for (i = 0; i < r; i++)
		printf("#");
		
	printf("\nG: ");
	for (i = 0; i < g; i++)
		printf("#");
		
	printf("\nE: ");
	for (i = 0; i < e; i++)
		printf("#");
		
	printf("\nO: ");
	for (i = 0; i < o; i++)
		printf("#");
		
	printf("\nN: ");
	for (i = 0; i < n; i++)
		printf("#");
	
	
	return 0;
}
