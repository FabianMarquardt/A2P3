%
%
% This script sets all relevant parameters for the impoert of LFP-data
% recorded during DBS-experiments.
%
%
% Set type of stimulation
% 

BlomRest=0;
BlomPPNl=0;
BlomPPNr=0;
BlomDopa=0;

EberREST=0;
EberSTNl=0;
EberSTNr=0;
EberPPNr=0;
EberPPNl=0;


HergenRest=0;
HergenPPNl=0;
HergenPPNr=0;
HergenDopa=0;

HabekPPNl=0;
HabekPPNr=0;
HabekGPl=0;
HabekGPl_230=0; % Stim mit 230 us Pulsbreite
HabekGPr=0;
HabekRest=0; 
HabekDopa=0;

NagelANT = 0;

OswaldRest = 0;
OswaldStim = 0;

Seehaus_rest = 0;

Kullmann_rest = 0;

Lewand_rest = 0;


Sengdopa=0;
SengSTN=0;
SengPPNr20=0;
SengPPNr130_01=0; % stim. at electrode pair 0-1
SengPPNr130_23=0; % stim. at electrode pair 2-3 
SengPPNl=0;

Muehldopa=0;
MuehlSTNl=0;
MuehlSTNr=0;
MuehlPPNr=0;
MuehlPPNl_01=0; %Applies to Stim PPN left contacts 0-1 
MuehlPPNl_23=0; %Applies to Stim PPN left contacts 2-3

GrauACCl=0;

AllstPPNr=0;
AllstSTNr=0;
AllstSTNl=0;
AllstDOPA=0;

FunkREST=0; % Daten fehlerhaft/unbrauchbar
FunkDOPA=0; 
FunkPPNl=0;
FunkPPNr=0;

StockDOPA=1;
StockDOPAclean=0;
StockPPNr=0;
StockPPNl=0;
%


%
% -------------
% Nagel, ANT
% -------------
%

if NagelANT ~= 0
    bin=2;  %BrainAmp data type
    % BrainAMp: Signals are usually sampled at 2500 or 5000 Hz. They are
    % decimated to 500 Hz by the import_brainamp script.
    fName='/Users/hinrichs/Documents/MATLAB/work/Thalamus/Nagel/Nacc_ANT_Nagel_allRest.eeg';
    nchan=19;
    %sens=zeros(nchan,1); % Wit Brain Amp no need to set it here. 

    % Labels:
    % To be set appropriately
    Pr3=14;pr3r=3;pr1r=9;pl2r=10;Pr1=16;Pr2=15;pr2r=5;pr4r=6;Fz=12;Cz=13;pl4r=11;pl1r=4;pl3r=2;Pl3=1;Pl2=8;Pl1=7;

    % These numbers refer to 500 Hz sampling frequency
    nanf = 1*60*512; % Start at 1' = 1' after initial blood sampling
    nanf = 35*60*512; % 35' = 30' after start of LDOPA application
    iend = nanf + 4*60*512; % End 4' later

end
%
%
% -------------
% Oswald, Rest, GPi Vim
% -------------
%

if OswaldRest ~= 0
    bin=2;  %BrainAmp data type
    % BrainAMp: Signals are usually sampled at 2500 or 5000 Hz. They are
    % decimated to 500 Hz by the import_brainamp script.
    fName='/Users/hinrichs/Documents/MATLAB/work/Thalamus/Oswald/Oswald_all_rest2.eeg';
    nchan=25;
 
    %sens=zeros(nchan,1); % Wit Brain Amp no need to set it here. 

    % Labels:
    % To be set appropriately
    Gl1=1;Gl2=2;Gl3=3;Gl4=4; Gr1=5;Gr2=6;Gr3=7;Gr4=8;  Vr1=9;Vr2=10;Vr3=11;Vr4=12; Vl1=13;Vl2=14;Vl3=15;Vl4=16;
    r_hh=17;l_hh=19;r_ss=18;l_ss=20;r_h=22;l_h=24;r_s=23;l_s=25;
    

    % These numbers refer to 500 Hz sampling frequency
    nanf = (2*60+0)*500; % Start at 2'. 
    iend = (5*60+0)*500; % End at 5'
%    iend = 3*60*500; % End at 3'
    end
%
%
%
% -------------
% Oswald, Stim, GPi Vim
% -------------
%

if OswaldStim ~= 0
    bin=2;  %BrainAmp data type
    % BrainAMp: Signals are usually sampled at 2500 or 5000 Hz. They are
    % decimated to 500 Hz by the import_brainamp script.
    fName='/Users/hinrichs/Documents/MATLAB/work/Thalamus/Oswald/Oswald_all_rest_Stim_02.eeg';
    nchan=25;
 
    %sens=zeros(nchan,1); % Wit Brain Amp no need to set it here. 

    % Labels:
    % To be set appropriately
    Gl1=1;Gl2=2;Gl3=3;Gl4=4; Gr1=5;Gr2=6;Gr3=7;Gr4=8;  Vr1=9;Vr2=10;Vr3=11;Vr4=12; Vl1=13;Vl2=14;Vl3=15;Vl4=16;

    % These numbers refer to 500 Hz sampling frequency
    %nanf = (16*60+7)*500; % Stim03/right Vmi 0-1 after 60''
    nanf = (19*30+7)*500; % Base line 60"after end of stim right Vim 0-1
    %nanf = (22*60+30)*500; % Stim03/right VMi 2-3 after 60''
    %nanf = (29*60+30)*500; % Stim04/left Vmi 0-1 after 60''
    %nanf = (35*60+50)*500;  % Stim04/left Vmi 2-3 after 60''
    %nanf = (32*60+30)*500; % Base Line at end og Stim04
    %nanf = (42*60+50)*500; % Stim01/left GPi 0-1 after 60''
    %nanf = (48*60+50)*500; % Stim01/left GPi 2-3 after 60''
    %nanf = (9*60+10)*500; % Stim02/rightt GPi 2-3 after 60''
    %nanf = (3*60+10)*500;  % Stim02/right GPi 0-1 after 60''
    %nanf=1;
    %iend = nanf+3*60*500; % End 3' later
    iend = nanf+2*60*500; % End 2' later
    
    end
%
%
%
% -------------
% Seehausen, Rest, AnT NAcc
% -------------
%

if Seehaus_rest ~= 0
    bin=1;  %Binary Walter-type
    
    fName='/Users/hinrichs/Documents/MATLAB/work/Thalamus/Seehausen/SEEHAUSEN_08032012_ALL_REST.bin';
    nchan=31;
 
    sens(1:31)=-247; % 

    % Labels:
    % To be set appropriately
    
%Seehausen-electrodes:
ATr3=1;Accr2r=2;aTr3r=3;Accr4r=4;aTr1r=5;Accr3r=6;Oz=7;aTl2r=8;Accl1r=9;Accl2r=10;ATr1=11;    
ATr2=12;Accr1r=13;aTr2r=14;aTr4r=15;Fpz=16;Cz=17;aTl4r=18;aTl1r=19;Accl3r=20;Accl4r=21;aTl3r=22;    
ACl3=23;ACl2=24;ACl1=25;ACr3=26;ACr2=27;ACr1=28;ATl3=29;ATl2=30;ATl1=31; 

    % These numbers refer to 500 Hz sampling frequency
    nanf = 1*60*500; % Start at 1'.
    nanf=30*512; %start at 30"
    iend = 5*60*500; % End at 5'
    %iend = 3*60*500; % End at 3'
    end
%
%
%
%
% -------------
% Lewandowsky, Rest, AnT Oz
% -------------
%

if Lewand_rest ~= 0
    bin=1;  %Binary Walter-type
    
    fName='/Users/hinrichs/Documents/MATLAB/work/Thalamus/Lewandowsky/LEWANDOWSKI_20062012_ALL_REST.bin';
    nchan=33;
 
    sens(1:33)=-247; % 

    % Labels:
    % To be set appropriately
    
%Seehausen-electrodes:
ATr3=1;Accr2r=2;aTr3r=3;Accr4r=4;aTr1r=5;Accr3r=6;T1=7;Oz=8;aTl2r=9;T2=10;Accl1r=11;Accl2r=12;ATr1=13;    
ATr2=14;Accr1r=15;aTr2r=16;aTr4r=17;Fpz=18;Cz=19;aTl4r=20;aTl1r=21;Accl3r=22;Accl4r=23;aTl3r=24;    
ACl3=25;ACl2=26;ACl1=27;ACr3=28;ACr2=29;ACr1=30;ATl3=31;ATl2=32;ATl1=33; 

    % These numbers refer to 500 Hz sampling frequency
    nanf = 2*60*500; % Start at 2'.
    
    iend = 8*60*500; % End at 5'
    %iend = 3*60*500; % End at 3'
    end
