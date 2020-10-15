function [heartRate,SpO2] = processRawData()
% The function processRawData collects data from Arduino Uno R3 by reading
% from computer port. The functions returns variables HR and SpO2.
% heartRate = heart beats per minute
% SpO2 = oxygen saturation in blood vessels
%% Clean up
clear s;
clear,clc, close all;
%% Get pulse and O2 saturation

% Setup serial connection
comPort = serialportlist('available');
s = serial(comPort(1),'BaudRate',115200);

% Open connection
fopen(s);

% Make call asynchron
% OBS: fscanf is a syncron call and will block the command window until
% all operations is done --> output comes at the end, when loop is over
s.ReadAsyncMode = 'continuous';
readasync(s);

% Preallocate variables for time-optimization
heartRate = zeros(1,10);
SpO2 = zeros(1,10);
ii = 1;
s.BytesAvailableFcnMode = 'terminator';
while (s.BytesAvailable < 1)  % Should run continuosly when data is available
    for ii = 1:length(heartRate)
        fprintf(s,'BioData');
        rawData = fscanf(s);  % Data type is char.
        rawData = convertCharsToStrings(rawData); % Convert data to strings
        bioData = split(rawData,':'); % splits data -> HR:SpO2:Conficence:Status
        bioData = str2double(bioData);
        % Check confidence is over 95% and status of finger detected (equals 3)
        if bioData(3)>= 95 && bioData(4)==3
            %         heartRate = bioData(1)
            %         SpO2 = bioData(2) 
            heartRate(ii) = bioData(1)
            SpO2(ii) = bioData(2)
        else
            disp('Finger detection error. Try replace finger')
        end
    end
    ii = 1; % refill array with new data
end

% Close the serial port connection
fclose(s);
delete(s);
clear s;
end








