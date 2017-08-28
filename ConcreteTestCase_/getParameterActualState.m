function [ value ] = getParameterActualState( parameterName, outputs )
%GETPARAMETERVALUE essa fun��o retorna o valor atual do parametro
%(parameterName), a outra entrada � a tabela de valor atual que est�
%relacionada com o envio do telecomando

value = -9999;

for i = 1:size(outputs,2) % varre todos os outputs
    if  strcmp(parameterName,outputs(i).name) == 1 %testa para encontrar qual o parametro
        value =  outputs(i).actualState; % se encontrado atualiza o valor de value para retornar
        break;
    end
end



end


