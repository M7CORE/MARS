#include <stdio.h>
#include <stdlib.h>


int main(){
	
	int A, B, C, f, g;
	
	printf("Enter 3 integers for A, B, C respectively:\n\n");
	scanf("%d", &A);
	printf("\n");
	scanf("%d", &B);
	printf("\n");
	scanf("%d", &C);
	
	f = 0;
	g = 0;
	
	f = A * B - 6;
	g = 8 * C - 3;
	
	printf("\nf_ten = %d\n\n", f);
	printf("g_ten = %d", g);
	
	return 0;
}
