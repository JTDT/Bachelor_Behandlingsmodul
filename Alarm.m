function[valueColor, frekvens] = Alarm(alarmState)
% forklarende tekst 
%% Hen lydfil der skal afspilles som alarm
[y, Fs] = audioread('alarmMedPause.wav');
player = audioplayer(y, Fs);

%% Play alarm for HR
alarmState = true;
% spil lydfil
while alarmState == true    
    playblocking(player);   
    
end
% s�t farve til r�d
% blinkende frekvens til 2 Hz
% Arbejdscyklus: 50% 
%% Play alarm for SpO2
% spil lydfil


%% Play alarm for temp
% spil lydfil

%% mute alarm
% symbol
% m�ske denne skal ind i main appen??