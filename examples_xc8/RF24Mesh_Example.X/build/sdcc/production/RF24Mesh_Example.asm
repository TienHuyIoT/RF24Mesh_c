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
	global	_displayTimer
	global	_setup
	global	_loop

;--------------------------------------------------------
; extern variables in this module
;--------------------------------------------------------
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
	extern	_stdin
	extern	_stdout
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
	extern	_millis
	extern	_RF24_init
	extern	_RF24N_init
	extern	_RF24N_available
	extern	_RF24N_read
	extern	_RF24M_init
	extern	_RF24M_begin
	extern	_RF24M_update
	extern	_RF24M_write
	extern	_RF24M_setNodeID
	extern	_RF24M_checkConnection
	extern	_RF24M_renewAddress
	extern	_Serial_begin
	extern	_Serial_print
	extern	_Serial_println
	extern	_itoa_

;--------------------------------------------------------
;	Equates to used internal registers
;--------------------------------------------------------
STATUS	equ	0xfd8
FSR0L	equ	0xfe9
FSR1L	equ	0xfe1
FSR1H	equ	0xfe2
FSR2L	equ	0xfd9
FSR2H	equ	0xfda
POSTINC1	equ	0xfe6
POSTDEC1	equ	0xfe5
PREINC1	equ	0xfe4
PRODL	equ	0xff3
PRODH	equ	0xff4


	idata
_displayTimer	db	0x00, 0x00, 0x00, 0x00


; Internal registers
.registers	udata_ovr	0x0000
r0x00	res	1
r0x01	res	1
r0x02	res	1
r0x03	res	1
r0x04	res	1
r0x05	res	1

udata_RF24Mesh_Example_0	udata
_loop_header_2_206	res	8

udata_RF24Mesh_Example_1	udata
_loop_payload_2_206	res	8

