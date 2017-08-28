clear all
close all
clc

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


tests = generateBoardQueue(name_test_file,2014,10,17,14,04,00);

if isstruct(tests) == 0
    if tests == -1 
        return;
    end
end
