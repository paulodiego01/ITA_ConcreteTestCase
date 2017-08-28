function [ output ] = compareRecDataWithOutput( tests,outputLog )
%COMPARERECDATAWITHOUTPUT Summary of this function goes here
%   Detailed explanation goes here

% considerando que a sequencia de bordo foi aplicada na sequencia do
% arquivo gerado

contadorTop = 1;
count = 1;

for t = 1:size(tests,2) % caminha pelos testes
    for e = 1:size(tests(t).expression,2) % caminha em cada express�o do teste
        
        recDataCounter = 1;

        for rd = 1:size(tests(t).expression{e}.recdata,2) %caminho em cada recdata de uma express�o
            

            
            output(contadorTop).testNumber = tests(t).id;  % salva o id do teste
            output(contadorTop).ExprNumber = e;
            output(contadorTop).ExprText = tests(t).expression{e}.text; % salva a express�o do teste
            output(contadorTop).sentTC = tests(t).expression{e}.senddata; % salva o telecomando enviado pelo teste
             
            output(contadorTop).parameterName = tests(t).expression{e}.recdata{rd}.parsed.name;
            nameToSearch = output(contadorTop).parameterName;
            output(contadorTop).condadoOutput = tests(t).expression{e}.recdata{rd}.parsed.parameter;
            exp = output(contadorTop).condadoOutput ;
            output(contadorTop).simulatorOutput = getParameterActualState(nameToSearch,outputLog(count).outputs);
            sim = output(contadorTop).simulatorOutput;
            
            if strcmp(exp,sim) == 1
                 output(contadorTop).comparation = 'OK';
            else
                 output(contadorTop).comparation = 'NOT OK';               
            end
            
            recDataCounter = recDataCounter + 1;
            contadorTop = contadorTop + 1;
            
            clear exp;
            clear sim;
            
         end
         
         count = count + 1;
    end
end




% 
% count = 1;
% 
% for t = 1:size(tests,1) % caminha pelos testes
%     for e = 1:size(tests(t).expression,2) % caminha em cada express�o do teste
% 
%         output(count).testNumber = tests(t).id;  % salva o id do teste
%         output(count).expression = tests(t).expression{e}.text; % salva a express�o do teste
%         output(count).sentTC = tests(t).expression{e}.senddata; % salva o telecomando enviado pelo teste
%         
%         recDataCounter = 1;
% 
%         for rd = 1:size(tests(t).expression{e}.recdata,2) %caminho em cada recdata de uma express�o
%              
%             output(count).paramValue(recDataCounter).name = tests(t).expression{e}.recdata{rd}.parsed.name;
%             nameToSearch = output(count).paramValue(recDataCounter).name;
%             output(count).paramValue(recDataCounter).expectedValue = tests(t).expression{e}.recdata{rd}.parsed.parameter;
%             exp = output(count).paramValue(recDataCounter).expectedValue;
%             output(count).paramValue(recDataCounter).simulatedValue = getParameterActualState(nameToSearch,outputLog(count).outputs);
%             sim = output(count).paramValue(recDataCounter).simulatedValue;
%             
%             if strcmp(exp,sim) == 1
%                  output(count).paramValue(recDataCounter).comparation = 'OK';
%             else
%                  output(count).paramValue(recDataCounter).comparation = 'NOT OK';               
%             end
%             
%             recDataCounter = recDataCounter + 1;
%          end
%          
%          count = count + 1;
%     end
% end



end

