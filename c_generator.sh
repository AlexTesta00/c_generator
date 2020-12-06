#Project
NAME="Default"
NAMEO="Default"
echo "Insert the project name : (without .c)"
while read nome in A;do
	if [[ -n ${nome} ]];then
	NAME=${nome}".c"
	NAMEO=${nome}".o"
	echo "The project name : ${NAME}"
	break
	
	else
	echo "Please, insert a valid name :"
	fi
done
echo "/* ${NAME} */" >> ${NAME}
echo "" >> ${NAME}
echo "/* Pre - Processor */" >> ${NAME}
echo "#ifndef _THREAD_SAFE" >> ${NAME}
echo "#define _THREAD_SAFE" >> ${NAME}
echo "#endif" >> ${NAME}
echo "#ifndef _REENTRANT" >> ${NAME}
echo "#define _REENTRANT" >> ${NAME}
echo "#endif" >> ${NAME}
echo "" >> ${NAME}
echo "#ifdef  _POSIX_C_SOURCE" >> ${NAME}
echo "#if     _POSIX_C_SOURCE < 200112L" >> ${NAME}
echo "#undef  _POSIX_C_SOURCE" >> ${NAME}
echo "#define _POSIX_C_SOURCE 200112L" >> ${NAME}
echo "#endif" >> ${NAME}
echo "#else" >> ${NAME}
echo "#define _POSIX_C_SOURCE 200112L" >> ${NAME}
echo "#endif" >> ${NAME}
echo "" >> ${NAME}
echo "/* Librares */" >> ${NAME}
echo '#include <stdio.h>' >> ${NAME}
echo '#include <stdlib.h>' >> ${NAME}
echo '#include <unistd.h>' >> ${NAME}
echo '#include <string.h>' >> ${NAME}
echo '#include <pthread.h>' >> ${NAME}
echo '#include <errno.h>' >> ${NAME}
echo '#include <stdint.h>' >> ${NAME}
echo '#include <inttypes.h>' >> ${NAME}
echo "" >> ${NAME}
echo "/* Macros */" >> ${NAME}
echo "" >> ${NAME}
echo "" >> ${NAME}
echo "/* Constants */" >> ${NAME}
echo "" >> ${NAME}
echo "" >> ${NAME}
echo "/* Function Declaration */" >> ${NAME}
echo "" >> ${NAME}
echo "" >> ${NAME}
echo "/* Main */" >> ${NAME}
echo "int main(void)" >> ${NAME}
echo "{" >> ${NAME}
echo '	printf("Hello, World\n");'>> ${NAME}
echo "" >> ${NAME}
echo "	return (0);" >> ${NAME}
echo "}" >> ${NAME}
echo "" >> ${NAME}
echo "/* Function Define*/" >> ${NAME}
echo "" >> ${NAME}

#Makefile
echo "CFLAG=-ansi -Wpedantic -Wall -Werror -D_REENTRANT  -D_THREAD_SAFE -D_POSIX_C_SOURCE=200112L" >> Makefile
echo "LIBRARES=-lpthread" >> Makefile
echo "" >> Makefile
echo "all:					main" >> Makefile
echo "" >> Makefile
echo "main:					${NAMEO}" >> Makefile
echo "						gcc ${CFLAG} -o main ${NAMEO} ${LIBRARES}" >> Makefile
echo "" >> Makefile
echo "${NAMEO}:				${NAME}" >> Makefile
echo "				        gcc -c ${CFLAG} ${NAME} ${LIBRARES}" >> Makefile
echo "" >> Makefile
echo ".PHONY:				clean" >> Makefile
echo "" >> Makefile
echo "clean:				" >> Makefile
echo "" >> Makefile
echo "						rm -f main ${NAMEO} *~ core" >> Makefile

#Lancio il make
if [[ -e Makefile ]];then
(make)
fi
