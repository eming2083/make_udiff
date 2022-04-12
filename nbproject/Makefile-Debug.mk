#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Environment
MKDIR=mkdir
CP=cp
GREP=grep
NM=nm
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++
FC=gfortran
AS=as

# Macros
CND_PLATFORM=MinGW4.8.1-Windows
CND_DLIB_EXT=dll
CND_CONF=Debug
CND_DISTDIR=dist
CND_BUILDDIR=build

# Include project Makefile
include Makefile

# Object Directory
OBJECTDIR=${CND_BUILDDIR}/${CND_CONF}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/src/bsdiff/bsdiff.o \
	${OBJECTDIR}/src/bsdiff/bspatch.o \
	${OBJECTDIR}/src/crc32.o \
	${OBJECTDIR}/src/lzma/lzma_compress.o \
	${OBJECTDIR}/src/lzma/src/7zFile.o \
	${OBJECTDIR}/src/lzma/src/LzFind.o \
	${OBJECTDIR}/src/lzma/src/LzmaDec.o \
	${OBJECTDIR}/src/lzma/src/LzmaEnc.o \
	${OBJECTDIR}/src/main.o \
	${OBJECTDIR}/src/mkpatch.o


# C Compiler Flags
CFLAGS=

# CC Compiler Flags
CCFLAGS=
CXXFLAGS=

# Fortran Compiler Flags
FFLAGS=

# Assembler Flags
ASFLAGS=

# Link Libraries and Options
LDLIBSOPTIONS=

# Build Targets
.build-conf: ${BUILD_SUBPROJECTS}
	"${MAKE}"  -f nbproject/Makefile-${CND_CONF}.mk ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/bsdiff_make_udiff.exe

${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/bsdiff_make_udiff.exe: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}
	${LINK.cc} -o ${CND_DISTDIR}/${CND_CONF}/${CND_PLATFORM}/bsdiff_make_udiff ${OBJECTFILES} ${LDLIBSOPTIONS}

${OBJECTDIR}/src/bsdiff/bsdiff.o: src/bsdiff/bsdiff.c
	${MKDIR} -p ${OBJECTDIR}/src/bsdiff
	${RM} "$@.d"
	$(COMPILE.c) -g -I. -Isrc/bsdiff -Isrc/lzma -Isrc/lzma/inc -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/bsdiff/bsdiff.o src/bsdiff/bsdiff.c

${OBJECTDIR}/src/bsdiff/bspatch.o: src/bsdiff/bspatch.c
	${MKDIR} -p ${OBJECTDIR}/src/bsdiff
	${RM} "$@.d"
	$(COMPILE.c) -g -I. -Isrc/bsdiff -Isrc/lzma -Isrc/lzma/inc -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/bsdiff/bspatch.o src/bsdiff/bspatch.c

${OBJECTDIR}/src/crc32.o: src/crc32.cpp
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -I. -Isrc/bsdiff -Isrc/lzma -Isrc/lzma/inc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/crc32.o src/crc32.cpp

${OBJECTDIR}/src/lzma/lzma_compress.o: src/lzma/lzma_compress.c
	${MKDIR} -p ${OBJECTDIR}/src/lzma
	${RM} "$@.d"
	$(COMPILE.c) -g -I. -Isrc/bsdiff -Isrc/lzma -Isrc/lzma/inc -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/lzma/lzma_compress.o src/lzma/lzma_compress.c

${OBJECTDIR}/src/lzma/src/7zFile.o: src/lzma/src/7zFile.c
	${MKDIR} -p ${OBJECTDIR}/src/lzma/src
	${RM} "$@.d"
	$(COMPILE.c) -g -I. -Isrc/bsdiff -Isrc/lzma -Isrc/lzma/inc -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/lzma/src/7zFile.o src/lzma/src/7zFile.c

${OBJECTDIR}/src/lzma/src/LzFind.o: src/lzma/src/LzFind.c
	${MKDIR} -p ${OBJECTDIR}/src/lzma/src
	${RM} "$@.d"
	$(COMPILE.c) -g -I. -Isrc/bsdiff -Isrc/lzma -Isrc/lzma/inc -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/lzma/src/LzFind.o src/lzma/src/LzFind.c

${OBJECTDIR}/src/lzma/src/LzmaDec.o: src/lzma/src/LzmaDec.c
	${MKDIR} -p ${OBJECTDIR}/src/lzma/src
	${RM} "$@.d"
	$(COMPILE.c) -g -I. -Isrc/bsdiff -Isrc/lzma -Isrc/lzma/inc -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/lzma/src/LzmaDec.o src/lzma/src/LzmaDec.c

${OBJECTDIR}/src/lzma/src/LzmaEnc.o: src/lzma/src/LzmaEnc.c
	${MKDIR} -p ${OBJECTDIR}/src/lzma/src
	${RM} "$@.d"
	$(COMPILE.c) -g -I. -Isrc/bsdiff -Isrc/lzma -Isrc/lzma/inc -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/lzma/src/LzmaEnc.o src/lzma/src/LzmaEnc.c

${OBJECTDIR}/src/main.o: src/main.cpp
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.cc) -g -I. -Isrc/bsdiff -Isrc/lzma -Isrc/lzma/inc -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/main.o src/main.cpp

${OBJECTDIR}/src/mkpatch.o: src/mkpatch.c
	${MKDIR} -p ${OBJECTDIR}/src
	${RM} "$@.d"
	$(COMPILE.c) -g -I. -Isrc/bsdiff -Isrc/lzma -Isrc/lzma/inc -std=c99 -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/src/mkpatch.o src/mkpatch.c

# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${CND_BUILDDIR}/${CND_CONF}

# Subprojects
.clean-subprojects:

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
