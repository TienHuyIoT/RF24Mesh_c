;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.6.0 #9615 (Linux)
;--------------------------------------------------------
; PIC16 port for the Microchip 16-bit core micros
;--------------------------------------------------------
	list	p=18f4620
	radix	dec


;--------------------------------------------------------
; public variables in this module
;--------------------------------------------------------
	global	_RF24M_init
	global	_RF24M_begin
	global	_RF24M_update
	global	_RF24M_write_n
	global	_RF24M_write
	global	_RF24M_setChannel
	global	_RF24M_setChild
	global	_RF24M_checkConnection
	global	_RF24M_getAddress
	global	_RF24M_getNodeID
	global	_RF24M_releaseAddress
	global	_RF24M_renewAddress
	global	_RF24M_requestAddress
	global	_RF24M_setNodeID
	global	_RF24M_setStaticAddress
	global	_RF24M_setAddress
	global	_RF24M_loadDHCP
	global	_RF24M_saveDHCP
	global	_RF24M_DHCP

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
	extern	__gptrget2
	extern	__gptrput2
	extern	__gptrget1
	extern	__moduchar
	extern	__gptrput1
	extern	_stdin
	extern	_stdout
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PORTCbits
	extern	_PORTDbits
	extern	_PORTEbits
	extern	_LATAbits
	extern	_LATBbits
	extern	_LATCbits
	extern	_LATDbits
	extern	_LATEbits
	extern	_DDRAbits
	extern	_TRISAbits
	extern	_DDRBbits
	extern	_TRISBbits
	extern	_DDRCbits
	extern	_TRISCbits
	extern	_DDRDbits
	extern	_TRISDbits
	extern	_DDREbits
	extern	_TRISEbits
	extern	_OSCTUNEbits
	extern	_PIE1bits
	extern	_PIR1bits
	extern	_IPR1bits
	extern	_PIE2bits
	extern	_PIR2bits
	extern	_IPR2bits
	extern	_EECON1bits
	extern	_RCSTAbits
	extern	_TXSTAbits
	extern	_T3CONbits
	extern	_CMCONbits
	extern	_CVRCONbits
	extern	_ECCP1ASbits
	extern	_PWM1CONbits
	extern	_BAUDCONbits
	extern	_BAUDCTLbits
	extern	_CCP2CONbits
	extern	_CCP1CONbits
	extern	_ADCON2bits
	extern	_ADCON1bits
	extern	_ADCON0bits
	extern	_SSPCON2bits
	extern	_SSPCON1bits
	extern	_SSPSTATbits
	extern	_T2CONbits
	extern	_T1CONbits
	extern	_RCONbits
	extern	_WDTCONbits
	extern	_HLVDCONbits
	extern	_LVDCONbits
	extern	_OSCCONbits
	extern	_T0CONbits
	extern	_STATUSbits
	extern	_INTCON3bits
	extern	_INTCON2bits
	extern	_INTCONbits
	extern	_STKPTRbits
	extern	_mtime
	extern	_PORTA
	extern	_PORTB
	extern	_PORTC
	extern	_PORTD
	extern	_PORTE
	extern	_LATA
	extern	_LATB
	extern	_LATC
	extern	_LATD
	extern	_LATE
	extern	_DDRA
	extern	_TRISA
	extern	_DDRB
	extern	_TRISB
	extern	_DDRC
	extern	_TRISC
	extern	_DDRD
	extern	_TRISD
	extern	_DDRE
	extern	_TRISE
	extern	_OSCTUNE
	extern	_PIE1
	extern	_PIR1
	extern	_IPR1
	extern	_PIE2
	extern	_PIR2
	extern	_IPR2
	extern	_EECON1
	extern	_EECON2
	extern	_EEDATA
	extern	_EEADR
	extern	_EEADRH
	extern	_RCSTA
	extern	_TXSTA
	extern	_TXREG
	extern	_RCREG
	extern	_SPBRG
	extern	_SPBRGH
	extern	_T3CON
	extern	_TMR3
	extern	_TMR3L
	extern	_TMR3H
	extern	_CMCON
	extern	_CVRCON
	extern	_ECCP1AS
	extern	_PWM1CON
	extern	_BAUDCON
	extern	_BAUDCTL
	extern	_CCP2CON
	extern	_CCPR2
	extern	_CCPR2L
	extern	_CCPR2H
	extern	_CCP1CON
	extern	_CCPR1
	extern	_CCPR1L
	extern	_CCPR1H
	extern	_ADCON2
	extern	_ADCON1
	extern	_ADCON0
	extern	_ADRES
	extern	_ADRESL
	extern	_ADRESH
	extern	_SSPCON2
	extern	_SSPCON1
	extern	_SSPSTAT
	extern	_SSPADD
	extern	_SSPBUF
	extern	_T2CON
	extern	_PR2
	extern	_TMR2
	extern	_T1CON
	extern	_TMR1
	extern	_TMR1L
	extern	_TMR1H
	extern	_RCON
	extern	_WDTCON
	extern	_HLVDCON
	extern	_LVDCON
	extern	_OSCCON
	extern	_T0CON
	extern	_TMR0
	extern	_TMR0L
	extern	_TMR0H
	extern	_STATUS
	extern	_FSR2L
	extern	_FSR2H
	extern	_PLUSW2
	extern	_PREINC2
	extern	_POSTDEC2
	extern	_POSTINC2
	extern	_INDF2
	extern	_BSR
	extern	_FSR1L
	extern	_FSR1H
	extern	_PLUSW1
	extern	_PREINC1
	extern	_POSTDEC1
	extern	_POSTINC1
	extern	_INDF1
	extern	_WREG
	extern	_FSR0L
	extern	_FSR0H
	extern	_PLUSW0
	extern	_PREINC0
	extern	_POSTDEC0
	extern	_POSTINC0
	extern	_INDF0
	extern	_INTCON3
	extern	_INTCON2
	extern	_INTCON
	extern	_PROD
	extern	_PRODL
	extern	_PRODH
	extern	_TABLAT
	extern	_TBLPTR
	extern	_TBLPTRL
	extern	_TBLPTRH
	extern	_TBLPTRU
	extern	_PC
	extern	_PCL
	extern	_PCLATH
	extern	_PCLATU
	extern	_STKPTR
	extern	_TOS
	extern	_TOSL
	extern	_TOSH
	extern	_TOSU
	extern	_malloc
	extern	_realloc
	extern	_memcpy
	extern	_millis
	extern	_delay
	extern	_RF24_begin
	extern	_RF24_startListening
	extern	_RF24_stopListening
	extern	_RF24_available
	extern	_RF24_rxFifoFull
	extern	_RF24_setChannel
	extern	_RF24_setDataRate
	extern	_RF24NH_init
	extern	_RF24N_begin
	extern	_RF24N_update
	extern	_RF24N_write_m
	extern	_RF24N_multicast
	extern	_RF24N_write_
	extern	_RF24N_getFrame_buffer
	extern	_RF24N_setReturnSysMsgs
	extern	_RF24N_getNetworkFlags
	extern	_RF24N_setNetworkFlags
	extern	_RF24N_getRouteTimeout
	extern	__mulint

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
WREG	equ	0xfe8
FSR0L	equ	0xfe9
FSR0H	equ	0xfea
FSR1L	equ	0xfe1
FSR1H	equ	0xfe2
FSR2L	equ	0xfd9
FSR2H	equ	0xfda
INDF0	equ	0xfef
POSTINC0	equ	0xfee
POSTINC1	equ	0xfe6
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PLUSW2	equ	0xfdb
PRODL	equ	0xff3
PRODH	equ	0xff4


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1
r0x06	res	1
r0x07	res	1
r0x08	res	1
r0x09	res	1
r0x0a	res	1
r0x0b	res	1
r0x0c	res	1
r0x0d	res	1
r0x0e	res	1
r0x0f	res	1
r0x10	res	1
r0x11	res	1
r0x12	res	1
r0x13	res	1
r0x14	res	1

udata_RF24Mesh_cg_0	udata
_mesh	res	21

udata_RF24Mesh_cg_1	udata
_RF24M_update_returnAddr_4_206	res	2

udata_RF24Mesh_cg_2	udata
_RF24M_update_returnAddr_4_207	res	2

udata_RF24Mesh_cg_3	udata
_RF24M_write_n_header_1_214	res	8

udata_RF24Mesh_cg_4	udata
_RF24M_checkConnection_header_2_228	res	8

udata_RF24Mesh_cg_5	udata
_RF24M_getAddress_address_1_233	res	2

udata_RF24Mesh_cg_6	udata
_RF24M_getAddress_nodeID_1_232	res	1

udata_RF24Mesh_cg_7	udata
_RF24M_getAddress_header_1_233	res	8

udata_RF24Mesh_cg_8	udata
_RF24M_getNodeID_address_1_243	res	2

udata_RF24Mesh_cg_9	udata
_RF24M_getNodeID_header_2_250	res	8

udata_RF24Mesh_cg_10	udata
_RF24M_getNodeID_ID_3_252	res	2

udata_RF24Mesh_cg_11	udata
_RF24M_releaseAddress_header_1_256	res	8

udata_RF24Mesh_cg_12	udata
_RF24M_requestAddress_newAddress_1_265	res	2

udata_RF24Mesh_cg_13	udata
_RF24M_requestAddress_header_1_265	res	8

udata_RF24Mesh_cg_14	udata
_RF24M_requestAddress_contactNode_1_265	res	8

udata_RF24Mesh_cg_15	udata
_RF24M_DHCP_newAddress_1_292	res	2

