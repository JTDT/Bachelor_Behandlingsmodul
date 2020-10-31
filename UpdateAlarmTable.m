function UpdateAlarmTable(app, ii, MeasureType, MeasureValue, ThresholdMin, ThresholdMax, time)

% id = ii;
% Type = MeasureType;
% Value = MeasureValue;
% Threshold_min = ThresholdMin
% Threshold_max = ThresholdMax;
% Time = time;


app.AlarmTable{ii,1} = ii;
app.AlarmTable{ii,2} = MeasureType;
app.AlarmTable{ii,3} = MeasureValue;
app.AlarmTable{ii,4} = ThresholdMin;
app.AlarmTable{ii,5} = ThresholdMax;
app.AlarmTable{ii,6} = time;

app.AlarmTable

end