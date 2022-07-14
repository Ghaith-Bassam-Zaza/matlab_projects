#scaling time domain
dt = 0.01;
N  = 10000;
t  = [0:dt:dt*(N-1)];

#PLOTTING BESSEL FUNCTION [0,10]
m = besselj(0,t);
m(10/dt+1:length(m))=zeros(1,length(m)-10/dt);
figure(1)
plot(t,m);grid on;
title("m(t)=j0(t) in 0<t<10 , 0 otherwise", "fontsize",20);

#scaling frequency domain 
fs = 1/dt;
df = 1/(N*dt)
if (rem(N,2)==0) 
  f=- (0.5 * fs) : df : (0.5*fs - df) ; 
else 
  f=- (0.5*fs-0.5*df) : df : (0.5*fs -0.5*df);
end

#STEMMING FUNCTION IN FREQUENCY DOMAIN
M = fftshift(fft(m))*dt;
figure(2)
stem(f,abs(M));
title("M(f)","fontsize",20);

#Verifying Parseval¡¦s law
E_t = sum(m.^2)*dt;
E_f = sum(abs(M).^2)*df;
fprintf("Energy in time domain = %f , Energy in frequency domain = %f\n",E_t,E_f);

#finding BW of %99 of total energy
index= find(f==0);
BW = 0;
p_acc=0;
for i = index : length(f)
  p_acc = (abs(M(i)).^2)*df +p_acc;
  if p_acc >= 0.99*E_f*0.5
    BW = f(i) ;
    break
  endif
  
end   

fprintf("BW of 99 of total energy = %f\n",BW);


%choosing fc and ka
ka = -1/min(m); %1+ka*m>0 @all time
fc = 2*BW; %any frequency > BW

%plot AM signal to ensure no distortion
c = sin(2*pi*fc*t);
AM = 1+ ka*m;
s= AM.*c;
figure(3);
plot(t,AM);
title("AM signal (envelope)","fontsize",20);

%plot time domain signal s(t)
figure(4);
plot(t,s);
title("time domain signal s(t)","fontsize",20);

%plotting spectrum
figure(5);
S = fftshift(fft(s))*dt;
plot(f,abs(S));

%plotting spectrum
figure(6)
g = hilbert(s);
plot(t,abs(g));
hold on 
plot(t,m);
hold on
plot(t,AM);
legend("recieved signal","massage","modulated massage");