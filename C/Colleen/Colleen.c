// Get quined
#include <unistd.h>

void quine_printer(int fd, const char *fmt)
{
	// Who needs printf...
	const char	spc[4] = {9, 10, 34, 0};
	const char	*tmp = fmt;
	int			i = 0;

	while (*tmp)
		tmp++;
	while (i < tmp - fmt)
	{
		unsigned char	c = (unsigned char)fmt[i++];
		const char		*s;
		switch (c)
		{
			case 63: write(fd, fmt, tmp - fmt); continue;
			case 65: s = &spc[0]; break;
			case 66: s = &spc[1]; break;
			case 67: s = &spc[2]; break;
			default: s = fmt + i - 1; break;
		}
		write(fd, s, 1);
	}
}

int main(void)
{
	const char *code = "// Get quinedB#include <unistd.h>BBvoid quine_printer(int fd, const char *fmt)B{BA// Who needs printf...BAconst charAspc[4] = {9, 10, 34, 0};BAconst charA*tmp = fmt;BAintAAAi = 0;BBAwhile (*tmp)BAAtmp++;BAwhile (i < tmp - fmt)BA{BAAunsigned charAc = (unsigned char)fmt[i++];BAAconst charAA*s;BAAswitch (c)BAA{BAAAcase 63: write(fd, fmt, tmp - fmt); continue;BAAAcase 65: s = &spc[0]; break;BAAAcase 66: s = &spc[1]; break;BAAAcase 67: s = &spc[2]; break;BAAAdefault: s = fmt + i - 1; break;BAA}BAAwrite(fd, s, 1);BA}B}BBint main(void)B{BAconst char *code = C?C;BAquine_printer(1, code);B}B";
	quine_printer(1, code);
}
