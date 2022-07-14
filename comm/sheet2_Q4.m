#scaling time domain
dt = 0.001;
T  = 100 ;
N  = T/dt;
t  = [0:dt:dt*(N-1)];

#scaling frequency domain 
fs = 1/dt;
df = 1/(N*dt)
if (rem(N,2)==0) 
  f=- (0.5 * fs) : df : (0.5*fs - df) ; 
else 
  f=- (0.5*fs-0.5*df) : df : (0.5*fs -0.5*df);
end

%defining m(t) = Jo(t) cos(2£k10t) & plotting
figure(1);
m = besselj(0,t) .* cos(2*pi*10*t);
plot(t,m);
xlabel("t");
ylabel("m(t)");


%plotting M(f)
figure(2);
M = fftshift(fft(m))/dt;
plot(f,M);
xlabel("f");
ylabel("M(f)");

#finding BW of %99 of total energy
E_f = sum(abs(M).^2)*df;
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

%signal modulating
fc = 200;
c = sin(2*pi*fc*t);
s = m.*c;
S = fftshift(fft(s))*dt;
H = zeros(1,length(f));
H(find(f==fc):length(f))=1;
S_filtered= S.*H;
figure(3);
plot(f,abs(S_filtered));
xlabel("f");
ylabel("S_filtered");

figure(3);
plot(f,abs(S_filtered));
xlabel("f");
ylabel("S_filtered");


%reciever
%plotting detected spectrum
