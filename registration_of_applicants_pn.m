% start by cleaning the session
% clear all; clc;

global global_info
global_info.DELTA_TIME = 0.5;
global_info.STOP_AT = 10;
global_info.semafor = 0;
%introducting this semefors for each transaction
% all set to zero except 1 meaning only one transition can fire to start
% 1 set to active 0 to inactive
% global_info.tR_1 = 0;
% global_info.tR_2 = 0;
% global_info.tR_3 = 0;
% global_info.tR_4 = 0;
% global_info.tR_5 = 0;
% global_info.tR_6 = 0;
% global_info.tR_7 = 0;
% global_info.tR_O = 0;

% initialize pnstruct 
pns = pnstruct('registration_of_applicants_pn_pdf');

%place a token here to start the simulation
dyn.m0 = {'pR1',1};

%define the resources
dyn.re = {'registering',1,inf, 'review success',1,inf, ...
    'failed review',1,inf, 'Failed Gov. validation',1,inf, ...
    'Successful Gov. validation',1,inf, 'Successful registration',1,inf, ...  
    'Failed household registration',1,inf , ...
    'successful household registration',1,inf ...
    'making an exit',1,inf,};

%defining the firing time so that they dont fire all at the same time
dyn.ft = {'tR_1',1, 'tR_2',1, 'tR_3',1, 'tR_4',1, 'tR_5',1, 'tR_6',1, ...
        'tR_7',1, 'tR_O',1,};

% define the initial dynamics
pni = initialdynamics(pns, dyn);
%start simulation
sim = gpensim(pni);

%VIEW RESULTS

% print the use of resources , the schedule
prnschedule(sim);

%plot PetriNet
plotp(sim, {'pR1','pR2','pR3','pR4','pR5','pR6'});

%check what this is 
occupancy(sim, {'tR_1','tR_2','tR_3','tR_4','tR_5', ...
    'tR_6','tR_7','tR_O'});

%plot Grantt chart
plotGC(sim)

%coverbility tree, to be checked
cotree(pni, 1, 1);




