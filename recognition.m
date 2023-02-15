clc;
clear all;
close all;
r = audiorecorder(22050, 16, 1);
record(r);     % speak into microphone...
pause(r);
p = play(r);   % listen
resume(r);     % speak again
stop(r);
p = play(r);   % listen to complete recording
mySpeech = getaudiodata(r, 'int16'); % get data as int16 array
%find the closest feature
load database
D = [];
for(i=1:size(F,1))
    d=sum(abs(F(i)-f));
    D=[D,d];
end
%smallest distance
sm=imf;
ind= -1;
for(i=1:length(D))
    if(D(i)<sm)
        sm=D(i);
        ind=i;
    end
end
detected_class=c(ind);
disp('the detected class is :');
detected_class
