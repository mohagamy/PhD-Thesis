% This Figure shows the different strategies to assign Tr. power to different nodes
% Parameter Set-up
% I need to iterate so I can plot an average results
clear;clc;
GeneralWSN  % Make sure we start with the same WSN each time
WSN0 = WSN;
%------------------------ All of the nodes - Equal w (WORST)
clear WSN
WSN = WSN0;
WSN.ProbOfSel             = 1;
WSN.NoOfTransEnergyLevels = 1;
WSN.CBWeightDesignOption  = 1;
WSN.EqualCBWeights        = 1;
[WSN1] = CBTransmit(WSN);
1
%------------------------ All of the nodes - Different w - Energy (BEST)
clear WSN 
WSN = WSN0;
WSN.ProbOfSel             = 1;
WSN.NoOfTransEnergyLevels = 8;
WSN.CBWeightDesignOption  = 1;
WSN.EqualCBWeights        = 0;
[WSN2] = CBTransmit(WSN);
2
% %------------------------ All of the nodes - Different w - Channel
% clear WSN 
% WSN = WSN0;
% WSN.ProbOfSel             = 1;
% WSN.NoOfTransEnergyLevels = 8;
% WSN.CBWeightDesignOption  = 2;
% WSN.EqualCBWeights        = 0;
% [WSN3] = CBTransmit(WSN);
% 3
% 

% Other Cases
% %------------------------ 50% of the nodes - Equal w   (bad)
% %------------------------ 50% of the nodes - Different w - Energy  (average)
% %------------------------ 50% of the nodes - Different w - Channel

%No. of Coll nodes%------------------------%------------------------%------------------------%
% figure
% hold on
% plot(100*WSN1.NoOfCollNodes/WSN.M,'-k');
% plot(100*WSN2.NoOfCollNodes/WSN.M,'-.k');
% box('on');
% grid('on');
% hold('all');
% ylabel('Number of collaborative nodes')
% xlabel('Transmission round')
% legend('Equal weights','Different weights');

% Percentage of life nodes%------------------------%------------------------%------------------------%
figure
hold on
plot(100*WSN1.NoOfLifeNodes/WSN.M,'-k');
plot(100*WSN2.NoOfLifeNodes/WSN.M,'-.k');
box('on');
grid('on');
hold('all');
ylabel('Percentage of life nodes [%]')
xlabel('Transmission round')
legend('CB without power control','CB with power control');
%Total remaining energy%------------------------%------------------------%------------------------%
figure
hold on
plot(WSN1.SumEi,'-k');
plot(WSN2.SumEi,'-.k');
box('on');
grid('on');
hold('all');
ylabel('Total remaining energy [Watts Sec]')
xlabel('Transmission round')
legend('CB without power control','CB with power control');
%SNR%------------------------%------------------------%------------------------%
figure
hold on
plot(10*log10(WSN1.AchievedSNR),'-k');
plot(10*log10(WSN2.AchievedSNR),'-.k');
box('on');
grid('on');
hold('all');
ylabel('SNR [dB]')
xlabel('Transmission round')
legend('CB without power control','CB with power control');
ylim([17 20])
