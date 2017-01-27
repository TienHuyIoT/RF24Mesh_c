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
ifeq "$(wildcard nbproject/Makefile-local-xc8.mk)" "nbproject/Makefile-local-xc8.mk"
include nbproject/Makefile-local-xc8.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=xc8
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/RF24Mesh_Example.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/RF24Mesh_Example.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=--mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=RF24Mesh_Example.c pic_main.c serial.c ../../../RF24_c/utility/XC8/spi.c umalloc.c ../../../RF24Network_c/RF24Network_c.c ../../RF24Mesh_c.c ../../../RF24_c/RF24.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/RF24Mesh_Example.p1 ${OBJECTDIR}/pic_main.p1 ${OBJECTDIR}/serial.p1 ${OBJECTDIR}/_ext/2031907356/spi.p1 ${OBJECTDIR}/umalloc.p1 ${OBJECTDIR}/_ext/1478480717/RF24Network_c.p1 ${OBJECTDIR}/_ext/43898991/RF24Mesh_c.p1 ${OBJECTDIR}/_ext/381377385/RF24.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/RF24Mesh_Example.p1.d ${OBJECTDIR}/pic_main.p1.d ${OBJECTDIR}/serial.p1.d ${OBJECTDIR}/_ext/2031907356/spi.p1.d ${OBJECTDIR}/umalloc.p1.d ${OBJECTDIR}/_ext/1478480717/RF24Network_c.p1.d ${OBJECTDIR}/_ext/43898991/RF24Mesh_c.p1.d ${OBJECTDIR}/_ext/381377385/RF24.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/RF24Mesh_Example.p1 ${OBJECTDIR}/pic_main.p1 ${OBJECTDIR}/serial.p1 ${OBJECTDIR}/_ext/2031907356/spi.p1 ${OBJECTDIR}/umalloc.p1 ${OBJECTDIR}/_ext/1478480717/RF24Network_c.p1 ${OBJECTDIR}/_ext/43898991/RF24Mesh_c.p1 ${OBJECTDIR}/_ext/381377385/RF24.p1

