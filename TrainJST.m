clc;
clear all;
close all;
warning off;

% Proses membaca data latih dari excel
filename = 'Data Input.xlsx';
sheet = 2;
xlRange = 'C4:H8';
 
Data = xlsread(filename, sheet, xlRange);
data_latih = Data(:,1:5)';
target_latih = Data(:,6)';
[m,n] = size(data_latih);
 
% Pembuatan JST
net = newff(minmax(data_latih),[10 1],{'poslin','purelin'},'traingdx');
 
% Memberikan nilai untuk mempengaruhi proses pelatihan
net.performFcn = 'mse';
net.trainParam.goal = 0.01;
net.trainParam.show = 25;
net.trainParam.epochs = 1000;
net.trainParam.mc = 0.95;
net.trainParam.lr = 0.01;
 
% Proses training
[net_keluaran,tr,Y,E] = train(net,data_latih,target_latih);
 
% Hasil setelah pelatihan
bobot_hidden = net_keluaran.IW{1,1};
bobot_keluaran = net_keluaran.LW{2,1};
bias_hidden = net_keluaran.b{1,1};
bias_keluaran = net_keluaran.b{2,1};
jumlah_iterasi = tr.num_epochs;
nilai_keluaran = Y;
nilai_error = E;
error_MSE = (1/n)*sum(nilai_error.^2);
 
save net.mat net_keluaran
 
% Hasil prediksi
hasil_latih = sim(net_keluaran,data_latih);
max_data = 23
min_data = 18.3
hasil_latih = ((hasil_latih - 0.1)*(max_data - min_data)/0.8) + min_data;
% Performansi hasil prediksi
filename = 'Data Input.xlsx';
sheet = 1;
xlRange = 'H4:H8';
 
target_latih_asli = xlsread(filename, sheet, xlRange);
 
figure, 
plotregression(target_latih_asli,hasil_latih,'Regression')
 
figure,
plotperform(tr)
 
figure,
plot(hasil_latih,'bo-')
hold on
plot(target_latih_asli,'ro-')
hold off
grid on
title(strcat(['Grafik Keluaran JST vs Target dengan nilai MSE = ',...
num2str(error_MSE)]))
xlabel('Pola ke-')
ylabel('Beban Puncak')
legend('Keluaran JST','Target','Location','Best')