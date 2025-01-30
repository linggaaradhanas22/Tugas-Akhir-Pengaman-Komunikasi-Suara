% Extract the desired columns from the table
selectedData = [goertzelTable.DTMF_Signal, goertzelTable.Q1, goertzelTable.Q2];

% Open a file for writing
fileID = fopen('goertzel_selected_data.txt', 'w');

% Write the data
% Use '%.15f' format specifier to maintain 15 decimal places
for i = 1:size(selectedData, 1)
    fprintf(fileID, '%.15f\t%.15f\t%.15f\n', selectedData(i,1), selectedData(i,2), selectedData(i,3));
end

% Close the file
fclose(fileID);