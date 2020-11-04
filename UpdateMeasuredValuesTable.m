function UpdateMeasuredValuesTable(app, jj, HRvalue, SpO2value, time)

% forklarende tekst 

app.MeasuredValuesTable{jj,1} = jj;
app.MeasuredValuesTable{jj,2} = HRvalue;
app.MeasuredValuesTable{jj,3} = SpO2value;
app.MeasuredValuesTable{jj,4} = time;


end