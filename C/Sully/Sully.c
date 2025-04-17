#include <unistd.h>
#include <fcntl.h>
#include <stdlib.h>
int sully_gen = 5;

void quine_printer(int fd, const char *fmt)
{
	// Who needs printf...
	const char	spc[4] = {9, 10, 34, sully_gen + 48};
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
			case 68: s = &spc[3]; break;
			default: s = fmt + i - 1; break;
		}
		write(fd, s, 1);
	}
}

int main(void)
{
	if (sully_gen <= 0)
		return (0);
	sully_gen--;
	char		file[10] = {83, 117, 108, 108, 121, 95, sully_gen + 48, 46, 99, 0};
	char		cmd[] = "clang Sully_X.c -o Sully_X && ./Sully_X";
	const char	*code = "#include <unistd.h>B#include <fcntl.h>B#include <stdlib.h>Bint sully_gen = D;BBvoid quine_printer(int fd, const char *fmt)B{BA// Who needs printf...BAconst charAspc[4] = {9, 10, 34, sully_gen + 48};BAconst charA*tmp = fmt;BAintAAAi = 0;BBAwhile (*tmp)BAAtmp++;BAwhile (i < tmp - fmt)BA{BAAunsigned charAc = (unsigned char)fmt[i++];BAAconst charAA*s;BAAswitch (c)BAA{BAAAcase 63: write(fd, fmt, tmp - fmt); continue;BAAAcase 65: s = &spc[0]; break;BAAAcase 66: s = &spc[1]; break;BAAAcase 67: s = &spc[2]; break;BAAAcase 68: s = &spc[3]; break;BAAAdefault: s = fmt + i - 1; break;BAA}BAAwrite(fd, s, 1);BA}B}BBint main(void)B{BAif (sully_gen <= 0)BAAreturn (0);BAsully_gen--;BAcharAAfile[10] = {83, 117, 108, 108, 121, 95, sully_gen + 48, 46, 99, 0};BAcharAAcmd[] = Cclang Sully_X.c -o Sully_X && ./Sully_XC;BAconst charA*code = C?C;BAconst intAfd = open(file, 0101, 0644);BAcmd[12] = sully_gen + 48;BAcmd[25] = sully_gen + 48;BAcmd[38] = sully_gen + 48;BAquine_printer(fd, code);BAsystem(cmd);B}B";
	const int	fd = open(file, 0101, 0644);
	cmd[12] = sully_gen + 48;
	cmd[25] = sully_gen + 48;
	cmd[38] = sully_gen + 48;
	quine_printer(fd, code);
	system(cmd);
}
