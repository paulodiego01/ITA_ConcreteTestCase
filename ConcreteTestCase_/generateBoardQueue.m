% função cria o arquivo da fila de bordo
% entrada:  filename - nome do arquivo dos casos de teste ( o arquivo de
% entrada dos casos de teste segue a formatação de saida da Condado
%           y,m,d,h.mn.s - tempo inicial que os testes serão aplicados

function [testCase] = generateBoardQueue(filename,year,month,day,hour,min,sec)
global filename_txt
global path_txt

global test_case_filename
global test_case_pathname
global pathstr
global name_test_file
global ext

% entrar com o nome do arquivo sem extensões
%nomeDoArquivo = 'caso1excecoes-testes';

% tempo inicial do teste
%year=2014;
%month=10;
%day=17;
%hour=14;
%min=04;
%sec=00.000;

t = datenum(year,month,day,hour,min,sec);

str = datestr(t,'dd-mm-yyyy HH:MM:SS.FFF');


testCase = parseCondado(filename);
% 
% % traduzir a expressão lida da condado para comandos da fila de bordo
% for i = 1:length(testCase)
%     for j = 1 : length(testCase(i).expression)
%         
%         testCase(i).expression{j}.parsed = aux;
%     end
% end

if isstruct(testCase) == 0
    if testCase == -1 
        return;
    end
end

%path_save_txt = (fullfile(path_txt,filename_txt));
% gerar o arquivo da fila de bordo
init2 = test_case_pathname;
folder2 = dir(test_case_pathname);
filename2 = [init2 name_test_file '_BoardQueue.txt'];

%fid = fopen(strcat(filename2,'_BoardQueue.txt'),'w');

fid = fopen(filename2,'w');

%fid = fopen(strcat(path_save_txt),'wt');
for i = 1:length(testCase)
    for j = 1 : length(testCase(i).expression)
        
        toWrite = testCase(i).expression{j}.senddata;
        toWrite = strcat('SET CMD=',toWrite);

        fprintf(fid,'%s\n',toWrite);

        execDate = datestr(t,'dd-mm-yyyy HH:MM:SS.FFF');        
        fprintf(fid,'pExecTime=%s\n',execDate);
        
        t = t + 0.00002;       
    end
end
fid = fclose(fid);
%[filename_txt path_txt] = uiputfile('*.txt','Save .txt');



