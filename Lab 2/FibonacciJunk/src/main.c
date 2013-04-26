#include "driver_config.h"
#include "target_config.h"

#include "gpio.h"
#include "timer32.h"

extern int fibonacci(int nn);

int fibEasy(int nn)
{
	if(nn == 1 || nn == 2)
	{
		return 1;
	}
	else if (nn < 1)
	{
		return 0;
	}
	else if(nn > 10)
	{
		return fibEasy(nn-1) - fibEasy(nn-2);
	}
	else if(nn <= 10)
	{
		return fibEasy(nn-1) + fibEasy(nn-2);
	}
	return 0;
}

int makePositive(int in)
{
	if(in<0)
	{
		return in*-1;
	}
	else
	{
		return in;
	}
}

void flashLight(int timeMS, int OnOrOff)
{

}

void displayHex(int in)
{
	int hex[8];
	int count = 0;
	if(in == 0)
	{
		displayDigit(0);
		return;
	}
	while(in > 0)
	{
		hex[count++] = in % 16;
		in /= 16;
	}
	while (count > 0)
	{
		displayDigit(hex[--count]);
		flashLight(500, 0);
	}
}

int getBit(uint8_t input, int location)
{
	input = input >> location;
	input = input << (7);
	return input != 0;
}

void flashHex(uint8_t pattern, uint8_t length)
{
	int ii;
	for(ii = 0; ii < length; ii++)
	{
		if(getBit(pattern, ii) == 0)
		{
			flashLight(100, 1);
			// Short
		}
		else if (getBit(pattern, ii) == 1)
		{
			flashLight(400, 1);
			// Long
		}
		flashLight(100, 0);
		//Turn off and Delay
	}
}

static const uint8_t hexToMorLUT[16] =
{
	   // FCPBAGED
		0b00011111, // 0
		0b00001111, // 1
		0b00000111, // 2
		0b00000011, // 3
		0b00000001, // 4
		0b00000000, // 5
		0b00010000, // 6
		0b00011000, // 7
		0b00011100, // 8
		0b00011110, // 9
		0b00000001, // a
		0b00001000, // b
		0b00001010, // c
		0b00000100, // d
		0b00000000, // e
		0b00000010, // f
};

static const uint8_t morLengthLUT[10] =
{
	   // FCPBAGED
		5, // 0
		5, // 1
		5, // 2
		5, // 3
		5, // 4
		5, // 5
		5, // 6
		5, // 7
		5, // 8
		5, // 9
		2, // a
		4,// b
		4, // c
		3, // d
		1, // e
		4, // f
};

void displayDigit(int digit)
{
	flashHex(hexToMorLUT[digit], morLengthLUT[digit]);
}

void initLED()
{
	  /* Initialize GPIO (sets up clock) */
	  GPIOInit();
	  /* Set LED port pin to output */
	  GPIOSetDir( LED_PORT, LED_BIT, 1 );
}

int main(void) {

	initLED();
	int nn = 20;
	int fibOutEasy = fibEasy(nn);

	int fibOut = fibonacci(nn);

	int absFib = makePositive(fibOut);
	displayHex(absFib);
	//if(fibOutEasy != fibOut);

	return 0;
}
