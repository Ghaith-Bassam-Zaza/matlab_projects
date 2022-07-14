#given vars
fm = 100
fc = 10e3

#scalling time domain
dt = 0.000001;
N  = 20e3;
t  = [0 : dt : (N-1)*dt];

#ploting  basband signal
m = sin(2*pi*fm*t);
figure(1);
plot(t,m);grid on;
title("baseband signal","fontsize",20);

#plotting  carrier
c = sin(2*pi*fc*t);
figure(2);
plot(t,c);grid on;
title("carrirer signal","fontsize",20);

#plotting modulated signal
s = m.*c;
figure(3);
plot(t,s);
plot(t,s);grid on;
title("modulated signal","fontsize",20);

#scaling frequency domain 
fs = 1/dt;
df = 1/(N*dt);
f  = [(-0.5*fs):df:(0.5*fs-df)];

#ploting baseband spectrum
ffm = fft(m);
ffms = fftshift(ffm)/N;
figure(4);
plot(f,abs(ffms));grid on;
title("baseband spectrum","fontsize",20);

#ploting carrier spectrum
ffc = fft(c);
ffcs = fftshift(ffc)/N;
figure(5);
plot(f,abs(ffcs));grid on;
title("carrier spectrum","fontsize",20);

#ploting modulated spectrum
ffs = fft(s);
ffss = fftshift(ffs)/N;
figure(6);
plot(f,abs(ffss));grid on;
title("modulated spectrum","fontsize",20);
