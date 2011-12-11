#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <string.h>
#include <math.h>

#define X 600851475143

int main(void)
{
    long lim = sqrt(X);
    char sieve[lim];
    memset(sieve, 1, lim);

    for (long p = 2; p < lim; p++) {
        if (sieve[p]) {
            for (long np = p*2; np < lim; np += p)
                sieve[np] = false;
            if (X % p == 0)
                printf("%ld\n", p);
        }
    }

    return EXIT_SUCCESS;
}
