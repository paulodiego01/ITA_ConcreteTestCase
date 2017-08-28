function [ argument ] = readCondadoCommand( condadoCommand )
%READCONDADOCOMMAND Summary of this function goes here
% condadoCommand = comando da condado ( senddata(L,xxxxx) ou
% recdata(L,xxxxx)
% saida = xxxxx

% aux = aux{1,1}; % pega o primeiro comando
aux = strsplit(condadoCommand,{'(',',',')'}); % divide os campos do comando por parenteses e virgulas
argument = aux{1,3}; % pego o terceiro campo

argument = removeUnder(argument);


end

