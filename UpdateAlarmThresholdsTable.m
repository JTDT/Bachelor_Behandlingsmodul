function UpdateAlarmThresholdsTable(app, counter, HRmin, HRmax, SpO2min, SpO2max,time)
% The function updates table for alarmthresholds used under measureirng 
% app = the mlapp the funktion is called from
% counter = counter for number of changed alarm thresholds 
% HRmin = minimum threshold value for HR
% HRmax = maximum threshold value for HR
% SpO2min = minimum threshold value for SpO2
% SpO2max = maximum threshold value for SpO2

app.AlarmThresholdsTable{counter,1} = counter;
app.AlarmThresholdsTable{counter,2} = HRmin;
app.AlarmThresholdsTable{counter,3} = HRmax;
app.AlarmThresholdsTable{counter,4} = SpO2min;
app.AlarmThresholdsTable{counter,5} = SpO2max;
app.AlarmThresholdsTable{counter,6} = time;


end