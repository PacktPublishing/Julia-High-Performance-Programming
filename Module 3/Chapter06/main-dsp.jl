using DSP, Distributions

t = linspace(0,5pi,512);
x1 = sin(t);
x2 = 0.4*cos(4t);
x3 = 0.2*cos(8t);
x = x1 + x2 + x3;

responsetype = Lowpass(0.2)
prototype = Elliptic(4, 0.5, 30)
tf = convert(TFFilter, digitalfilter(responsetype, prototype))
numerator_coefs   = coefb(tf)
denominator_coefs = coefa(tf)

responsetype = Bandpass(10, 40; fs=1000)
prototype = Butterworth(4)
xb = filt(digitalfilter(responsetype, prototype), x);

using Winston
plot(xb)
