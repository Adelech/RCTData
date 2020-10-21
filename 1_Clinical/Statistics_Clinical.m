%% DATA
clear all
clc
scale = 1; % - 1 = FMA Total - 2 = ARAT - 3 = GS

load('CLINICAL.mat')
DATA = CLINICAL{scale};
CHANGE = DATA - DATA(:,1);

index_hman=1:22;    % robotic group
index_conv=23:44;   % conventional group
%% Meand, STD, Median and Standard error
display('HMAN - CONV')
display('[Absolute]')
display([nanmean(DATA(index_hman,:)).' nanstd(DATA(index_hman,:)).' nanmedian(DATA(index_hman,:)).' iqr(DATA(index_hman,:)).' zeros(5,1) nanmean(DATA(index_conv,:)).' nanstd(DATA(index_conv,:)).' nanmedian(DATA(index_conv,:)).' iqr(DATA(index_conv,:)).'])
display('[Change]')
display([nanmean(CHANGE(index_hman,:)).' nanstd(CHANGE(index_hman,:)).' nanmedian(CHANGE(index_hman,:)).' iqr(CHANGE(index_hman,:)).' zeros(5,1) nanmean(CHANGE(index_conv,:)).' nanstd(CHANGE(index_conv,:)).' nanmedian(CHANGE(index_conv,:)).' iqr(CHANGE(index_conv,:)).' ])
display('------------')
%% Statistics

% Non-parametric - BETWEEN - 

% baseline HMan vs Conv
p_1 = ranksum(DATA(index_conv,1),DATA(index_hman,1));

% change
pp_1 = ranksum(CHANGE(index_conv,1),CHANGE(index_hman,1));
pp_2 = ranksum(CHANGE(index_conv,2),CHANGE(index_hman,2));
pp_3 = ranksum(CHANGE(index_conv,3),CHANGE(index_hman,3));
pp_4 = ranksum(CHANGE(index_conv,4),CHANGE(index_hman,4));
pp_5 = ranksum(CHANGE(index_conv,5),CHANGE(index_hman,5));

% Non-parametric - WITHIN - 

%wilcoxon
pw_conv_2 = signrank(DATA(index_conv,1),DATA(index_conv,2));
pw_conv_3 = signrank(DATA(index_conv,1),DATA(index_conv,3));
pw_conv_4 = signrank(DATA(index_conv,1),DATA(index_conv,4));
pw_conv_5 = signrank(DATA(index_conv,1),DATA(index_conv,5));
pw_conv_35 = signrank(DATA(index_conv,3),DATA(index_conv,5));
pw_hman_2 = signrank(DATA(index_hman,1),DATA(index_hman,2));
pw_hman_3 = signrank(DATA(index_hman,1),DATA(index_hman,3));
pw_hman_4 = signrank(DATA(index_hman,1),DATA(index_hman,4));
pw_hman_5 = signrank(DATA(index_hman,1),DATA(index_hman,5));
pw_hman_35 = signrank(DATA(index_hman,3),DATA(index_hman,5));

%Between
display('BETWEEN')
display('--- Absolute - Baseline ---')
display([p_1])
display('----- Change -----')
display([pp_1 pp_2 pp_3 pp_4 pp_5])
display(' ')

%Within
display('WITHIN')
display('-- Conventional group --')
display('Wilcoxon')
display([pw_conv_2 pw_conv_3 pw_conv_4 pw_conv_5 pw_conv_35])
display('-- Robotic group --')
display([pw_hman_2 pw_hman_3 pw_hman_4 pw_hman_5 pw_hman_35])
