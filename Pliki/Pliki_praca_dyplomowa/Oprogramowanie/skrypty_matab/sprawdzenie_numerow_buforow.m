% wczytaj plik
filename = 'file.txt';
fileID = fopen(filename, 'r');
lines = textscan(fileID, '%s', 'Delimiter', '\n');
fclose(fileID);
lines = lines{1};


combined_hex_data = strings(length(lines), 1);


for i = 1:length(lines)
    % wyodrębnij 19. i 20. bajt i zamień ich kolejność
    hex_data = split(lines{i});
    extracted_hex_data = [hex_data(20); hex_data(19)];

    % połącz zamienione wartości szesnastkowe
    combined_hex_data(i) = strcat(extracted_hex_data(1), extracted_hex_data(2));
end

% konwersja szesnastkowych na dziesiętne
dec_data = hex2dec(combined_hex_data);


figure;
plot(dec_data);
title('Wykres danych dziesiętnych');
xlabel('Indeks');
ylabel('Wartość');