%
%
%
% -------------
% Kullmann, Rest, AnT Pz
% -------------
%

if Kullmann_rest ~= 0
    bin=1;  %Binary Walter-type
    
    fName='/Users/hinrichs/Documents/MATLAB/work/Thalamus/Kullmann/KULLMANN_01072011_ALL_REST.bin';
    nchan=18;
 
    sens(1)    = -989;
    sens(2:5)  = -494;
    sens(6:7)  = -989; %
    sens(8:14) = -494;
    sens(15:18)= -989;

    % Labels:
    % To be set appropriately
    
%Kullmann-electrodes:
ATr3=1;aTr3r=2;aTr1r=3;Pz=4;aTl2r=5;ATr1=6;ATr2=7;aTr2r=8;aTr4r=9;FCz=10;Cz=11;aTl4r=12;aTl1r=13;aTl3r=14;ATl3=15;ATl2=16;Fz_c=17;ATl1=18;   

    % These numbers refer to 500 Hz sampling frequency
    nanf = 1; % Start at 1'.
 
    iend = 5*60*500; % End at 5'
    %iend = 3*60*500; % End at 3'
    iend = (1*60+35)*512;
    end
%
%
%
% --------
% Habekost, Rest
% --------
if HabekRest ~= 0
    bin=1;
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Habekost/HABEKOST_REST_17112011.bin';
    nchan=30;
    sens=zeros(nchan,1);
% 
% Channel labels 
%
     pr1=10;pl1=30;Gr1=27;Gl1=24;pr1r=5;pl1r=18;Gr1r=12;Gl1r=8;AFz=15;Cz=16;pl4r=17;pr4r=14;Gl4r=20;Gr4r=4;
%
% Sensitivities/channel
%

    sens(1)=-989;
    sens(2:9)=-494;
    sens(10:11)=-989;
    sens(12:21)=-494;
    sens(22:30)=-989;
%
%  All rest
%
nanf=30000;
%nanf=61440; % Start 120 sec after beginning to skip artifacts
%nanf=80000; % Start 10 sec after beginning to skip artifacts

%iend=170*512; % End 10 sec before recording stop
iend=nanf+18*1024;
iend=92000;

end
%
% --------
% Habekost, L-Dopa
% --------
if HabekDopa ~= 0
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/L-DOPA/Habekost/HABEKOST_18112011_DOPA_BEINE.bin';

    bin=1;
    nchan=30;
    sens=zeros(nchan,1);
% 
% Channel labels 
%
     pr1=10;pl1=30;Gr1=27;Gl1=24;pr1r=5;pl1r=18;Gr1r=12;Gl1r=8;AFz=15;Cz=16;pl4r=17;pr4r=14;Gl4r=20;Gr4r=4;pl2r=7;pr2r=13;pr3r=3;pl3r=21;
%
% Sensitivities/channel
%

    sens(1)=-989;
    sens(2:9)=-494;
    sens(10:11)=-989;
    sens(12:21)=-494;
    sens(22:30)=-989;
%
% Habekost, L-Dopa
%
%nanf =  512; % no movement, no medication, right at the beginning
%nanf = (1*60+30)*512; % Start at 1:30
%nanf = (9*60)*512;
%nanf = 110143;% leg passive, no medication
%nanf = 128000;% rest after leg passive
%nanf = 156250;% leg active, no medication
%nanf = 208504;% leg passive, no medication
%nanf = 256147;% leg active, no medication
%nanf = 276480; % 9' ==> after movement, right before ldopa application 
nanf = 1105920; % 25' 30" after L-Dopa application


%nanf = 1198080; % Rest, l-Dopa (starting at 39:00 min)
%nanf = (15*60)*512;
%nanf = (20*60)*512;
%nanf = (35*60)*512;
%nanf = (45*60+35)*512;
%nanf = 1237192;% leg passive, l-Dopa
%nanf = 1259520; %rest between lag passive and leg active
%nanf = 1283584; % leg active, L-Dopa
%nanf = 1333760;% leg passive, l-Dopa
%nanf = 1384448;% leg active, l-Dopa
%nanf = 1403688; % no movement, l-Dopa
iend = nanf+(3*60)*512;
%iend = nanf+(2*60)*512;
%iend =   107520; % no movement, no medication%
%iend = 368640; % 12' ==> after movement, shortly after start of  ldopa application 
%iend=iend-60*512;
%%iend =  30737+40000+18*1024; % no movement, no medication
%iend = 110000; % no movement
%iend = 125512;% leg passive, no medication
%iend = 172643;% leg active, no medication
%iend = 156250+18*1024;% leg active, no medication
%iend = 222848;% leg passive, no medication
%iend = 274077;% leg active, no medication

%iend = 1228800; % 39'30'' after L-Dopa application

%iend = 1198080+18*1024;% no movement, l-Dopa, start+60 sec
%iend = 1251328;% leg passive, l-Dopa
%iend = 1259520+20*1024; %rest between lag passive and leg active
%iend = 1299968;% leg active, l-Dopa
%iend = 1350144;% leg passive, l-Dopa
%iend = 1400320;% leg active, l-Dopa
%iend = 1384448+18*1024;% leg active, l-Dopa
%iend = 1444672; % no movement, l-Dopa



end
%
% ---------- 
% Habekost Stim PPN l
% ----------
if HabekPPNl ~= 0 
    bin=1;
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Habekost/HABEKOST_17112011_LEFTPPN_new.bin';
    nchan=23;
    sens=zeros(nchan,1);
%
% Channel labels
%
    Pr3=1;Gr2r=2;pr3r=3;Gr4r=4;pr1r=5;Gr3r=6;Gl1r=7;Gl2r=8;Pr1=9;Pr2=10;Gr1r=11;pr2r=12;pr4r=13;AFz=14;Cz=15;Gl3r=16;Gl4r=17;Gl3=18;Gl2=19;Gl1=20;Gr3=21;Gr2=22;Gr1=23;
% Sensitivities/channel
%
 
    sens(1)=-989;
    sens(2:8)=-494;
    sens(9:10)=-989;
    sens(11:17)=-494;
    sens(18:23)=-989;
%
% STim PPN left
%

nanf=37910; % BL1
%nanf=97337; % 20 Hz 0-1 2V
%nanf=205432; % 20 Hz 2-3 2V
%nanf=223000; % BL3
%nanf=384225; % 130 Hz 0-1 2V
%nanf=470000; % 130 Hz 2-3 2V

%iend=56353; % BL1
iend=37910+18*1024; % BL
%iend=114755; % 20 Hz 0-1 2V
%iend=97337+18*1024; % 20 Hz 0-1 2V
%iend=222851; % 20 Hz 2-3 2V
%iend=205432+18*1024; % 20 Hz 2-3 2V
%iend=243000; % BL3
%iend=402668; % 130 Hz 0-1 2V
%iend=384225+18*1024; % 130 Hz 0-1 2V
%iend=486400; % 130 Hz 2-3 2V
%iend=470000+18*1024; % 130 Hz 2-3 2V
    
end
%
% ---------- 
% Habekost Stim PPN r
% ----------
if HabekPPNr ~= 0 
    bin=1;
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Habekost/HABEKOST_17112011_RIGHTPPN.bin';
    nchan=23;
    sens=zeros(nchan,1);
%
% Channel labels
%
    Gr2r=1;Gr4r=2;Gr3r=3;pl2r=4;Gl1r=5;Gl2r=6;Gr1r=7;AFz=8;Cz=9;pl4r=10;pl1r=11;Gl3r=12;Gl4r=13;pl3r=14;Gl3=15;Gl2=16;Gl1=17;Gr3=18;Gr2=19;Gr1=20;Pl3=21;Pl2=22;Pl1=23;
% Sensitivities/channel
%
    sens(1:14)=-494;
    sens(15:23)=-989;
%
% Stim PPN right
%

nanf =  37397; % BL
%nanf =  57890; % 20 Hz 0-1 1V
%nanf =  75308; % BL 2
nanf =  93751; % 20 Hz, 2V, 0-1 
%nanf = 112705; % BL3
%nanf = 140882; % 20 Hz 2-3 1V
%nanf = 158812; % BL4
nanf = 179305; % 20 Hz 2-3 2V
%nanf = 246928; % 130 Hz 0-1 1V
%nanf = 264859; % BL5 
nanf = 282790; % 130 Hz, 0-1 2V
%nanf = 301232; % BL6
nanf = 338630; % 130 Hz 2-3 1V
%nanf = 356560; % BL7
%nanf = 375004; % 130 Hz 2-3 1V