;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
; I code from now on!
; ; Starting pCode block
S_RF24Mesh_Example__loop	code
_loop:
;	.line	59; RF24Mesh_Example.c	void loop() {
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
;	.line	61; RF24Mesh_Example.c	RF24M_update();
	CALL	_RF24M_update
;	.line	64; RF24Mesh_Example.c	if (millis() - displayTimer >= 1000) {
	CALL	_millis
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVFF	FSR0L, r0x03
	BANKSEL	_displayTimer
	MOVF	_displayTimer, W, B
	SUBWF	r0x00, F
	BANKSEL	(_displayTimer + 1)
	MOVF	(_displayTimer + 1), W, B
	SUBWFB	r0x01, F
	BANKSEL	(_displayTimer + 2)
	MOVF	(_displayTimer + 2), W, B
	SUBWFB	r0x02, F
	BANKSEL	(_displayTimer + 3)
	MOVF	(_displayTimer + 3), W, B
	SUBWFB	r0x03, F
	MOVLW	0x00
	SUBWF	r0x03, W
	BNZ	_00138_DS_
	MOVLW	0x00
	SUBWF	r0x02, W
	BNZ	_00138_DS_
	MOVLW	0x03
	SUBWF	r0x01, W
	BNZ	_00138_DS_
	MOVLW	0xe8
	SUBWF	r0x00, W
_00138_DS_:
	BTFSS	STATUS, 0
	BRA	_00118_DS_
;	.line	65; RF24Mesh_Example.c	displayTimer = millis();
	CALL	_millis
	BANKSEL	_displayTimer
	MOVWF	_displayTimer, B
	MOVFF	PRODL, (_displayTimer + 1)
	MOVFF	PRODH, (_displayTimer + 2)
	MOVFF	FSR0L, (_displayTimer + 3)
;	.line	68; RF24Mesh_Example.c	if (!RF24M_write(&displayTimer, 'M', sizeof(displayTimer),0)) {
	MOVLW	HIGH(_displayTimer)
	MOVWF	r0x01
	MOVLW	LOW(_displayTimer)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x04
	MOVWF	POSTDEC1
	MOVLW	0x4d
	MOVWF	POSTDEC1
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_RF24M_write
	MOVWF	r0x00
	MOVLW	0x07
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x00, W
	BNZ	_00114_DS_
;	.line	71; RF24Mesh_Example.c	if ( ! RF24M_checkConnection() ) {
	CALL	_RF24M_checkConnection
	MOVWF	r0x00
	MOVF	r0x00, W
	BNZ	_00111_DS_
;	.line	73; RF24Mesh_Example.c	Serial_println("Renewing Address");
	MOVLW	UPPER(___str_1)
	MOVWF	r0x02
	MOVLW	HIGH(___str_1)
	MOVWF	r0x01
	MOVLW	LOW(___str_1)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Serial_println
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	74; RF24Mesh_Example.c	RF24M_renewAddress(MESH_RENEWAL_TIMEOUT);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0xea
	MOVWF	POSTDEC1
	MOVLW	0x60
	MOVWF	POSTDEC1
	CALL	_RF24M_renewAddress
	MOVLW	0x04
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	BRA	_00118_DS_
_00111_DS_:
;	.line	76; RF24Mesh_Example.c	Serial_println("Send fail, Test OK");
	MOVLW	UPPER(___str_2)
	MOVWF	r0x02
	MOVLW	HIGH(___str_2)
	MOVWF	r0x01
	MOVLW	LOW(___str_2)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Serial_println
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	BRA	_00118_DS_
_00114_DS_:
;	.line	79; RF24Mesh_Example.c	Serial_print("Send OK: "); Serial_println(itoa_(displayTimer));
	MOVLW	UPPER(___str_3)
	MOVWF	r0x02
	MOVLW	HIGH(___str_3)
	MOVWF	r0x01
	MOVLW	LOW(___str_3)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Serial_print
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	BANKSEL	(_displayTimer + 3)
	MOVF	(_displayTimer + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_displayTimer + 2)
	MOVF	(_displayTimer + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_displayTimer + 1)
	MOVF	(_displayTimer + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_displayTimer
	MOVF	_displayTimer, W, B
	MOVWF	POSTDEC1
	CALL	_itoa_
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVLW	0x04
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Serial_println
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
_00118_DS_:
;	.line	83; RF24Mesh_Example.c	while (RF24N_available()) {
	CALL	_RF24N_available
	MOVWF	r0x00
	MOVF	r0x00, W
	BTFSC	STATUS, 2
	BRA	_00121_DS_
;	.line	86; RF24Mesh_Example.c	RF24N_read( &header, &payload, sizeof(payload));
	MOVLW	HIGH(_loop_header_2_206)
	MOVWF	r0x01
	MOVLW	LOW(_loop_header_2_206)
	MOVWF	r0x00
	MOVLW	0x80
	MOVWF	r0x02
	MOVLW	HIGH(_loop_payload_2_206)
	MOVWF	r0x04
	MOVLW	LOW(_loop_payload_2_206)
	MOVWF	r0x03
	MOVLW	0x80
	MOVWF	r0x05
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x08
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
	CALL	_RF24N_read
	MOVLW	0x08
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	87; RF24Mesh_Example.c	Serial_print("Received packet #");
	MOVLW	UPPER(___str_4)
	MOVWF	r0x02
	MOVLW	HIGH(___str_4)
	MOVWF	r0x01
	MOVLW	LOW(___str_4)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Serial_print
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	BANKSEL	(_loop_payload_2_206 + 7)
;	.line	88; RF24Mesh_Example.c	Serial_print(itoa_(payload.counter));
	MOVF	(_loop_payload_2_206 + 7), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_loop_payload_2_206 + 6)
	MOVF	(_loop_payload_2_206 + 6), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_loop_payload_2_206 + 5)
	MOVF	(_loop_payload_2_206 + 5), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_loop_payload_2_206 + 4)
	MOVF	(_loop_payload_2_206 + 4), W, B
	MOVWF	POSTDEC1
	CALL	_itoa_
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVLW	0x04
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Serial_print
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	89; RF24Mesh_Example.c	Serial_print(" at ");
	MOVLW	UPPER(___str_5)
	MOVWF	r0x02
	MOVLW	HIGH(___str_5)
	MOVWF	r0x01
	MOVLW	LOW(___str_5)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Serial_print
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	BANKSEL	(_loop_payload_2_206 + 3)
;	.line	90; RF24Mesh_Example.c	Serial_println(itoa_(payload.ms));
	MOVF	(_loop_payload_2_206 + 3), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_loop_payload_2_206 + 2)
	MOVF	(_loop_payload_2_206 + 2), W, B
	MOVWF	POSTDEC1
	BANKSEL	(_loop_payload_2_206 + 1)
	MOVF	(_loop_payload_2_206 + 1), W, B
	MOVWF	POSTDEC1
	BANKSEL	_loop_payload_2_206
	MOVF	_loop_payload_2_206, W, B
	MOVWF	POSTDEC1
	CALL	_itoa_
	MOVWF	r0x00
	MOVFF	PRODL, r0x01
	MOVFF	PRODH, r0x02
	MOVLW	0x04
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Serial_println
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
	BRA	_00118_DS_
_00121_DS_:
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
S_RF24Mesh_Example__setup	code
_setup:
;	.line	41; RF24Mesh_Example.c	void setup() {
	MOVFF	FSR2H, POSTDEC1
	MOVFF	FSR2L, POSTDEC1
	MOVFF	FSR1H, FSR2H
	MOVFF	FSR1L, FSR2L
	MOVFF	r0x00, POSTDEC1
	MOVFF	r0x01, POSTDEC1
	MOVFF	r0x02, POSTDEC1
;	.line	43; RF24Mesh_Example.c	RF24_init(36,35);
	MOVLW	0x23
	MOVWF	POSTDEC1
	MOVLW	0x24
	MOVWF	POSTDEC1
	CALL	_RF24_init
	MOVF	POSTINC1, F
	MOVF	POSTINC1, F
;	.line	44; RF24Mesh_Example.c	RF24N_init();
	CALL	_RF24N_init
;	.line	45; RF24Mesh_Example.c	RF24M_init(); 
	CALL	_RF24M_init
;	.line	47; RF24Mesh_Example.c	Serial_begin(115200);
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x01
	MOVWF	POSTDEC1
	MOVLW	0xc2
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	CALL	_Serial_begin
	MOVLW	0x04
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	50; RF24Mesh_Example.c	RF24M_setNodeID(nodeID);    
	MOVLW	0x01
	MOVWF	POSTDEC1
	CALL	_RF24M_setNodeID
	MOVF	POSTINC1, F
;	.line	52; RF24Mesh_Example.c	Serial_println(F("Connecting to the mesh..."));
	MOVLW	UPPER(___str_0)
	MOVWF	r0x02
	MOVLW	HIGH(___str_0)
	MOVWF	r0x01
	MOVLW	LOW(___str_0)
	MOVWF	r0x00
	MOVF	r0x02, W
	MOVWF	POSTDEC1
	MOVF	r0x01, W
	MOVWF	POSTDEC1
	MOVF	r0x00, W
	MOVWF	POSTDEC1
	CALL	_Serial_println
	MOVLW	0x03
	ADDWF	FSR1L, F
	BTFSC	STATUS, 0
	INCF	FSR1H, F
;	.line	53; RF24Mesh_Example.c	RF24M_begin(MESH_DEFAULT_CHANNEL, RF24_1MBPS, MESH_RENEWAL_TIMEOUT );
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0xea
	MOVWF	POSTDEC1
	MOVLW	0x60
	MOVWF	POSTDEC1
	MOVLW	0x00
	MOVWF	POSTDEC1
	MOVLW	0x61
	MOVWF	POSTDEC1
	CALL	_RF24M_begin
	MOVLW	0x06
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
___str_0:
	DB	0x43, 0x6f, 0x6e, 0x6e, 0x65, 0x63, 0x74, 0x69, 0x6e, 0x67, 0x20, 0x74
	DB	0x6f, 0x20, 0x74, 0x68, 0x65, 0x20, 0x6d, 0x65, 0x73, 0x68, 0x2e, 0x2e
	DB	0x2e, 0x00
; ; Starting pCode block
___str_1:
	DB	0x52, 0x65, 0x6e, 0x65, 0x77, 0x69, 0x6e, 0x67, 0x20, 0x41, 0x64, 0x64
	DB	0x72, 0x65, 0x73, 0x73, 0x00
; ; Starting pCode block
___str_2:
	DB	0x53, 0x65, 0x6e, 0x64, 0x20, 0x66, 0x61, 0x69, 0x6c, 0x2c, 0x20, 0x54
	DB	0x65, 0x73, 0x74, 0x20, 0x4f, 0x4b, 0x00
; ; Starting pCode block
___str_3:
	DB	0x53, 0x65, 0x6e, 0x64, 0x20, 0x4f, 0x4b, 0x3a, 0x20, 0x00
; ; Starting pCode block
___str_4:
	DB	0x52, 0x65, 0x63, 0x65, 0x69, 0x76, 0x65, 0x64, 0x20, 0x70, 0x61, 0x63
	DB	0x6b, 0x65, 0x74, 0x20, 0x23, 0x00
; ; Starting pCode block
___str_5:
	DB	0x20, 0x61, 0x74, 0x20, 0x00


; Statistics:
; code size:	  944 (0x03b0) bytes ( 0.72%)
;           	  472 (0x01d8) words
; udata size:	   16 (0x0010) bytes ( 0.42%)
; access size:	    6 (0x0006) bytes


	end