udata_RF24Mesh_cg_16	udata
_RF24M_DHCP_header_1_292	res	8

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_RF24Mesh_cg__RF24M_DHCP	code
_RF24M_DHCP:
;	.line	578; ../../RF24Mesh_cg.c	void RF24M_DHCP(void){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
;	.line	581; ../../RF24Mesh_cg.c	uint16_t fwd_by = 0;
	CLRF	r0x00
	CLRF	r0x01
;	.line	582; ../../RF24Mesh_cg.c	uint8_t shiftVal = 0;
	CLRF	r0x02
;	.line	583; ../../RF24Mesh_cg.c	uint8_t extraChild = 0;
	CLRF	r0x03
	BANKSEL	(_mesh + 7)
;	.line	587; ../../RF24Mesh_cg.c	if(mesh.doDHCP){
	MOVF	(_mesh + 7), W, B
	BZ	_00635_DS_
	BANKSEL	(_mesh + 7)
;	.line	588; ../../RF24Mesh_cg.c	mesh.doDHCP = 0;
	CLRF	(_mesh + 7), B
	BRA	_00636_DS_
_00635_DS_:
;	.line	589; ../../RF24Mesh_cg.c	}else{ return; }
	BRA	_00672_DS_
_00636_DS_:
;	.line	591; ../../RF24Mesh_cg.c	memcpy(&header,RF24N_getFrame_buffer,sizeof(RF24NetworkHeader));	
	MOVLW	HIGH(_RF24M_DHCP_header_1_292)
	MOVWF	r0x05
	MOVLW	LOW(_RF24M_DHCP_header_1_292)
	MOVWF	r0x04
	MOVLW	0x80
	MOVWF	r0x06
	MOVLW	UPPER(_RF24N_getFrame_buffer)
	MOVWF	r0x09
	MOVLW	HIGH(_RF24N_getFrame_buffer)
	MOVWF	r0x08
	MOVLW	LOW(_RF24N_getFrame_buffer)
	MOVWF	r0x07
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x08
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	594; ../../RF24Mesh_cg.c	from_id = header.reserved;
	MOVFF	(_RF24M_DHCP_header_1_292 + 7), r0x04
;	.line	595; ../../RF24Mesh_cg.c	if(!from_id){
	MOVF	r0x04, W
	BNZ	_00638_DS_
;	.line	599; ../../RF24Mesh_cg.c	return;
	BRA	_00672_DS_
_00638_DS_:
;	.line	604; ../../RF24Mesh_cg.c	if( header.from_node != MESH_DEFAULT_ADDRESS){
	MOVFF	_RF24M_DHCP_header_1_292, r0x05
	MOVFF	(_RF24M_DHCP_header_1_292 + 1), r0x06
	MOVF	r0x05, W
	XORLW	0x24
	BNZ	_00729_DS_
	MOVF	r0x06, W
	XORLW	0x09
	BZ	_00643_DS_
_00729_DS_:
;	.line	605; ../../RF24Mesh_cg.c	uint16_t m = header.from_node;
	MOVFF	r0x05, r0x07
	MOVFF	r0x06, r0x08
;	.line	607; ../../RF24Mesh_cg.c	fwd_by = header.from_node;
	MOVFF	r0x05, r0x00
	MOVFF	r0x06, r0x01
;	.line	609; ../../RF24Mesh_cg.c	while(m){  //Octal addresses convert nicely to binary in threes. Address 03 = B011  Address 033 = B011011
	CLRF	r0x05
_00639_DS_:
	MOVF	r0x07, W
	IORWF	r0x08, W
	BZ	_00641_DS_
;	.line	610; ../../RF24Mesh_cg.c	m >>= 3; //Find out how many digits are in the octal address
	BCF	STATUS, 0
	RRCF	r0x08, F
	RRCF	r0x07, F
	BCF	STATUS, 0
	RRCF	r0x08, F
	RRCF	r0x07, F
	BCF	STATUS, 0
	RRCF	r0x08, F
	RRCF	r0x07, F
;	.line	611; ../../RF24Mesh_cg.c	count++; 
	INCF	r0x05, F
	BRA	_00639_DS_
; ;multiply lit val:0x03 by variable r0x05 and store in r0x02
_00641_DS_:
;	.line	613; ../../RF24Mesh_cg.c	shiftVal = count*3; //Now we know how many bits to shift when adding a child node 1-5 (B001 to B101) to any address         
	MOVF	r0x05, W
	MULLW	0x03
	MOVFF	PRODL, r0x02
	BRA	_00644_DS_
_00643_DS_:
;	.line	616; ../../RF24Mesh_cg.c	extraChild = 1;
	MOVLW	0x01
	MOVWF	r0x03
_00644_DS_:
;	.line	623; ../../RF24Mesh_cg.c	for(i=MESH_MAX_CHILDREN+extraChild; i> 0; i--){ // For each of the possible addresses (5 max)
	MOVLW	0x04
	ADDWF	r0x03, F
_00671_DS_:
	MOVF	r0x03, W
	BTFSC	STATUS, 2
	BRA	_00672_DS_
;	.line	625; ../../RF24Mesh_cg.c	uint8_t found = 0;
	CLRF	r0x05
;	.line	626; ../../RF24Mesh_cg.c	newAddress = fwd_by | (i << shiftVal);
	MOVFF	r0x03, r0x06
	CLRF	r0x07
	MOVFF	r0x06, r0x08
	MOVFF	r0x07, r0x09
	MOVF	r0x02, W
	BZ	_00730_DS_
	NEGF	WREG
	BCF	STATUS, 0
_00731_DS_:
	RLCF	r0x08, F
	RLCF	r0x09, F
	ADDLW	0x01
	BNC	_00731_DS_
_00730_DS_:
	MOVF	r0x08, W
	MOVWF	r0x06
	MOVF	r0x09, W
	MOVWF	r0x07
	MOVF	r0x00, W
	IORWF	r0x06, F
	MOVF	r0x01, W
	IORWF	r0x07, F
	MOVFF	r0x06, _RF24M_DHCP_newAddress_1_292
	MOVFF	r0x07, (_RF24M_DHCP_newAddress_1_292 + 1)
;	.line	627; ../../RF24Mesh_cg.c	if(!newAddress ){ /*printf("dumped 0%o\n",newAddress);*/ continue; }
	MOVF	r0x06, W
	IORWF	r0x07, W
	BTFSC	STATUS, 2
	BRA	_00665_DS_
;	.line	629; ../../RF24Mesh_cg.c	for(i=0; i < mesh.addrListTop; i++){
	CLRF	r0x03
	CLRF	r0x06
	CLRF	r0x07
	CLRF	r0x08
_00668_DS_:
	BANKSEL	(_mesh + 6)
	MOVF	(_mesh + 6), W, B
	SUBWF	r0x06, W
	BTFSC	STATUS, 0
	BRA	_00651_DS_
;	.line	645; ../../RF24Mesh_cg.c	if(  (mesh.addrList[i].address == newAddress && mesh.addrList[i].nodeID != from_id ) || newAddress == MESH_DEFAULT_ADDRESS){
	MOVF	r0x07, W
	BANKSEL	(_mesh + 3)
	ADDWF	(_mesh + 3), W, B
	MOVWF	r0x09
	MOVF	r0x08, W
	BANKSEL	(_mesh + 4)
	ADDWFC	(_mesh + 4), W, B
	MOVWF	r0x0a
	CLRF	WREG
	BANKSEL	(_mesh + 5)
	ADDWFC	(_mesh + 5), W, B
	MOVWF	r0x0b
	MOVF	r0x09, W
	ADDLW	0x01
	MOVWF	r0x0c
	MOVLW	0x00
	ADDWFC	r0x0a, W
	MOVWF	r0x0d
	MOVLW	0x00
	ADDWFC	r0x0b, W
	MOVWF	r0x0e
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrget2
	MOVWF	r0x0c
	MOVFF	PRODL, r0x0d
	MOVF	r0x0c, W
	BANKSEL	_RF24M_DHCP_newAddress_1_292
	XORWF	_RF24M_DHCP_newAddress_1_292, W, B
	BNZ	_00734_DS_
	MOVF	r0x0d, W
	BANKSEL	(_RF24M_DHCP_newAddress_1_292 + 1)
	XORWF	(_RF24M_DHCP_newAddress_1_292 + 1), W, B
	BZ	_00735_DS_
_00734_DS_:
	BRA	_00650_DS_
_00735_DS_:
	MOVFF	r0x09, FSR0L
	MOVFF	r0x0a, PRODL
	MOVF	r0x0b, W
	CALL	__gptrget1
	MOVWF	r0x09
	MOVF	r0x09, W
	XORWF	r0x04, W
	BNZ	_00647_DS_
_00650_DS_:
	BANKSEL	_RF24M_DHCP_newAddress_1_292
	MOVF	_RF24M_DHCP_newAddress_1_292, W, B
	XORLW	0x24
	BNZ	_00738_DS_
	BANKSEL	(_RF24M_DHCP_newAddress_1_292 + 1)
	MOVF	(_RF24M_DHCP_newAddress_1_292 + 1), W, B
	XORLW	0x09
	BZ	_00647_DS_
_00738_DS_:
	BRA	_00669_DS_
_00647_DS_:
;	.line	646; ../../RF24Mesh_cg.c	found = 1;
	MOVLW	0x01
	MOVWF	r0x05
;	.line	647; ../../RF24Mesh_cg.c	break;
	BRA	_00651_DS_
_00669_DS_:
;	.line	629; ../../RF24Mesh_cg.c	for(i=0; i < mesh.addrListTop; i++){
	MOVLW	0x03
	ADDWF	r0x07, F
	BTFSC	STATUS, 0
	INCF	r0x08, F
	INCF	r0x06, F
	MOVFF	r0x06, r0x03
	BRA	_00668_DS_
_00651_DS_:
;	.line	651; ../../RF24Mesh_cg.c	if(!found){
	MOVF	r0x05, W
	BTFSS	STATUS, 2
	BRA	_00665_DS_
;	.line	653; ../../RF24Mesh_cg.c	header.type = NETWORK_ADDR_RESPONSE;
	MOVLW	0x80
	BANKSEL	(_RF24M_DHCP_header_1_292 + 6)
	MOVWF	(_RF24M_DHCP_header_1_292 + 6), B
;	.line	654; ../../RF24Mesh_cg.c	header.to_node = header.from_node;
	MOVFF	_RF24M_DHCP_header_1_292, r0x05
	MOVFF	(_RF24M_DHCP_header_1_292 + 1), r0x06
	MOVF	r0x05, W
	BANKSEL	(_RF24M_DHCP_header_1_292 + 2)
	MOVWF	(_RF24M_DHCP_header_1_292 + 2), B
	MOVF	r0x06, W
	BANKSEL	(_RF24M_DHCP_header_1_292 + 3)
	MOVWF	(_RF24M_DHCP_header_1_292 + 3), B
	BANKSEL	_RF24M_DHCP_header_1_292
;	.line	656; ../../RF24Mesh_cg.c	if(header.from_node != MESH_DEFAULT_ADDRESS){ //Is NOT node 01 to 05
	MOVF	_RF24M_DHCP_header_1_292, W, B
	XORLW	0x24
	BNZ	_00741_DS_
	BANKSEL	(_RF24M_DHCP_header_1_292 + 1)
	MOVF	(_RF24M_DHCP_header_1_292 + 1), W, B
	XORLW	0x09
	BNZ	_00741_DS_
	BRA	_00656_DS_
_00741_DS_:
;	.line	657; ../../RF24Mesh_cg.c	delay(2);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_delay
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	658; ../../RF24Mesh_cg.c	if( RF24N_write_m(&header,&newAddress,sizeof(newAddress)) ){
	MOVLW	HIGH(_RF24M_DHCP_header_1_292)
	MOVWF	r0x06
	MOVLW	LOW(_RF24M_DHCP_header_1_292)
	MOVWF	r0x05
	MOVLW	0x80
	MOVWF	r0x07
	MOVLW	HIGH(_RF24M_DHCP_newAddress_1_292)
	MOVWF	r0x09
	MOVLW	LOW(_RF24M_DHCP_newAddress_1_292)
	MOVWF	r0x08
	MOVLW	0x80
	MOVWF	r0x0a
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write_m
	MOVWF	r0x05
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x05, W
	BTFSS	STATUS, 2
	BRA	_00657_DS_
;	.line	661; ../../RF24Mesh_cg.c	RF24N_write_m(&header,&newAddress,sizeof(newAddress));
	MOVLW	HIGH(_RF24M_DHCP_header_1_292)
	MOVWF	r0x06
	MOVLW	LOW(_RF24M_DHCP_header_1_292)
	MOVWF	r0x05
	MOVLW	0x80
	MOVWF	r0x07
	MOVLW	HIGH(_RF24M_DHCP_newAddress_1_292)
	MOVWF	r0x09
	MOVLW	LOW(_RF24M_DHCP_newAddress_1_292)
	MOVWF	r0x08
	MOVLW	0x80
	MOVWF	r0x0a
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write_m
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	BRA	_00657_DS_
_00656_DS_:
;	.line	664; ../../RF24Mesh_cg.c	delay(2);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	_delay
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	665; ../../RF24Mesh_cg.c	RF24N_write_(&header,&newAddress,sizeof(newAddress),header.to_node);
	MOVLW	HIGH(_RF24M_DHCP_header_1_292)
	MOVWF	r0x06
	MOVLW	LOW(_RF24M_DHCP_header_1_292)
	MOVWF	r0x05
	MOVLW	0x80
	MOVWF	r0x07
	MOVLW	HIGH(_RF24M_DHCP_newAddress_1_292)
	MOVWF	r0x09
	MOVLW	LOW(_RF24M_DHCP_newAddress_1_292)
	MOVWF	r0x08
	MOVLW	0x80
	MOVWF	r0x0a
	BANKSEL	(_RF24M_DHCP_header_1_292 + 3)
	MOVF	(_RF24M_DHCP_header_1_292 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_RF24M_DHCP_header_1_292 + 2)
	MOVF	(_RF24M_DHCP_header_1_292 + 2), W, B
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write_
	MOVLW	0x0a
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
_00657_DS_:
;	.line	668; ../../RF24Mesh_cg.c	timer=millis();
	CALL	_millis
	MOVWF	r0x05
	MOVFF	PRODL, r0x06
	MOVFF	PRODH, r0x07
	MOVFF	FSR0L, r0x08
	BANKSEL	_RF24M_DHCP_newAddress_1_292
;	.line	669; ../../RF24Mesh_cg.c	mesh.lastAddress = newAddress;
	MOVF	_RF24M_DHCP_newAddress_1_292, W, B
	BANKSEL	(_mesh + 19)
	MOVWF	(_mesh + 19), B
	BANKSEL	(_RF24M_DHCP_newAddress_1_292 + 1)
	MOVF	(_RF24M_DHCP_newAddress_1_292 + 1), W, B
	BANKSEL	(_mesh + 20)
	MOVWF	(_mesh + 20), B
;	.line	670; ../../RF24Mesh_cg.c	mesh.lastID = from_id;
	MOVFF	r0x04, r0x09
	CLRF	r0x0a
	MOVF	r0x09, W
	BANKSEL	(_mesh + 17)
	MOVWF	(_mesh + 17), B
	MOVF	r0x0a, W
	BANKSEL	(_mesh + 18)
	MOVWF	(_mesh + 18), B
_00660_DS_:
;	.line	671; ../../RF24Mesh_cg.c	while(RF24N_update() != MESH_ADDR_CONFIRM){
	CALL	_RF24N_update
	MOVWF	r0x09
	MOVF	r0x09, W
	XORLW	0x81
	BZ	_00662_DS_
;	.line	672; ../../RF24Mesh_cg.c	if(millis()-timer > RF24N_getRouteTimeout()){
	CALL	_millis
	MOVWF	r0x09
	MOVFF	PRODL, r0x0a
	MOVFF	PRODH, r0x0b
	MOVFF	FSR0L, r0x0c
	MOVF	r0x05, W
	SUBWF	r0x09, F
	MOVF	r0x06, W
	SUBWFB	r0x0a, F
	MOVF	r0x07, W
	SUBWFB	r0x0b, F
	MOVF	r0x08, W
	SUBWFB	r0x0c, F
	CALL	_RF24N_getRouteTimeout
	MOVWF	r0x0d
	MOVFF	PRODL, r0x0e
	CLRF	r0x0f
	CLRF	r0x10
	MOVF	r0x0c, W
	SUBWF	r0x10, W
	BNZ	_00744_DS_
	MOVF	r0x0b, W
	SUBWF	r0x0f, W
	BNZ	_00744_DS_
	MOVF	r0x0a, W
	SUBWF	r0x0e, W
	BNZ	_00744_DS_
	MOVF	r0x09, W
	SUBWF	r0x0d, W
_00744_DS_:
	BC	_00660_DS_
;	.line	673; ../../RF24Mesh_cg.c	return;
	BRA	_00672_DS_
_00662_DS_:
	BANKSEL	(_RF24M_DHCP_newAddress_1_292 + 1)
;	.line	677; ../../RF24Mesh_cg.c	RF24M_setAddress(from_id,newAddress);
	MOVF	(_RF24M_DHCP_newAddress_1_292 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_RF24M_DHCP_newAddress_1_292
	MOVF	_RF24M_DHCP_newAddress_1_292, W, B
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_RF24M_setAddress
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	681; ../../RF24Mesh_cg.c	break;
	BRA	_00672_DS_
_00665_DS_:
;	.line	623; ../../RF24Mesh_cg.c	for(i=MESH_MAX_CHILDREN+extraChild; i> 0; i--){ // For each of the possible addresses (5 max)
	DECF	r0x03, F
	BRA	_00671_DS_
_00672_DS_:
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_RF24Mesh_cg__RF24M_saveDHCP	code
_RF24M_saveDHCP:
;	.line	544; ../../RF24Mesh_cg.c	void RF24M_saveDHCP(void){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
;	.line	572; ../../RF24Mesh_cg.c	}
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_RF24Mesh_cg__RF24M_loadDHCP	code
_RF24M_loadDHCP:
;	.line	517; ../../RF24Mesh_cg.c	void RF24M_loadDHCP(void){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
;	.line	540; ../../RF24Mesh_cg.c	}
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_RF24Mesh_cg__RF24M_setAddress	code
_RF24M_setAddress:
;	.line	488; ../../RF24Mesh_cg.c	void RF24M_setAddress( uint8_t nodeID, uint16_t address){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
	MOVLW	0x05
	MOVFF	PLUSW2, r0x02
;	.line	490; ../../RF24Mesh_cg.c	uint8_t position = mesh.addrListTop;
	MOVFF	(_mesh + 6), r0x03
	MOVFF	r0x03, r0x04
;	.line	492; ../../RF24Mesh_cg.c	for(i=0; i<mesh.addrListTop; i++){
	CLRF	r0x05
	MOVFF	(_mesh + 3), r0x06
	MOVFF	(_mesh + 4), r0x07
	MOVFF	(_mesh + 5), r0x08
	CLRF	r0x09
	CLRF	r0x0a
	CLRF	r0x0b
_00598_DS_:
	MOVF	r0x03, W
	SUBWF	r0x09, W
	BC	_00594_DS_
;	.line	493; ../../RF24Mesh_cg.c	if( mesh.addrList[i].nodeID == nodeID){
	MOVF	r0x0a, W
	ADDWF	r0x06, W
	MOVWF	r0x0c
	MOVF	r0x0b, W
	ADDWFC	r0x07, W
	MOVWF	r0x0d
	CLRF	WREG
	ADDWFC	r0x08, W
	MOVWF	r0x0e
	MOVFF	r0x0c, FSR0L
	MOVFF	r0x0d, PRODL
	MOVF	r0x0e, W
	CALL	__gptrget1
	MOVWF	r0x0c
	MOVF	r0x0c, W
	XORWF	r0x00, W
	BNZ	_00599_DS_
;	.line	494; ../../RF24Mesh_cg.c	position = i;
	MOVFF	r0x05, r0x04
;	.line	495; ../../RF24Mesh_cg.c	break;
	BRA	_00594_DS_
_00599_DS_:
;	.line	492; ../../RF24Mesh_cg.c	for(i=0; i<mesh.addrListTop; i++){
	MOVLW	0x03
	ADDWF	r0x0a, F
	BTFSC	STATUS, 0
	INCF	r0x0b, F
	INCF	r0x09, F
	MOVFF	r0x09, r0x05
	BRA	_00598_DS_
; ;multiply lit val:0x03 by variable r0x04 and store in r0x03
_00594_DS_:
;	.line	498; ../../RF24Mesh_cg.c	mesh.addrList[position].nodeID = nodeID;
	MOVF	r0x04, W
	MULLW	0x03
	MOVF	PRODH, W
	MOVWF	r0x05
	MOVFF	PRODL, r0x03
	MOVF	r0x03, W
	ADDWF	r0x06, F
	MOVF	r0x05, W
	ADDWFC	r0x07, F
	CLRF	WREG
	ADDWFC	r0x08, F
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrput1
;	.line	499; ../../RF24Mesh_cg.c	mesh.addrList[position].address = address;
	CLRF	r0x00
	BANKSEL	(_mesh + 3)
	MOVF	(_mesh + 3), W, B
	ADDWF	r0x03, F
	BANKSEL	(_mesh + 4)
	MOVF	(_mesh + 4), W, B
	ADDWFC	r0x05, F
	BANKSEL	(_mesh + 5)
	MOVF	(_mesh + 5), W, B
	ADDWFC	r0x00, F
	INCF	r0x03, F
	BNC	_00617_DS_
	INFSNZ	r0x05, F
	INCF	r0x00, F
_00617_DS_:
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, PRODH
	MOVFF	r0x03, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x00, W
	CALL	__gptrput2
;	.line	501; ../../RF24Mesh_cg.c	if(position == mesh.addrListTop){
	MOVFF	(_mesh + 6), r0x00
	MOVF	r0x04, W
	XORWF	r0x00, W
	BZ	_00619_DS_
	BRA	_00600_DS_
_00619_DS_:
;	.line	502; ../../RF24Mesh_cg.c	++mesh.addrListTop;  
	INCF	r0x00, F
	MOVF	r0x00, W
	BANKSEL	(_mesh + 6)
	MOVWF	(_mesh + 6), B
	BANKSEL	(_mesh + 5)
;	.line	503; ../../RF24Mesh_cg.c	mesh.addrList = (addrListStruct*)realloc(mesh.addrList,(mesh.addrListTop + 1) * sizeof(addrListStruct));
	MOVF	(_mesh + 5), W, B
	MOVWF	r0x03
	BANKSEL	(_mesh + 4)
	MOVF	(_mesh + 4), W, B
	MOVWF	r0x02
	BANKSEL	(_mesh + 3)
	MOVF	(_mesh + 3), W, B
	MOVWF	r0x01
	CLRF	r0x04
	INFSNZ	r0x00, F
	INCF	r0x04, F
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x00
	MOVFF	PRODL, r0x04
	MOVLW	0x04
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_realloc
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVLW	0x05
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x02, W
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVF	r0x00, W
	BANKSEL	(_mesh + 3)
	MOVWF	(_mesh + 3), B
	MOVF	r0x01, W
	BANKSEL	(_mesh + 4)
	MOVWF	(_mesh + 4), B
	MOVF	r0x02, W
	BANKSEL	(_mesh + 5)
	MOVWF	(_mesh + 5), B
_00600_DS_:
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_RF24Mesh_cg__RF24M_setStaticAddress	code
_RF24M_setStaticAddress:
;	.line	482; ../../RF24Mesh_cg.c	void RF24M_setStaticAddress( uint8_t nodeID, uint16_t address){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
	MOVLW	0x05
	MOVFF	PLUSW2, r0x02
;	.line	483; ../../RF24Mesh_cg.c	RF24M_setAddress(nodeID,address);
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24M_setAddress
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_RF24Mesh_cg__RF24M_setNodeID	code
_RF24M_setNodeID:
;	.line	476; ../../RF24Mesh_cg.c	void RF24M_setNodeID( uint8_t nodeID){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
;	.line	477; ../../RF24Mesh_cg.c	mesh._nodeID = nodeID;
	MOVF	r0x00, W
	BANKSEL	_mesh
	MOVWF	_mesh, B
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_RF24Mesh_cg__RF24M_requestAddress	code
_RF24M_requestAddress:
;	.line	304; ../../RF24Mesh_cg.c	uint8_t RF24M_requestAddress(uint8_t level){    
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	BANKSEL	_RF24M_requestAddress_newAddress_1_265
;	.line	313; ../../RF24Mesh_cg.c	uint16_t newAddress=0; 
	CLRF	_RF24M_requestAddress_newAddress_1_265, B
	BANKSEL	(_RF24M_requestAddress_newAddress_1_265 + 1)
	CLRF	(_RF24M_requestAddress_newAddress_1_265 + 1), B
;	.line	315; ../../RF24Mesh_cg.c	uint8_t type=0;
	CLRF	r0x01
;	.line	318; ../../RF24Mesh_cg.c	RF24NH_init(&header, 0100, NETWORK_POLL );
	MOVLW	HIGH(_RF24M_requestAddress_header_1_265)
	MOVWF	r0x03
	MOVLW	LOW(_RF24M_requestAddress_header_1_265)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVLW	0xc2
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x40
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_RF24NH_init
	MOVLW	0x06
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	323; ../../RF24Mesh_cg.c	RF24N_multicast(&header,0,0,level);
	MOVLW	HIGH(_RF24M_requestAddress_header_1_265)
	MOVWF	r0x03
	MOVLW	LOW(_RF24M_requestAddress_header_1_265)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_RF24N_multicast
	MOVLW	0x09
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	325; ../../RF24Mesh_cg.c	timr = millis();
	CALL	_millis
	MOVWF	r0x00
	MOVFF	PRODL, r0x02
	MOVFF	PRODH, r0x03
	MOVFF	FSR0L, r0x04
;	.line	327; ../../RF24Mesh_cg.c	while(1){
	CLRF	r0x05
	CLRF	r0x06
	CLRF	r0x07
_00499_DS_:
;	.line	331; ../../RF24Mesh_cg.c	if(RF24N_update() == NETWORK_POLL){
	CALL	_RF24N_update
	MOVWF	r0x08
	MOVF	r0x08, W
	XORLW	0xc2
	BNZ	_00491_DS_
;	.line	332; ../../RF24Mesh_cg.c	memcpy(&contactNode[pollCount],& RF24N_getFrame_buffer()[0],sizeof(uint16_t));
	MOVLW	LOW(_RF24M_requestAddress_contactNode_1_265)
	ADDWF	r0x06, W
	MOVWF	r0x08
	MOVLW	HIGH(_RF24M_requestAddress_contactNode_1_265)
	ADDWFC	r0x07, W
	MOVWF	r0x09
	MOVF	r0x09, W
	MOVWF	r0x09
	MOVF	r0x08, W
	MOVWF	r0x08
	MOVLW	0x80
	MOVWF	r0x0a
	CALL	_RF24N_getFrame_buffer
	MOVWF	r0x0b
	MOVFF	PRODL, r0x0c
	MOVFF	PRODH, r0x0d
	MOVF	r0x0d, W
	MOVWF	r0x0d
	MOVF	r0x0c, W
	MOVWF	r0x0c
	MOVF	r0x0b, W
	MOVWF	r0x0b
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	333; ../../RF24Mesh_cg.c	++pollCount;
	MOVLW	0x02
	ADDWF	r0x06, F
	BTFSC	STATUS, 0
	INCF	r0x07, F
	INCF	r0x05, F
_00491_DS_:
;	.line	353; ../../RF24Mesh_cg.c	if(millis() - timr > 55 || pollCount >=  MESH_MAXPOLLS ){
	CALL	_millis
	MOVWF	r0x08
	MOVFF	PRODL, r0x09
	MOVFF	PRODH, r0x0a
	MOVFF	FSR0L, r0x0b
	MOVF	r0x00, W
	SUBWF	r0x08, F
	MOVF	r0x02, W
	SUBWFB	r0x09, F
	MOVF	r0x03, W
	SUBWFB	r0x0a, F
	MOVF	r0x04, W
	SUBWFB	r0x0b, F
	MOVLW	0x00
	SUBWF	r0x0b, W
	BNZ	_00567_DS_
	MOVLW	0x00
	SUBWF	r0x0a, W
	BNZ	_00567_DS_
	MOVLW	0x00
	SUBWF	r0x09, W
	BNZ	_00567_DS_
	MOVLW	0x38
	SUBWF	r0x08, W
_00567_DS_:
	BC	_00536_DS_
	MOVLW	0x04
	SUBWF	r0x05, W
	BTFSS	STATUS, 0
	BRA	_00499_DS_
_00536_DS_:
	MOVFF	r0x05, r0x06
;	.line	354; ../../RF24Mesh_cg.c	if(!pollCount){
	MOVF	r0x05, W
	BNZ	_00500_DS_
;	.line	360; ../../RF24Mesh_cg.c	return 0;
	CLRF	WREG
	BRA	_00520_DS_
_00500_DS_:
;	.line	382; ../../RF24Mesh_cg.c	for(i=0; i<pollCount; i++){
	CLRF	r0x05
_00518_DS_:
	MOVF	r0x06, W
	SUBWF	r0x05, W
	BTFSC	STATUS, 0
	BRA	_00506_DS_
;	.line	385; ../../RF24Mesh_cg.c	header.type = NETWORK_REQ_ADDRESS;
	MOVLW	0xc3
	BANKSEL	(_RF24M_requestAddress_header_1_265 + 6)
	MOVWF	(_RF24M_requestAddress_header_1_265 + 6), B
;	.line	386; ../../RF24Mesh_cg.c	header.reserved = RF24M_getNodeID(MESH_BLANK_ID);
	MOVLW	0xff
	MOVWF	POSTDEC1
	MOVLW	0xff
	MOVWF	POSTDEC1
	CALL	_RF24M_getNodeID
	MOVWF	r0x07
	MOVFF	PRODL, r0x08
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVF	r0x07, W
	BANKSEL	(_RF24M_requestAddress_header_1_265 + 7)
	MOVWF	(_RF24M_requestAddress_header_1_265 + 7), B
; ;multiply lit val:0x02 by variable r0x05 and store in r0x07
;	.line	387; ../../RF24Mesh_cg.c	header.to_node = contactNode[i];    
	MOVF	r0x05, W
	MULLW	0x02
	MOVF	PRODH, W
	MOVWF	r0x08
	MOVFF	PRODL, r0x07
	MOVLW	LOW(_RF24M_requestAddress_contactNode_1_265)
	ADDWF	r0x07, F
	MOVLW	HIGH(_RF24M_requestAddress_contactNode_1_265)
	ADDWFC	r0x08, F
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, FSR0H
	MOVFF	POSTINC0, r0x09
	MOVFF	INDF0, r0x0a
	MOVF	r0x09, W
	BANKSEL	(_RF24M_requestAddress_header_1_265 + 2)
	MOVWF	(_RF24M_requestAddress_header_1_265 + 2), B
	MOVF	r0x0a, W
	BANKSEL	(_RF24M_requestAddress_header_1_265 + 3)
	MOVWF	(_RF24M_requestAddress_header_1_265 + 3), B
;	.line	390; ../../RF24Mesh_cg.c	RF24N_write_(&header,0,0,contactNode[i]);
	MOVLW	HIGH(_RF24M_requestAddress_header_1_265)
	MOVWF	r0x0a
	MOVLW	LOW(_RF24M_requestAddress_header_1_265)
	MOVWF	r0x09
	MOVLW	0x80
	MOVWF	r0x0b
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, FSR0H
	MOVFF	POSTINC0, r0x07
	MOVFF	INDF0, r0x08
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write_
	MOVLW	0x0a
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	397; ../../RF24Mesh_cg.c	timr = millis();    
	CALL	_millis
	MOVWF	r0x00
	MOVFF	PRODL, r0x02
	MOVFF	PRODH, r0x03
	MOVFF	FSR0L, r0x04
_00503_DS_:
;	.line	399; ../../RF24Mesh_cg.c	while(millis()-timr<225){
	CALL	_millis
	MOVWF	r0x07
	MOVFF	PRODL, r0x08
	MOVFF	PRODH, r0x09
	MOVFF	FSR0L, r0x0a
	MOVF	r0x00, W
	SUBWF	r0x07, F
	MOVF	r0x02, W
	SUBWFB	r0x08, F
	MOVF	r0x03, W
	SUBWFB	r0x09, F
	MOVF	r0x04, W
	SUBWFB	r0x0a, F
	MOVLW	0x00
	SUBWF	r0x0a, W
	BNZ	_00570_DS_
	MOVLW	0x00
	SUBWF	r0x09, W
	BNZ	_00570_DS_
	MOVLW	0x00
	SUBWF	r0x08, W
	BNZ	_00570_DS_
	MOVLW	0xe1
	SUBWF	r0x07, W
_00570_DS_:
	BC	_00505_DS_
;	.line	400; ../../RF24Mesh_cg.c	if( (type = RF24N_update()) == NETWORK_ADDR_RESPONSE){
	CALL	_RF24N_update
	MOVWF	r0x07
	MOVFF	r0x07, r0x01
	MOVF	r0x07, W
	XORLW	0x80
	BNZ	_00503_DS_
;	.line	401; ../../RF24Mesh_cg.c	i=pollCount;
	MOVFF	r0x06, r0x05
_00505_DS_:
;	.line	405; ../../RF24Mesh_cg.c	delay(5);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x05
	MOVWF	POSTDEC1
	CALL	_delay
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	382; ../../RF24Mesh_cg.c	for(i=0; i<pollCount; i++){
	INCF	r0x05, F
	BRA	_00518_DS_
_00506_DS_:
;	.line	407; ../../RF24Mesh_cg.c	if(type != NETWORK_ADDR_RESPONSE){
	MOVF	r0x01, W
	XORLW	0x80
	BZ	_00508_DS_
;	.line	408; ../../RF24Mesh_cg.c	return 0;
	CLRF	WREG
	BRA	_00520_DS_
_00508_DS_:
;	.line	418; ../../RF24Mesh_cg.c	memcpy(&newAddress,RF24N_getFrame_buffer()+sizeof(RF24NetworkHeader),sizeof(newAddress));
	MOVLW	HIGH(_RF24M_requestAddress_newAddress_1_265)
	MOVWF	r0x01
	MOVLW	LOW(_RF24M_requestAddress_newAddress_1_265)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	CALL	_RF24N_getFrame_buffer
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
	MOVFF	PRODH, r0x05
	MOVLW	0x08
	ADDWF	r0x03, F
	MOVLW	0x00
	ADDWFC	r0x04, F
	ADDWFC	r0x05, F
	MOVF	r0x05, W
	MOVWF	r0x05
	MOVF	r0x04, W
	MOVWF	r0x04
	MOVF	r0x03, W
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	BANKSEL	_RF24M_requestAddress_newAddress_1_265
;	.line	420; ../../RF24Mesh_cg.c	if(!newAddress || RF24N_getFrame_buffer()[7] != RF24M_getNodeID(MESH_BLANK_ID) ){
	MOVF	_RF24M_requestAddress_newAddress_1_265, W, B
	BANKSEL	(_RF24M_requestAddress_newAddress_1_265 + 1)
	IORWF	(_RF24M_requestAddress_newAddress_1_265 + 1), W, B
	BZ	_00509_DS_
	CALL	_RF24N_getFrame_buffer
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVLW	0x07
	ADDWF	r0x00, F
	MOVLW	0x00
	ADDWFC	r0x01, F
	ADDWFC	r0x02, F
	MOVFF	r0x00, FSR0L
	MOVFF	r0x01, PRODL
	MOVF	r0x02, W
	CALL	__gptrget1
	MOVWF	r0x00
	MOVLW	0xff
	MOVWF	POSTDEC1
	MOVLW	0xff
	MOVWF	POSTDEC1
	CALL	_RF24M_getNodeID
	MOVWF	r0x01
	MOVFF	PRODL, r0x02
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	CLRF	r0x03
	MOVF	r0x00, W
	XORWF	r0x01, W
	BNZ	_00509_DS_
	MOVF	r0x03, W
	XORWF	r0x02, W
	BZ	_00510_DS_
_00509_DS_:
;	.line	427; ../../RF24Mesh_cg.c	return 0;
	CLRF	WREG
	BRA	_00520_DS_
_00510_DS_:
	BANKSEL	_RF24M_requestAddress_newAddress_1_265
;	.line	441; ../../RF24Mesh_cg.c	mesh.mesh_address = newAddress;
	MOVF	_RF24M_requestAddress_newAddress_1_265, W, B
	BANKSEL	(_mesh + 1)
	MOVWF	(_mesh + 1), B
	BANKSEL	(_RF24M_requestAddress_newAddress_1_265 + 1)
	MOVF	(_RF24M_requestAddress_newAddress_1_265 + 1), W, B
	BANKSEL	(_mesh + 2)
	MOVWF	(_mesh + 2), B
;	.line	443; ../../RF24Mesh_cg.c	RF24_stopListening();
	CALL	_RF24_stopListening
;	.line	444; ../../RF24Mesh_cg.c	delay(10);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	_delay
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BANKSEL	(_mesh + 2)
;	.line	445; ../../RF24Mesh_cg.c	RF24N_begin(mesh.mesh_address);
	MOVF	(_mesh + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_mesh + 1)
	MOVF	(_mesh + 1), W, B
	MOVWF	POSTDEC1
	CALL	_RF24N_begin
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BANKSEL	(_RF24M_requestAddress_header_1_265 + 2)
;	.line	446; ../../RF24Mesh_cg.c	header.to_node = 00;
	CLRF	(_RF24M_requestAddress_header_1_265 + 2), B
	BANKSEL	(_RF24M_requestAddress_header_1_265 + 3)
	CLRF	(_RF24M_requestAddress_header_1_265 + 3), B
;	.line	447; ../../RF24Mesh_cg.c	header.type = MESH_ADDR_CONFIRM;
	MOVLW	0x81
	BANKSEL	(_RF24M_requestAddress_header_1_265 + 6)
	MOVWF	(_RF24M_requestAddress_header_1_265 + 6), B
;	.line	449; ../../RF24Mesh_cg.c	while( !RF24N_write_m(&header,0,0) ){
	CLRF	r0x00
_00514_DS_:
	MOVLW	HIGH(_RF24M_requestAddress_header_1_265)
	MOVWF	r0x02
	MOVLW	LOW(_RF24M_requestAddress_header_1_265)
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write_m
	MOVWF	r0x01
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x01, W
	BNZ	_00516_DS_
;	.line	450; ../../RF24Mesh_cg.c	if(registerAddrCount++ >= 6 ){ 
	MOVFF	r0x00, r0x01
	INCF	r0x00, F
	MOVLW	0x06
	SUBWF	r0x01, W
	BNC	_00513_DS_
;	.line	451; ../../RF24Mesh_cg.c	RF24N_begin(MESH_DEFAULT_ADDRESS);
	MOVLW	0x09
	MOVWF	POSTDEC1
	MOVLW	0x24
	MOVWF	POSTDEC1
	CALL	_RF24N_begin
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	452; ../../RF24Mesh_cg.c	mesh.mesh_address = MESH_DEFAULT_ADDRESS;
	MOVLW	0x24
	BANKSEL	(_mesh + 1)
	MOVWF	(_mesh + 1), B
	MOVLW	0x09
	BANKSEL	(_mesh + 2)
	MOVWF	(_mesh + 2), B
;	.line	453; ../../RF24Mesh_cg.c	return 0;
	CLRF	WREG
	BRA	_00520_DS_
_00513_DS_:
;	.line	455; ../../RF24Mesh_cg.c	delay(3);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x03
	MOVWF	POSTDEC1
	CALL	_delay
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BRA	_00514_DS_
_00516_DS_:
;	.line	458; ../../RF24Mesh_cg.c	return 1;  
	MOVLW	0x01
_00520_DS_:
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_RF24Mesh_cg__RF24M_renewAddress	code
_RF24M_renewAddress:
;	.line	273; ../../RF24Mesh_cg.c	uint16_t RF24M_renewAddress( uint32_t timeout){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
	MOVLW	0x05
	MOVFF	PLUSW2, r0x02
	MOVLW	0x06
	MOVFF	PLUSW2, r0x03
;	.line	274; ../../RF24Mesh_cg.c	uint8_t reqCounter = 0;
	CLRF	r0x04
;	.line	275; ../../RF24Mesh_cg.c	uint8_t totalReqs = 0;
	CLRF	r0x05
;	.line	278; ../../RF24Mesh_cg.c	if(RF24_available()){ return 0; }
	CALL	_RF24_available
	MOVWF	r0x06
	MOVF	r0x06, W
	BZ	_00464_DS_
	CLRF	PRODL
	CLRF	WREG
	BRA	_00470_DS_
_00464_DS_:
;	.line	280; ../../RF24Mesh_cg.c	RF24_stopListening();
	CALL	_RF24_stopListening
;	.line	282; ../../RF24Mesh_cg.c	RF24N_setNetworkFlags(RF24N_getNetworkFlags() | 2);
	CALL	_RF24N_getNetworkFlags
	MOVWF	r0x06
	BSF	r0x06, 1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_RF24N_setNetworkFlags
	MOVF	POSTINC1, F
;	.line	283; ../../RF24Mesh_cg.c	delay(10);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x0a
	MOVWF	POSTDEC1
	CALL	_delay
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	285; ../../RF24Mesh_cg.c	RF24N_begin(MESH_DEFAULT_ADDRESS);
	MOVLW	0x09
	MOVWF	POSTDEC1
	MOVLW	0x24
	MOVWF	POSTDEC1
	CALL	_RF24N_begin
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	286; ../../RF24Mesh_cg.c	mesh.mesh_address = MESH_DEFAULT_ADDRESS;
	MOVLW	0x24
	BANKSEL	(_mesh + 1)
	MOVWF	(_mesh + 1), B
	MOVLW	0x09
	BANKSEL	(_mesh + 2)
	MOVWF	(_mesh + 2), B
;	.line	288; ../../RF24Mesh_cg.c	start = millis();
	CALL	_millis
	MOVWF	r0x06
	MOVFF	PRODL, r0x07
	MOVFF	PRODH, r0x08
	MOVFF	FSR0L, r0x09
_00467_DS_:
;	.line	289; ../../RF24Mesh_cg.c	while(!RF24M_requestAddress(reqCounter)){
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	CALL	_RF24M_requestAddress
	MOVWF	r0x0a
	MOVF	POSTINC1, F
	MOVF	r0x0a, W
	BTFSS	STATUS, 2
	BRA	_00469_DS_
;	.line	290; ../../RF24Mesh_cg.c	if(millis()-start > timeout){ return 0; }
	CALL	_millis
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVFF	PRODH, r0x0c
	MOVFF	FSR0L, r0x0d
	MOVF	r0x06, W
	SUBWF	r0x0a, F
	MOVF	r0x07, W
	SUBWFB	r0x0b, F
	MOVF	r0x08, W
	SUBWFB	r0x0c, F
	MOVF	r0x09, W
	SUBWFB	r0x0d, F
	MOVF	r0x0d, W
	SUBWF	r0x03, W
	BNZ	_00485_DS_
	MOVF	r0x0c, W
	SUBWF	r0x02, W
	BNZ	_00485_DS_
	MOVF	r0x0b, W
	SUBWF	r0x01, W
	BNZ	_00485_DS_
	MOVF	r0x0a, W
	SUBWF	r0x00, W
_00485_DS_:
	BC	_00466_DS_
	CLRF	PRODL
	CLRF	WREG
	BRA	_00470_DS_
_00466_DS_:
;	.line	291; ../../RF24Mesh_cg.c	delay(50 + ( (totalReqs+1)*(reqCounter+1)) * 2);
	MOVFF	r0x05, r0x0a
	CLRF	r0x0b
	INFSNZ	r0x0a, F
	INCF	r0x0b, F
	MOVFF	r0x04, r0x0c
	CLRF	r0x0d
	INFSNZ	r0x0c, F
	INCF	r0x0d, F
	MOVF	r0x0d, W
	MOVWF	POSTDEC1
	MOVF	r0x0c, W
	MOVWF	POSTDEC1
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVLW	0x04
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	CALL	__mulint
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVLW	0x04
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVLW	0x32
	ADDWF	r0x0a, F
	BTFSC	STATUS, 0
	INCF	r0x0b, F
	MOVF	r0x0b, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	CALL	_delay
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	292; ../../RF24Mesh_cg.c	reqCounter++;
	INCF	r0x04, F
;	.line	293; ../../RF24Mesh_cg.c	reqCounter = reqCounter%4;
	MOVLW	0x03
	ANDWF	r0x04, F
;	.line	294; ../../RF24Mesh_cg.c	totalReqs++;
	INCF	r0x05, F
;	.line	295; ../../RF24Mesh_cg.c	totalReqs = totalReqs%10;
	MOVLW	0x0a
	MOVWF	POSTDEC1
	MOVFF	r0x05, POSTDEC1
	CALL	__moduchar
	MOVWF	r0x05
	MOVF	PREINC1, W
	MOVF	PREINC1, W
	BRA	_00467_DS_
_00469_DS_:
;	.line	298; ../../RF24Mesh_cg.c	RF24N_setNetworkFlags(RF24N_getNetworkFlags() & ~2);
	CALL	_RF24N_getNetworkFlags
	MOVWF	r0x00
	BCF	r0x00, 1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24N_setNetworkFlags
	MOVF	POSTINC1, F
;	.line	299; ../../RF24Mesh_cg.c	return mesh.mesh_address;
	MOVFF	(_mesh + 2), PRODL
	BANKSEL	(_mesh + 1)
	MOVF	(_mesh + 1), W, B
_00470_DS_:
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_RF24Mesh_cg__RF24M_releaseAddress	code
_RF24M_releaseAddress:
;	.line	257; ../../RF24Mesh_cg.c	uint8_t RF24M_releaseAddress(void){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	BANKSEL	(_mesh + 1)
;	.line	260; ../../RF24Mesh_cg.c	if(mesh.mesh_address == MESH_DEFAULT_ADDRESS){ return 0; }
	MOVF	(_mesh + 1), W, B
	XORLW	0x24
	BNZ	_00457_DS_
	BANKSEL	(_mesh + 2)
	MOVF	(_mesh + 2), W, B
	XORLW	0x09
	BZ	_00458_DS_
_00457_DS_:
	BRA	_00446_DS_
_00458_DS_:
	CLRF	WREG
	BRA	_00449_DS_
_00446_DS_:
;	.line	262; ../../RF24Mesh_cg.c	RF24NH_init(&header,00,MESH_ADDR_RELEASE);
	MOVLW	HIGH(_RF24M_releaseAddress_header_1_256)
	MOVWF	r0x01
	MOVLW	LOW(_RF24M_releaseAddress_header_1_256)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0xc5
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24NH_init
	MOVLW	0x06
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	263; ../../RF24Mesh_cg.c	if(RF24N_write_m(&header,0,0)){
	MOVLW	HIGH(_RF24M_releaseAddress_header_1_256)
	MOVWF	r0x01
	MOVLW	LOW(_RF24M_releaseAddress_header_1_256)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write_m
	MOVWF	r0x00
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	BZ	_00448_DS_
;	.line	264; ../../RF24Mesh_cg.c	RF24N_begin(MESH_DEFAULT_ADDRESS);
	MOVLW	0x09
	MOVWF	POSTDEC1
	MOVLW	0x24
	MOVWF	POSTDEC1
	CALL	_RF24N_begin
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	265; ../../RF24Mesh_cg.c	mesh.mesh_address=MESH_DEFAULT_ADDRESS;
	MOVLW	0x24
	BANKSEL	(_mesh + 1)
	MOVWF	(_mesh + 1), B
	MOVLW	0x09
	BANKSEL	(_mesh + 2)
	MOVWF	(_mesh + 2), B
;	.line	266; ../../RF24Mesh_cg.c	return 1;
	MOVLW	0x01
	BRA	_00449_DS_
_00448_DS_:
;	.line	268; ../../RF24Mesh_cg.c	return 0;
	CLRF	WREG
_00449_DS_:
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_RF24Mesh_cg__RF24M_getNodeID	code
_RF24M_getNodeID:
;	.line	222; ../../RF24Mesh_cg.c	int16_t RF24M_getNodeID(uint16_t address){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, _RF24M_getNodeID_address_1_243
	MOVLW	0x04
	MOVFF	PLUSW2, (_RF24M_getNodeID_address_1_243 + 1)
	BANKSEL	_RF24M_getNodeID_address_1_243
;	.line	224; ../../RF24Mesh_cg.c	if(address == MESH_BLANK_ID){
	MOVF	_RF24M_getNodeID_address_1_243, W, B
	XORLW	0xff
	BNZ	_00431_DS_
	BANKSEL	(_RF24M_getNodeID_address_1_243 + 1)
	MOVF	(_RF24M_getNodeID_address_1_243 + 1), W, B
	XORLW	0xff
	BZ	_00432_DS_
_00431_DS_:
	BRA	_00376_DS_
_00432_DS_:
;	.line	225; ../../RF24Mesh_cg.c	return mesh._nodeID;
	MOVFF	_mesh, r0x00
	CLRF	r0x01
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
	BRA	_00396_DS_
_00376_DS_:
	BANKSEL	_RF24M_getNodeID_address_1_243
;	.line	227; ../../RF24Mesh_cg.c	if(address == 0){
	MOVF	_RF24M_getNodeID_address_1_243, W, B
	BANKSEL	(_RF24M_getNodeID_address_1_243 + 1)
	IORWF	(_RF24M_getNodeID_address_1_243 + 1), W, B
	BNZ	_00377_DS_
;	.line	228; ../../RF24Mesh_cg.c	return 0;
	CLRF	PRODL
	CLRF	WREG
	BRA	_00396_DS_
_00377_DS_:
;	.line	231; ../../RF24Mesh_cg.c	if(!mesh.mesh_address){ //Master Node
	MOVFF	(_mesh + 1), r0x00
	MOVFF	(_mesh + 2), r0x01
	MOVF	r0x00, W
	IORWF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_00391_DS_
;	.line	233; ../../RF24Mesh_cg.c	for(i=0; i< mesh.addrListTop; i++){
	CLRF	r0x02
	CLRF	r0x03
	CLRF	r0x04
_00394_DS_:
	BANKSEL	(_mesh + 6)
	MOVF	(_mesh + 6), W, B
	SUBWF	r0x02, W
	BTFSC	STATUS, 0
	BRA	_00392_DS_
;	.line	234; ../../RF24Mesh_cg.c	if(mesh.addrList[i].address == address){
	MOVF	r0x03, W
	BANKSEL	(_mesh + 3)
	ADDWF	(_mesh + 3), W, B
	MOVWF	r0x05
	MOVF	r0x04, W
	BANKSEL	(_mesh + 4)
	ADDWFC	(_mesh + 4), W, B
	MOVWF	r0x06
	CLRF	WREG
	BANKSEL	(_mesh + 5)
	ADDWFC	(_mesh + 5), W, B
	MOVWF	r0x07
	MOVF	r0x05, W
	ADDLW	0x01
	MOVWF	r0x08
	MOVLW	0x00
	ADDWFC	r0x06, W
	MOVWF	r0x09
	MOVLW	0x00
	ADDWFC	r0x07, W
	MOVWF	r0x0a
	MOVFF	r0x08, FSR0L
	MOVFF	r0x09, PRODL
	MOVF	r0x0a, W
	CALL	__gptrget2
	MOVWF	r0x08
	MOVFF	PRODL, r0x09
	MOVF	r0x08, W
	BANKSEL	_RF24M_getNodeID_address_1_243
	XORWF	_RF24M_getNodeID_address_1_243, W, B
	BNZ	_00434_DS_
	MOVF	r0x09, W
	BANKSEL	(_RF24M_getNodeID_address_1_243 + 1)
	XORWF	(_RF24M_getNodeID_address_1_243 + 1), W, B
	BZ	_00435_DS_
_00434_DS_:
	BRA	_00395_DS_
_00435_DS_:
;	.line	235; ../../RF24Mesh_cg.c	return mesh.addrList[i].nodeID;
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrget1
	MOVWF	r0x05
	CLRF	r0x06
	MOVFF	r0x06, PRODL
	MOVF	r0x05, W
	BRA	_00396_DS_
_00395_DS_:
;	.line	233; ../../RF24Mesh_cg.c	for(i=0; i< mesh.addrListTop; i++){
	MOVLW	0x03
	ADDWF	r0x03, F
	BTFSC	STATUS, 0
	INCF	r0x04, F
	INCF	r0x02, F
	BRA	_00394_DS_
_00391_DS_:
;	.line	240; ../../RF24Mesh_cg.c	if(mesh.mesh_address == MESH_DEFAULT_ADDRESS){ return -1; }
	MOVF	r0x00, W
	XORLW	0x24
	BNZ	_00436_DS_
	MOVF	r0x01, W
	XORLW	0x09
	BZ	_00437_DS_
_00436_DS_:
	BRA	_00382_DS_
_00437_DS_:
	SETF	PRODL
	SETF	WREG
	BRA	_00396_DS_
_00382_DS_:
;	.line	241; ../../RF24Mesh_cg.c	RF24NH_init(&header, 00, MESH_ID_LOOKUP );
	MOVLW	HIGH(_RF24M_getNodeID_header_2_250)
	MOVWF	r0x01
	MOVLW	LOW(_RF24M_getNodeID_header_2_250)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0xc6
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24NH_init
	MOVLW	0x06
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	242; ../../RF24Mesh_cg.c	if(RF24N_write_m(&header,&address,sizeof(address)) ){
	MOVLW	HIGH(_RF24M_getNodeID_header_2_250)
	MOVWF	r0x01
	MOVLW	LOW(_RF24M_getNodeID_header_2_250)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_RF24M_getNodeID_address_1_243)
	MOVWF	r0x04
	MOVLW	LOW(_RF24M_getNodeID_address_1_243)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write_m
	MOVWF	r0x00
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	BTFSC	STATUS, 2
	BRA	_00392_DS_
;	.line	243; ../../RF24Mesh_cg.c	uint32_t timer=millis(), timeout = 500;	
	CALL	_millis
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
_00385_DS_:
;	.line	245; ../../RF24Mesh_cg.c	while(RF24N_update() != MESH_ID_LOOKUP){            
	CALL	_RF24N_update
	MOVWF	r0x04
	MOVF	r0x04, W
	XORLW	0xc6
	BZ	_00387_DS_
;	.line	246; ../../RF24Mesh_cg.c	if(millis()-timer > timeout){ return -1; }
	CALL	_millis
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVFF	FSR0L, r0x07
	MOVF	r0x00, W
	SUBWF	r0x04, F
	MOVF	r0x01, W
	SUBWFB	r0x05, F
	MOVF	r0x02, W
	SUBWFB	r0x06, F
	MOVF	r0x03, W
	SUBWFB	r0x07, F
	MOVLW	0x00
	SUBWF	r0x07, W
	BNZ	_00440_DS_
	MOVLW	0x00
	SUBWF	r0x06, W
	BNZ	_00440_DS_
	MOVLW	0x01
	SUBWF	r0x05, W
	BNZ	_00440_DS_
	MOVLW	0xf5
	SUBWF	r0x04, W
_00440_DS_:
	BNC	_00385_DS_
	SETF	PRODL
	SETF	WREG
	BRA	_00396_DS_
_00387_DS_:
;	.line	249; ../../RF24Mesh_cg.c	memcpy(&ID,&RF24N_getFrame_buffer()[sizeof(RF24NetworkHeader)],sizeof(ID));
	MOVLW	HIGH(_RF24M_getNodeID_ID_3_252)
	MOVWF	r0x01
	MOVLW	LOW(_RF24M_getNodeID_ID_3_252)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	CALL	_RF24N_getFrame_buffer
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
	MOVFF	PRODH, r0x05
	MOVLW	0x08
	ADDWF	r0x03, F
	MOVLW	0x00
	ADDWFC	r0x04, F
	ADDWFC	r0x05, F
	MOVF	r0x05, W
	MOVWF	r0x05
	MOVF	r0x04, W
	MOVWF	r0x04
	MOVF	r0x03, W
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	250; ../../RF24Mesh_cg.c	return ID;
	MOVFF	(_RF24M_getNodeID_ID_3_252 + 1), PRODL
	BANKSEL	_RF24M_getNodeID_ID_3_252
	MOVF	_RF24M_getNodeID_ID_3_252, W, B
	BRA	_00396_DS_
_00392_DS_:
;	.line	253; ../../RF24Mesh_cg.c	return -1;
	SETF	PRODL
	SETF	WREG
_00396_DS_:
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_RF24Mesh_cg__RF24M_getAddress	code
_RF24M_getAddress:
;	.line	187; ../../RF24Mesh_cg.c	int16_t RF24M_getAddress(uint8_t nodeID){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, _RF24M_getAddress_nodeID_1_232
	BANKSEL	_RF24M_getAddress_address_1_233
;	.line	188; ../../RF24Mesh_cg.c	int16_t address = 0;
	CLRF	_RF24M_getAddress_address_1_233, B
	BANKSEL	(_RF24M_getAddress_address_1_233 + 1)
	CLRF	(_RF24M_getAddress_address_1_233 + 1), B
;	.line	192; ../../RF24Mesh_cg.c	if(!RF24M_getNodeID(MESH_BLANK_ID)){ //Master Node
	MOVLW	0xff
	MOVWF	POSTDEC1
	MOVLW	0xff
	MOVWF	POSTDEC1
	CALL	_RF24M_getNodeID
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BTFSS	STATUS, 2
	BRA	_00307_DS_
	BANKSEL	_RF24M_getAddress_address_1_233
;	.line	194; ../../RF24Mesh_cg.c	address = 0;
	CLRF	_RF24M_getAddress_address_1_233, B
	BANKSEL	(_RF24M_getAddress_address_1_233 + 1)
	CLRF	(_RF24M_getAddress_address_1_233 + 1), B
;	.line	196; ../../RF24Mesh_cg.c	for(i=0; i< mesh.addrListTop; i++){
	CLRF	r0x00
	CLRF	r0x01
	CLRF	r0x02
_00321_DS_:
	BANKSEL	(_mesh + 6)
	MOVF	(_mesh + 6), W, B
	SUBWF	r0x00, W
	BTFSC	STATUS, 0
	BRA	_00305_DS_
;	.line	197; ../../RF24Mesh_cg.c	if(mesh.addrList[i].nodeID == nodeID){
	MOVFF	(_mesh + 3), r0x03
	MOVFF	(_mesh + 4), r0x04
	MOVFF	(_mesh + 5), r0x05
	MOVF	r0x01, W
	ADDWF	r0x03, W
	MOVWF	r0x06
	MOVF	r0x02, W
	ADDWFC	r0x04, W
	MOVWF	r0x07
	CLRF	WREG
	ADDWFC	r0x05, W
	MOVWF	r0x08
	MOVFF	r0x06, FSR0L
	MOVFF	r0x07, PRODL
	MOVF	r0x08, W
	CALL	__gptrget1
	MOVWF	r0x06
	MOVF	r0x06, W
	BANKSEL	_RF24M_getAddress_nodeID_1_232
	XORWF	_RF24M_getAddress_nodeID_1_232, W, B
	BNZ	_00322_DS_
;	.line	198; ../../RF24Mesh_cg.c	address = mesh.addrList[i].address;
	MOVF	r0x01, W
	ADDWF	r0x03, F
	MOVF	r0x02, W
	ADDWFC	r0x04, F
	CLRF	WREG
	ADDWFC	r0x05, F
	INCF	r0x03, F
	BNC	_00363_DS_
	INFSNZ	r0x04, F
	INCF	r0x05, F
_00363_DS_:
	MOVFF	r0x03, FSR0L
	MOVFF	r0x04, PRODL
	MOVF	r0x05, W
	CALL	__gptrget2
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
	MOVFF	r0x03, _RF24M_getAddress_address_1_233
	MOVFF	r0x04, (_RF24M_getAddress_address_1_233 + 1)
;	.line	199; ../../RF24Mesh_cg.c	return address;
	MOVFF	r0x04, PRODL
	MOVF	r0x03, W
	BRA	_00323_DS_
_00322_DS_:
;	.line	196; ../../RF24Mesh_cg.c	for(i=0; i< mesh.addrListTop; i++){
	MOVLW	0x03
	ADDWF	r0x01, F
	BTFSC	STATUS, 0
	INCF	r0x02, F
	INCF	r0x00, F
	BRA	_00321_DS_
_00305_DS_:
;	.line	202; ../../RF24Mesh_cg.c	return -1;
	SETF	PRODL
	SETF	WREG
	BRA	_00323_DS_
_00307_DS_:
	BANKSEL	(_mesh + 1)
;	.line	205; ../../RF24Mesh_cg.c	if(mesh.mesh_address == MESH_DEFAULT_ADDRESS){ return -1; }
	MOVF	(_mesh + 1), W, B
	XORLW	0x24
	BNZ	_00364_DS_
	BANKSEL	(_mesh + 2)
	MOVF	(_mesh + 2), W, B
	XORLW	0x09
	BZ	_00365_DS_
_00364_DS_:
	BRA	_00309_DS_
_00365_DS_:
	SETF	PRODL
	SETF	WREG
	BRA	_00323_DS_
_00309_DS_:
	BANKSEL	_RF24M_getAddress_nodeID_1_232
;	.line	206; ../../RF24Mesh_cg.c	if(!nodeID){return 0;}
	MOVF	_RF24M_getAddress_nodeID_1_232, W, B
	BNZ	_00311_DS_
	CLRF	PRODL
	CLRF	WREG
	BRA	_00323_DS_
_00311_DS_:
;	.line	208; ../../RF24Mesh_cg.c	RF24NH_init(&header, 00, MESH_ADDR_LOOKUP );
	MOVLW	HIGH(_RF24M_getAddress_header_1_233)
	MOVWF	r0x01
	MOVLW	LOW(_RF24M_getAddress_header_1_233)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0xc4
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24NH_init
	MOVLW	0x06
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	209; ../../RF24Mesh_cg.c	if(RF24N_write_m(&header,&nodeID,sizeof(nodeID)+1) ){
	MOVLW	HIGH(_RF24M_getAddress_header_1_233)
	MOVWF	r0x01
	MOVLW	LOW(_RF24M_getAddress_header_1_233)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_RF24M_getAddress_nodeID_1_232)
	MOVWF	r0x04
	MOVLW	LOW(_RF24M_getAddress_nodeID_1_232)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write_m
	MOVWF	r0x00
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	BZ	_00318_DS_
;	.line	210; ../../RF24Mesh_cg.c	uint32_t timer=millis(), timeout = 150;		
	CALL	_millis
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
_00314_DS_:
;	.line	211; ../../RF24Mesh_cg.c	while(RF24N_update() != MESH_ADDR_LOOKUP){
	CALL	_RF24N_update
	MOVWF	r0x04
	MOVF	r0x04, W
	XORLW	0xc4
	BZ	_00319_DS_
;	.line	212; ../../RF24Mesh_cg.c	if(millis()-timer > timeout){ return -1; }
	CALL	_millis
	MOVWF	r0x04
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVFF	FSR0L, r0x07
	MOVF	r0x00, W
	SUBWF	r0x04, F
	MOVF	r0x01, W
	SUBWFB	r0x05, F
	MOVF	r0x02, W
	SUBWFB	r0x06, F
	MOVF	r0x03, W
	SUBWFB	r0x07, F
	MOVLW	0x00
	SUBWF	r0x07, W
	BNZ	_00368_DS_
	MOVLW	0x00
	SUBWF	r0x06, W
	BNZ	_00368_DS_
	MOVLW	0x00
	SUBWF	r0x05, W
	BNZ	_00368_DS_
	MOVLW	0x97
	SUBWF	r0x04, W
_00368_DS_:
	BNC	_00314_DS_
	SETF	PRODL
	SETF	WREG
	BRA	_00323_DS_
_00318_DS_:
;	.line	215; ../../RF24Mesh_cg.c	return -1;
	SETF	PRODL
	SETF	WREG
	BRA	_00323_DS_
_00319_DS_:
	BANKSEL	_RF24M_getAddress_address_1_233
;	.line	217; ../../RF24Mesh_cg.c	address = 0;
	CLRF	_RF24M_getAddress_address_1_233, B
	BANKSEL	(_RF24M_getAddress_address_1_233 + 1)
	CLRF	(_RF24M_getAddress_address_1_233 + 1), B
;	.line	218; ../../RF24Mesh_cg.c	memcpy(&address,RF24N_getFrame_buffer()+sizeof(RF24NetworkHeader),sizeof(address));
	MOVLW	HIGH(_RF24M_getAddress_address_1_233)
	MOVWF	r0x01
	MOVLW	LOW(_RF24M_getAddress_address_1_233)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	CALL	_RF24N_getFrame_buffer
	MOVWF	r0x03
	MOVFF	PRODL, r0x04
	MOVFF	PRODH, r0x05
	MOVLW	0x08
	ADDWF	r0x03, F
	MOVLW	0x00
	ADDWFC	r0x04, F
	ADDWFC	r0x05, F
	MOVF	r0x05, W
	MOVWF	r0x05
	MOVF	r0x04, W
	MOVWF	r0x04
	MOVF	r0x03, W
	MOVWF	r0x03
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_memcpy
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	219; ../../RF24Mesh_cg.c	return address >= 0 ? address: -2;	
	BSF	STATUS, 0
	BANKSEL	(_RF24M_getAddress_address_1_233 + 1)
	BTFSS	(_RF24M_getAddress_address_1_233 + 1), 7, B
	BCF	STATUS, 0
	BC	_00325_DS_
	MOVFF	_RF24M_getAddress_address_1_233, r0x00
	MOVFF	(_RF24M_getAddress_address_1_233 + 1), r0x01
	BRA	_00326_DS_
_00325_DS_:
	MOVLW	0xfe
	MOVWF	r0x00
	MOVLW	0xff
	MOVWF	r0x01
_00326_DS_:
	MOVFF	r0x01, PRODL
	MOVF	r0x00, W
_00323_DS_:
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_RF24Mesh_cg__RF24M_checkConnection	code
_RF24M_checkConnection:
;	.line	163; ../../RF24Mesh_cg.c	uint8_t RF24M_checkConnection(void){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
;	.line	166; ../../RF24Mesh_cg.c	uint8_t ok = 0;
	CLRF	r0x00
;	.line	167; ../../RF24Mesh_cg.c	while(count-- && mesh.mesh_address != MESH_DEFAULT_ADDRESS){
	MOVLW	0x03
	MOVWF	r0x01
_00271_DS_:
	MOVFF	r0x01, r0x02
	DECF	r0x01, F
	MOVF	r0x02, W
	BTFSC	STATUS, 2
	BRA	_00273_DS_
	BANKSEL	(_mesh + 1)
	MOVF	(_mesh + 1), W, B
	XORLW	0x24
	BNZ	_00297_DS_
	BANKSEL	(_mesh + 2)
	MOVF	(_mesh + 2), W, B
	XORLW	0x09
	BNZ	_00297_DS_
	BRA	_00273_DS_
_00297_DS_:
;	.line	170; ../../RF24Mesh_cg.c	RF24M_update();
	CALL	_RF24M_update
;	.line	171; ../../RF24Mesh_cg.c	if(RF24_rxFifoFull() || (RF24N_getNetworkFlags() & 1)){
	CALL	_RF24_rxFifoFull
	MOVWF	r0x02
	MOVF	r0x02, W
	BNZ	_00265_DS_
	CALL	_RF24N_getNetworkFlags
	MOVWF	r0x02
	BTFSS	r0x02, 0
	BRA	_00266_DS_
_00265_DS_:
;	.line	172; ../../RF24Mesh_cg.c	return 1;
	MOVLW	0x01
	BRA	_00276_DS_
_00266_DS_:
;	.line	175; ../../RF24Mesh_cg.c	RF24NH_init(&header,00,NETWORK_PING);
	MOVLW	HIGH(_RF24M_checkConnection_header_2_228)
	MOVWF	r0x03
	MOVLW	LOW(_RF24M_checkConnection_header_2_228)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVLW	0x82
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_RF24NH_init
	MOVLW	0x06
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	176; ../../RF24Mesh_cg.c	ok = RF24N_write_m(&header,0,0);
	MOVLW	HIGH(_RF24M_checkConnection_header_2_228)
	MOVWF	r0x03
	MOVLW	LOW(_RF24M_checkConnection_header_2_228)
	MOVWF	r0x02
	MOVLW	0x80
	MOVWF	r0x04
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write_m
	MOVWF	r0x00
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	177; ../../RF24Mesh_cg.c	if(ok){break;}
	MOVF	r0x00, W
	BNZ	_00273_DS_
;	.line	178; ../../RF24Mesh_cg.c	delay(103);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x67
	MOVWF	POSTDEC1
	CALL	_delay
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BRA	_00271_DS_
_00273_DS_:
;	.line	180; ../../RF24Mesh_cg.c	if(!ok){ RF24_stopListening(); }
	MOVF	r0x00, W
	BNZ	_00275_DS_
	CALL	_RF24_stopListening
_00275_DS_:
;	.line	181; ../../RF24Mesh_cg.c	return ok;
	MOVF	r0x00, W
_00276_DS_:
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_RF24Mesh_cg__RF24M_setChild	code
_RF24M_setChild:
;	.line	154; ../../RF24Mesh_cg.c	void RF24M_setChild(uint8_t allow){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
;	.line	158; ../../RF24Mesh_cg.c	RF24N_setNetworkFlags( allow ? RF24N_getNetworkFlags() & ~FLAG_NO_POLL : RF24N_getNetworkFlags() | FLAG_NO_POLL); 
	MOVF	r0x00, W
	BZ	_00259_DS_
	CALL	_RF24N_getNetworkFlags
	MOVWF	r0x00
	BCF	r0x00, 3
	BRA	_00260_DS_
_00259_DS_:
	CALL	_RF24N_getNetworkFlags
	MOVWF	r0x01
	MOVLW	0x08
	IORWF	r0x01, W
	MOVWF	r0x00
_00260_DS_:
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24N_setNetworkFlags
	MOVF	POSTINC1, F
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_RF24Mesh_cg__RF24M_setChannel	code
_RF24M_setChannel:
;	.line	147; ../../RF24Mesh_cg.c	void RF24M_setChannel( uint8_t _channel){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
;	.line	149; ../../RF24Mesh_cg.c	mesh.radio_channel = _channel;
	MOVF	r0x00, W
	BANKSEL	(_mesh + 16)
	MOVWF	(_mesh + 16), B
;	.line	150; ../../RF24Mesh_cg.c	RF24_setChannel(mesh.radio_channel);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24_setChannel
	MOVF	POSTINC1, F
;	.line	151; ../../RF24Mesh_cg.c	RF24_startListening();
	CALL	_RF24_startListening
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_RF24Mesh_cg__RF24M_write	code
_RF24M_write:
;	.line	125; ../../RF24Mesh_cg.c	uint8_t RF24M_write( const void* data, uint8_t msg_type, size_t size, uint8_t nodeID){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
	MOVFF	r0x0e, POSTDEC1
	MOVFF	r0x0f, POSTDEC1
	MOVFF	r0x10, POSTDEC1
	MOVFF	r0x11, POSTDEC1
	MOVFF	r0x12, POSTDEC1
	MOVFF	r0x13, POSTDEC1
	MOVFF	r0x14, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
	MOVLW	0x05
	MOVFF	PLUSW2, r0x02
	MOVLW	0x06
	MOVFF	PLUSW2, r0x03
	MOVLW	0x07
	MOVFF	PLUSW2, r0x04
	MOVLW	0x08
	MOVFF	PLUSW2, r0x05
	MOVLW	0x09
	MOVFF	PLUSW2, r0x06
;	.line	126; ../../RF24Mesh_cg.c	int16_t toNode = 0;
	CLRF	r0x07
	CLRF	r0x08
;	.line	127; ../../RF24Mesh_cg.c	int32_t lookupTimeout = millis()+ MESH_LOOKUP_TIMEOUT;
	CALL	_millis
	MOVWF	r0x09
	MOVFF	PRODL, r0x0a
	MOVFF	PRODH, r0x0b
	MOVFF	FSR0L, r0x0c
	MOVLW	0xb8
	ADDWF	r0x09, F
	MOVLW	0x0b
	ADDWFC	r0x0a, F
	MOVLW	0x00
	ADDWFC	r0x0b, F
	ADDWFC	r0x0c, F
	BANKSEL	(_mesh + 1)
;	.line	130; ../../RF24Mesh_cg.c	if(mesh.mesh_address == MESH_DEFAULT_ADDRESS){ return 0; }
	MOVF	(_mesh + 1), W, B
	XORLW	0x24
	BNZ	_00218_DS_
	BANKSEL	(_mesh + 2)
	MOVF	(_mesh + 2), W, B
	XORLW	0x09
	BZ	_00244_DS_
_00243_DS_:
	BRA	_00218_DS_
_00244_DS_:
	CLRF	WREG
	BRA	_00227_DS_
_00218_DS_:
;	.line	132; ../../RF24Mesh_cg.c	if(nodeID){
	MOVF	r0x06, W
	BTFSC	STATUS, 2
	BRA	_00226_DS_
;	.line	134; ../../RF24Mesh_cg.c	while( (toNode=RF24M_getAddress(nodeID)) < 0 ){
	MOVLW	0x32
	MOVWF	r0x0d
	CLRF	r0x0e
	CLRF	r0x0f
	CLRF	r0x10
_00222_DS_:
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	CALL	_RF24M_getAddress
	MOVWF	r0x11
	MOVFF	PRODL, r0x12
	MOVF	POSTINC1, F
	MOVFF	r0x11, r0x07
	MOVFF	r0x12, r0x08
	BSF	STATUS, 0
	BTFSS	r0x12, 7
	BCF	STATUS, 0
	BNC	_00226_DS_
;	.line	135; ../../RF24Mesh_cg.c	if(millis() > lookupTimeout || toNode == -2){
	CALL	_millis
	MOVWF	r0x11
	MOVFF	PRODL, r0x12
	MOVFF	PRODH, r0x13
	MOVFF	FSR0L, r0x14
	MOVF	r0x0c, W
	ADDLW	0x80
	MOVWF	PRODL
	MOVF	r0x14, W
	ADDLW	0x80
	SUBWF	PRODL, W
	BNZ	_00245_DS_
	MOVF	r0x13, W
	SUBWF	r0x0b, W
	BNZ	_00245_DS_
	MOVF	r0x12, W
	SUBWF	r0x0a, W
	BNZ	_00245_DS_
	MOVF	r0x11, W
	SUBWF	r0x09, W
_00245_DS_:
	BNC	_00219_DS_
	MOVF	r0x07, W
	XORLW	0xfe
	BNZ	_00220_DS_
	MOVF	r0x08, W
	XORLW	0xff
	BZ	_00219_DS_
_00246_DS_:
	BRA	_00220_DS_
_00219_DS_:
;	.line	136; ../../RF24Mesh_cg.c	return 0;
	CLRF	WREG
	BRA	_00227_DS_
_00220_DS_:
;	.line	138; ../../RF24Mesh_cg.c	retryDelay+=50;
	MOVLW	0x32
	ADDWF	r0x0d, F
	MOVLW	0x00
	ADDWFC	r0x0e, F
	ADDWFC	r0x0f, F
	ADDWFC	r0x10, F
;	.line	139; ../../RF24Mesh_cg.c	delay(retryDelay);
	MOVF	r0x0d, W
	MOVWF	r0x11
	MOVF	r0x0e, W
	MOVWF	r0x12
	MOVF	r0x12, W
	MOVWF	POSTDEC1
	MOVF	r0x11, W
	MOVWF	POSTDEC1
	CALL	_delay
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	BRA	_00222_DS_
_00226_DS_:
;	.line	142; ../../RF24Mesh_cg.c	return RF24M_write_n(toNode,data,msg_type,size);
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	CALL	_RF24M_write_n
	MOVWF	r0x00
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
_00227_DS_:
	MOVFF	PREINC1, r0x14
	MOVFF	PREINC1, r0x13
	MOVFF	PREINC1, r0x12
	MOVFF	PREINC1, r0x11
	MOVFF	PREINC1, r0x10
	MOVFF	PREINC1, r0x0f
	MOVFF	PREINC1, r0x0e
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_RF24Mesh_cg__RF24M_write_n	code
_RF24M_write_n:
;	.line	116; ../../RF24Mesh_cg.c	uint8_t RF24M_write_n( uint16_t to_node, const void* data, uint8_t msg_type, size_t size ){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
	MOVLW	0x05
	MOVFF	PLUSW2, r0x02
	MOVLW	0x06
	MOVFF	PLUSW2, r0x03
	MOVLW	0x07
	MOVFF	PLUSW2, r0x04
	MOVLW	0x08
	MOVFF	PLUSW2, r0x05
	MOVLW	0x09
	MOVFF	PLUSW2, r0x06
	MOVLW	0x0a
	MOVFF	PLUSW2, r0x07
	BANKSEL	(_mesh + 1)
;	.line	118; ../../RF24Mesh_cg.c	if(mesh.mesh_address == MESH_DEFAULT_ADDRESS){ return 0; }
	MOVF	(_mesh + 1), W, B
	XORLW	0x24
	BNZ	_00211_DS_
	BANKSEL	(_mesh + 2)
	MOVF	(_mesh + 2), W, B
	XORLW	0x09
	BZ	_00212_DS_
_00211_DS_:
	BRA	_00205_DS_
_00212_DS_:
	CLRF	WREG
	BRA	_00206_DS_
_00205_DS_:
;	.line	119; ../../RF24Mesh_cg.c	RF24NH_init(&header,to_node,msg_type);	
	MOVLW	HIGH(_RF24M_write_n_header_1_214)
	MOVWF	r0x09
	MOVLW	LOW(_RF24M_write_n_header_1_214)
	MOVWF	r0x08
	MOVLW	0x80
	MOVWF	r0x0a
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	MOVF	r0x0a, W
	MOVWF	POSTDEC1
	MOVF	r0x09, W
	MOVWF	POSTDEC1
	MOVF	r0x08, W
	MOVWF	POSTDEC1
	CALL	_RF24NH_init
	MOVLW	0x06
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	120; ../../RF24Mesh_cg.c	return RF24N_write_m(&header,data,size);	
	MOVLW	HIGH(_RF24M_write_n_header_1_214)
	MOVWF	r0x01
	MOVLW	LOW(_RF24M_write_n_header_1_214)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x05
	MOVF	r0x07, W
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write_m
	MOVWF	r0x00
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
_00206_DS_:
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_RF24Mesh_cg__RF24M_update	code
_RF24M_update:
;	.line	65; ../../RF24Mesh_cg.c	uint8_t RF24M_update(void){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVFF	r0x06, POSTDEC1
	MOVFF	r0x07, POSTDEC1
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, POSTDEC1
	MOVFF	r0x0a, POSTDEC1
	MOVFF	r0x0b, POSTDEC1
	MOVFF	r0x0c, POSTDEC1
	MOVFF	r0x0d, POSTDEC1
;	.line	69; ../../RF24Mesh_cg.c	uint8_t type = RF24N_update();
	CALL	_RF24N_update
	MOVWF	r0x00
	BANKSEL	(_mesh + 1)
;	.line	70; ../../RF24Mesh_cg.c	if(mesh.mesh_address == MESH_DEFAULT_ADDRESS){ return type; }
	MOVF	(_mesh + 1), W, B
	XORLW	0x24
	BNZ	_00182_DS_
	BANKSEL	(_mesh + 2)
	MOVF	(_mesh + 2), W, B
	XORLW	0x09
	BZ	_00183_DS_
_00182_DS_:
	BRA	_00121_DS_
_00183_DS_:
	MOVF	r0x00, W
	BRA	_00146_DS_
_00121_DS_:
;	.line	73; ../../RF24Mesh_cg.c	if(type == NETWORK_REQ_ADDRESS){
	MOVF	r0x00, W
	XORLW	0xc3
	BNZ	_00123_DS_
;	.line	74; ../../RF24Mesh_cg.c	mesh.doDHCP = 1;
	MOVLW	0x01
	BANKSEL	(_mesh + 7)
	MOVWF	(_mesh + 7), B
_00123_DS_:
;	.line	77; ../../RF24Mesh_cg.c	if(!RF24M_getNodeID(MESH_BLANK_ID)){
	MOVLW	0xff
	MOVWF	POSTDEC1
	MOVLW	0xff
	MOVWF	POSTDEC1
	CALL	_RF24M_getNodeID
	MOVWF	r0x01
	MOVFF	PRODL, r0x02
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVF	r0x01, W
	IORWF	r0x02, W
	BTFSS	STATUS, 2
	BRA	_00142_DS_
;	.line	78; ../../RF24Mesh_cg.c	if( (type == MESH_ADDR_LOOKUP || type == MESH_ID_LOOKUP)) {
	CLRF	r0x01
	MOVF	r0x00, W
	XORLW	0xc4
	BNZ	_00187_DS_
	INCF	r0x01, F
_00187_DS_:
	MOVF	r0x01, W
	BNZ	_00137_DS_
	MOVF	r0x00, W
	XORLW	0xc6
	BZ	_00137_DS_
	BRA	_00138_DS_
_00137_DS_:
;	.line	79; ../../RF24Mesh_cg.c	RF24NetworkHeader * header = (RF24NetworkHeader*) RF24N_getFrame_buffer();
	CALL	_RF24N_getFrame_buffer
	MOVWF	r0x02
	MOVFF	PRODL, r0x03
	MOVFF	PRODH, r0x04
	MOVF	r0x04, W
	MOVWF	r0x04
	MOVF	r0x03, W
	MOVWF	r0x03
	MOVF	r0x02, W
	MOVWF	r0x02
;	.line	80; ../../RF24Mesh_cg.c	header->to_node = header->from_node;
	MOVF	r0x02, W
	ADDLW	0x02
	MOVWF	r0x05
	MOVLW	0x00
	ADDWFC	r0x03, W
	MOVWF	r0x06
	MOVLW	0x00
	ADDWFC	r0x04, W
	MOVWF	r0x07
	MOVFF	r0x02, FSR0L
	MOVFF	r0x03, PRODL
	MOVF	r0x04, W
	CALL	__gptrget2
	MOVWF	r0x08
	MOVFF	PRODL, r0x09
	MOVFF	r0x08, POSTDEC1
	MOVFF	r0x09, PRODH
	MOVFF	r0x05, FSR0L
	MOVFF	r0x06, PRODL
	MOVF	r0x07, W
	CALL	__gptrput2
;	.line	82; ../../RF24Mesh_cg.c	if(type==MESH_ADDR_LOOKUP){
	MOVF	r0x01, W
	BZ	_00125_DS_
;	.line	83; ../../RF24Mesh_cg.c	int16_t returnAddr = RF24M_getAddress(RF24N_getFrame_buffer()[sizeof(RF24NetworkHeader)]);
	CALL	_RF24N_getFrame_buffer
	MOVWF	r0x01
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVLW	0x08
	ADDWF	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x05, F
	ADDWFC	r0x06, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget1
	MOVWF	r0x01
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_RF24M_getAddress
	BANKSEL	_RF24M_update_returnAddr_4_206
	MOVWF	_RF24M_update_returnAddr_4_206, B
	MOVFF	PRODL, (_RF24M_update_returnAddr_4_206 + 1)
	MOVF	POSTINC1, F
;	.line	84; ../../RF24Mesh_cg.c	RF24N_write_m(header,&returnAddr,sizeof(returnAddr)); 
	MOVLW	HIGH(_RF24M_update_returnAddr_4_206)
	MOVWF	r0x05
	MOVLW	LOW(_RF24M_update_returnAddr_4_206)
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x06
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write_m
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	BRA	_00142_DS_
_00125_DS_:
;	.line	86; ../../RF24Mesh_cg.c	int16_t returnAddr = RF24M_getNodeID(RF24N_getFrame_buffer()[sizeof(RF24NetworkHeader)]);
	CALL	_RF24N_getFrame_buffer
	MOVWF	r0x01
	MOVFF	PRODL, r0x05
	MOVFF	PRODH, r0x06
	MOVLW	0x08
	ADDWF	r0x01, F
	MOVLW	0x00
	ADDWFC	r0x05, F
	ADDWFC	r0x06, F
	MOVFF	r0x01, FSR0L
	MOVFF	r0x05, PRODL
	MOVF	r0x06, W
	CALL	__gptrget1
	MOVWF	r0x01
	CLRF	r0x05
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_RF24M_getNodeID
	BANKSEL	_RF24M_update_returnAddr_4_207
	MOVWF	_RF24M_update_returnAddr_4_207, B
	MOVFF	PRODL, (_RF24M_update_returnAddr_4_207 + 1)
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	87; ../../RF24Mesh_cg.c	RF24N_write_m(header,&returnAddr,sizeof(returnAddr));        
	MOVLW	HIGH(_RF24M_update_returnAddr_4_207)
	MOVWF	r0x05
	MOVLW	LOW(_RF24M_update_returnAddr_4_207)
	MOVWF	r0x01
	MOVLW	0x80
	MOVWF	r0x06
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x02
	MOVWF	POSTDEC1
	MOVF	r0x06, W
	MOVWF	POSTDEC1
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_RF24N_write_m
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	BRA	_00142_DS_
_00138_DS_:
;	.line	92; ../../RF24Mesh_cg.c	if(type == MESH_ADDR_RELEASE ){
	MOVF	r0x00, W
	XORLW	0xc5
	BZ	_00191_DS_
	BRA	_00135_DS_
_00191_DS_:
;	.line	94; ../../RF24Mesh_cg.c	uint16_t *fromAddr = (uint16_t*)RF24N_getFrame_buffer();
	CALL	_RF24N_getFrame_buffer
	MOVWF	r0x01
	MOVFF	PRODL, r0x02
	MOVFF	PRODH, r0x03
	MOVF	r0x03, W
	MOVWF	r0x03
	MOVF	r0x02, W
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	r0x01
;	.line	95; ../../RF24Mesh_cg.c	for(i=0; i< mesh.addrListTop; i++){
	CLRF	r0x04
	CLRF	r0x05
	CLRF	r0x06
_00144_DS_:
	BANKSEL	(_mesh + 6)
	MOVF	(_mesh + 6), W, B
	SUBWF	r0x04, W
	BTFSC	STATUS, 0
	BRA	_00142_DS_
;	.line	96; ../../RF24Mesh_cg.c	if(mesh.addrList[i].address == *fromAddr){
	MOVF	r0x05, W
	BANKSEL	(_mesh + 3)
	ADDWF	(_mesh + 3), W, B
	MOVWF	r0x07
	MOVF	r0x06, W
	BANKSEL	(_mesh + 4)
	ADDWFC	(_mesh + 4), W, B
	MOVWF	r0x08
	CLRF	WREG
	BANKSEL	(_mesh + 5)
	ADDWFC	(_mesh + 5), W, B
	MOVWF	r0x09
	INCF	r0x07, F
	BNC	_00193_DS_
	INFSNZ	r0x08, F
	INCF	r0x09, F
_00193_DS_:
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrget2
	MOVWF	r0x0a
	MOVFF	PRODL, r0x0b
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	MOVF	r0x03, W
	CALL	__gptrget2
	MOVWF	r0x0c
	MOVFF	PRODL, r0x0d
	MOVF	r0x0a, W
	XORWF	r0x0c, W
	BNZ	_00194_DS_
	MOVF	r0x0b, W
	XORWF	r0x0d, W
	BZ	_00195_DS_
_00194_DS_:
	BRA	_00145_DS_
_00195_DS_:
;	.line	97; ../../RF24Mesh_cg.c	mesh.addrList[i].address = 0;
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	PRODH
	MOVFF	r0x07, FSR0L
	MOVFF	r0x08, PRODL
	MOVF	r0x09, W
	CALL	__gptrput2
_00145_DS_:
;	.line	95; ../../RF24Mesh_cg.c	for(i=0; i< mesh.addrListTop; i++){
	MOVLW	0x03
	ADDWF	r0x05, F
	BTFSC	STATUS, 0
	INCF	r0x06, F
	INCF	r0x04, F
	BRA	_00144_DS_
_00135_DS_:
;	.line	103; ../../RF24Mesh_cg.c	if(type == MESH_ADDR_CONFIRM ){
	MOVF	r0x00, W
	XORLW	0x81
	BNZ	_00142_DS_
;	.line	104; ../../RF24Mesh_cg.c	RF24NetworkHeader * header = (RF24NetworkHeader*)RF24N_getFrame_buffer();
	CALL	_RF24N_getFrame_buffer
	MOVWF	r0x01
	MOVFF	PRODL, r0x02
	MOVFF	PRODH, r0x03
	MOVF	r0x03, W
	MOVWF	r0x03
	MOVF	r0x02, W
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	r0x01
;	.line	105; ../../RF24Mesh_cg.c	if(header->from_node == mesh.lastAddress){
	MOVFF	r0x01, FSR0L
	MOVFF	r0x02, PRODL
	MOVF	r0x03, W
	CALL	__gptrget2
	MOVWF	r0x01
	MOVFF	PRODL, r0x02
	MOVFF	(_mesh + 19), r0x03
	MOVFF	(_mesh + 20), r0x04
	MOVF	r0x01, W
	XORWF	r0x03, W
	BNZ	_00198_DS_
	MOVF	r0x02, W
	XORWF	r0x04, W
	BZ	_00199_DS_
_00198_DS_:
	BRA	_00142_DS_
_00199_DS_:
	BANKSEL	(_mesh + 17)
;	.line	106; ../../RF24Mesh_cg.c	RF24M_setAddress(mesh.lastID,mesh.lastAddress);
	MOVF	(_mesh + 17), W, B
	MOVWF	r0x01
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_RF24M_setAddress
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
_00142_DS_:
;	.line	113; ../../RF24Mesh_cg.c	return type;
	MOVF	r0x00, W
_00146_DS_:
	MOVFF	PREINC1, r0x0d
	MOVFF	PREINC1, r0x0c
	MOVFF	PREINC1, r0x0b
	MOVFF	PREINC1, r0x0a
	MOVFF	PREINC1, r0x09
	MOVFF	PREINC1, r0x08
	MOVFF	PREINC1, r0x07
	MOVFF	PREINC1, r0x06
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_RF24Mesh_cg__RF24M_begin	code
_RF24M_begin:
;	.line	36; ../../RF24Mesh_cg.c	uint8_t RF24M_begin( uint8_t channel, rf24_datarate_e data_rate, uint32_t timeout){
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
	MOVFF	r0x03, POSTDEC1
	MOVFF	r0x04, POSTDEC1
	MOVFF	r0x05, POSTDEC1
	MOVLW	0x03
	MOVFF	PLUSW2, r0x00
	MOVLW	0x04
	MOVFF	PLUSW2, r0x01
	MOVLW	0x05
	MOVFF	PLUSW2, r0x02
	MOVLW	0x06
	MOVFF	PLUSW2, r0x03
	MOVLW	0x07
	MOVFF	PLUSW2, r0x04
	MOVLW	0x08
	MOVFF	PLUSW2, r0x05
;	.line	38; ../../RF24Mesh_cg.c	RF24_begin();
	CALL	_RF24_begin
;	.line	39; ../../RF24Mesh_cg.c	mesh.radio_channel = channel;
	MOVF	r0x00, W
	BANKSEL	(_mesh + 16)
	MOVWF	(_mesh + 16), B
;	.line	40; ../../RF24Mesh_cg.c	RF24_setChannel(mesh.radio_channel);
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24_setChannel
	MOVF	POSTINC1, F
;	.line	41; ../../RF24Mesh_cg.c	RF24_setDataRate(data_rate);  
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	CALL	_RF24_setDataRate
	MOVF	POSTINC1, F
;	.line	42; ../../RF24Mesh_cg.c	RF24N_setReturnSysMsgs(); 
	CALL	_RF24N_setReturnSysMsgs
;	.line	45; ../../RF24Mesh_cg.c	if(RF24M_getNodeID(MESH_BLANK_ID)){ //Not master node
	MOVLW	0xff
	MOVWF	POSTDEC1
	MOVLW	0xff
	MOVWF	POSTDEC1
	CALL	_RF24M_getNodeID
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BZ	_00113_DS_
;	.line	46; ../../RF24Mesh_cg.c	mesh.mesh_address = MESH_DEFAULT_ADDRESS;
	MOVLW	0x24
	BANKSEL	(_mesh + 1)
	MOVWF	(_mesh + 1), B
	MOVLW	0x09
	BANKSEL	(_mesh + 2)
	MOVWF	(_mesh + 2), B
;	.line	47; ../../RF24Mesh_cg.c	if(!RF24M_renewAddress(timeout)){
	MOVF	r0x05, W
	MOVWF	POSTDEC1
	MOVF	r0x04, W
	MOVWF	POSTDEC1
	MOVF	r0x03, W
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	CALL	_RF24M_renewAddress
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVLW	0x04
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	IORWF	r0x01, W
	BNZ	_00114_DS_
;	.line	48; ../../RF24Mesh_cg.c	return 0;
	CLRF	WREG
	BRA	_00115_DS_
_00113_DS_:
;	.line	52; ../../RF24Mesh_cg.c	mesh.addrList = (addrListStruct*)malloc(2 * sizeof(addrListStruct));
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x06
	MOVWF	POSTDEC1
	CALL	_malloc
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
	MOVF	r0x02, W
	MOVWF	r0x02
	MOVF	r0x01, W
	MOVWF	r0x01
	MOVF	r0x00, W
	MOVWF	r0x00
	MOVF	r0x00, W
	BANKSEL	(_mesh + 3)
	MOVWF	(_mesh + 3), B
	MOVF	r0x01, W
	BANKSEL	(_mesh + 4)
	MOVWF	(_mesh + 4), B
	MOVF	r0x02, W
	BANKSEL	(_mesh + 5)
	MOVWF	(_mesh + 5), B
	BANKSEL	(_mesh + 6)
;	.line	53; ../../RF24Mesh_cg.c	mesh.addrListTop = 0;
	CLRF	(_mesh + 6), B
;	.line	54; ../../RF24Mesh_cg.c	RF24M_loadDHCP();
	CALL	_RF24M_loadDHCP
	BANKSEL	(_mesh + 1)
;	.line	56; ../../RF24Mesh_cg.c	mesh.mesh_address = 0;
	CLRF	(_mesh + 1), B
	BANKSEL	(_mesh + 2)
	CLRF	(_mesh + 2), B
	BANKSEL	(_mesh + 2)
;	.line	57; ../../RF24Mesh_cg.c	RF24N_begin(mesh.mesh_address);
	MOVF	(_mesh + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_mesh + 1)
	MOVF	(_mesh + 1), W, B
	MOVWF	POSTDEC1
	CALL	_RF24N_begin
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
_00114_DS_:
;	.line	60; ../../RF24Mesh_cg.c	return 1;
	MOVLW	0x01
_00115_DS_:
	MOVFF	PREINC1, r0x05
	MOVFF	PREINC1, r0x04
	MOVFF	PREINC1, r0x03
	MOVFF	PREINC1, r0x02
	MOVFF	PREINC1, r0x01
	MOVFF	PREINC1, r0x00
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	

; ; Starting pCode block
S_RF24Mesh_cg__RF24M_init	code
_RF24M_init:
;	.line	29; ../../RF24Mesh_cg.c	void RF24M_init(void)
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
;	.line	31; ../../RF24Mesh_cg.c	}
	MOVFF	PREINC1, FSR2L
	MOVFF	PREINC1, FSR2H
	RETURN	



; Statistics:
; code size:	 7374 (0x1cce) bytes ( 5.63%)
;           	 3687 (0x0e67) words
; udata size:	  100 (0x0064) bytes ( 2.60%)
; access size:	   21 (0x0015) bytes


	end
