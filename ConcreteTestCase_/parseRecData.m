function [ recStruct ] = parseRecData( recdata )
%PARSERECDATA Summary of this function goes here
%   Detailed explanation goes here

k =  strfind(recdata,'NumAnswer');
if k > 0
    aux = strsplit(recdata,'NumAnswer');
    recStruct.name = aux{1,1};
    recStruct.name = removeUnder(recStruct.name);
    
    recStruct.parameter = aux{1,2};
    
    k = strfind(aux{1,2},'p');
    if k>0
        aux = strsplit(recStruct.parameter,'p');
        recStruct.parameter = strcat(aux{1,1},'.',aux{1,2});
    end
        
        
    return;
end
k =  strfind(recdata,'StrAnswer');
if k > 0
    aux = strsplit(recdata,'StrAnswer');
    recStruct.name = aux{1,1};
    recStruct.name = removeUnder(recStruct.name);
    
    recStruct.parameter = aux{1,2};
    return;
end

recStruct.name = 'ERROR';
recStruct.parameter = 'ERROR';
end



