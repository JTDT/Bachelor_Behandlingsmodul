function UpdateAlarmThresholdsTable(app, kk, HRmin, HRmax, SpO2min, SpO2max, time)
% forklarende tekst 

app.AlarmThresholdsTable{kk,1} = kk;
app.AlarmThresholdsTable{kk,2} = HRmin;
app.AlarmThresholdsTable{kk,3} = HRmax;
app.AlarmThresholdsTable{kk,4} = SpO2min;
app.AlarmThresholdsTable{kk,5} = SpO2max;
app.AlarmThresholdsTable{kk,6} = time;
%disp(app.AlarmThresholdsTable{kk,6})
disp(app.AlarmThresholdsTable)
%app.A
%%app.AlarmThresholdsTable  % bruges til test -> skal slettes!!!

end