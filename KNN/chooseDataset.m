function userChoice = chooseDataset()

%User input for choosing data set
prompt = {'Choose dataset: 1-face 2-pose 3-illum'};
dlg_title = 'Input';
num_lines = 1;
defaultans = {'1'};
answer = inputdlg(prompt,dlg_title,num_lines,defaultans);
userChoice = str2double(answer);

if userChoice~=1 && userChoice~=2 && userChoice~=3
    warning('Input must be 1, 2, or 3!!');
    userChoice = chooseDataset();
end

end