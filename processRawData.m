function [heartRate,SpO2] = processRawData(HR_handle,SpO2_handle, MonitorState)
% The function processRawData collects data from Arduino Uno R3 by reading
% from computer port. The functions returns variables HR and SpO2.
% heartRate = pulse/heart rate (heart beats per minute)
% SpO2 = oxygen saturation in blood vessels
% HR_handle = handle to heart rate label on GUI
% SpO2_handle = handle to oxygen saturation label on GUI
% MonitorState = A boolean that indicated if the monitor is started/stopped
%% Get pulse and O2 saturation


if (MonitorState == true)
% Setup serial connection
%comPorts = serialportlist('available');
comPort = 'COM3';
s = serial(comPort,'BaudRate',115200);

% Open connection
fopen(s);
end
 
% Make call asynchron
% OBS: fscanf is a syncron call and will block the command window until
% all operations is done --> output comes at the end, when loop is over
s.ReadAsyncMode = 'continuous';
readasync(s);

% Preallocate variables for time-optimization
measurement = 1;
s.BytesAvailableFcnMode = 'terminator';
%while (s.BytesAvailable < 1)  % Should run continuosly when data is available
    for measurement = 1:20 % put in array
        fprintf(s,'BioData');
        rawData = fscanf(s);  % Data type is char.
        rawData = convertCharsToStrings(rawData); % Convert data to strings
        bioData = split(rawData,':'); % splits data -> HR:SpO2:Conficence:Status
        bioData = str2double(bioData);
        % Check confidence is over 95% and status of finger detected (equals 3)
        if bioData(3)>= 95 && bioData(4)==3
            heartRate = bioData(1)
            SpO2 = bioData(2)

            set(HR_handle,'Text',num2str(bioData(1)));
            set(SpO2_handle,'Text',num2str(bioData(2)));
            drawnow % this updates the GUI immediatly at every iteration
            
        else
            disp('Finger detection error. Try replace finger')
       end
    end
%end

if (Monitor == false)
% Close the serial port connection
fclose(s);
delete(s);
clear s;
end 
end








