#include <stdio.h>
#include <stdlib.h>


int main(){

	int f_ten, g_ten, quotient = 0, remainder = 0;

	printf("f_ten = ");
	scanf("%d", &f_ten);
	printf("\ng_ten = ");
	scanf("%d", &g_ten);

	quotient = (f_ten+3) / (g_ten+6);
	remainder = (f_ten+3) % (g_ten+6);

	printf("\nh_quotient = %d\n\n", quotient);
	printf("h_remainder = %d\n\n", remainder);

	return 0;
}
