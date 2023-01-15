clc;clear all;close all;
 
% load jaringan yang sudah dibuat pada proses pelatihan
load net.mat

% input dari user
for i = 1:5
    %fprintf('Nilai X%f',i);
    %prompt = '= ';
    X(i) = input(sprintf('Nilai X%f = ',i));
end

% proses normalisasi nilai
filename = 'Data Input.xlsx';
sheet = 1;
xlRange = 'C13:H15';
Data = xlsread(filename, sheet, xlRange);

X_normal = 0;
for j = 1:5
    if (X(j) > max(Data(:,j)))
        X_normal(j) = (0.8*(X(j) - min(Data(:,j)))/(X(j) - min(Data(:,j)))) + 0.1;
    elseif (X(j) < min(Data(:,j)))
        X_normal(j) = 0.1;
    else
        X_normal(j) = (0.8*(X(j) - min(Data(:,j)))/(max(Data(:,j)) - min(Data(:,j)))) + 0.1;
    end
end

data_uji = X_normal';

% Hasil prediksi
hasil_uji = sim(net_keluaran,data_uji);
nilai_error = -0.0154;

max_data = 23.3;
min_data = 21.3;
hasil_uji1 = ((hasil_uji-0.1)*(max_data-min_data)/0.8)+min_data;
fprintf('Prediksi beban puncak = %f\n',hasil_uji1);