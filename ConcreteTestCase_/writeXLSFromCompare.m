function [  ] = writeXLSFromCompare( compared, filename)
%WRITEXLSFROMCOMPARE Summary of this function goes here
%   Detailed explanation goes here

global test_case_pathname

matrixToSave{1,1} = 'testNumber';
matrixToSave{1,2} = 'exprNumber';
matrixToSave{1,3} = 'exprText';
matrixToSave{1,4} = 'sendTC';
matrixToSave{1,5} = 'paramterName';
matrixToSave{1,6} = 'condadoOutput';
matrixToSave{1,7} = 'simuladorOutput';
matrixToSave{1,8} = 'comparation';


%    xlswrite(filename,{'testNumber'},1,'A1');
%    xlswrite(filename,{'ExprNumber'},1,'B1');
%    xlswrite(filename,{'ExprText'},1,'C1');
%    xlswrite(filename,{'sentTC'},1,'D1');
%    xlswrite(filename,{'parameterName'},1,'E1');
%    xlswrite(filename,{'condadoOutput'},1,'F1');
%    xlswrite(filename,{'simulatorOutput'},1,'G1');
%    xlswrite(filename,{'comparation'},1,'H1');    



for i = 1:size(compared,2)
     matrixToSave{i+1,1} = compared(i).testNumber;
     matrixToSave{i+1,2} = compared(i).ExprNumber;
     matrixToSave{i+1,3} = compared(i).ExprText;
     matrixToSave{i+1,4} = compared(i).sentTC;
     matrixToSave{i+1,5} = compared(i).parameterName;
     matrixToSave{i+1,6} = compared(i).condadoOutput;
     matrixToSave{i+1,7} = compared(i).simulatorOutput;
     matrixToSave{i+1,8} = compared(i).comparation;   
    
end
% 
% for i = 1:size(compared,2)
%      aux = strcat('A',num2str(i+1));
%      xlswrite(filename,compared(i).testNumber,1,strcat('A',num2str(i+1)));
%      xlswrite(filename,compared(i).ExprNumber,1,strcat('B',num2str(i+1)));
%      xlswrite(filename,{compared(i).ExprText},1,strcat('C',num2str(i+1)));
%      xlswrite(filename,{compared(i).sentTC},1,strcat('D',num2str(i+1)));
%      xlswrite(filename,{compared(i).parameterName},1,strcat('E',num2str(i+1)));
%      xlswrite(filename,{compared(i).condadoOutput},1,strcat('F',num2str(i+1)));
%      xlswrite(filename,{compared(i).simulatorOutput},1,strcat('G',num2str(i+1)));
%      xlswrite(filename,{compared(i).comparation},1,strcat('H',num2str(i+1)));    
%     
% end

save_here = strcat(test_case_pathname,filename);


    xlswrite(save_here,matrixToSave);


end

