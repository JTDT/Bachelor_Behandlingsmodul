 function processRawData(~,~,app,serialObj,HR_label,SpO2_label)
% The function collects data from Arduino Uno R3 by reading
% from computer port.
% heartRate = pulse/heart rate (heart beats per minute)
% SpO2 = oxygen saturation in blood vessels
% serialObj = serial port object
% HR_handle = handle to heart rate label on GUI
% SpO2_handle = handle to oxygen saturation label on GUI
%% Get pulse and O2 saturation

% Make call asynchron
% OBS: fscanf is a syncron call and will block the command window until
% all operations is done - making it asyncron will make it run back
% serialObj.ReadAsyncMode = 'continuous';
% readasync(serialObj);
% serialObj.BytesAvailableFcnMode = 'terminator';
serialObj = [];

% Read data via serial port
comPort = 'COM3';
serialObj = serialport(comPort,9600);
rawData = strtrim(readline(serialObj));
bioData = split(rawData,':'); % splits data -> HR:SpO2:Conficence:Status:[array]
bioData = str2double(bioData);

% Check confidence is over 95% and status of finger detected (equals 3)
 if bioData(3)>= 95 && bioData(4)==3
    heartRate = bioData(1)
    SpO2 = bioData(2)
    
%     set(HR_label,'Text',num2str(bioData(1)));
%     set(SpO2_label,'Text',num2str(bioData(2)));
%     drawnow % this updates the GUI immediatly at every iteration
 else
     disp('Finger detection error. Try replace finger')
end
end








