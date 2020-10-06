% Processing raw data from Arduino and pulsoximeter
%% Clean up
clear a;
clear,clc, close all
%% Get pulse and O2 saturation
comPort = serialportlist('available')
arduino = serial(comPort(1),'BaudRate',115200);
i=0;
fopen(arduino);
while (i<10)  % Should run continuosly?
    fprintf(arduino,'Your serial data');
    output = fscanf(arduino);  % Data type is char.
    outputstr = convertCharsToStrings(output); % Convert to string
    % get only values for Heart rate and 0xygen saturation
    bioData = contains(outputstr,['Heartrate','Oxygen']);
    if (bioData == 1)
        sprintf(bioData)
    end
    i=i+1;
end
fclose(arduino);

%% Connect to Arduino Hardware and include the I2C library
port = 'COM3'; % check in device manager
a = arduino(port,'Uno','Libraries','I2C');
% Scans for available I2C addresses.
addresses = scanI2CBus(a);
% Create the I2C device object
i2c_device = device(a,'I2CAddress','0x55')
% Read data 
sensor_data = read(i2c_device,8,'uint8')








