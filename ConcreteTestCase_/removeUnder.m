function [ argument ] = removeUnder( argument )
%ADAPTAUNDER Summary of this function goes here
%   Detailed explanation goes here

% aux = strsplit(argument,'UNDER');
% 
% if length(aux)> 1 
%     argument = strcat(aux(1),'_',aux(2));
% end

argument = strrep(argument,'UNDER','_');

if iscell(argument) == 1
    argument = argument{1};
end

end

