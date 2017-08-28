function [ tcLog ] = readSimTClog( filename )
%READSIMTCLOG Summary of this function goes here
%   Detailed explanation goes here

[num,txt,raw] = xlsread(filename); % le arquivo do excel

for i = 2 : size(raw,1);
    tcLog(i-1).tc = raw{i,2}; % pega todos os telecomandos
    tcLog(i-1).time = raw{i,1}; % pega todos os tempos dos telecomandos
end

% retorna tcLog com o log de telecomandos
end

