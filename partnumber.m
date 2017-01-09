function [thissub] = partnumber()
% Enter particpiant number %
% error message which is printed to command window
fail1='Program aborted. Participant number not entered';
prompt = {'Enter participant number:'};
dlg_title ='New Participant';
num_lines = 1;
def = {'0'};
%Presents box to enterdata into
answer = inputdlg(prompt,dlg_title,num_lines,def);
switch isempty(answer)
%deals with both cancel and X presses
    case 1
        error(fail1)
    case 0
        thissub = answer{1};
end

end