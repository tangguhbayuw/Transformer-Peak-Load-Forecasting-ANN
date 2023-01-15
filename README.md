# Transformer-Peak-Load-Forecasting-ANN

## Deskripis
Transformer Peak Load Forecasting ANN adalah suatu jaringan saraf buatan menggunakan propagasi mundur yang digunakan untuk meramalkan beban puncak pada sebuah trafo. Pada sistem sederhana ini, terdapat 3 file berformat .m, dimana terdapat file tes, file latih, dan file untuk prediksi. 
Pada program latih, digunakan fungsi newff yang merupakan fungsi untuk membuat jaringan feed-forward backpropagation. Kemudian dari hasil pelatihan, akan ditampilkan hasil regresi yang terbentuk, grafik perbandingan antara hasil pelatihan dengan targetnya, dan nilai epoch ketika pelatihan mencapai performa terbaiknya. 
Sistem akan mengeluarkan file net.mat dari hasil pelatihan yang kemudian dapat dipakai pada file tes dan file prediksi
