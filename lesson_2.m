% TODO : Find the Bsweep of chirp for 1 m resolution
maxRange=300;
rangeResolution=1;
c= 3*10^8;

%d_res = c/2*Bsweep
Bsweep= c / (2*rangeResolution);
disp(Bsweep);

% TODO : Calculate the chirp time based on the Radar's Max Range

%Range= c*Ts*fb / (2* Bsweep)
%for max range, we assume fb = Bsweep/5.5
%so Ts= 5.5*2* maxRange / c
Ts= 5.5*2*maxRange/ c;
disp(Ts);

% TODO : define the frequency shifts 
freqencyShift = [0, 1.1e6, 13e6, 24e6];
calculated_range= c*freqencyShift*Ts/(2*Bsweep);

% Display the calculated range
disp(calculated_range);