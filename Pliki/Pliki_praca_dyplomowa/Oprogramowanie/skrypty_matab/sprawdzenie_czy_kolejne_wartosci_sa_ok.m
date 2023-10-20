% Odczyt pliku tekstowego
filename = 'file.txt';
fileID = fopen(filename, 'r');
raw_data = textscan(fileID, '%s');
fclose(fileID);
raw_data = raw_data{1};

% Konwersja danych na wartości szesnastkowe o długości 4 znaków
hex_data = reshape([raw_data{:}], 4, [])';

% Konwersja wartości szensatkowe na wartości dziesiętne
dec_data = hex2dec(hex_data);

% Wartości referencyjne
ref_values = [12000, 15000, 33800, 5400, 24500, 6700, 7500, 16000, 7800, 9600];

% Sprawdzenie, czy wartości dec_data są równe wartościom referencyjnym
czy_sa_rowne = true;
for i = 1:length(ref_values)
    for j = i:10:length(dec_data)
        if dec_data(j) ~= ref_values(i)
            czy_sa_rowne = false;
            break;
        end
    end
    if ~czy_sa_rowne
        break;
    end
end

% Wyświetlenie wyniku
if czy_sa_rowne
    disp('Wszystkie wartości dec_data są równe wartościom referencyjnym');
else
    disp('Wszystkie wartości dec_data NIE są równe wartościom referencyjnym');
end

