function Alarm(alarmState)
% forklarende tekst 
%global player; % skal variabel være global ?
%% Hent lydfil der skal afspilles som alarm
% [y, Fs] = audioread('alarmMedPause.wav');
% player = audioplayer(y, Fs);

%% Play alarm for HR
%alarmState = false;
% spil lydfil
if alarmState == false
    %playblocking(player).stop;
    %stop(player);
    clear player;
end
playblocking(player); 
% while alarmState == true    
%     %play(player);      
%     
% end
% sæt farve til rød
%valueColor = "red";
% blinkende frekvens til 2 Hz
% frekvens = 2;
% Arbejdscyklus: 50% 
%% Play alarm for SpO2
% spil lydfil


%% Play alarm for temp
% spil lydfil

%% mute alarm
% måske denne skal ind i main appen??
%alarmState = "pause";
%if alarmState == "pause"
    % Vis symbol -> gøres i mainappen??
%    pause(5);
%    Alarm(true);
    % fjern symbol
%end
end