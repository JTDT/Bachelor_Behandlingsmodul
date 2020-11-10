function UpdateAlarmThresholdsTable(app, kk, HRmin, HRmax, SpO2min, SpO2max,time)
% The function updates table for alarmthresholds used under measureirng 
% app = the mlapp the funktion is called from
% kk = counter 
% HRmin = minimum threshold value for HR
% HRmax = maximum threshold value for HR
% SpO2min = minimum threshold value for SpO2
% SpO2max = maximum threshold value for SpO2

app.AlarmThresholdsTable{kk,1} = kk;
app.AlarmThresholdsTable{kk,2} = HRmin;
app.AlarmThresholdsTable{kk,3} = HRmax;
app.AlarmThresholdsTable{kk,4} = SpO2min;
app.AlarmThresholdsTable{kk,5} = SpO2max;
app.AlarmThresholdsTable{kk,6} = time;


end