function [heartRate,SpO2] = processRawData(serialObj,HR_handle,SpO2_handle)
% The function processRawData collects data from Arduino Uno R3 by reading
% from computer port. The functions returns variables HR and SpO2.
% heartRate = pulse/heart rate (heart beats per minute)
% SpO2 = oxygen saturation in blood vessels
% serialObj = serial port object 
% HR_handle = handle to heart rate label on GUI
% SpO2_handle = handle to oxygen saturation label on GUI
%% Get pulse and O2 saturation

% Setup serial connection
%comPorts = serialportlist('available');
% comPort = 'COM3';
% s = serial(comPort,'BaudRate',115200);
% 
% % Open connection
% fopen(s);
 
% Make call asynchron
% OBS: fscanf is a syncron call and will block the command window until
% all operations is done --> output comes at the end, when loop is over
serialObj.ReadAsyncMode = 'continuous';
readasync(serialObj);

% Preallocate variables for time-optimization
measurement = 1;
serialObj.BytesAvailableFcnMode = 'terminator';
%while (s.BytesAvailable < 1)  % Should run continuosly when data is available
    %for measurement = 1:20 % put in array
        fprintf(serialObj,'BioData');
        rawData = fscanf(serialObj);  % Data type is char.
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
   % end
%end

% Close the serial port connection
% fclose(s);
% delete(s);
% clear s;
end








