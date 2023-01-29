%% Matlab Code
% freqs = [300 400 500 600];
% freqs = [220.00 246.94 261.63 293.66 329.63 349.23 392.00];
% freqs = [261.63 392.00 329.63 349.23 392.00 0 0];
f1 = 300;
f2 = 250;
f3 = 400;
f4 = 430;
% freqs = [f1 f1*1.25 f2 f2*1.25 f3 f3*1.25 f4 f4*1.25];
freqs = [350 350*1.1224 370 f2*1.25 f3 f3*1.25 f4 f4*1.25];
% amps = [9 1 1 0 3 4 5;
%         3 2 6 1 0 0 0;
%         0 9 1 2 6 6 0];
% amps = [0 9 1 0 8 0 0;
%         6 0 3 0 0 4 0;
%         1 0 0 0 2 0 8];
% amps = [0 6 1 0 8 0 3];
amps = [9 9 0 0 0 0 0 0];
amps = amps/10;
R = height(amps);
N = width(amps);
durs = 1;
% Fs = 22050;
Fs = 48000;
t=0:1/Fs:1;
x = [];
for rr = 1:R
 ttemp = 0:1/Fs:durs;
 xtemp = zeros(size(ttemp));
 for ii = 1:N
  xtemp = xtemp + amps(rr,ii)*sin(2*pi*freqs(ii)*ttemp);
 end
 x = [x xtemp];
end
soundsc(x, Fs);
% audiowrite('A.mp4', x, Fs);
