
NAME = helloworld

SRCS = helloworld.asm

OBJS = $(SRCS:.asm=.o)

ifdef MAIN
	ENTRYPOINT = _main
else
	ENTRYPOINT = _start
endif

LDFLAGS = -macosx_version_min 11.0 -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib -lSystem 

all : $(NAME)
	echo " \033[1;34m @@ Build Complete @@ \033[0m "

$(NAME) : $(OBJS)
	ld $^ -o $@ $(LDFLAGS) -e $(ENTRYPOINT)

%.o : %.asm
	nasm -f macho64 $< -o $@

RM = rm -rf

clean :
	$(RM) $(OBJS)

fclean :
	make clean
	$(RM) $(NAME)

re :
	make fclean
	make all
