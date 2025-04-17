##
#	42 post common-core project dr_quine.
##

COLLEEN		:=	Colleen
GRACE		:=	Grace
SULLY		:=	Sully

NASM		:=	nasm
NASM_FLAGS	:=	-f elf64

LD			:=	ld
LD_FLAGS	:=	-o

RM          :=	rm -rf

MAKEFLAGS   +=	--no-print-directory

all: c g

c:
	$(NASM) $(NASM_FLAGS) $(COLLEEN)/$(COLLEEN).s
	$(LD) $(LD_FLAGS) $(COLLEEN)/$(COLLEEN) $(COLLEEN)/$(COLLEEN).o
	$(RM) $(COLLEEN)/$(COLLEEN).o

g:
	$(NASM) $(NASM_FLAGS) $(GRACE)/$(GRACE).s
	$(LD) $(LD_FLAGS) $(GRACE)/$(GRACE) $(GRACE)/$(GRACE).o
	$(RM) $(GRACE)/$(GRACE).o

s:
	$(NASM) $(NASM_FLAGS) $(SULLY)/$(SULLY).s
	$(LD) $(LD_FLAGS) $(SULLY)/$(SULLY) $(SULLY)/$(SULLY).o
	$(RM) $(SULLY)/$(SULLY).o

clean:
	$(RM) $(COLLEEN)/$(COLLEEN)
	$(RM) $(GRACE)/$(GRACE)
	$(RM) $(SULLY)/$(SULLY)

fclean: clean
	$(RM) $(GRACE)/$(GRACE)_kid.s
	$(RM) $(SULLY)/$(SULLY)_*

re:
	@$(MAKE) fclean
	@$(MAKE) all

.PHONY: all clean fclean re
.SILENT:
