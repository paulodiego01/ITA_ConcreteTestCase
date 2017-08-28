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


save_here = strcat(test_case_pathname,filename);


    xlswrite(save_here,matrixToSave);


end

