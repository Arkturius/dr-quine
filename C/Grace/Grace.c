#include <unistd.h>
#include <fcntl.h>
// Grace-fully
#define QUINE_PRINTER(fd, fmt)													\
{																				\
	const char	spc[4] = {9, 10, 34, 92};										\
	const char	*tmp = fmt;														\
	int			i = 0;															\
																				\
	while (*tmp)																\
		tmp++;																	\
	while (i < tmp - fmt)														\
	{																			\
		unsigned char	c = (unsigned char)fmt[i++];							\
		const char		*s;														\
		switch (c)																\
		{																		\
			case 63: write(fd, fmt, tmp - fmt); continue;						\
			case 65: s = &spc[0]; break;										\
			case 66: s = &spc[1]; break;										\
			case 67: s = &spc[2]; break;										\
			case 68: s = &spc[3]; break;										\
			default: s = fmt + i - 1; break;									\
		}																		\
		write(fd, s, 1);														\
	}																			\
}
#define ret(X)	return (X)
#define	_main()																	\
int main(void)																	\
{																				\
	const char	*code = "#include <unistd.h>B#include <fcntl.h>B// Grace-fullyB#define QUINE_PRINTER(fd, fmt)AAAAAAAAAAAAADB{AAAAAAAAAAAAAAAAAAAADBAconst charAspc[4] = {9, 10, 34, 92};AAAAAAAAAADBAconst charA*tmp = fmt;AAAAAAAAAAAAAADBAintAAAi = 0;AAAAAAAAAAAAAAADBAAAAAAAAAAAAAAAAAAAADBAwhile (*tmp)AAAAAAAAAAAAAAAADBAAtmp++;AAAAAAAAAAAAAAAAADBAwhile (i < tmp - fmt)AAAAAAAAAAAAAADBA{AAAAAAAAAAAAAAAAAAADBAAunsigned charAc = (unsigned char)fmt[i++];AAAAAAADBAAconst charAA*s;AAAAAAAAAAAAAADBAAswitch (c)AAAAAAAAAAAAAAAADBAA{AAAAAAAAAAAAAAAAAADBAAAcase 63: write(fd, fmt, tmp - fmt); continue;AAAAAADBAAAcase 65: s = &spc[0]; break;AAAAAAAAAADBAAAcase 66: s = &spc[1]; break;AAAAAAAAAADBAAAcase 67: s = &spc[2]; break;AAAAAAAAAADBAAAcase 68: s = &spc[3]; break;AAAAAAAAAADBAAAdefault: s = fmt + i - 1; break;AAAAAAAAADBAA}AAAAAAAAAAAAAAAAAADBAAwrite(fd, s, 1);AAAAAAAAAAAAAADBA}AAAAAAAAAAAAAAAAAAADB}B#define ret(X)Areturn (X)B#defineA_main()AAAAAAAAAAAAAAAAADBint main(void)AAAAAAAAAAAAAAAAADB{AAAAAAAAAAAAAAAAAAAADBAconst charA*code = C?C;AAAAAAAAAAAAAAAAADBAconst intAfd = open(CGrace_kid.cC, 0101, 0644);AAAAAAADBAif (fd == -1) ret(1);AAAAAAAAAAAAAADBAQUINE_PRINTER(fd, code);AAAAAAAAAAAAADBAret(0);AAAAAAAAAAAAAAAAAADB}B_main()B";																	\
	const int	fd = open("Grace_kid.c", 0101, 0644);							\
	if (fd == -1) ret(1);														\
	QUINE_PRINTER(fd, code);													\
	ret(0);																		\
}
_main()
