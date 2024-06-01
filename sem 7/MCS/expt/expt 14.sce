/*An aircraft is heading towards a control tower with 500 kmph at an elevation of 20 degree. 
The communication between the aircraft tower and the plane takes place at f= 900MHz.
Determine the expected doppler shift of the recieved signal*/

clc
clear all
format('v',20)
fc = 900 * 10^6 //Hz
disp("The given cut-off frequency is (Hz) ", fc)

v_kmph = 500
// converting to m/s
v = v_kmph * (1000/3600)
disp("The given velocity of aircraft in m/s is ", v)

theta = 20 
disp("The given elevation is ", theta)

c = 3 * 10^8 //speed of light in m/s

lambda = c/fc

fd = (v/lambda) * cosd(theta)
disp("The doppler frequency is (Hz) ", fd)

// moving towards the tower
f = fc + fd
disp("The doppler shift of recieved frequency is (Hz) ",f)

