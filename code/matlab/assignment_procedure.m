% Membersihkan layar
clc
% Membersihkan memori
% clear
% Membuat matrix data
pijk_new=pijk
S=zeros(size(pijk))
[row_pijk col_pijk]=size(pijk)
% Memulai iterasi 1 sampai baris terakhir data
for i=1:row_pijk
    % Mencari kolom,baris dari nilai minimal
    [minvalue,colindex]=min(pijk_new(i,:))
    [row,col]=ind2sub(size(pijk_new),colindex)
    % Menyimpan baris tempat element minimal
    barismin = pijk_new(row,:)
    % Mengganti baris minimal dengan angka besar
    pijk_new(row,:)=999
    % Menambahkan element2 di kolom minimal dengan minvalue
    pijk_new(:,col)=pijk_new(:,col)+minvalue
    % Mengganti semua element di baris minimal dengan 0
    barismin(:)=0
    % Mengganti element di barismin dan kolom minimal dengan 1
    barismin(col)=1
    % Menyimpan baris minimal di variabel array
    S(row,:)=barismin
end
