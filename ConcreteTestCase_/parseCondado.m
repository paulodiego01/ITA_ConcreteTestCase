function [ testCase ] = parseCondado( filename )
%PARSECONDADO Summary of this function goes here
%   Detailed explanation goes here

% abrir o arquivo da condado
%fid = fopen(strcat(filename,'.seq'));
global pathstr

init = pathstr;
folder = dir(pathstr);
filename = [init '\' folder(3).name];

%filename=fullfile((strcat(pathstr,'.seq')));

fid = fopen(filename,'r');

if fid == -1
    testCase = -1;
    return ;
end

tline  = 'start';
i = 1;
tcCounter = 0;

% Loop de leitura do arquivo 
while ischar(tline ) % até o fim do arquivo (o fim não é um caracter)
    %  disp(tline)
    tline  = fgets(fid); % read a line
    i = i + 1;
    
    if isstrprop(tline,'digit') 
        break;
    end
    
    if length(tline) == 2% criar nova estrutura quanto encontra espaço no arquivo
         tcCounter = tcCounter + 1;
         testCase(tcCounter).id = tcCounter;
         eCounter = 1;
     end
     
     if length(tline) > 2
         testCase(tcCounter).expression{eCounter}.text = tline;
         eCounter = eCounter + 1;
     end
end
fid = fclose(fid);



% interpret sendData and recdata
for i = 1:length(testCase)
    for j = 1 : length(testCase(i).expression)
        aux = testCase(i).expression{j}.text;
        aux = strsplit(aux); % divido em comandos
        
        testCase(i).expression{j}.senddata = readCondadoCommand(aux{1,1});
        k = 2;
        while 1
            if k > length(aux)
               break; 
            end
            if strcmp(aux{1,k},'') == 1
                break;
            end
            
            recommand = readCondadoCommand(aux{1,k});
            testCase(i).expression{j}.recdata{k - 1}.command = recommand;
            
            testCase(i).expression{j}.recdata{k - 1}.parsed = parseRecData(recommand);
            
            k = k + 1;
        end
    end
end



end

