function UpdateMeasuredValuesTable(app, counter, HRvalue, SpO2value, time)
% The function updates table for measured values
% app = the mlapp the funktion is called from
% counter = counter for number of measured values
% HRvalue = measured value for HR
% SpO2value = measured value for SpO2
% time = time for when the values was measured 

app.MeasuredValuesTable{counter,1} = counter;
app.MeasuredValuesTable{counter,2} = HRvalue;
app.MeasuredValuesTable{counter,3} = SpO2value;
app.MeasuredValuesTable{counter,4} = time;
end