#include "xc8_config.h"
#include"config_pic.h"


void setup(void);
void loop(void);

#define _T0 65536l-(_XTAL_FREQ/4000l) 
#define _T0H  (_T0&0xFF00)>>8 
#define _T0L  (_T0&0x00FF) 

#ifdef __XC8
void interrupt isr(void)
#else
void isr(void) __shadowregs __interrupt 1
#endif
{
    if(INTCONbits.TMR0IF)
    {
        TMR0H=_T0H; 
        TMR0L=_T0L; //1000ms=1us*1*(65536-3036)
        mtime++;
        INTCONbits.TMR0IF=0;
    }

}



void main()
{
    mtime=0;
    //Configura TMR0
    T0CONbits.T08BIT=0;
    T0CONbits.T0CS=0;
    T0CONbits.PSA=1;
    //T0CONbits.T0PS2=0;//divide por 16
    //T0CONbits.T0PS1=0;
    //T0CONbits.T0PS0=1;
    TMR0H=_T0H; 
    TMR0L=_T0L; 
    INTCONbits.TMR0IF=0;
    INTCONbits.GIE = 1;
    INTCONbits.TMR0IE = 1;
    T0CONbits.TMR0ON=1;

    setup();
    
            
    while(1)
    {
        loop();
    }

}

