function flashAlarmLabel(~,~,app,label)
%MANGLER forklarende tekst til funktion 
for ii = 1:length(label)
    if ~isempty(label{ii}) && strcmpi(label{ii}.Visible,'on')
        label{ii}.Visible = 'off';
        label{ii}.FontColor = 'r';
    else
        label{ii}.Visible = 'on';
    end
end
end