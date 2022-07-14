#given vars
fc = 10e3;
fm = 100;

#scaling time domain 
dt = 0.000001;
N  = 20e3; 
t  = [0:dt:(N-1)*dt];

#plotting modulatied signal
m = sin(2*pi*fm*t);
c = sin(2*pi*fc*t);
s = m .* c;
figure(1);
plot(t,s);grid on;
title("modulated signal" , "fontsize",20);

#plotting signal after product modulator
pm = s .* c;
figure(2);
plot(t,pm);grid on;
title("product modulated signal" , "fontsize",20);

#scaling frequency domain
fs = 1 / dt;
df = 1 / (N*dt);
f  = [-0.5*fs:df:0.5*fs-df];

#plotting spectrum after product modulator
ffpm = fft(pm);
ffpms = fftshift(ffpm)/N;
figure(3);
plot(f,abs(ffpms));grid on;
title("product modulated spectrum" , "fontsize",20);

#plotting spectrum after lpf
H = zeros(1, length(f));
H(length(f)/2-200:length(f)/2+200)=ones(1,401);
figure(4);
lpf_ffpms = ffpms.*H;
plot(f,abs(lpf_ffpms));grid on;
title("spectrum after lpf" , "fontsize",20);

#plotting signal after lpf vs baseband
lpf_ffpm = ifftshift(lpf_ffpms*N);
lpf_pm   = ifft(lpf_ffpm);
figure(4);
plot(t,lpf_pm);grid on;
hold on
plot(t,m,"--r");
hold off
title("signal after lpf vs baseband" , "fontsize",20);
legend("signal after lpf","baseband");