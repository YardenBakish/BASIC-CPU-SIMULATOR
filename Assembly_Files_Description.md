# CPU-Simulator

### The project includes the following Assembly Files:

1. **mulmat.asm** - The program performs 4x4 matrix multiplication. The input values of the first matrix are set in addresses 0x100 to 0x10F, and the second matrix in 0x110 to 0x11F. the output will be written to addresses 0x120 to 0x12F. each matrix' values is stored by increasing line order, from left to right
2. **bubble.asm** - The program performs bubble sort. The array's input values are stored in addresses 1024-1039
3.  **binom.asm** - Calculates the binomial coefficient recursively, according to the following algorithm:
```python
int binom(n, k)
{
if (k == 0 || n == k)
return 1;
return binom(n-1, k-1) + binom(n-1, k)
}

```
4. **leds.asm** - The program periodically turns on the first LED, then the second and so on until all of the LEDs are turned on
5. **circle.asm** - the program draws a full white circle on the screen (represented by the screen. txt file). the center will be at (175, 143) and the radius is set in in 0x100 
6. **disktest.asm** - Calculate bitwise-XOR of the 0-3 sectors in the Hard-Disk and outputs the result in sector 4

NOTE: To clarify, the value of the input arguments provided in the assembly files are entirely up to you! Feel free to change them however you like. In The files supplied to this project, initial values are set for convenience
