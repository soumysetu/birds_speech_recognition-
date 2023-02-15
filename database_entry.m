clear all;
close all;
clc;
% create recorded object
recorder = audiorecorder(16000,8,2);
disp('record bird voice');
drawnow();
pause(1);
recordlocking(recorder,5);
play(recorder);
data = getaudiodata(recorder);
plot(data)
figure;
% feature extraction
f = voicefeatures(data);
%save voice data
uno = input('enter the bird name :');
try
    load database
    F = [F;f];
    C = [c;uno];
    save database;
catch
    F =f;
    C = uno;
    save database F C
end
magbox('the voice sample is registered')