%iend =  56865; % BL
iend =  37397+18*1024; % BL
%iend =  74284; % 20 Hz 0-1 1V
%iend =  92726; % BL 2
%iend = 111681; % 20 Hz, 2V, 0-1 
iend =  93751+18*1024; % 20 Hz, 2V, 0-1 
%iend = 139858; % BL3
%iend = 157788; % 20 Hz 2-3 1V
%iend = 178280; % BL4
%iend = 196723; % 20 Hz 2-3 2V
iend = 179305+18*1024; % 20 Hz 2-3 2V
%iend = 263835; % 130 Hz 0-1 1V
%iend = 300208; % 130 Hz, 0-1 2V
iend = 282790+18*1024; % 130 Hz, 0-1 2V
%iend = 337605; % BL6
%iend = 355536; % 130 Hz 2-3 1V
iend = 338630+18*1024; % 130 Hz 2-3 1V
%iend = 373979; % BL7
%iend = 391397; % 130 Hz 2-3 1V

end
%
% ---------- 
% Habekost Stim GPi r
% ----------
if HabekGPr ~= 0
    bin=1;
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Habekost/HABEKOST_17112011_RIGHTGPI.bin';
    nchan=23;
    sens=zeros(nchan,1);
%
% Channel labels and stimulation condition
%
% Right GPi Stimulation:
%
% Labels:
    Pr3=1;pr3r=2;pr1r=3;pl2r=4;Gl1r=5;Gl2r=6;Pr1=7;Pr2=8;pr2r=9;pr4r=10;AFz=11;Cz=12;pl4r=13;pl1r=14;Gl3r=15;Gl4r=16;pl3r=17;Gl3=18;Gl2=19;Gl1=20;Pl3=21;Pl2=22;Pl1=23;
% Sensitivities/channel

    sens(1)=-989;
    sens(2:6)=-494;
    sens(7:8)=-989;
    sens(9:17)=-494;
    sens(18:23)=-989;
%
% Stim GPI right, 60 usec
%
%nanf=1;
nanf=39447; % BL
%nanf = 58915; % 130 Hz 2-3 2V
%nanf = 76845; % BL2
%nanf = 76000; % TEST TEST TEST
nanf = 99899;% 130 Hz 2-3 4V ACHTUNG: Spektren + HP-gefilterte Signale sagen: Beginnt bei 95000!!!
%nanf = 95000;% 130 Hz 2-3 4V

%iend = 57890; % BL
iend = 39447+18*1024;
%iend = 75820; % 130 Hz 2-3 2V
%iend = 98874; % BL2
%iend = 120300; % 130 Hz 2-3 4V ACHTUNG: Spektren + HP-gefilterte Signale  sagen: Endet bei 115000!!!
%iend = 120300-5000; % 130 Hz 2-3 4V
%iend = 118500;% TEST TEST TEST BETTER: around sample 119000 peak-like artifact
%iend = 95000+18*1024; % 
iend = 99899+18*1024; %
%iend=130000;

end
%
% -------------
% Habekost Stim GPi left
% -------------
%

if HabekGPl ~= 0
    bin=1;
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Habekost/HABEKOST_17112011_LEFTGPI.bin';
    nchan=23;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;Gr2r=2;pr3r=3;Gr4r=4;pr1r=5;Gr3r=6;pl2r=7;Pr1=8;Pr2=9;Gr1r=10;pr2r=11;pr4r=12;AFz=13;Cz=14;pl4r=15;pl1r=16;pl3r=17;Gr3=18;Gr2=19;Gr1=20;Pl3=21;Pl2=22;Pl1=23;
% Sensitivities/channel

    sens(1)=-989;
    sens(2:7)=-494;
    sens(8:9)=-989;
    sens(10:17)=-494;
    sens(18:23)=-989;
%
%  Stim GPi left 
%

%nanf=1;
nanf = 38423; % BL
%nanf = 38423+10*512; %  TEST TEST TEST
%nanf = 56353; %  130 Hz 2-3 2V
%nanf = 56353+16*512;
%nanf = 74284; % BL2
nanf = 92726; % 130 Hz 2-3 4V 
%nanf=92726+16*512; % TEST TEST TEST
%nanf=92726+25*512; % TEST TEST TEST

%iend = 55328; % BL
iend = 38423+1024*18;
%iend = 73259; %  130 Hz 2-3 2V
%iend = 91702; % BL2
%iend = 110145;% 130 Hz 2-3 4V
iend = 92726+1024*18;% 130 Hz 2-3 4V 
%iend=140000;


    
end
%
% -------------
% Habekost Stim GPi left, 230 us pulse width
% -------------
%

if HabekGPl_230 ~= 0
    bin=1;
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Habekost/HABEKOST_17112011_LEFTGPI_230MICROSEC.bin';
    nchan=23;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;Gr2r=2;pr3r=3;Gr4r=4;pr1r=5;Gr3r=6;pl2r=7;Pr1=8;Pr2=9;Gr1r=10;pr2r=11;pr4r=12;AFz=13;Cz=14;pl4r=15;pl1r=16;pl3r=17;Gr3=18;Gr2=19;Gr1=20;Pl3=21;Pl2=22;Pl1=23;
% Sensitivities/channel

    sens(1)=-989;
    sens(2:7)=-494;
    sens(8:9)=-989;
    sens(10:17)=-494;
    sens(18:23)=-989;
%
%  Stim GPi left, 230 usec 
%

nanf = 39447; % BL
%nanf = 61476; % 130 Hz 2-3 2V
%nanf = 80431; % BL2
%nanf = 100411; % 130 Hz 2-3 4V


%iend = 61475; % BL
iend = 39447+18*1024;% BL
%iend = 39447+22*1024;% BL
%iend = 79407;  % 130 Hz 2-3 2V
%iend=74000;
%iend = 99386; % BL2
%iend = 119878; % 130 Hz 2-3 4V

end
%
% -------------
% Sengstacke, L-DOPA 
% -------------
%

if Sengdopa ~= 0
    bin=1;
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/L-DOPA/Sengstacke/SENGSTACKE_LDOPA_030911.bin';
    nchan=16;
    sens=zeros(nchan,1);
% Labels:
    Pr3=14;pr3r=3;pr1r=9;pl2r=10;Pr1=16;Pr2=15;pr2r=5;pr4r=6;Fz=12;Cz=13;pl4r=11;pl1r=4;pl3r=2;Pl3=1;Pl2=8;Pl1=7;
% Sensitivities/channel

    sens(1:nchan)=-247;
    
    nanf = 1*60*512; % Start at 1' = 1' after initial blood sampling
    nanf = 35*60*512; % 35' = 30' after start of LDOPA application
    iend = nanf + 4*60*512; % End 4' later

end
%
% -------------
% Sengstacke, STN-stim
% -------------
%

if SengSTN ~= 0
    bin=0; % Export type = ASCSengPPNr
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Sengstacke/SENGSTACKE_SPONTAN_STNSTIM_02092010.asc';
    nchan=16;
    sens=zeros(nchan,1);
% Labels:
    Pr3=14;pr3r=3;pr1r=9;pl2r=10;Pr1=16;Pr2=15;pr2r=5;pr4r=6;Fz=12;Cz=13;pl4r=11;pl1r=4;pl3r=2;Pl3=1;Pl2=8;Pl1=7;
% Sensitivities/channel

    sens(1:nchan)=-247;
%
%  STN-stim
%
nanf = hex2dec('eda');    % Base line
%nanf = hex2dec('56b78');  % STN l 130 Hz 2-3 1.5V
%nanf = hex2dec('7790c');  % STN l 130 Hz 2-3 2V
%nanf = hex2dec('f170c');  % STN r 130 Hz 2-3 2V
%nanf = hex2dec('175b04'); % STN l 60 Hz 2-3 2V FORGET IT (electrodes r def.)!!!
%nanf = hex2dec('1ee2dc'); % STN r 60 Hz 2-3 2V OK!!!
%
%iend = hex2dec('FEB4');  % Base line
iend = hex2dec('eda')+30000;    % Base line
%iend = hex2dec('66034')-30000;  % STN l 130 Hz 2-3 1.5V
%iend = hex2dec('7790c')+59000;  % STN l 130 Hz 2-3 2V
%iend = hex2dec('f170c')+55000; % STN r 130 Hz 2-3 2V
%iend = hex2dec('175b04')+55000; % STN l 60 Hz 2-3 2V FORGET IT(electrodes r def.)!!!
%iend = hex2dec('1ee2dc')+40000; % STN r 60 Hz 2-3 2V TEST TEST OK!!!
%
end
%
%
% -------------
% Sengstacke, PPN-stim left
% -------------
%

