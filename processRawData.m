% Processing raw data from Arduino and pulsoximeter
% Set up
clear,clc
% Connect to Arduino Hardware and include the I2C library
a = arduino('COM3','Uno','Libraries','I2C');
% Configure pins
% configurePin(a,'D4','pullup');
% pinMode = configurePin(a,'D4');

% Scans for available I2C addresses.
addresses = scanI2CBus(a);
% Create the I2C device object
i2c_device = device(a,'I2CAddress','0x55')
% Read data 
sensor_data = read(i2c_device,8,'uint8')

%% Clean up
clear a;

%% Method 2
comPort = serialportlist('available');
arduino = serial(comPort,'BaudRate',115200);
i=0;
while (i<10)  % For X times execution
    fopen(arduino);
    fprintf(arduino,'Your serial data');
    output = fscanf(arduino)  % output is displayed. Data type is char.
    numout = str2double(output)   % For output in double data type.
    i=i+1;
end
