function [] = COMMON_POST(~)

global global_info
% check current transation names
%tname = transition.name;

%check only for the initiating transation
%if strcmp(tname, 'tR_I')
if eq(global_info.semafor, 1)
    % do nothing
else
    %release all resources used
    release();
end