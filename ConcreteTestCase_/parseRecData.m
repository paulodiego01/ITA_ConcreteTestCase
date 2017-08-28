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
    
%     
%     k = strfind(aux{1,2},'EM');
%     if k>0
%         aux = strsplit(recStruct.parameter,'EM');
%         x = str2num(aux{1,1});
%         y = str2num(aux{1,2});
%         recStruct.parameter = 0;
%         h = 
%         recStruct.parameter = x*realpow(10,-y);
%     end
%     
%     k = strfind(aux{1,2},'E');
%     if k>0
%         aux = strsplit(recStruct.parameter,'E');
%         x = str2num(aux{1,1});
%         y = str2num(aux{1,2});
%         recStruct.parameter = x*realpow(10,y);
%     end
        
    
    
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



