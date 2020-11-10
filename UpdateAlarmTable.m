function UpdateAlarmTable(app, ii, MeasureType, MeasureValue, ThresholdMin, ThresholdMax, time)
% The function updates table for alarm values
% app = the mlapp the funktion is called from (MonitorApp)
% ii = counter 
% MeasureType = What measure type the alarm is for. Can be HR or SpO2
% MeasureValue = The measured value that started the alarm
% ThresholdMin = Value for the minimum threshold
% ThresholdMax = Value for the maximum threshold
% time = time for when the alarm started 

app.AlarmTable{ii,1} = ii;
app.AlarmTable{ii,2} = MeasureType;
app.AlarmTable{ii,3} = MeasureValue;
app.AlarmTable{ii,4} = ThresholdMin;
app.AlarmTable{ii,5} = ThresholdMax;
app.AlarmTable{ii,6} = time;

end