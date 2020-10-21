%% DATA

%Robotic
[ROM_SPARC,~,~] = xlsread('ROM_robotic',1);
ROM_SPARC = reshape(ROM_SPARC(:,4:8),[],1);
[ROM_TIME,~,~] = xlsread('ROM_robotic',3);
ROM_TIME = reshape(ROM_TIME(:,4:8),[],1);
[ROM_ERROR,~,~] = xlsread('ROM_robotic',4);
ROM_ERROR = reshape(ROM_ERROR(:,4:8),[],1);
[COORD_SPARC,~,~] = xlsread('CORD_robotic',1);
COORD_SPARC = reshape(COORD_SPARC(:,4:8),[],1);
[COORD_TIME,~,~] = xlsread('CORD_robotic',3);
COORD_TIME = reshape(COORD_TIME(:,4:8),[],1);
[COORD_ERROR,~,~] = xlsread('CORD_robotic',4);
COORD_ERROR = reshape(COORD_ERROR(:,4:8),[],1);

%Clinical
load('CLINICAL_forCorr.mat')

%% Data - N=34

list_patient_conv = [1 2 4 5 7 10 11 12 13 14 15 17 19 20 21];
list_patient_HMAN = [1 2 3 4 5 6 7 8 9 10 11 14 15 16 17 18 19 20 22] +22;
list_patients = [list_patient_conv list_patient_HMAN];

FMA_Total = CLINICAL_2{1}(list_patients,:);
FMA_Total = reshape(FMA_Total,[],1);

ARAT =  CLINICAL_2{2}(list_patients,:);
ARAT = reshape(ARAT,[],1);

GS =  CLINICAL_2{3}(list_patients,:);
GS = reshape(GS,[],1);

%LineTracing
[R_LT,PValue_LT] = corrplot(zscore([FMA_Total ARAT GS ROM_SPARC ROM_TIME ROM_ERROR]))
[R_CT,PValue_CT] = corrplot(zscore([FMA_Total ARAT GS COORD_SPARC COORD_TIME COORD_ERROR])) 






