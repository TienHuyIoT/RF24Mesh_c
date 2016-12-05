#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-sdcc.mk)" "nbproject/Makefile-local-sdcc.mk"
include nbproject/Makefile-local-sdcc.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=sdcc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/RF24Mesh_Example.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/RF24Mesh_Example.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=RF24Mesh_Example.c pic_main.c serial.c ../../../RF24_c/utility/XC8/spi.c umalloc.c ../../../RF24_c/RF24_cg.c ../../RF24Mesh_cg.c ../../../RF24Network_c/RF24Network_cg.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/RF24Mesh_Example.o ${OBJECTDIR}/pic_main.o ${OBJECTDIR}/serial.o ${OBJECTDIR}/_ext/2031907356/spi.o ${OBJECTDIR}/umalloc.o ${OBJECTDIR}/_ext/381377385/RF24_cg.o ${OBJECTDIR}/_ext/43898991/RF24Mesh_cg.o ${OBJECTDIR}/_ext/1478480717/RF24Network_cg.o
POSSIBLE_DEPFILES=${OBJECTDIR}/RF24Mesh_Example.o.d ${OBJECTDIR}/pic_main.o.d ${OBJECTDIR}/serial.o.d ${OBJECTDIR}/_ext/2031907356/spi.o.d ${OBJECTDIR}/umalloc.o.d ${OBJECTDIR}/_ext/381377385/RF24_cg.o.d ${OBJECTDIR}/_ext/43898991/RF24Mesh_cg.o.d ${OBJECTDIR}/_ext/1478480717/RF24Network_cg.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/RF24Mesh_Example.o ${OBJECTDIR}/pic_main.o ${OBJECTDIR}/serial.o ${OBJECTDIR}/_ext/2031907356/spi.o ${OBJECTDIR}/umalloc.o ${OBJECTDIR}/_ext/381377385/RF24_cg.o ${OBJECTDIR}/_ext/43898991/RF24Mesh_cg.o ${OBJECTDIR}/_ext/1478480717/RF24Network_cg.o

# Source Files
SOURCEFILES=RF24Mesh_Example.c pic_main.c serial.c ../../../RF24_c/utility/XC8/spi.c umalloc.c ../../../RF24_c/RF24_cg.c ../../RF24Mesh_cg.c ../../../RF24Network_c/RF24Network_cg.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-sdcc.mk dist/${CND_CONF}/${IMAGE_TYPE}/RF24Mesh_Example.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/RF24Mesh_Example.o: RF24Mesh_Example.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/RF24Mesh_Example.o 
	${MP_CC} --use-non-free -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --opt-code-size --pstack-model=large  -Wl,-s,18f4620_g.lkr   -c -mpic16 -p18f4620 RF24Mesh_Example.c  -o${OBJECTDIR}/RF24Mesh_Example.o
	
${OBJECTDIR}/pic_main.o: pic_main.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/pic_main.o 
	${MP_CC} --use-non-free -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --opt-code-size --pstack-model=large  -Wl,-s,18f4620_g.lkr   -c -mpic16 -p18f4620 pic_main.c  -o${OBJECTDIR}/pic_main.o
	
${OBJECTDIR}/serial.o: serial.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/serial.o 
	${MP_CC} --use-non-free -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --opt-code-size --pstack-model=large  -Wl,-s,18f4620_g.lkr   -c -mpic16 -p18f4620 serial.c  -o${OBJECTDIR}/serial.o
	
${OBJECTDIR}/_ext/2031907356/spi.o: ../../../RF24_c/utility/XC8/spi.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/2031907356 
	${RM} ${OBJECTDIR}/_ext/2031907356/spi.o 
	${MP_CC} --use-non-free -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --opt-code-size --pstack-model=large  -Wl,-s,18f4620_g.lkr   -c -mpic16 -p18f4620 ../../../RF24_c/utility/XC8/spi.c  -o${OBJECTDIR}/_ext/2031907356/spi.o
	
${OBJECTDIR}/umalloc.o: umalloc.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/umalloc.o 
	${MP_CC} --use-non-free -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --opt-code-size --pstack-model=large  -Wl,-s,18f4620_g.lkr   -c -mpic16 -p18f4620 umalloc.c  -o${OBJECTDIR}/umalloc.o
	
${OBJECTDIR}/_ext/381377385/RF24_cg.o: ../../../RF24_c/RF24_cg.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/381377385 
	${RM} ${OBJECTDIR}/_ext/381377385/RF24_cg.o 
	${MP_CC} --use-non-free -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --opt-code-size --pstack-model=large  -Wl,-s,18f4620_g.lkr   -c -mpic16 -p18f4620 ../../../RF24_c/RF24_cg.c  -o${OBJECTDIR}/_ext/381377385/RF24_cg.o
	
${OBJECTDIR}/_ext/43898991/RF24Mesh_cg.o: ../../RF24Mesh_cg.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/43898991 
	${RM} ${OBJECTDIR}/_ext/43898991/RF24Mesh_cg.o 
	${MP_CC} --use-non-free -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --opt-code-size --pstack-model=large  -Wl,-s,18f4620_g.lkr   -c -mpic16 -p18f4620 ../../RF24Mesh_cg.c  -o${OBJECTDIR}/_ext/43898991/RF24Mesh_cg.o
	
