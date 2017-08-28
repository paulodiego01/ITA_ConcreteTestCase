
clear all; clc
tic;

%year=2014;
%month=10;
%day=17;
%hour=14;
%min=04;
%sec=00.000;
% ESTE COMANDO GERA A FILA DE BORDO PARA SER COLOCADO NO SIMULADOR 
%(NA PRIMEIRA ETAPA APENAS ESSE COMANDO DEVE SER USADO)
%(NA SEGUNDA ETAPA, JÁ COM OS RESULTADO DO SIMULADOR, DEVEM SER USADOS
%TODOS OS COMANDOS SEGUINTES)

[test_case_filename,test_case_pathname] = uigetfile('*.seq','Select Condado file (.seq)');
[pathstr,name_test_file,ext] = fileparts([test_case_pathname test_case_filename]);

global test_case_filename
global test_case_pathname
global pathstr
global name_test_file
global ext

complete_path = strcat(test_case_pathname,name_test_file);

tests = generateBoardQueue(complete_path,2014,10,17,14,04,00);

if isstruct(tests) == 0
    if tests == -1 
        return;
    end
end



%% Usar estes comandos depois de ter o resultado 

[tc_filename] = uigetfile('*.csv','Select TCs File (.csv)',test_case_pathname);

complete_tc_path = strcat(test_case_pathname,tc_filename);

%[tc_filename,tc_pathname] = uigetfile('*.csv','Select TCs File (.csv)');
tcLog = readSimTClog(complete_tc_path);



[sim_output_filename] = uigetfile('*.csv','Select Simulator Output File (.csv)',test_case_pathname);
%[sim_output_filename sim_output_pathname] = uigetfile('*.csv','Select Simulator Output File (.csv)');
complete_path_his = strcat(test_case_pathname,sim_output_filename);

outputLog = readSimOutputLog(complete_path_his,tcLog);

finalExit = compareRecDataWithOutput(tests,outputLog);

[filename_xlsx] = uiputfile('*.xlsx','Save results',test_case_pathname);
%[filename_xlsx path_xlsx] = uiputfile('*.xlsx','Save results');

global test_case_pathname

writeXLSFromCompare(finalExit,filename_xlsx);

tempo_total = toc;
fprintf ('CONCLUÍDO')