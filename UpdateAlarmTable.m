<<<<<<< HEAD
function UpdateAlarmTable(app, ii, MeasureType, MeasureValue, ThresholdMin, ThresholdMax, time)
% forklarende tekst 

% skal kun gemme ned når der udløses en ny alarm for HR eller Spo2

app.AlarmTable{ii,1} = ii;
app.AlarmTable{ii,2} = MeasureType;
app.AlarmTable{ii,3} = MeasureValue;
app.AlarmTable{ii,4} = ThresholdMin;
app.AlarmTable{ii,5} = ThresholdMax;
app.AlarmTable{ii,6} = time;

%app.AlarmTable % bruges til test -> skal slettes!!!

end

        
=======
function UpdateAlarmTable(app, ii, MeasureType, MeasureValue, ThresholdMin, ThresholdMax, time)
% forklarende tekst 

% skal kun gemme ned når der udløses en ny alarm for HR eller Spo2

app.AlarmTable{ii,1} = ii;
app.AlarmTable{ii,2} = MeasureType;
app.AlarmTable{ii,3} = MeasureValue;
app.AlarmTable{ii,4} = ThresholdMin;
app.AlarmTable{ii,5} = ThresholdMax;
app.AlarmTable{ii,6} = time;

app.AlarmTable % bruges til test -> skal slettes!!!

end

        
>>>>>>> e54f5b96e73099c0561699975ad87535b532035b
            