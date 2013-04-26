/* GPIO and GPIO Interrupt Initialization */
void GPIOInit() {
 
    /* Enable AHB clock to the GPIO domain. */
  LPC_SYSCON->SYSAHBCLKCTRL |= (1<<6);
  
  /* Enable JTAG */ 
  LPC_IOCON->R_PIO1_1  &= ~0x07;
  LPC_IOCON->R_PIO1_1  |= 0x01;
  
  /* Enable 1 and 2 as interupts */
  NVIC_EnableIRQ(EINT1_IRQn);
  NVIC_EnableIRQ(EINT2_IRQn);
 
}
