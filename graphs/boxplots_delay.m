%% Delay Data from Excel Sheet %%
delay = [6.141619	7.379464	6.4325	1.744075	1.60888	1.541333	7.6587	6.264	13.78448	24.32513	16.27679	11.43504	19.45963	10.74694	16.50832
6.390375	5.983333	10.01463	1.347697	1.37	1.864111	6.997583	9.533583	6.474083	17.72882	23.2863	14.97036	11.14666	15.45518	10.93257
6.644625	6.718035	7.264	1.651299	1.68	1.665462	13.72289	21.01106	36.80514	11.50729	9.468469	15.01935	9.066833	9.981378	12.27633
9.526087	7.025417	7.025481	1.523148	1.476267	1.613333	43.62712	9.144546	8.240607	9.806097	12.13849	10.08591	9.071455	13.99	14.98483
6.31813	5.847171	6.979111	1.727233	1.3604	1.554783	7.99	15.69806	8.124346	9.943415	11.504	10.2923	9.990357	18.67005	10.34663
5.94996	5.775037	6.729412	1.592119	1.728314	1.700828	6.641571	12.73997	21.4285	15.30281	13.3144	12.91088	10.9746	22.57868	13.18756
5.758138	5.863655	7.538742	1.744075	1.626931	1.800556	9.387111	15.51185	7.918033	13.69984	11.67864	11.07552	14.75964	14.72757	13.00954
10.416	6.158694	7.594194	1.347697	1.417033	1.986571	14.61438	7.3162	9.120237	20.41394	9.74325	13.56354	25.02759	19.48934	12.713
7.723483	6.351839	6.850828	1.651299	1.540933	1.871167	8.159226	21.52517	7.948655	10.82194	13.0505	12.45492	11.99357	14.74097	15.82353
6.053269	6.116654	6.247567	1.748878	2.911656	1.760588	9.089464	6.916923	8.148963	37.46886	13.65776	10.83622	10.2958	21.08802	23.91878]

%% Scenario 1 - Empty World %%
case0_sc1_delay = delay(:,4);
case1_sc1_delay = delay(:,7);
case2_sc1_delay = delay(:,1);
case3_sc1_delay = delay(:,10);
case4_sc1_delay = delay(:,13);

%Boxplot for this scenario
figure(1);
boxplot([case0_sc1_delay case1_sc1_delay case2_sc1_delay case3_sc1_delay, case4_sc1_delay]);
set(gca,'xtick',1:5, 'xticklabel',{'Case 0', 'Case 1', 'Case 2', 'Case 3', 'Case 4'})
ylabel('Network Delay (ms)');
%title('Network Delay in Empty World');
set (gca, 'FontSize',14);

%% Scenario 2 - Sparse Obstacles World %%
case0_sc2_delay = delay(:,5);
case1_sc2_delay = delay(:,8);
case2_sc2_delay = delay(:,2);
case3_sc2_delay = delay(:,11);
case4_sc2_delay = delay(:,14);

%Boxplot for this scenario
figure(2);
boxplot([case0_sc2_delay case1_sc2_delay case2_sc2_delay case3_sc2_delay, case4_sc2_delay]);
set(gca,'xtick',1:5, 'xticklabel',{'Case 0', 'Case 1', 'Case 2', 'Case 3', 'Case 4'})
ylabel('Network Delay (ms)');
%title('Network Delay in Sparse Obstacles');
set (gca, 'FontSize',14);

%% Scenario 3 - Dense Obstacles World %%
case0_sc3_delay = delay(:,6);
case1_sc3_delay = delay(:,9);
case2_sc3_delay = delay(:,3);
case3_sc3_delay = delay(:,12);
case4_sc3_delay = delay(:,15);
%Boxplot for this scenario
figure(3);
boxplot([case0_sc3_delay case1_sc3_delay case2_sc3_delay case3_sc3_delay, case4_sc3_delay]);
set(gca,'xtick',1:5, 'xticklabel',{'Case 0', 'Case 1', 'Case 2', 'Case 3', 'Case 4'})
ylabel('Network Delay (ms)');
%title('Network Delay in Dense Obstacles');
set (gca, 'FontSize',14);
