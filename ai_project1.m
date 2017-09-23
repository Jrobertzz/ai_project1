mu = [70,180];                                      %mean for height/weight in inches/pounds
ExpSigma = [4  6];
ExpCorrC = [1.0 -0.5
           -0.5  1.0];
sigma = corr2cov(ExpSigma, ExpCorrC)                %covariance matrix(https://en.wikipedia.org/wiki/Covariance_matrix)
r = mvnrnd(mu,sigma,1000);

mu = [65,160];                                      %mean for height/weight in inches/pounds
ExpSigma = [3.5  5];
ExpCorrC = [1.0 -0.5
           -0.5  1.0];
sigma = corr2cov(ExpSigma, ExpCorrC)                %covariance matrix(https://en.wikipedia.org/wiki/Covariance_matrix)
[standard_div] = cov2corr(sigma);
r2 = mvnrnd(mu,sigma,1000);

figure
plot(r2(:,1),r2(:,2),'+',r(:,1),r(:,2),'X')

figure                                              %create new figure(graph window)
h1 = histfit(r(:,1));                               %histfit creates histogram with bell curve
set(h1(1),'facecolor','r'); set(h1(2),'color','m')  %<histfit>(1) = bar color, <histfit>(2) = line color
hold on;                                            %keep in figure
h2 = histfit(r2(:,1));
alpha(h2,.5)

figure
h1 = histfit(r(:,2));
set(h1(1),'facecolor','r'); set(h1(2),'color','m')
hold on;
h2 = histfit(r2(:,2));
alpha(h2,.5)

S = std(r)
M = mean(r)

S2 = std(r2)
M2 = mean(r2)