${OBJECTDIR}/_ext/1478480717/RF24Network_cg.o: ../../../RF24Network_c/RF24Network_cg.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1478480717 
	${RM} ${OBJECTDIR}/_ext/1478480717/RF24Network_cg.o 
	${MP_CC} --use-non-free -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --opt-code-size --pstack-model=large  -Wl,-s,18f4620_g.lkr   -c -mpic16 -p18f4620 ../../../RF24Network_c/RF24Network_cg.c  -o${OBJECTDIR}/_ext/1478480717/RF24Network_cg.o
	
else
${OBJECTDIR}/RF24Mesh_Example.o: RF24Mesh_Example.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/RF24Mesh_Example.o 
	${MP_CC} --use-non-free -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --opt-code-size --pstack-model=large  -Wl,-s,18f4620_g.lkr   -c -mpic16 -p18f4620 RF24Mesh_Example.c  -o${OBJECTDIR}/RF24Mesh_Example.o
	
${OBJECTDIR}/pic_main.o: pic_main.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/pic_main.o 
	${MP_CC} --use-non-free -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --opt-code-size --pstack-model=large  -Wl,-s,18f4620_g.lkr   -c -mpic16 -p18f4620 pic_main.c  -o${OBJECTDIR}/pic_main.o
	
${OBJECTDIR}/serial.o: serial.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/serial.o 
	${MP_CC} --use-non-free -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --opt-code-size --pstack-model=large  -Wl,-s,18f4620_g.lkr   -c -mpic16 -p18f4620 serial.c  -o${OBJECTDIR}/serial.o
	
${OBJECTDIR}/_ext/2031907356/spi.o: ../../../RF24_c/utility/XC8/spi.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/2031907356 
	${RM} ${OBJECTDIR}/_ext/2031907356/spi.o 
	${MP_CC} --use-non-free -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --opt-code-size --pstack-model=large  -Wl,-s,18f4620_g.lkr   -c -mpic16 -p18f4620 ../../../RF24_c/utility/XC8/spi.c  -o${OBJECTDIR}/_ext/2031907356/spi.o
	
${OBJECTDIR}/umalloc.o: umalloc.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR} 
	${RM} ${OBJECTDIR}/umalloc.o 
	${MP_CC} --use-non-free -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --opt-code-size --pstack-model=large  -Wl,-s,18f4620_g.lkr   -c -mpic16 -p18f4620 umalloc.c  -o${OBJECTDIR}/umalloc.o
	
${OBJECTDIR}/_ext/381377385/RF24_cg.o: ../../../RF24_c/RF24_cg.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/381377385 
	${RM} ${OBJECTDIR}/_ext/381377385/RF24_cg.o 
	${MP_CC} --use-non-free -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --opt-code-size --pstack-model=large  -Wl,-s,18f4620_g.lkr   -c -mpic16 -p18f4620 ../../../RF24_c/RF24_cg.c  -o${OBJECTDIR}/_ext/381377385/RF24_cg.o
	
${OBJECTDIR}/_ext/43898991/RF24Mesh_cg.o: ../../RF24Mesh_cg.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/43898991 
	${RM} ${OBJECTDIR}/_ext/43898991/RF24Mesh_cg.o 
	${MP_CC} --use-non-free -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --opt-code-size --pstack-model=large  -Wl,-s,18f4620_g.lkr   -c -mpic16 -p18f4620 ../../RF24Mesh_cg.c  -o${OBJECTDIR}/_ext/43898991/RF24Mesh_cg.o
	
${OBJECTDIR}/_ext/1478480717/RF24Network_cg.o: ../../../RF24Network_c/RF24Network_cg.c  nbproject/Makefile-${CND_CONF}.mk
	${MKDIR} ${OBJECTDIR}/_ext/1478480717 
	${RM} ${OBJECTDIR}/_ext/1478480717/RF24Network_cg.o 
	${MP_CC} --use-non-free -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --opt-code-size --pstack-model=large  -Wl,-s,18f4620_g.lkr   -c -mpic16 -p18f4620 ../../../RF24Network_c/RF24Network_cg.c  -o${OBJECTDIR}/_ext/1478480717/RF24Network_cg.o
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/RF24Mesh_Example.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    18f4620_g.lkr
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} -Wl-c -Wl-m --use-non-free -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --opt-code-size --pstack-model=large  -Wl,-s,18f4620_g.lkr   -mpic16 -p18f4620 ${OBJECTFILES} -odist/${CND_CONF}/${IMAGE_TYPE}/RF24Mesh_Example.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} 
else
dist/${CND_CONF}/${IMAGE_TYPE}/RF24Mesh_Example.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   18f4620_g.lkr
	${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} -Wl-c -Wl-m --use-non-free -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --opt-code-size --pstack-model=large  -Wl,-s,18f4620_g.lkr   -mpic16 -p18f4620 ${OBJECTFILES} -odist/${CND_CONF}/${IMAGE_TYPE}/RF24Mesh_Example.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/sdcc
	${RM} -r dist/sdcc

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
