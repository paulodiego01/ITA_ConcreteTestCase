function [ converstionStatus ] = uppaalToCondado( )
%UPPAALTOCONDADO Summary of this function goes here
%   Detailed explanation goes here

 [uppaalFileName,test_case_pathname] = uigetfile('*.seq','Select Uppaal file (.seq)');
 [pathstr,uppaalFileName,ext] = fileparts([test_case_pathname uppaalFileName]);

% abrir o arquivo da uppaal
uppaalFID = fopen(strcat(uppaalFileName,'.seq'));
if uppaalFID == -1
    converstionStatus = -1;
    return ;
end


tline  = 'start';
i = 1;
uppaalCounter = 0;

% Loop de leitura do arquivo 
while ischar(tline ) % até o fim do arquivo (o fim não é um caracter)
    %  disp(tline)
    tline  = fgets(uppaalFID); % read a line
    i = i + 1;
    
    if isstrprop(tline,'digit') 
        break;
    end
    
    if length(tline) == 2% criar nova estrutura quanto encontra espaço no arquivo
         uppaalCounter = uppaalCounter + 1;
         uppaal(uppaalCounter).id = uppaalCounter;
         eCounter = 1;
     end
     
     if length(tline) > 2
         uppaal(uppaalCounter).expression{eCounter}.text = tline;
         eCounter = eCounter + 1;
     end
end
uppaalFID = fclose(uppaalFID);


% dividir em senddata e recdata
for i = 1:length(uppaal)
    for j = 1 : length(uppaal(i).expression)
        aux = uppaal(i).expression{j}.text;
        aux = strsplit(aux); % divido em comandos
        
        % só separando o recdata e o senddata
        uppaal(i).expression{j}.senddata = aux{1};
        uppaal(i).expression{j}.recdata = aux{2};
      
        % separar os recdatas.... e os seus conteúdos
        aux = strsplit(uppaal(i).expression{j}.recdata,{'(',',',')'});
        
        if length(aux) < 3 %testando se o recdata veio vazio: recdata(L,XYZKYTGAMA )
            uppaal(i).expression{j}.recdataParsed{1} = 'recdata( )';
        else
            for k = 3: length(aux) - 1
                uppaal(i).expression{j}.recdataParsed{k - 2} = strcat('recdata(L,',aux{k},')')
                
            end
            
        end

        
    end
end

% criar expressoes da condado
fCondado = fopen(strcat(uppaalFileName,'_Condado.seq'),'w');

fprintf(fCondado,'\n');

%fid = fopen(strcat(path_save_txt),'wt');
for i = 1:length(uppaal)
    for j = 1 : length(uppaal(i).expression)
        
        toWrite = uppaal(i).expression{j}.senddata;
        
        for k = 1 : length( uppaal(i).expression{j}.recdataParsed)
            toWrite = [toWrite,' ', uppaal(i).expression{j}.recdataParsed{k}];
        end
        
        fprintf(fCondado,'%s\n',toWrite);
    end
    
    
    
    if i == length(uppaal)
        fprintf(fCondado,'%d',uppaalCounter);
    else
        fprintf(fCondado,'\n');
    end
end
fCondado = fclose(fCondado);





end

