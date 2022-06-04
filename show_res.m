clc
%clear
close all

load ('Alpha.mat')
load('result/BAY_MAP.mat')
load('result/ML_result.mat');
ML_Ex=ones(4,9);
for i=1:4
    ML_Ex(i,:)= ML_Ex(i,:)*result_ML(i);
end


figure(1)
semilogx(alpha,1-result_BAY_S1(1,:),alpha,1-result_BAY_S2(1,:),alpha,1-result_MAP_S1(1,:),alpha,1-result_MAP_S2(1,:),alpha,1-ML_Ex(1,:));
legend('BAY_S1','BAY_S2','MAP_S1','MAP_S2','ML');
title('Data Set 1')
grid on
xlabel('alpha');
ylabel('error rate');


figure(2)
semilogx(alpha,1-result_BAY_S1(2,:),alpha,1-result_BAY_S2(2,:),alpha,1-result_MAP_S1(2,:),alpha,1-result_MAP_S2(2,:),alpha,1-ML_Ex(2,:));
legend('BAY_S1','BAY_S2','MAP_S1','MAP_S2','ML');
title('Data Set 2')
grid on
xlabel('alpha');
ylabel('error rate');



figure(3)
semilogx(alpha,1-result_BAY_S1(3,:),alpha,1-result_BAY_S2(3,:),alpha,1-result_MAP_S1(3,:),alpha,1-result_MAP_S2(3,:),alpha,1-ML_Ex(3,:));
legend('BAY_S1','BAY_S2','MAP_S1','MAP_S2','ML');
title('Data Set 3')
grid on
xlabel('alpha');
ylabel('error rate');

figure(4)
semilogx(alpha,1-result_BAY_S1(4,:),alpha,1-result_BAY_S2(4,:),alpha,1-result_MAP_S1(4,:),alpha,1-result_MAP_S2(4,:),alpha,1-ML_Ex(4,:));
legend('BAY_S1','BAY_S2','MAP_S1','MAP_S2','ML');
title('Data Set 4')
grid on
xlabel('alpha');
ylabel('error rate');



figure(5)
semilogx(alpha,1-result_BAY_S1(1,:),alpha,1-result_BAY_S1(2,:),alpha,1-result_BAY_S1(3,:),alpha,1-result_BAY_S1(4,:));
legend('S1_D1','S1_D2','S1_D3','S1_D4')
title('Baysian method stratege 1');
grid on
xlabel('alpha');
ylabel('error rate');

figure(6)
semilogx(alpha,1-result_BAY_S2(1,:),alpha,1-result_BAY_S2(2,:),alpha,1-result_BAY_S2(3,:),alpha,1-result_BAY_S2(4,:));
legend('S2_D1','S2_D2','S2_D3','S2_D4')
title('Baysian method stratege 2');
grid on
xlabel('alpha');
ylabel('error rate');


figure(7)
semilogx(alpha,1-result_MAP_S1(1,:),alpha,1-result_MAP_S1(2,:),alpha,1-result_MAP_S1(3,:),alpha,1-result_MAP_S1(4,:));
legend('S1_D1','S1_D2','S1_D3','S1_D4')
title('MAP method stratege 1');
grid on
xlabel('alpha');
ylabel('error rate');

figure(8)
semilogx(alpha,1-result_MAP_S2(1,:),alpha,1-result_MAP_S2(2,:),alpha,1-result_MAP_S2(3,:),alpha,1-result_MAP_S2(4,:));
legend('S2_D1','S2_D2','S2_D3','S2_D4')
title('MAP method stratege 2');
grid on
xlabel('alpha');
ylabel('error rate');

figure(9)

plot(1-result_ML);
title('ML method');
grid on
xlabel('Data set');
ylabel('error rate');