if SengPPNl ~= 0
    bin=1; % Export type = Bin
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Sengstacke/SENGSTACKE_SPONTAN_PPN_LEFT.bin';
    nchan=9;
    sens=zeros(nchan,1);
% Labels:
    pr2r=6;Fz=8;Cz=9;pr4r=7;pr1r=3;pr3r=2;Pr3=1;Pr2=5;Pr1=4;
% Sensitivities/channel

    sens(1:nchan)=-247;
%
%  PPN-stim left
%
%nanf = 1000;    % Base line
%nanf = 437000;  % PPN-Stim 20 Hz, 2V, 0-1
%nanf = 935000;  % PPN-Stim 20 Hz, 2V, 2-3
%nanf = 1456000;  % PPN-Stim 130 Hz, 2V, 0-1
%nanf = 1947000;  % PPN-Stim 130 Hz, 2V, 2-3
%
%iend = 61000;  % Base line
%iend = 497000;  % PPN-Stim 20 Hz, 2V, 0-1 
%iend = 994000;  % PPN-Stim 20 Hz, 2V, 2-3 
%iend = 1516000;  % PPN-Stim 130 Hz, 2V, 0-1 
%iend = 2009000;  % PPN-Stim 130 Hz, 2V, 2-3 


end
%
%
% -------------
% Sengstacke, PPN-stim right, 20 Hz
% -------------
%

if SengPPNr20 ~= 0
    bin=0; % Export type = ASCII
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Sengstacke/SENGSTACKE_SPONTAN_PPNR20HZ_02092010.asc';
    nchan=9;
    sens=zeros(nchan,1);
% Labels:
    pl2r=6;Fz=8;Cz=9;pl4r=7;pl1r=3;pl3r=2;Pl3=1;Pl2=5;Pl1=4;
% Sensitivities/channel

    sens(1:nchan)=-247;
    
%  PPN-stim right , 20 Hz
%
nanf = hex2dec('35e');    % Base line
nanf = hex2dec('6eaf8');  % PPN-Stim 20 Hz, 2V, 0-1
%nanf = hex2dec('fec3c');  % PPN-Stim 20 Hz, 2V, 2-3
%
iend = hex2dec('13078');  % Base line
iend = hex2dec('7fbcc');  % PPN-Stim 20 Hz, 2V, 0-1 
%iend = hex2dec('10e218')-3000;  % PPN-Stim 20 Hz, 2V, 2-3, Artefakte am Ende ausblenden
%
%
end
%
%
% -------------
% Sengstacke, PPN-stim right, 130 Hz at electrode pair 0-1
% -------------
%

if SengPPNr130_01 ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Sengstacke/SENGSTACKE_PPN_RIGHT_130HZ_0-1+.bin';
    nchan=9;
    sens=zeros(nchan,1);
% Labels:
    pl2r=6;Fz=8;Cz=9;pl4r=7;pl1r=3;pl3r=2;Pl3=1;Pl2=5;Pl1=4;
% Sensitivities/channel

    sens(1:nchan)=-247;
%
%
%  PPN-stim right , 130 Hz, 0-1+, separate data file,
%                               but recordings followed immediately after
%                               end of sti. PPN r 20 Hz recordings
%
nanf = 4000;    % Base line
nanf = 542000;  % PPN-Stim 130 Hz, 2V, 0-1
%
iend = 114000;  % Base line
iend = 597000;  % PPN-Stim 130 Hz, 2V, 0-1 
%
end
%
%
% -------------
% Sengstacke, PPN-stim right, 130 Hz at electrode pair 2-3
% -------------
%

if SengPPNr130_23 ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Sengstacke/SENGSTACKE_PPN_RIGHT_130HZ_2-3+.bin';
    nchan=9;
    sens=zeros(nchan,1);
% Labels:
    pl2r=6;Fz=8;Cz=9;pl4r=7;pl1r=3;pl3r=2;Pl3=1;Pl2=5;Pl1=4;
% Sensitivities/channel

    sens(1:nchan)=-247;
%
%  PPN-stim right , 130 Hz, 2-3+, separate data file,
%                               recordings at the day followed the 
%                               recording of the stim. PPN r 130 Hz 0-1+ rec. 
%
%nanf = 4000;    % Base line
%nanf = 454000;  % PPN-Stim 130 Hz, 2V, 2-3
%
%iend = 79000;  % Base line
%iend = 514000;  % PPN-Stim 130 Hz, 2V, 2-3 

end
%
%
% -------------
% Mühlbauer, L-DOPA
% -------------
%

if Muehldopa ~= 0
    bin=0; % Export type = ASCII
    %fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/L-DOPA/Muehlbauer/MUEHLBAUER_07072010_LDOPA.asc';
   fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/L-DOPA/Muehlbauer/MUEHLBAUER_12072010_LDOPA_BLUT.asc';
    nchan=30;
    sens=zeros(nchan,1);
% Labels:
    Pr3=28;pr3r=3;pr1r=12;pl2r=13;Pr1=30;Pr2=29;pr2r=5;pr4r=6;Fz=15;Cz=16;pl4r=14;pl1r=4;pl3r=2;Pl3=1;Pl2=11;Pl1=10;
% Sensitivities/channel

    sens(1:nchan)=-247;
%
%
% L-DOPA
%
%nanf = hex2dec('eda');    % Beginn base line lt. Trigger
nanf=1; % Baseline
nanf=(33*60+30)*512; % Aftre blood sampling following LDopa-application+30'
%
%iend = hex2dec('FEB4');  % Base line
iend = nanf+(3*60*512);   % Base line + 3'
%iend=(36*60+30)*512; % Baseline

%
end
%
%
%
% -------------
% Mühlbauer, STN stim right
% -------------
%

if MuehlSTNr ~= 0
    bin=0; % Export type = ASCII
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Muehlbauer/MUEHLBAUER_07072010_STIMSTNRE.asc';
    nchan=24;
    sens=zeros(nchan,1);
% Labels:
    Pr3=22;pr3r=4;pr1r=11;pl2r=12;Pr1=24;Pr2=23;pr2r=6;pr4r=7;Fz=14;Cz=15;pl4r=13;pl1r=5;pl3r=3;Pl3=1;Pl2=10;Pl1=9;
% Sensitivities/channel

    sens(1:nchan)=-247;
% Mühlbauer, STN Stim right, PPN links und STN rechts nicht o.k.
%
nanf = hex2dec('596');    % Base line
%nanf=hex2dec('91bc2'); % Start Stim right STN 60 Hz 2V
nanf=hex2dec('116876'); % Start Stim right STN 130 Hz 2V
%nanf = 1205760; % base line at end

iend = hex2dec('31c46');  % Base line
%iend=hex2dec('a192e'); % End Stim right STN 60 Hz 2V
iend=hex2dec('1267cc'); % End Stim right STN 130 Hz 2V
%iend = 1205760+18*1024; % base line at end
%

end
%


%
%
% -------------
% Mühlbauer, STN stim left
% -------------
%

if MuehlSTNl ~= 0
    bin=0; % Export type = ASCII
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Muehlbauer/MUEHLBAUER_07072010_STIMSTNLI.asc';
    nchan=24;
    sens=zeros(nchan,1);
% Labels:
    Pr3=22;pr3r=4;pr1r=11;pl2r=12;Pr1=24;Pr2=23;pr2r=6;pr4r=7;Fz=14;Cz=15;pl4r=13;pl1r=5;pl3r=3;Pl3=1;Pl2=10;Pl1=9;sr1r=17; sr4r=16;Sr1=21;
% Sensitivities/channel

    sens(1:nchan)=-247;
    %
% Mühlbauer, STN Stim left, Kanal PPN l (1-4) defekt
%
nanf = hex2dec('2812');    % Base line
%nanf=hex2dec('b54e6'); % Start Stim right STN 60 Hz 2V
%nanf=hex2dec('13b1f8'); % Start Stim right STN 130 Hz 2V
ianf=hex2dec('14b106')+1024; %Base line after stim
%
%iend = hex2dec('31c46');  % Base line
iend=hex2dec('2812')+18*1024; % Base line
%iend=hex2dec('c5f4a'); % End Stim right STN 60 Hz 2V
%iend=hex2dec('14b106'); % End Stim right STN 130 Hz 2V
iend=hex2dec('14b106')+1024+18*1024; %Base line after stim
%

