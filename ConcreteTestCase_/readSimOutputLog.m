function [ simOutputs ] = readSimOutputLog( filename, tcLog )
%READSIMOUTPUTLOG Summary of this function goes here
%   Detailed explanation goes here

[num,txt,raw] = xlsread(filename); % le arquivo do excel

counter = 1;
for i = 3 : size(raw,1);
    
    flag_read = 0;
    for j = 1 : length(tcLog)  % procura em cada tempo por todos os possíveis telecomandos
        if strcmp(tcLog(j).time,raw{i,1}) == 1
            flag_read = 1;
            break
        end
    end

    if flag_read == 1 % realiza leitura da transicao
        
        simOutputs(counter).time = tcLog(j).time;
        simOutputs(counter).tc = tcLog(j).tc;        
        
        for k = 2 : size(raw,2)
            
            simOutputs(counter).outputs(k-1).name = raw{2,k};
            simOutputs(counter).outputs(k-1).previewState = num2str(raw{i-1,k});
            simOutputs(counter).outputs(k-1).actualState =  num2str(raw{i,k});
        end
        
        counter = counter + 1;
    end
end



end

