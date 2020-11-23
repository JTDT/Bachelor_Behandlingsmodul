function UpdateAlarmTable(app, counter, MeasureType, MeasureValue, ThresholdMin, ThresholdMax, time)
% The function updates table for alarm values
% app = the mlapp the funktion is called from (MonitorApp)
% counter = counter for number of new alarms
% MeasureType = What measure type the alarm is for. Can be HR or SpO2
% MeasureValue = The measured value that started the alarm
% ThresholdMin = Value for the minimum threshold
% ThresholdMax = Value for the maximum threshold
% time = time for when the alarm started 

app.AlarmTable{counter,1} = counter;
app.AlarmTable{counter,2} = MeasureType;
app.AlarmTable{counter,3} = MeasureValue;
app.AlarmTable{counter,4} = ThresholdMin;
app.AlarmTable{counter,5} = ThresholdMax;
app.AlarmTable{counter,6} = time;

end