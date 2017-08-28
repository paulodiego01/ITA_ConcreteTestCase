function [ value ] = getParameterActualState( parameterName, outputs )
%GETPARAMETERVALUE essa função retorna o valor atual do parametro
%(parameterName), a outra entrada é a tabela de valor atual que está
%relacionada com o envio do telecomando

value = -9999;

for i = 1:size(outputs,2) % varre todos os outputs
    if  strcmp(parameterName,outputs(i).name) == 1 %testa para encontrar qual o parametro
        value =  outputs(i).actualState; % se encontrado atualiza o valor de value para retornar
        break;
    end
end



end


