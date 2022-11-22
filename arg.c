#!/usr/bin/tcc -run

#ifdef _WIN32
#include <io.h> // for isatty()
#endif

#ifdef __linux__
#include <unistd.h> // for isatty()
#endif


#include <stdio.h>  // for fileno(), printf(), stderr, stdout, fprintf()


int count_chars(char *p[]) {
	int count = 0;
	for (; *p; p++) {
		for (char *c = *p; *c; c++) {
			count++;
		}
	}
	return count;
}

int main(int argc, char *argv[]) {
	if ( isatty(fileno(stdout)) ) {
		fprintf(stderr, "%i:%i ", (argc - 1), count_chars(argv + 1) );
	}


	if (*(argv+1)) for (char **ptr = argv+1; ;) {
		printf("%c", '\'');

		for (char *c = *ptr; *c; c++) {
			if (*c == '\'') {
				printf("%s", "'\\''");
			} else {
				printf("%c", *c);
			}
		}


		ptr++;
		if (! *ptr) {
			printf("%c", '\'');
			break;
		}

		printf("%s", "' ");
	}
	printf("%c", '\n');


	return 0;
}