end
%

%
% -------------
% Mühlbauer, PPN stim right
% -------------
%

if MuehlPPNr ~= 0
    bin=0; % Export type = ASCII
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Muehlbauer/MUEHLBAUER_09072010_STIM_PPNR.asc';
    nchan=23;
    sens=zeros(nchan,1);
% Labels:
    Pl3=1;pl3r=2;pl1r=3;Pl1=7;Pl2=8;pl2r=9;pl4r=10;Fz=11;Cz=12;sl1r=14;sl4r=13;sr1r=6;sr4r=5;
% Sensitivities/channel

    sens(1:nchan)=-247;
%
% PPN Stim right, STN li hier extrem niedrig. Kaputt?
%
%nanf = 30000;    % Base line
nanf = 543000; % Stim 20 Hz, 2V, 0-1
%nanf = 1600000; % Stim 20 Hz, 2V, 2-3
nanf = 1063000; % Start Stim right STN 130 Hz 2V, 0-1
nanf = 2115000; % Start Stim right STN 130 Hz 2V, 2-3
%
%iend = 153000;  % Base line
iend = 604000; % Stim 20 Hz, 2V, 0-1
%iend = 1661000; % Stim 20 Hz, 2V, 2-3
iend = 1126000; % End Stim right STN 130 Hz 2V, 0-1
iend = 2181000; % End Stim right STN 130 Hz 2V, 2-3
%

end

%
%
% -------------
% Mühlbauer, PPN stim left at electrodes 0-1
% -------------
%

if MuehlPPNl_01 ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Muehlbauer/MUEHLBAUER_08082010_LEFTPPN.bin';

    nchan=23;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=2;pr1r=3;Pr1=7;Pr2=8;pr2r=9;pr4r=10;Fz=11;Cz=12;sl1r=14;sl4r=13;sr1r=6;sr4r=5;
% Sensitivities/channel

    sens(1:nchan)=-247;
%
%  PPN Stim left, contacts 0-1
%
%nanf = 30000;    % Base line
%nanf = 1329000; % Stim 20 Hz, 2V, 0-1
%nanf = 1957000; % Start Stim right STN 130 Hz 2V, 0-1
%
%iend = 158000;  % Base line
%iend = 1421000; % Stim 20 Hz, 2V, 2-3
%iend = 2019000; % End Stim right STN 130 Hz 2V, 2-3
%  
end
%
% -------------
% Mühlbauer, PPN stim left at electrodes 2-3
% -------------
%

if MuehlPPNl_23 ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Muehlbauer/MUELBAUER_10072012_STIM_PPN_LEFT_2-3+.bin';

    nchan=23;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=2;pr1r=3;Pr1=7;Pr2=8;pr2r=9;pr4r=10;Fz=11;Cz=12;sl1r=14;sl4r=13;sr1r=6;sr4r=5;
% Sensitivities/channel

    sens(1:nchan)=-247;
%
%  PPN Stim left, contacts 2-3 (ATTENTION: separate data file!!)
%
%nanf = 1000;    % Base line
%nanf = 151200; % Stim 20 Hz, 2V, 2-3
%nanf = 696800; % Start Stim right STN 130 Hz 0.5V, 2-3
%
%iend = 150000;  % Base line
%iend = 210000; % Stim 20 Hz, 2V, 2-3
%iend = 740000; % End Stim right STN 130 Hz 0.5V, 2-3 recording ABANDONED!!
%  
end

% % % 

%
% -------------
% Allstein, LDOPA
% -------------
%

if AllstDOPA ~= 0
    bin=0; % Export type = ASC
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/L-DOPA/Allstein/ALLSTEIN_DOPA.asc';
    nchan=23;
    sens=zeros(nchan,1);
% Labels:
    PR3=1;pr3r=2;pr1r=3;sl2r=4;sr4r=5;sr1r=6;PR1=7;PR2=8;pr2r=9;pr4r=10;Fz=11;Cz=12;sl4r=13;sl1r=14;sr2r=15;sr3r=16;sl3r=17;SR3=18;SR2=19;SR1=20;SL3=21;SL2=22;SL1=23;

% Sensitivities/channel

    sens(1:nchan)=-247;
%
% LDOPA application
%
%nanf =hex2dec('2f8d0'); % Very beginning before movement
%nanf =hex2dec('3646e');% Dopa off, beginning of passive movement
%nanf =hex2dec('3dd96');% Dopa off, beginning of 2nd passive movement
%nanf =hex2dec('43a62');% Dopa off, beginning of active movement
%nanf =hex2dec('16a5e4');% Dopa on, beginning of passive movement
nanf =hex2dec('1725ac');% Dopa on, beginning of 2nd passive movement
%nanf = 1075200; % 30' after L-Dopa application
%nanf = hex2dec('eda');

%iend = hex2dec('313fc'); % end = beginning of BL rigt before movement
%iend = hex2dec('3646e'); % end = beginning of BL rigt before movement
%iend = hex2dec('3a2ee'); % Dopa off, end of passive movement
%iend = hex2dec('41c14'); % Dopa off, end of 2nd passive movement
%iend = hex2dec('46740'); % Dopa off, end of active movement
%iend = hex2dec('16e03a'); % Dopa on, end of passive movement
iend = hex2dec('176492'); % Dopa on, end of 2nd passive movement
%iend = 409600;% base line before L-Dopa application + 2'30"
%iend = 445440;% base line before L-Dopa application + 3'40"
%iend = 1228800; % 30'+5' after L-Dopa application


end


%
% -------------
% Allstein, PPN re stim
% -------------
%

if AllstPPNr ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Allstein/ALLSTEIN_07102010_STIM_RIGHT_PPN.bin';
    nchan=16;
    sens=zeros(nchan,1);
% Labels:
    Sl3=1;sl3r=2;sl1r=3;sr2r=4;Sl1=5;Sl2=6;sl2r=7;sl4r=8;Fz=9;Cz=10;sr4r=11;sr1r=12;sr3r=13;Sr3=14;Sr2=15;Sr1=16;

% Sensitivities/channel

    sens(1:nchan)=-247;
%
% Stim PPN right
%
%nanf = 1000; % base line
%nanf = 497800; % Stim PPN r, 20 Hz, 2 V 
nanf = 1011200; % Stim PPN r, 130 Hz, 2V

%iend = 69000;% base line
%iend = 540000; % Stim PPN r, 20 Hz, 2V
iend = 1077700; % Stim PPN r, 130 Hz, 2V

end
%
% -------------
% Allstein, STN re stim
% -------------
%

if AllstSTNr ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Allstein/ALLSTEIN_07102010_STIM_RIGHT_STN.bin';
    nchan=16;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=2;pr1r=3;sl2r=4;Pr1=5;Pr2=6;pr2r=7;pr4r=8;Fz=9;Cz=10;sl4r=11;sl1r=12;sl3r=13;Sl3=14;Sl2=15;Sl1=16;

% Sensitivities/channel

    sens(1:nchan)=-247;
    %
% Stim STN right
%
%nanf = 1600; % base line
%nanf = 464000; % Stim STN r, 60 Hz, 2 V 
nanf = 667700; % Stim STN r, 130 Hz, 2V

%iend = 69000;% base line
%iend = 528000; % Stim STN r, 60 Hz, 2V
iend = 742000; % Stim STN r, 130 Hz, 2V
%


end
%
% -------------
% Allstein, STN le stim
% -------------
%

if AllstSTNl ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Allstein/ALLSTEIN_07102010_STIM_LEFTT_STN.bin';

    nchan=16;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=2;pr1r=3;sr2r=4;Pr1=5;Pr2=6;pr2r=7;pr4r=8;Fz=9;Cz=10;sr4r=11;sr1r=12;sr3r=13;Sr3=14;Sr2=15;Sr1=16;

% Sensitivities/channel

    sens(1:nchan)=-247;
%
% Stim STN left
%
%nanf = 1100; % base line
%nanf = 561200; % Stim STN l, 60 Hz, 2 V 
nanf = 1072700; % Stim STN l, 130 Hz, 2V

%iend = 67000;% base line
%iend = 627200; % Stim STN l, 60 Hz, 2V
iend = 1136640; % Stim STN l, 130 Hz, 2V

end
%

%
% -------------
% Grau, Stim Acc le
% -------------
%

if GrauACCl ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Grau/GRAU_02112011_LACC_STIM.bin';
    nchan=25;
    sens=zeros(nchan,1);
% Labels:
    ATr3=1;Accr2r=2;aTr3r=3;Accr4r=4;aTr1r=5;Accr3r =6;POz =7;aTl2r=8;Oz=9;ATr1=10;ATr2=11;Accr1r=12;aTr2r=13;  
    aTr4r=14; Fpz=15;Cz=16;aTl4r=17;aTl1r=18;aTl3r=19;ACr3=20;ACr2=21;ACr1=22;ATl3=23;ATl2=24;ATl1=25;
% Sensitivities/channel

    sens(1)     = -989;
    sens(2:9)  = -494;
    sens(10:11)= -989;
    sens(12:19)= -494;
    sens(20:25)= -989;


%
% Stim ACC left
%
nanf = 15000; % base line
nanf = 197230;
%nanf = ; % Stim 20 Hz 2V 0-1
%nanf = ; % Stim 20 Hz 2V 2-3
%nanf = ; % Stim 130 Hz 2V 0-1
%nanf = ; % Stim 130 Hz 2V 2-3


iend = 35800; % base line
iend = 215160;
iend = 245900;
%iend = ; % Stim 20 Hz 2V 0-1
%iend = ; % Stim 20 Hz 2V 2-3
%iend = ; % Stim 130 Hz 2V 0-1
%iend = ; % Stim 130 Hz 2V 2-3

end

% 
% -------------
% Funk, L-DOPA
% -------------
%

if FunkDOPA ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/L-DOPA/Funk/FUNK_05042012_DOPA.bin';
    nchan=17;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=2;pr1r=3;Cz=4;pl2r=5;Pr1=6;Pr2=7;pr2r=8;pr4r=9;AFz=10;CFz=11;pl4r=12;pl1r=13;pl3r=14;Pl3=15;Pl2=16;Pl1=17;

% Sensitivities/channel

    sens(1:nchan)=-247;
%
% L-DOPA
%
%nanf=1; % The very beginning

nanf = 302080;% 9'50" => after first movement paradigm, befor L-Dopa appliction
nanf = 1382400; % 30' past LDopa application
iend=nanf+180*512; % End 3'  later

%iend = (67*60+30)*512; % The very end
%

end
%

% 
% -------------
% Funk, all rest
% -------------
%

if FunkREST ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Funk/FUNK_04042012_ALLREST.bin';
    nchan=18;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=2;pr1r=3;Cz=4;pl2r=5;Pr1=6;Pr2=7;pr2r=8;pr4r=9;AFz=10;CFz=11;pl4r=12;pl1r=13;pl3r=14;Gl3=15;Pl3=16;Pl2=17;Pl1=18;

% Sensitivities/channel

    sens(1:nchan)=-247;
%
% All rest
%
nanf=120000; % Start appr. 240 sec after beginning of recording
iend=nanf+18*1024; % End 36 sec later
%

end
%
% -------------
% Funk, Stim PPN le
% -------------
%

if FunkPPNl ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Funk/FUNK_04042012_PPN_LEFT.bin';
    nchan=11;
    sens=zeros(nchan,1);
% Labels:
    Cz=1;pr2r=2;AFz=3;CFz=4;pr4r=5;pr1r=6;pr3r=7;Gl3=8;Pr3=9;Pr2=10;Pr1=11;

% Sensitivities/channel

    sens(1:nchan)=-247;
%
%  Stim PPN left
%
%nanf = 15000; % base line
%nanf = 113000; % Stim 20 Hz 2V 0-1
%nanf = 296000; % Stim 20 Hz 2V 2-3
%nanf = 480000; % Stim 130 Hz 2V 0-1
nanf = 670000; % Stim 130 Hz 2V 2-3


%iend = 112000; % baseline '
%iend = 202000; % Stim 20 Hz 2V 0-1
%iend = 389000; % Stim 20 Hz 2V 2-3
%iend = 570000; % Stim 130 Hz 2V 0-1
iend = 716000; % Stim 130 Hz 2V 2-3
%

end
%
% -------------
% Funk, Stim PPN ri
% -------------
%

if FunkPPNr ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Funk/FUNK_04042012_PPN_RIGHT.bin';
    nchan=10;
    sens=zeros(nchan,1);
% Labels:
    Cz=1;pl2r=2;AFz=3;CFz=4;pl4r=5;pl1r=6;pl3r=7;Pl3=8;Pl2=9;Pl1=10;

% Sensitivities/channel

    sens(1:nchan)=-247;
%
%  Funk, Stim PPN right
%
%nanf = 35000; % base line
nanf = 108000; % Stim 20 Hz 2V 0-1
%nanf = 295000; % Stim 20 Hz 2V 2-3
nanf = 475000; % Stim 130 Hz 2V 0-1
%nanf = 659000; % Stim 130 Hz 2V 2-3


%iend = 107000; % base line
iend = 199000; % Stim 20 Hz 2V 0-1
%iend = 383000; % Stim 20 Hz 2V 2-3
iend = 563000; % Stim 130 Hz 2V 0-1
%iend = 748000; % Stim 130 Hz 2V 2-3

end
%
%
% -------------
% Blomeier, all rest
% -------------
%

if BlomRest ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Koerth_Blomeier/BLOMEIER_03052012_ALLREST.bin';
    nchan=16;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=2;pr1r=3;pl2r=4;Pr1=5;Pr2=5;pr2r=7;pr4r=8;AFz=9;CFz=10;pl4r=11;pl1r=12;pl3r=13;Pl3=14;Pl2=15;Pl1=16;

% Sensitivities/channel

    sens(1:nchan)=-247;
%
%  All Rest
%
nanf=70000; % Start appr. 140 sec after beginning of recording
iend=5*60*512; % End after 5'
%
end
%
%
% -------------
% Blomeier, LDOPA
% -------------
%

if BlomDopa ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/L-DOPA/Koerth-Blomeier/BLOMEIER_03052012_DOPA.bin';
    nchan=16;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=2;pr1r=3;pl2r=4;Pr1=5;Pr2=5;pr2r=7;pr4r=8;AFz=9;CFz=10;pl4r=11;pl1r=12;pl3r=13;Pl3=14;Pl2=15;Pl1=16;

% Sensitivities/channel

    sens(1:nchan)=-247;
%
%  LDOPA
%
%
%nanf = 1; % The very beginning

nanf = (9*60+10)*512; % Start at 9'10" = after initial movement paradigm
nanf = (39*60+30)*512; % 39'30" after onset = 26'30" after LDOPA application

%iend = 2*60*512; % End at 2'
iend = nanf+3*60*512; % End  3' later

%iend = 51*60*512; % The very end

% OFF-L-DOPA movement paradigm
% ============================
%nanf = (2*60+0)*512; % Begin of passiv movement
%iend = (3*60+0)*512; % End of passiv movement

%nanf = (4*60+0)*512; % Begin of active movement
%iend = (5*60+0)*512; % End of active movement

%nanf = (6*60+5)*512; % Begin of 2nd passiv movement
%iend = (7*60+3)*512; % End of 2nd passiv movement

%nanf = (8*60+7)*512; % Begin of 2nd active movement
%iend = (9*60+8)*512; % End of 2nd active movement

%nanf = (5*60+0)*512; % Begin of in between
%iend = (6*60+5)*512; % End of in between

% ON-L-DOPA movement paradigm
% ============================
%nanf = (43*60+40)*512; % Begin of passiv movement
%iend = (44*60+40)*512; % End of passiv movement

%nanf = (45*60+40)*512; % Begin of active movement
%iend = (46*60+40)*512; % End of active movement

%nanf = (47*60+44)*512; % Begin of 2nd passiv movement
%iend = (48*60+44)*512; % End of 2nd passiv movement

%nanf = (49*60+45)*512; % Begin of 2nd active movement
%iend = (50*60+45)*512; % End of 2nd active movement

%nanf = (46*60+40)*512; % Begin of in between
%iend = (47*60+44)*512; % End of in between
%
end
%
% -------------
% Blomeier, Stim PPN le
% -------------
%

if BlomPPNl ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Koerth_Blomeier/BLOMEIER_03052012_PPN_LEFT.bin';
    nchan=9;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=2;pr1r=3;Pr1=4;Pr2=5;pr2r=6;pr4r=7;AFz=8;CFz=9;

% Sensitivities/channel

    sens(1:nchan)=-247;
%
% Stim PPN left
%
%nanf = 14400; % base line
%nanf = 108550; % Stim 20 Hz 2V 0-1
%nanf = 302080; % Stim 20 Hz 2V 2-3
%nanf = 476680; % Stim 130 Hz 1.0V 0-1
nanf = 659460; % Stim 130 Hz 1.0V 2-3


%iend = 108540; % baseline '
%iend = 201200; % Stim 20 Hz 2V 0-1
%iend = 391600; % Stim 20 Hz 2V 2-3
%iend = 361470+23000; % Stim 20 Hz 2V 2-3, Ausblenden der späten Artefakte
%iend = 570360; % Stim 130 Hz 1.5V 0-1
iend = 751000; % Stim 130 Hz 1.0V 2-3
%

end
%
% -------------
% Blomeier, Stim PPN ri
% -------------
%

if BlomPPNr ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Koerth_Blomeier/BLOMEIER_03052012_PPN_RIGHT.bin';
    nchan=9;
    sens=zeros(nchan,1);
% Labels:
    pl2r=1;AFz=2;CFz=3;pl4r=4;pl1r=5;pl3r=6;Pl3=7;Pl2=8;Pl1=9;

% Sensitivities/channel

    sens(1:nchan)=-247;
%
% Stim PPN right
%
%nanf = 18000; % base line, artifacts around start+10000
%nanf = 108000; % Stim 20 Hz 2V 0-1
%nanf = 309300; % Stim 20 Hz 2V 2-3
nanf = 500300; % Stim 130 Hz 1.0V 0-1
%nanf = 713800; % Stim 130 Hz 1.0V 2-3


%iend = 107000; % base line%
%iend = 198000; % Stim 20 Hz 2V 0-1
%iend = 402000; % Stim 20 Hz 2V 2-3
iend = 588000; % Stim 130 Hz 1.0V 0-1
%iend = 804000; % Stim 130 Hz 1.0V 2-3

end
%
%
% -------------
% Stockmeier, L-DOPA clean
% -------------
%

if StockDOPAclean ~= 0
    bin=0; % Export type = ASC
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/L-DOPA/Stockmeier/STOCKMEIER_BEINE_PASSIV_ACTIVE_CLEAN.asc';
%
% ACHTUNG: Sampling Frequenz 256 Hz!!  
%
nchan=17;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=2;pr1r=3;Pz=4;pl2r=5;Pr1=6;Pr2=7;pr2r=8;pr4r=9;Fz=10;Cz=11;pl4r=12;pl1r=13;pl3r=14;Pl3=15;Pl2=16;Pl1=17;

% Sensitivities/channel
    sens(1)   = -989;
    snes(2:5) = -494;
    sens(6:7) = -998;
    sens(8:14)= -494;
    sens(15:17) = -998;
   
%
% L-DOPA clean
%
nanf = 1; % rest staring at 0 sec
%nanf = 60*256;
%nanf = 27*60*256; % LDOPA-pahse starting at 27' =29' after LDOP application.
%nanf = (7*60+20)*256;
%nanf = 4*60*256; % Start of 1st active movement phase


iend = (2*60)*256; % Stop at 2' = 30" before start of passive movement
%iend = 20*1024; % end before artifact

%iend = 123391; % Ansolute end of recording
%iend=(7*60+20)*256;% End of 2nd active movement phase 
%
end

%
% -------------
% Stockmeier, L-DOPA
% -------------
%

if StockDOPA ~= 0
    bin=0; % Export type = ASC
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/L-DOPA/Stockmeier/STOCKMEIER_L-DOPA_BEINE_PASSIV_ACTIVE.asc';
%
% ACHTUNG: Sampling Frequenz 256 Hz!!  
%
nchan=17;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=2;pr1r=3;Pz=4;pl2r=5;Pr1=6;Pr2=7;pr2r=8;pr4r=9;Fz=10;Cz=11;pl4r=12;pl1r=13;pl3r=14;Pl3=15;Pl2=16;Pl1=17;

% Sensitivities/channel
    sens(1)   = -989;
    snes(2:5) = -494;
    sens(6:7) = -998;
    sens(8:14)= -494;
    sens(15:17) = -998;
   
%
% L-DOPA
%
%nanf = 1; % rest staring at 0 sec
nanf=(28*60)*256;% 30' after Dopa application
%nanf=2*60*256;
%nanf = 37*60*256; % LDOPA-pahse starting after LDOP and after movementapplication.


%iend = nanf+4*60*256; % Stop 4' later; fitss with 'LDOPA' data set
iend = nanf+3*60*256;
%iend = nanf + (2*60+30)*256; % Stop 2'30" later; fitss with 'CLEAN' data set
%iend = nanf+1*60*256;
%iend = (36*60+28)*256;% End of 2nd active movement phase 
%
end
%
% -------------
% Stockmeier, Stim PPN le
% -------------
%

if StockPPNl ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Stockmeier/STOCKMEIER_LPPN_03022011.bin';
    nchan=10;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=2;pr1r=3;Pz=4;Pr1=5;Pr2=6;pr2r=7;pr4r=8;Fz=9;Cz=10;

% Sensitivities/channel
    sens(1)   = -989;
    snes(2:4) = -494;
    sens(5:6) = -998;
    sens(7:10)= -494;
%
% Stim PPN left
%
nanf = 4000; % base line
%nanf = 94720; % Stim 20 Hz 2V 0-1
%nanf = 361470; % Stim 20 Hz 2V 2-3
%nanf = 645120; % Stim 130 Hz 1.5V 0-1
%nanf = 844800; % Stim 130 Hz 1.0V 2-3


iend = 34800; % baseline '
%iend = 125400; % Stim 20 Hz 2V 0-1
%iend = 395260; % Stim 20 Hz 2V 2-3
%iend = 361470+23000; % Stim 20 Hz 2V 2-3, Ausblenden der späten Artefakte
%iend = 675800; % Stim 130 Hz 1.5V 0-1
%iend = 875500; % Stim 130 Hz 1.0V 2-3
%
end
%
% -------------
% Stockmeier, Stim PPN ri
% -------------
%

if StockPPNr ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Stockmeier/STOCKMEIER_RPPN_03022011.bin';
    nchan=10;
    sens=zeros(nchan,1);
% Labels:
    Pl3=1;pl3r=2;pl1r=3;Pz=4;Pl1=5;Pl2=6;pl2r=7;pl4r=8;Fz=9;Cz=10;

% Sensitivities/channel
    sens(1)   = -989;
    snes(2:4) = -494;
    sens(5:6) = -998;
    sens(7:10)= -494;
%
%  Stim PPN right
%
%nanf = 4000+15000; % base line, artifacts around start+10000
%nanf = 104960; % Stim 20 Hz 2V 0-1
%nanf = 363520; % Stim 20 Hz 2V 2-3
%nanf = 628740; % Stim 130 Hz 1.5V 0-1
%nanf = 919040; % Stim 130 Hz 1.5V 2-3


%iend = 41980; % base line
%iend = 136700; % Stim 20 Hz 2V 0-1
%iend = 394240; % Stim 20 Hz 2V 2-3
%iend = 660480; % Stim 130 Hz 1.5V 0-1
%iend = 951290; % Stim 130 Hz 1.5V 2-3

end
%
%
%
% -------------
% Hergenhahn, all rest
% -------------
%

if HergenRest ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Hergenhahn/HERGENHAHN_19012012_ALL_REST.bin';
    nchan=17;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=2;pr1r=3;Pz=4;pl2r=5;Pr1=6;Pr2=7;pr2r=8;pr4r=9;Fz=10;Cz=11;pl4r=12;pl1r=13;pl3r=14;Pl3=15;Pl2=16;Pl1=17;
  
% Sensitivities/channel

    sens(1:nchan)=-247;
%
%  All rest
%
nanf=70000; % Start appr. 140 sec after beginning of recording
iend=nanf+2*60*512; % End after 5'

end
%
%
%
% -------------
% Hergenhahn, LDOPA
% -------------
%

if HergenDopa ~= 0
    bin=0; % Export type = ASC
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/L-DOPA/Hergenhahn/HERGENHAHN_230102012_L_DOPA.asc';
    nchan=17;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=2;pr1r=3;Pz=4;pl2r=5;Pr1=6;Pr2=7;pr2r=8;pr4r=9;Fz=10;Cz=11;pl4r=12;pl1r=13;pl3r=14;Pl3=15;Pl2=16;Pl1=17;
  
% Sensitivities/channel

    sens(1:nchan)=-247;
%
%  LDOPA
%
nanf = 245760; % Start at 8' = after initial movement paradigm  
nanf = 1228800; % Start at 40' = 27' after LDOPA application
iend=nanf+3*60*512; % End 3' later

end
%
%
% -------------
% Hergenhahn, Stim PPN le
% -------------
%

