% Wczytaj plik
filename = 'przedramie_sygnal.txt';
fileID = fopen(filename, 'r');
raw_data = fscanf(fileID, '%s');
fclose(fileID);

% usun przestrzenie miedzy próbkami i polacz
raw_data_no_spaces = erase(raw_data, ' ');
hex_data = reshape(raw_data_no_spaces, 4, [])';

% Zmiana wartości hex nad dec
dec_data = hex2dec(hex_data);
full_data=0.6+(dec_data/41260)*2*1.2;

figure;
plot(full_data);
title('Wykres sygnału pobranego z dłoni');
xlabel('idneks próbek');
ylabel('Wartość w V');