# Source Files
SOURCEFILES=RF24Mesh_Example.c pic_main.c serial.c ../../../RF24_c/utility/XC8/spi.c umalloc.c ../../../RF24Network_c/RF24Network_c.c ../../RF24Mesh_c.c ../../../RF24_c/RF24.c


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
	${MAKE}  -f nbproject/Makefile-xc8.mk dist/${CND_CONF}/${IMAGE_TYPE}/RF24Mesh_Example.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F4620
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/RF24Mesh_Example.p1: RF24Mesh_Example.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RF24Mesh_Example.p1.d 
	@${RM} ${OBJECTDIR}/RF24Mesh_Example.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --warn=-3 --asmlist -DXPRJ_xc8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=hybrid:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/RF24Mesh_Example.p1  RF24Mesh_Example.c 
	@-${MV} ${OBJECTDIR}/RF24Mesh_Example.d ${OBJECTDIR}/RF24Mesh_Example.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/RF24Mesh_Example.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/pic_main.p1: pic_main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pic_main.p1.d 
	@${RM} ${OBJECTDIR}/pic_main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --warn=-3 --asmlist -DXPRJ_xc8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=hybrid:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/pic_main.p1  pic_main.c 
	@-${MV} ${OBJECTDIR}/pic_main.d ${OBJECTDIR}/pic_main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/pic_main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/serial.p1: serial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/serial.p1.d 
	@${RM} ${OBJECTDIR}/serial.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --warn=-3 --asmlist -DXPRJ_xc8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=hybrid:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/serial.p1  serial.c 
	@-${MV} ${OBJECTDIR}/serial.d ${OBJECTDIR}/serial.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/serial.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2031907356/spi.p1: ../../../RF24_c/utility/XC8/spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2031907356" 
	@${RM} ${OBJECTDIR}/_ext/2031907356/spi.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2031907356/spi.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --warn=-3 --asmlist -DXPRJ_xc8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=hybrid:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/2031907356/spi.p1  ../../../RF24_c/utility/XC8/spi.c 
	@-${MV} ${OBJECTDIR}/_ext/2031907356/spi.d ${OBJECTDIR}/_ext/2031907356/spi.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2031907356/spi.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/umalloc.p1: umalloc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/umalloc.p1.d 
	@${RM} ${OBJECTDIR}/umalloc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --warn=-3 --asmlist -DXPRJ_xc8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=hybrid:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/umalloc.p1  umalloc.c 
	@-${MV} ${OBJECTDIR}/umalloc.d ${OBJECTDIR}/umalloc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/umalloc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1478480717/RF24Network_c.p1: ../../../RF24Network_c/RF24Network_c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1478480717" 
	@${RM} ${OBJECTDIR}/_ext/1478480717/RF24Network_c.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1478480717/RF24Network_c.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --warn=-3 --asmlist -DXPRJ_xc8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=hybrid:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1478480717/RF24Network_c.p1  ../../../RF24Network_c/RF24Network_c.c 
	@-${MV} ${OBJECTDIR}/_ext/1478480717/RF24Network_c.d ${OBJECTDIR}/_ext/1478480717/RF24Network_c.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1478480717/RF24Network_c.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/43898991/RF24Mesh_c.p1: ../../RF24Mesh_c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/RF24Mesh_c.p1.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/RF24Mesh_c.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --warn=-3 --asmlist -DXPRJ_xc8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=hybrid:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/43898991/RF24Mesh_c.p1  ../../RF24Mesh_c.c 
	@-${MV} ${OBJECTDIR}/_ext/43898991/RF24Mesh_c.d ${OBJECTDIR}/_ext/43898991/RF24Mesh_c.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/43898991/RF24Mesh_c.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/381377385/RF24.p1: ../../../RF24_c/RF24.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/381377385" 
	@${RM} ${OBJECTDIR}/_ext/381377385/RF24.p1.d 
	@${RM} ${OBJECTDIR}/_ext/381377385/RF24.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --warn=-3 --asmlist -DXPRJ_xc8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=hybrid:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/381377385/RF24.p1  ../../../RF24_c/RF24.c 
	@-${MV} ${OBJECTDIR}/_ext/381377385/RF24.d ${OBJECTDIR}/_ext/381377385/RF24.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/381377385/RF24.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/RF24Mesh_Example.p1: RF24Mesh_Example.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/RF24Mesh_Example.p1.d 
	@${RM} ${OBJECTDIR}/RF24Mesh_Example.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --warn=-3 --asmlist -DXPRJ_xc8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=hybrid:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/RF24Mesh_Example.p1  RF24Mesh_Example.c 
	@-${MV} ${OBJECTDIR}/RF24Mesh_Example.d ${OBJECTDIR}/RF24Mesh_Example.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/RF24Mesh_Example.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/pic_main.p1: pic_main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/pic_main.p1.d 
	@${RM} ${OBJECTDIR}/pic_main.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --warn=-3 --asmlist -DXPRJ_xc8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=hybrid:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/pic_main.p1  pic_main.c 
	@-${MV} ${OBJECTDIR}/pic_main.d ${OBJECTDIR}/pic_main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/pic_main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/serial.p1: serial.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/serial.p1.d 
	@${RM} ${OBJECTDIR}/serial.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --warn=-3 --asmlist -DXPRJ_xc8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=hybrid:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/serial.p1  serial.c 
	@-${MV} ${OBJECTDIR}/serial.d ${OBJECTDIR}/serial.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/serial.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/2031907356/spi.p1: ../../../RF24_c/utility/XC8/spi.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/2031907356" 
	@${RM} ${OBJECTDIR}/_ext/2031907356/spi.p1.d 
	@${RM} ${OBJECTDIR}/_ext/2031907356/spi.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --warn=-3 --asmlist -DXPRJ_xc8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=hybrid:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/2031907356/spi.p1  ../../../RF24_c/utility/XC8/spi.c 
	@-${MV} ${OBJECTDIR}/_ext/2031907356/spi.d ${OBJECTDIR}/_ext/2031907356/spi.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/2031907356/spi.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/umalloc.p1: umalloc.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/umalloc.p1.d 
	@${RM} ${OBJECTDIR}/umalloc.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --warn=-3 --asmlist -DXPRJ_xc8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=hybrid:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/umalloc.p1  umalloc.c 
	@-${MV} ${OBJECTDIR}/umalloc.d ${OBJECTDIR}/umalloc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/umalloc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1478480717/RF24Network_c.p1: ../../../RF24Network_c/RF24Network_c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1478480717" 
	@${RM} ${OBJECTDIR}/_ext/1478480717/RF24Network_c.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1478480717/RF24Network_c.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --warn=-3 --asmlist -DXPRJ_xc8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=hybrid:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/1478480717/RF24Network_c.p1  ../../../RF24Network_c/RF24Network_c.c 
	@-${MV} ${OBJECTDIR}/_ext/1478480717/RF24Network_c.d ${OBJECTDIR}/_ext/1478480717/RF24Network_c.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1478480717/RF24Network_c.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/43898991/RF24Mesh_c.p1: ../../RF24Mesh_c.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/43898991" 
	@${RM} ${OBJECTDIR}/_ext/43898991/RF24Mesh_c.p1.d 
	@${RM} ${OBJECTDIR}/_ext/43898991/RF24Mesh_c.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --warn=-3 --asmlist -DXPRJ_xc8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=hybrid:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/43898991/RF24Mesh_c.p1  ../../RF24Mesh_c.c 
	@-${MV} ${OBJECTDIR}/_ext/43898991/RF24Mesh_c.d ${OBJECTDIR}/_ext/43898991/RF24Mesh_c.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/43898991/RF24Mesh_c.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/381377385/RF24.p1: ../../../RF24_c/RF24.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/381377385" 
	@${RM} ${OBJECTDIR}/_ext/381377385/RF24.p1.d 
	@${RM} ${OBJECTDIR}/_ext/381377385/RF24.p1 
	${MP_CC} --pass1 $(MP_EXTRA_CC_PRE) --chip=$(MP_PROCESSOR_OPTION) -Q -G  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --warn=-3 --asmlist -DXPRJ_xc8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib $(COMPARISON_BUILD)  --output=-mcof,+elf:multilocs --stack=hybrid:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"    -o${OBJECTDIR}/_ext/381377385/RF24.p1  ../../../RF24_c/RF24.c 
	@-${MV} ${OBJECTDIR}/_ext/381377385/RF24.d ${OBJECTDIR}/_ext/381377385/RF24.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/381377385/RF24.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/RF24Mesh_Example.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    18f4620_g.lkr
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/RF24Mesh_Example.X.${IMAGE_TYPE}.map  -D__DEBUG=1 --debugger=none  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --warn=-3 --asmlist -DXPRJ_xc8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=hybrid:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"        $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/RF24Mesh_Example.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} dist/${CND_CONF}/${IMAGE_TYPE}/RF24Mesh_Example.X.${IMAGE_TYPE}.hex 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/RF24Mesh_Example.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   18f4620_g.lkr
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE) --chip=$(MP_PROCESSOR_OPTION) -G -mdist/${CND_CONF}/${IMAGE_TYPE}/RF24Mesh_Example.X.${IMAGE_TYPE}.map  --double=24 --float=24 --emi=wordwrite --opt=default,+asm,+asmfile,-speed,+space,-debug --addrqual=ignore --mode=free -P -N255 -I"../../" -I"../../../RF24Network_c" -I"../../../RF24_c" -I"../../../RF24_c/utility/XC8" --warn=-3 --asmlist -DXPRJ_xc8=$(CND_CONF)  --summary=default,-psect,-class,+mem,-hex,-file --output=default,-inhx032 --runtime=default,+clear,+init,-keep,-no_startup,-download,+config,+clib,-plib --output=-mcof,+elf:multilocs --stack=hybrid:auto:auto:auto "--errformat=%f:%l: error: (%n) %s" "--warnformat=%f:%l: warning: (%n) %s" "--msgformat=%f:%l: advisory: (%n) %s"     $(COMPARISON_BUILD) --memorysummary dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml -odist/${CND_CONF}/${IMAGE_TYPE}/RF24Mesh_Example.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/xc8
	${RM} -r dist/xc8

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
