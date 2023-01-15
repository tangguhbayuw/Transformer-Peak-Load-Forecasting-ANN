clc;clear all;close all;
 
% load jaringan yang sudah dibuat pada proses pelatihan
load net.mat
 
% Proses membaca data uji dari excel
filename = 'Data Input.xlsx';
sheet = 2;
xlRange = 'C13:H15';
 
Data = xlsread(filename, sheet, xlRange);
data_uji = Data(:,1:5)';
target_uji = Data(:,6)';
[m,n] = size(data_uji);
 
% Hasil prediksi
hasil_uji = sim(net_keluaran,data_uji);
nilai_error = hasil_uji-target_uji;
 
max_data = 23.3;
min_data = 21.3;
hasil_uji1 = ((hasil_uji-0.1)*(max_data-min_data)/0.8)+min_data;
 
% Performansi hasil prediksi
error_MSE = (1/n)*sum(nilai_error.^2);
 
filename = 'Data Input.xlsx';
sheet = 1;
xlRange = 'H13:H15';
 
target_uji_asli = xlsread(filename, sheet, xlRange);
 
figure,
plot(hasil_uji1,'bo-')
hold on
plot(target_uji_asli,'ro-')
hold off
grid on
title(strcat(['Grafik Keluaran JST vs Target dengan nilai MSE = ',...
num2str(error_MSE)]))
xlabel('Pola ke-')
ylabel('Beban Puncak')
legend('Keluaran JST','Target','Location','Best')