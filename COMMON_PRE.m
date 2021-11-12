%start
function [fire, transition] = COMMON_PRE(transition)
%global global_info

%if strcmp(transition.name, 'tR_I')
    %if not(global_info.tR_1)
        %global_info.tR_1 = 1;
        %fire = 1;
    %else
        %fire = 0;
    %global_info.tR_I = 0;
    %global_info.tR_1 = 1;
    
    %direct the token with colors
    %transition.new_color = 'tR_1';
    %transition.override = 1;
    %fire = 1;
if strcmp(transition.name, 'tR_1')
    %request for a specific resource that is registering
    granted = requestSR({'registering',1});
        %if granted == 1
            %fire = granted;
    %global_info.tR_1 = 0;
    %global_info.tR_2 = 1;       
    
    %direct the token with random colors
    randomoutput = randomgen(['tR_2','tR_3']);
    transition.new_color = randomoutput;
    transition.override = 1;
    %fire is the resource was successful
    fire = granted;
elseif strcmp(transition.name, 'tR_2')
    %request for a specific resource that is review success
    granted = requestSR({'review success',1});     
    
    %direct the token with random colors
    randomoutput = randomgen(['tR_4','tR_5']);
    transition.new_color = randomoutput;
    transition.override = 1;
    
    %fire is the resource was successful
    fire = granted;
elseif strcmp(transition.name, 'tR_3')
    %request for a specific resource that is failed review
    granted = requestSR({'failed review',1});  
    
    %direct the token with colors
    transition.new_color = 'tR_1';
    transition.override = 1;   
    
    %fire is the resource was successful
    fire = granted;
elseif strcmp(transition.name, 'tR_4')
    %request for a specific resource that is Failed Gov. validation
    granted = requestSR({'Failed Gov. validation',1});     
    
    %direct the token with colors
    transition.new_color = 'tR_7';
    transition.override = 1;
    
    %fire is the resource was successful
    fire = granted;
elseif strcmp(transition.name, 'tR_5')
    %request for a specific resource that is Successful Gov. validation
    granted = requestSR({'Successful Gov. validation',1});     
    
    %direct the token with colors
    randomoutput = randomgen(['tR_6','tRO']);
    transition.new_color = randomoutput;
    transition.override = 1;
    
    %fire is the resource was successful
    fire = granted;
elseif strcmp(transition.name, 'tR_6')
    %request for a specific resource that is Failed household registration
    granted = requestSR({'Failed household registration',1});     
    
    %direct the token with colors
    transition.new_color = 'tR_7';
    transition.override = 1;
    
    %fire is the resource was successful
    fire = granted;
elseif strcmp(transition.name, 'tR_7')
    %request for a specific resource that is making an exit
    granted = requestSR({'making an exit',1});     
    
    %direct the token with colors
    % transition.new_color = 'tR_I';
    % transition.override = 1;
    
    %fire is the resource was successful
    fire = granted;
elseif strcmp(transition.name, 'tR_O')
    %request for a specific resource that is successful household registration
    granted = requestSR({'successful household registration',1});     
            
    %fire is the resource was successful
    fire = granted;
else
    fire = 0;
end