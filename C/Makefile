##
#	42 post common-core project dr_quine.
##

COLLEEN		:=	Colleen
GRACE		:=	Grace
SULLY		:=	Sully

CC			:=	clang
CFLAGS		:=	-g

RM          :=	rm -rf

MAKEFLAGS   +=	--no-print-directory

all: c g

c:
	$(CC) $(CFLAGS) $(COLLEEN)/$(COLLEEN).c -o $(COLLEEN)/$(COLLEEN)
	$(RM) $(COLLEEN)/$(COLLEEN).o

g:
	$(CC) $(CFLAGS) $(GRACE)/$(GRACE).c -o $(GRACE)/$(GRACE)
	$(RM) $(GRACE)/$(GRACE).o

s:
	$(CC) $(CFLAGS) $(SULLY)/$(SULLY).c -o $(SULLY)/$(SULLY)
	$(RM) $(SULLY)/$(SULLY).o

clean:
	$(RM) $(COLLEEN)/$(COLLEEN)
	$(RM) $(GRACE)/$(GRACE)
	$(RM) $(SULLY)/$(SULLY)

fclean: clean
	$(RM) $(GRACE)/$(GRACE)_kid.c
	$(RM) $(SULLY)/$(SULLY)_*

re:
	@$(MAKE) fclean
	@$(MAKE) all

.PHONY: all clean fclean re
.SILENT:
