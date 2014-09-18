
%
% analyse_causal_DBS_signals_bin
%===================
% READ DATA
%===================
%
%   FOLLOWING PARAMETERS NEED TO BE SET BEFORE CALL TO importWalter16bit_ex:
%
% fName = Filename
% nchan = Number of channels
% sens = sensitivity-vector (one sens-value/channel)
% nanf = first sample to be read
% nread = number of samples to be read
% sfreq = sampling frequency
%

prep_lfp_read;

sfreq = 512.2951; % Sampling frequency
specres=0.5;% Spectral resolution in Hz
cim=0; % cim=0: 'coh' reflects squared coherence. cim ne 0: 'coh' reflects imaginary part of coherence
%specres=1.0;
over=1; % =1: Spectral estimation with (over <>0) or without (over=0) overlap
specpow=[3 6 8 13 30 60 90]; % total power range
gfr=30; % Mutual entropy only to be calcualated up to gfr Hz
artint=0.5; % Length of interval applied for artifact detection for non linear analysis
%
% nreal= Number of permutations used to estimate stats of coherence
% nrmut= Dito for mutual entropies
nreal=100;
nrmut=100;
nrmut=0; % TestTestTest
%



nread=iend-nanf;


%
%  ----- For non linear analysis signals need to be restricted to a smaller
%  region for numerical reasons. For this reason we split the total signal into segments of 2048
%  samples length and then take the average and the std.
%        

ntel=1;     % Sampel Nr. corresponding to lower limit of this restricted interval
nteu=nread;  % upper limit of this restricted interval
%ntesegl=512; % org
%ntesegl=128;  % Length of a segment^2 ; 2048 seems to be the best
%ntesegl=6000; % This is more appropirate if non linear measures are used
%ntesegl=2048;
ntesegl=1024;
%ntesegl=4096;
nteu=ntel+18*1024; % This statement NOT activated for Habekost

knear=4; %Number of nearest neighbours included
exc=0;   %Number of immediat neighbours to exlude (Theiler correction)
nreal_te=200; % Original value was 200
surr=0;% surr=1: Stats using surrogate data, surr=0: Stats by segment shuffling 
lagorder=1;% 0: Use preset values for lag and dim; 1: Define values individually
taupre=24; % default setting (used if lagorder=0) of embedding delay
dimpre=6; % default setting (used if lagorder=0) of embedding dimension
%
maxdel=ceil(0.03*sfreq); % Transfer entropy will be calculated up to maxdel samples ahead
maxdel=ceil(0.05*sfreq); % TEST TEST 50 ms corresponds to the CCV(xf,yf) first zerocrossing.
%maxdel=ceil(0.15*sfreq);%Super test, gleich wieder weg
resdel=max(floor(0.004*sfreq),1); % Transfer entropy will be calculated with resdel samples temporal resolution
%resdel=max(floor(0.01*sfreq),1);%Super test, gleich wieder weg

%
% Define Channel pair to be analysed
%
%
%ATr3=1;Accr2r=2;aTr3r=3;Accr4r=4;aTr1r=5;Accr3r=6;Oz=7;aTl2r=8;Accl1r=9;Accl2r=10;ATr1=11;    
%ATr2=12;Accr1r=13;aTr2r=14;aTr4r=15;Fpz=16;Cz=17;aTl4r=18;aTl1r=19;Accl3r=20;Accl4r=21;aTl3r=22;    
%ACl3=23;ACl2=24;ACl1=25;ACr3=26;ACr2=27;ACr1=28;ATl3=29;ATl2=30;ATl1=31; 

%
%
ch1_type='eeg';
ch2_type='eeg';
%chan1=pl1r;
%chan1r=pl4r;
%chan1 = Fz;
%chan1r = 0;
%chan1=Gl1;
%chan1r=Gl2;
chan1=pr1r;
chan1r=pr4r;
%chan1=aTl4r;
%chan1r=aTl3r;
%chan1=Vl3;
%chan1r=Vl4;
%chan1=Vl1;
%chan1r=Vl2;
%chan1=aTl1r;
%chan1r=aTl4r;

%chan1=Pl1;
%chan1r=0;
%chan1=AFz;
%chan1r=0;
%chan1=aTr1r;
%chan1r=aTr2r;
%chan2=POz;
%chan2r=Cz;
%chan2=Accr1r;
%chan2r=Accr2r;
%chan2=pr1r;
%chan2r=pr4r;
%chan2=pl1r;
%chan2r=pl4r;
%chan2=Pr1;
%chan2r=0;
%chan2=Gr1;
%chan2r=Gr2;
%chan2=pr1r;
%chan2r=pr4r;
%chan2=Vr3;
%chan2r=Vr4;
%chan2=l_hh;
%chan2r=0;
%chan2=Gr1;
%chan2r=Gr2;
%chan2=Oz;
%chan2r=0;
%chan2=aTr1r;
%chan2r=aTr4r;
%chan2=Gl3;
%chan2r=Gl4;
%chan2=Pr1;
chan2r=0;
chan2=Fz;
%chan2=AFz;
%chan2=Cz;
%chan2r=Cz;
%chan2r=0;
%chan2=Gr3;
%chan2r=Gr4;
%chan2=sr1r;
%chan2r=sr4r;
%chan2=Gr1r;
%chan2r=Gr4r;
%chan2=AFz;
%chan2r=0;
%chan2=Cz;
%chan2r=0;

% IMPORT DATA
%
if bin == 1
    importWalter16bit_ex;
elseif bin == 0
    import_Walter;
elseif bin == 2
    import_brainamp;
end
fny=sfreq/2;
%
%
% FILTER DATA + extract pair of signals for further processing
%

if chan1r ==0
    x=A(:,chan1);
else
    x=A(:,chan1)-A(:,chan1r);
end

if chan2r == 0
    y=A(:,chan2);
else
    y=A(:,chan2)-A(:,chan2r);
end
x=x';
y=y';

%
% If either channel is an EMG, please suppress activity below 16 Hz and
% rectify (see Sharott et al., 2008)
%
if strcmp(ch1_type,'emg')
    [bh,ah]=butter(7,16/fny,'high');
    x=filtfilt(bh,ah,x);
    x=abs(x-mean(x));
end
if strcmp(ch2_type,'emg')
    [bh,ah]=butter(7,16/fny,'high'); % Original setting ccording to
 %   Sharott etc. (Brown/Brain 2008)
    [bh,ah]=butter(7,10/fny,'high'); %Test version, same cutoff as for EEG
    y=filtfilt(bh,ah,y);
    yorg=y;% Test
 %   y=abs(y-mean(y));
    y=y-mean(y);

 %y=abs(hilbert(y)); % Test
end
    
%

% --- Display signals and ask for interval to be processed; extract interv.
%figure
%plot(x);
%hold on
%plot(y,'g');
%iu=input('Analyseintervall, unterer Index >');
%io=input('Analyseintervall, oberer Index  >');
iu=1;
io=length(x);
xp=x(iu:io);
yp=y(iu:io);
clear x y;
% ---

make_DBS_signals; %filtered signals are xf and yf

%
%=======================
% AUTO-CROSS- and COHERENCESPECTRA, Welch-algorithm, artifact rejection
%=======================
%
segl=sfreq/specres;  % Segment length [samples] tp achieve predefined spectral resolution
segl=2^round(log2(segl));   % change to nearest integer potence of 2
specres_eff=sfreq/segl;      % print resulting effectice spectral resolution
thr(1) = 10*std(xf); % Threshold to detect/reject artifacts
thr(2) = 10*std(yf); % Threshold to detect/reject artifacts

%
[coh,cxx,cyy,nseg,nart,f,coh_05,cl,cu,conf,cxxt,cyyt,edf] = crossautosp_stats(notch50(xp,sfreq),notch50(yp,sfreq),segl,over,thr,nreal,sfreq,cim);
%
cxxt=cxxt';
cyyt=cyyt';

disp(' Median Frequency');
[bpx,mfx,ptx] = bandpow_from_pow(cxx,specpow,segl,sfreq);
mfx
disp(' Median Frequency');
[bpy,mfy,pty] = bandpow_from_pow(cyy,specpow,segl,sfreq);
mfy

% PLOT POWER SPECTRA including confidence limits
figure
%plot(f,cxx,'-b',f,cxx*conf(1),'--b',f,cxx*conf(2),'--b');

jbfill(f,cxx*conf(2),cxx*conf(1),'b');
hold on
plot(f,cxx,'k');
%plot(f,cyy,'-g',f,cyy*conf(1),'--g',f,cyy*conf(2),'--g');
jbfill(f,cyy*conf(2),cyy*conf(1),'g','k',1);
hold on
plot(f,cyy,'k');  

lg=0;
if lg==1 % optional logarithmic plots
    figure
%plot(f,cxx,'-b',f,cxx*conf(1),'--b',f,cxx*conf(2),'--b');
    jbfill(f,log(cxx*conf(2)),log(cxx*conf(1)),'b');
    hold on
    plot(f,log(cxx),'k');
%plot(f,cyy,'-g',f,cyy*conf(1),'--g',f,cyy*conf(2),'--g');
    jbfill(f,log(cyy*conf(2)),log(cyy*conf(1)),'g','k',1);
    hold on
    plot(f,log(cyy),'k'); 
end


%==========================
% PLOT POWER SPECTRA including empirical confidence limits (=+- 2 std)
%figure
%plot(f,cxx,'-b',f,cxx*conf(1),'--b',f,cxx*conf(2),'--b');

%jbfill(f,mean(cxxt)-2*std(cxxt)/sqrt(nseg),mean(cxxt)+2*std(cxxt)/sqrt(nseg),'b');
%hold on
%plot(f,mean(cxxt),'k');
%plot(f,cyy,'-g',f,cyy*conf(1),'--g',f,cyy*conf(2),'--g');
%jbfill(f,mean(cyyt)-2*std(cyyt)/sqrt(nseg),mean(cyyt)+2*std(cyyt)/sqrt(nseg),'g','k',1);
%hold on
%plot(f,mean(cyyt),'k');  
%==========================

cxxtl=mean(cxxt)-2*std(cxxt)/sqrt(nseg);
cxxtu=mean(cxxt)+2*std(cxxt)/sqrt(nseg);
cyytl=mean(cyyt)-2*std(cyyt)/sqrt(nseg);
cyytu=mean(cyyt)+2*std(cyyt)/sqrt(nseg);

%
% PLOT COHERENCES including confidence interval
%
figure
if cim == 0
    plot(f,coh(1,:),'k');
    hold on
    jbfill(f,cu,cl,'b','k',1);
    hold on
    plot(f,coh_05,'r')
else
    jbfill(f,coh(2,:),coh(3,:),'b');
    hold on;
    plot(f,coh(1,:),'k');
end
    
    

display(' Daten gelesen, Spektren gerechnet. Fortsetzen?');
pause;
if nrmut ~= 0
    [ment,nseg,nart,f,mentstat,menstd,phasum] = mutualspec_stats(xp,yp,segl,over,thr,nrmut,sfreq,gfr);
    figure
    nm=length(ment);
    plot(f(1:nm),ment);
    hold on
    plot(f(1:nm),mentstat,'r')
    plot(f(1:nm),menstd,'c')
    display 'Mutual calculated'
    pause;
end
%
%calculate time domain mutual entropy incl. its STD
binw=.5;
[nh,bwi,pxy] = histkern2D_v2_zscore(xf,yf,binw);
[ent,lxy] = mutual_pxy(xf,yf,pxy,bwi);

display 'Mutual entropy, time domain:'
ent(1)
sqrt(var(lxy)/length(xf))

%

%
%
% ESTIMATE NON LINEAR CONNECTIVITY
%
%  ---- Convert x,y into variables of type 'signal'
%

%
%  ------- First detect and reject artifacts
%
asegl=floor(artint*sfreq);
[xaf,yaf,nseg,nart,thrx,thry] = artrem2(xf,yf,asegl,thr,0,sfreq);
%
%TEST TEST TEST for prewhitening
%xaf=[diff(xaf) 0];
%yaf=[diff(yaf) 0];
%TEST TEST TEST

%
% Determine autocorrelation decay time for both signals
%
display(' ACT:')
[texp,tzer]=act(xaf);
tzer;
[texp,tzer]=act(yaf);
tzer;
%
nteu=min(nteu,length(xaf));
%
% ------- Next convert artefact free signal into signal of type 'signal' (as used by
%          'amutual' and 'cao'=)
%
clear xs ys;
sz=size(xaf);
if(sz(2)>1)    % convert into column type signals
    xaf=xaf';
    yaf=yaf';
end
%
%
if lagorder==1
    
    xaf=xaf+.00001*randn(length(xaf),1); % TEST TEST TEST
    yaf=yaf+.00001*randn(length(yaf),1); % TEST TEST TEST
    xs=signal(xaf(ntel:ntel+ntesegl-1));
    ys=signal(yaf(ntel:ntel+ntesegl-1));
 %   xs=signal(xaf);% TEST TEST TEST Habekost estimations
 %   ys=signal(yaf);% TEST TEST TEST Habekost estimations
%
%  ---- Now define tau and dim (needed for neares neighbour estimation)
%
%  ------- tau (see Chen et al., Physics Letters A 324 (2004) pp 26-35)
%
    rs1=amutual(xs,40,20);
    rs2=amutual(ys,40,20);
    figure
    view(rs1);
    hold on
    view(rs2);
    tau=input('Input tau >');

%
%  ------- dim
%
    [E1x,E2x]=cao(xs,15,tau,knear,-1);
    [E1y,E2y]=cao(ys,15,tau,knear,-1);

    figure
    view(E1x);
    hold on
    view(E2x);
    title(' E1,E2 signal x');
%
    view(E1y);
    hold on
    view(E2y);
    title(' E1,E2 signal y');
    dim=input('Input dimension >');
else
    tau=taupre;
    dim=dimpre;
end


%
%  ---- And finally calcualte TRANSFER ENTROPY up to delay 'maxdel', MUTUAl INFORMATION
%
clear texy teyx;

ntscnt=0;
delay=(resdel:resdel:maxdel);
%delay=(1:resdel:maxdel+1); %old
%delay=(1:10); % TESt TEST TEST TEST
nsegments=length(ntel:ntesegl:nteu-ntesegl+1);
texy=zeros(nsegments,length(delay));
teyx=texy;
jnxy=texy;
jnyx=jnxy;
jnxyd=jnxy;
cs=zeros(1,nsegments);
%
% Hinweis darauf, dass Gauss'sches Verfahren (entspr. TEcov_2) bei LFPs
% ähnlich gut wie nichtlineare funktioniert finder sich bei Magri et al.,
% BMC Neuroscience 2009
%
for nts=ntel:ntesegl:nteu-ntesegl+1
    nl=nts;
    nu=nts+ntesegl-1;
    
    ntscnt=ntscnt+1;
    cs(ntscnt)=xcorr(xaf(nl:nu),yaf(nl:nu),0,'coeff');
    
    for d=1:length(delay)
       
 %      [te,mi]=TEvalues(xaf(nl:nu),yaf(nl:nu),dim,tau,delay(d),knear,tau);
 %       [tec,dis]=TEvalues_corr(xaf(nl:nu),yaf(nl:nu),dim,tau,delay(d),knear,tau);
 %       te=tec(2);
 %        te=STEvalues_test(xaf(nl:nu),yaf(nl:nu),dim,tau,delay(d),knear,tau);
        [te,mi]=TEcov_2(xaf(nl:nu),yaf(nl:nu),dim,tau,delay(d));
 %       entrop=transfer_entrop_ahead(xaf(nl:nu)',yaf(nl:nu)',delay(d),.5);
 %       texy(ntscnt,d)=entrop(2);
%        teyx(ntscnt,d)=entrop(1);
        texy(ntscnt,d)=te;
 %       [te,mi]=TEvalues(yaf(nl:nu),xaf(nl:nu),dim,tau,delay(d),knear,tau);
 %       [tec,dis]=TEvalues_corr(yaf(nl:nu),xaf(nl:nu),dim,tau,delay(d),knear,tau);
 %       te=tec(2);
 %        te=STEvalues_test(yaf(nl:nu),xaf(nl:nu),dim,tau,delay(d),knear,tau);
 
        [te,mi]=TEcov_2(yaf(nl:nu),xaf(nl:nu),dim,tau,delay(d));
        teyx(ntscnt,d)=te; 
 
    end
    
end
%disp('cross corr, mean std');
%mean(cs)
%std(cs)
%
% Plot results
%
ts=delay/sfreq;
%
% Estimate STD by Jackknife test
%
for d=1:length(delay)
    for i=1:ntscnt
        jnxy(i,d)=mean(texy([1:i-1 i+1:ntscnt],d));
        jnyx(i,d)=mean(teyx([1:i-1 i+1:ntscnt],d));
        jnxyd(i,d)=mean(texy([1:i-1 i+1:ntscnt],d)-teyx([1:i-1 i+1:ntscnt],d));        
    end
end

figure
%errorbar(ts,mean(texy(:,1:length(delay)),1),std(jnxy(:,1:length(delay)),0,1));
%hold on
%errorbar(ts,mean(teyx(:,1:length(delay)),1),std(jnyx(:,1:length(delay)),0,1),'g');
texyd=texy-teyx;
%errorbar(ts,mean(texyd(:,1:length(delay)),1),std(jnxyd(:,1:length(delay)),0,1),'r');

errorbar(ts,mean(texy(:,1:length(delay)),1),std(texy(:,1:length(delay))/sqrt(ntscnt),0,1));
hold on
errorbar(ts,mean(teyx(:,1:length(delay)),1),std(teyx(:,1:length(delay))/sqrt(ntscnt),0,1),'g');
texyd=texy-teyx;
errorbar(ts,mean(texyd(:,1:length(delay)),1),std(texyd(:,1:length(delay))/sqrt(ntscnt),0,1),'r');

sum(mean(texy(:,:),1))
sum(mean(teyx(:,:),1))
%break
%
% =================
% Calculate empirical stats for TE by randomizing segments
%
if surr == 0
    if nreal_te ~= 0
   
        texymn=zeros(nreal_te,length(delay));
        teyxmn=texymn;
        texys=zeros(nsegments,length(delay));
        teyxs=zeros(nsegments,length(delay));
for iii=1:500
    r=randn(nsegments,1);
end
        for nr=1:nreal_te

% Generate randomization sequence
            r=randn(nsegments,1);
            [~,irx]=sort(r);
            r=randn(nsegments,1);
            [~,iry]=sort(r);
            ntscnt=0;
            sc=0;
    
            for nts=ntel:ntesegl:nteu-ntesegl+1
                sc=sc+1;
                ix=irx(sc)-1; 
   %     ix=random('unid',nsegments,1,1)-1;
                xs=xaf(ntel+ix*ntesegl:ntel+ix*ntesegl+ntesegl-1);
                iy=iry(sc)-1;
   %     iy=random('unid',nsegments,1,1)-1;
                ys=yaf(ntel+iy*ntesegl:ntel+iy*ntesegl+ntesegl-1);
                ntscnt=ntscnt+1;
        
                for d=1:length(delay)
                    [te,mi]=TEcov_2(xs,ys,dim,tau,delay(d));
                    texys(ntscnt,d)=te;
                    [te,mi]=TEcov_2(ys,xs,dim,tau,delay(d));
                    teyxs(ntscnt,d)=te; 
                end
            end
    
            texymn(nr,:)=mean(texys,1);
            teyxmn(nr,:)=mean(teyxs,1);
        end
    end
end
%
% =================
% Calculate empirical stats for TE using surrogate data
%
if surr ~= 0
    if nreal_te ~= 0
        texymn=zeros(nreal_te,length(delay));
        teyxmn=texymn;
        texys=zeros(nsegments,length(delay));
        teyxs=zeros(nsegments,length(delay));

        for nr=1:nreal_te
            
            ntscnt=0;
    
            for nts=ntel:ntesegl:nteu-ntesegl+1
                nl=nts;
                nu=nts+ntesegl-1;
    
                ntscnt=ntscnt+1;
        
                for d=1:length(delay)
                    xs=fftsurrogate(xaf(nl:nu));
                    ys=fftsurrogate(yaf(nl:nu));
%                   [te,mi]=TEvalues(xs,yaf(nl:nu),dim,tau,delay(d),knear,exc);
                    [te,mi]=TEcov_2(xs,ys,dim,tau,delay(d));
%                   [tec,dis]=TEvalues_corr(xs,yaf(nl:nu),dim,tau,delay(d),knear,tau);
%                   te=tec(2);
                    texys(ntscnt,d)=te;
%                   [te,mi]=TEvalues(yaf(nl:nu),xs,dim,tau,delay(d),knear,exc);
                    [te,mi]=TEcov_2(ys,xs,dim,tau,delay(d));
%                   [tec,dis]=TEvalues_corr(yaf(nl:nu),xs,dim,tau,delay(d),knear,tau);
%                   te=tec(2);
         
                    teyxs(ntscnt,d)=te; 
                end
            end
    
            texymn(nr,:)=mean(texys,1);
            teyxmn(nr,:)=mean(teyxs,1);
        end

    end
end
statexy=sort(texymn); 
plot(ts,statexy(ceil(nreal_te*.95),:),'c')
stateyx=sort(teyxmn); 
plot(ts,stateyx(ceil(nreal_te*.95),:),'y')
tedif=texymn-teyxmn;
statdif=sort(tedif);
plot(ts,statdif(ceil(nreal_te*.975),:),'k')
plot(ts,statdif(ceil(nreal_te*.025),:),'k')

