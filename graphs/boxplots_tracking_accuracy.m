%% Tracking Data from Excel Sheet %%
tracking = [0.667259	0.479171	1.373102	0.454742	1.036325	1.48914	0.477337	0.532243	0.125603
1.141341	0.249795	0.930469	0.553553	0.340382	0.763437	0.563123	0.876538	0.206433
0.295645	2.70041	1.020894	0.061045	0.038491	0.32724	0.038635	0.24002	1.562698
0.249428	0.46999	1.29162	0.956864	1.183627	0.654796	0.75092	1.031221	0.450162
1.128934	1.77632	1.449081	0.607778	0.867533	0.239395	0.201472	0.696374	0.379318
0.119896	1.076483	0.82708	1.965039	2.605353	0.725215	1.37688	2.244635	0.560036
2.288462	0.927865	3.96903	0.449359	0.870933	0.710083	0.688735	0.472079	1.008433
1.456568	0.960683	1.586948	0.555488	0.385075	0.206397	0.7396	1.446539	1.843722
1.6148	2.101499	3.745762	0.595742	0.990871	0.985631	0.027576	1.124984	1.529419
1.52316	0.624602	0.154033	1.728316	1.796541	2.794879	2.090507	3.311935	0.400295]
%% Scenario 1 - Empty World %%
case2_sc1_tracking = tracking(:,1);
case3_sc1_tracking = tracking(:,4);
case4_sc1_tracking = tracking(:,7);

%Boxplot for this scenario
figure(1);
boxplot([case0_sc1_tracking case3_sc1_tracking, case4_sc1_tracking]);
set(gca,'xtick',1:3, 'xticklabel',{'Case 2', 'Case 3', 'Case 4'})
ylabel('Tracking Error (m)');
%title('Tracking Accuracy in Empty World');
set (gca, 'FontSize',14);

%% Scenario 2 - Sparse Obstacles World %%
case2_sc2_tracking = tracking(:,2);
case3_sc2_tracking = tracking(:,5);
case4_sc2_tracking = tracking(:,8);

%Boxplot for this scenario
figure(2);
boxplot([case0_sc2_tracking case3_sc2_tracking, case4_sc2_tracking]);
set(gca,'xtick',1:3, 'xticklabel',{'Case 2', 'Case 3', 'Case 4'})
ylabel('Tracking Error (m)');
%title('Tracking Accuracy in Sparse Obstacles');
set (gca, 'FontSize',14);

%% Scenario 3 - Dense Obstacles World %%
case2_sc3_tracking = tracking(:,3);
case3_sc3_tracking = tracking(:,6);
case4_sc3_tracking = tracking(:,9);
%Boxplot for this scenario
figure(3);
boxplot([case0_sc3_tracking case3_sc3_tracking, case4_sc3_tracking]);
set(gca,'xtick',1:3, 'xticklabel',{'Case 2', 'Case 3', 'Case 4'})
ylabel('Tracking Error (m)');
%title('Tracking Accuracy in Dense Obstacles');
set (gca, 'FontSize',14);




