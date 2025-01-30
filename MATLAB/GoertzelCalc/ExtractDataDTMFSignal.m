% Extract only the DTMF signal column from the table
selectedData = xDTMF;

% Open a file for writing
fileID = fopen('dtmf_signal.txt', 'w');

% Write the data
for i = 1:length(selectedData)
    fprintf(fileID, '%.15f\n', selectedData(i));
end

% Close the file
fclose(fileID);