if HergenPPNl ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Hergenhahn/HERGENHAHN_19012012_PPN_LEFT.bin';
    nchan=10;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=2;pr1r=3;Pz=4;Pr1=5;Pr2=6;pr2r=7;pr4r=8;AFz=9;Cz=10;

% Sensitivities/channel

    sens(1:nchan)=-247;
%
% Stim PPN left
%
%nanf = 25600; % base line
%nanf = 92200; % Stim 20 Hz 3V 0-1
%nanf = 341000; % Stim 20 Hz 3V 2-3
nanf = 464800; % Stim 130 Hz 1.0V 0-1
%nanf = 659460; % Stim 130 Hz 1.0V 2-3


%iend = 91000; % baseline '
%iend = 156000; % Stim 20 Hz 3V 0-1
%iend = 402000; % Stim 20 Hz 3V 2-3
iend = 537000; % Stim 130 Hz 1.0V 0-1
%iend = 770000; % Stim 130 Hz 1.0V 2-3
%
end
%
% -------------
% Hergenhahn, Stim PPN ri
% -------------
%

if HergenPPNr ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Hergenhahn/HERGENHAHN_19012012_PPN_RIGHT.bin';
    nchan=10;
    sens=zeros(nchan,1);
% Labels:
    Pz=1;pl2r=2;Fz=3;Cz=4;pl4r=5;pl1r=6;pl3r=7;Pl3=8;PL2=9;Pl1=10;
    

% Sensitivities/channel

    sens(1:nchan)=-247;
%
% Stim PPN right
%
%nanf = 18000; % base line, artifacts around start+10000
%nanf = 82000; % Stim 20 Hz 3V 0-1
%nanf = 330000; % Stim 20 Hz 3V 2-3
nanf = 464000; % Stim 130 Hz 1.0V 0-1
%nanf = 728000; % 130 Hz 1.0V 2-3


%iend = 81500; % base line
%iend = 145400; % Stim 20 Hz 3V 0-1
%iend = 401000; % Stim 20 Hz 3V 2-3
iend = 523000; % Stim 130 Hz 1.0V 0-1
%iend = 787000; % Stim 130 Hz 1.0V 2-3
%
end
% 
% -------------
% Eberhardt, all rest
% -------------
%

if EberREST ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Eberhardt/EBERHARDT_21092012_ALLREST.bin';
    nchan=30;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=3;pr1r=5;Cz=16;pl2r=7;Pr1=10;Pr2=11;pr2r=13;pr3r=3;pr4r=14;AFz=15;pl4r=17;pl1r=18;pl3r=21;
    sl1r=8;sl2r=9;sl3r=19;sl4r=20;sr1r=12;sr2r=2;sr3r=6;sr4r=4;Pl3=28;Pl2=29;Pl1=30;

% Sensitivities/channel

    sens(1:nchan)=-247;
%
% All rest
%
% All rest
nanf=1024;
%iend=150000;
iend=nanf+2*60*512; % 2 minutes



%

end
%
% -------------
% Eberhardt, Stim PPN le
% -------------
%

if EberPPNl ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Eberhardt/EBERHARDT_21092012_PPN_LEFT.bin';
    nchan=23;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=3;pr1r=5;Cz=15;Pr1=9;Pr2=10;pr2r=12;pr3r=3;pr4r=12;AFz=14;
    sl1r=7;sl2r=8;sl3r=16;sl4r=17;sr1r=11;sr2r=2;sr3r=6;sr4r=4;

% Sensitivities/channel

    sens(1:nchan)=-247;
%
%  Stim PPN left
%
% Stim PPN left
nanf = 11000;   % BL During first 11000 samples amplifier recovers
nanf = 96400;  % 20 HZ 1.5 V 0-1
nanf = 297000; % 20 HZ 2V 2-3
%nanf = 466200; % 130 HZ 1.5 V 0-1
%nanf = 650700; % 130 HZ 2V 2-3
%
iend = 92200;  % BL
iend = 187000; % 20 HZ 1.5 V 0-1
iend = 387000; % 20 HZ 2V 2-3
%iend = 540000; % 130 HZ 1.5 V 0-1 Last 20000 samples disturbed in STNr 1-4
%iend = 740000; % 130 HZ 2V 2-3
%

end
%
% -------------
% Eberhardt, Stim PPN ri
% -------------
%

if EberPPNr ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Eberhardt/EBERHARDT_21092012_PPN_RIGHT.bin';
    nchan=23;
    sens=zeros(nchan,1);
% Labels:
    Cz=9;pl2r=4;AFz=8;pl4r=10;pl1r=11;pl3r=14;
    sl1r=5;sl2r=6;sl3r=12;sl4r=13;sr1r=7;sr2r=1;sr3r=3;sr4r=2;Pl3=21;Pl2=22;Pl1=23;

% Sensitivities/channel

    sens(1:nchan)=-247;
%
%  Stim PPN right
%
% Stim PPN right
nanf = 11000;   % BL During first 11000 samples amplifier recovers
nanf = 113000; % 20 HZ 2 V 0-1
nanf = 290000; % 20 HZ 2V 2-3
%nanf = 475000; % 130 HZ 2V 0-1
nanf = 670000; % 130 HZ 2V 2-3
%
iend = 112000; % BL
iend = 173000; % 20 HZ 2 V 0-1 Last 25000 sample scorrupted in STNl 1-4
iend = 380000; % 20 HZ 2V 2-3
%iend = 560000; % 130 HZ 2 V 0-1
iend = 750000; % 130 HZ 2V 2-3

end
%
% 
% -------------
% Eberhardt, Stim STN left
% -------------
%

if EberSTNl ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Eberhardt/EBERHARDT_21092012_STN_LEFT.bin';
    nchan=23;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=3;pr1r=5;Cz=14;pl2r=7;Pr1=8;Pr2=9;pr2r=11;pr4r=12;AFz=13;pl4r=15;pl1r=16;pl3r=17;
    sr1r=10;sr2r=2;sr3r=6;sr4r=4;Pl3=21;Pl2=22;Pl1=23;

% Sensitivities/channel

    sens(1:nchan)=-247;
%
% STN left
%
%Stim STN links
%
nanf = 7000;   % BL
nanf = 103000; % 20 Hz 3V 0-1 
%nanf = 290000; % 20 Hz 3V 1-2 
nanf = 480000; % 20 Hz 3V 2-3 
nanf = 660000; % 130 Hz 3V 0-1 
nanf = 840000; % 130 Hz 3V 1-2 
%nanf = 1020000;% 130 Hz 3V 2-3 


iend = 100000; % BL
iend = 190000; % 20 Hz 3V 0-1 
%iend = 370000; % 20 Hz 3V 1-2 
iend = 550000; % 20 Hz 3V 2-3 
iend = 740000; % 130 Hz 3V 0-1 
iend = 920000; % 130 Hz 3V 1-2 
%iend = 1110000;% 130 Hz 3V 2-3 
end
% 
% -------------
% Eberhardt, Stim STN right
% -------------
%

if EberSTNr ~= 0
    bin=1; % Export type = BIN
    fName='/Users/hinrichs/Documents/MATLAB/work/PPN-Daten/iEEG_Tino/Eberhardt/EBERHARDT_21092012_STN_RIGHT.bin';
    nchan=23;
    sens=zeros(nchan,1);
% Labels:
    Pr3=1;pr3r=2;pr1r=3;Cz=12;pl2r=4;Pr1=7;Pr2=8;pr2r=9;pr4r=10;AFz=11;pl4r=13;pl1r=14;pl3r=17;
    sl1r=5;sl2r=6;sl3r=15;sl4r=16;Pl3=21;Pl2=22;Pl1=23;

% Sensitivities/channel

    sens(1:nchan)=-247;
%
% STN right
%
%Stim STN rechts

nanf = 1024;   % BL
nanf = 99000;  % 20 Hz 3V 0-1 
%nanf = 290000; % 20 Hz 3V 1-2 
nanf = 470000; % 20 Hz 3V 2-3 
%nanf = 660000; % 130 Hz 3V 0-1 
nanf = 840000; % 130 Hz 3V 1-2 
%nanf = 1020000;% 130 Hz 3V 2-3

iend = 98000;  % BL
iend = 188000; % 20 Hz 3V 0-1 
%iend = 370000; % 20 Hz 3V 1-2 
iend = 550000; % 20 Hz 3V 2-3 
%iend = 740000; % 130 Hz 3V 0-1 
iend = 920000; % 130 Hz 3V 1-2 
%iend = 1110000;% 130 Hz 3V 2-3 
%
end
