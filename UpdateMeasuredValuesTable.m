function UpdateMeasuredValuesTable(app, jj, HRvalue, SpO2value, time)
% The function updates table for measured values
% app = the mlapp the funktion is called from
% jj = counter 
% HRvalue = measured value for HR
% SpO2value = measured value for SpO2
% time = time for when the values was measured 

app.MeasuredValuesTable{jj,1} = jj;
app.MeasuredValuesTable{jj,2} = HRvalue;
app.MeasuredValuesTable{jj,3} = SpO2value;
app.MeasuredValuesTable{jj,4} = time;
end