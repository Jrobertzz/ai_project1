mu = [70,180];                                      %mean for height/weight in inches/pounds - men
ExpSigma = [4  6];
ExpCorrC = [1.0 0.8
           0.8  1.0];
sigma = corr2cov(ExpSigma, ExpCorrC);                %covariance matrix(https://en.wikipedia.org/wiki/Covariance_matrix)
r = mvnrnd(mu,sigma,2000);

mu = [65,160];                                      %mean for height/weight in inches/pounds - women
ExpSigma = [3.5  5];
ExpCorrC = [1.0 0.8
           0.8  1.0];
sigma = corr2cov(ExpSigma, ExpCorrC);                %covariance matrix(https://en.wikipedia.org/wiki/Covariance_matrix)
[standard_div] = cov2corr(sigma);
r2 = mvnrnd(mu,sigma,2000);

figure                                                    %create new figure(graph window)
h1 = histfit(r(:,1));                               %histfit creates histogram with bell curve
set(h1(1),'facecolor','r'); set(h1(2),'color','m')  %<histfit>(1) = bar color, <histfit>(2) = line color
hold on;                                            %keep in figure
h2 = histfit(r2(:,1));
alpha(h2,.5)
line([67 67], ylim); %line equation x >= 67

figure
plot(r2(:,1),r2(:,2),'+',r(:,1),r(:,2),'X')
hold on;
x = 50:1:85;
y = 0.9*x+109; %line equation y = 0.9x + 109
plot(x,y)

%{
disp("Men");
disp(r);
disp("Women");
disp(r2);
%}

%{
S = std(r)
M = mean(r)

S2 = std(r2)
M2 = mean(r2)
%}

%Scenario A - height only
error = 0;
tp = 0;
tn = 0;
fp = 0;
fn = 0;
for a = 1:2000
    if r(a,1) < 67      %error if men less than 67
        error = error + 1;
        fn = fn + 1;
    else
        tp = tp + 1;
    end
    if r2(a,1) >= 67    %error if women greater than 67
        error = error + 1;
        fp = fp + 1;
    else
        tn = tn + 1;
    end
end
error = error / 4000;
disp("Scenario A")
disp("Error Rate:")
disp(error)
disp("Accuracy Rate:")
disp(1-error)
disp("True Positive Rate")
disp(tp / 2000)
disp("True Negative Rate")
disp(tn / 2000)
disp("False Positive Rate")
disp(fp / 2000)
disp("False Negative Rate")
disp(fn / 2000)

%Scenario B - height and weight
error = 0;
tp = 0;
tn = 0;
fp = 0;
fn = 0;
for a = 1:2000
    x = r(a,1);
    yhat = 0.9*x+109;
    if r(a,2) < yhat
        error = error + 1;          %error if below line for men
        fn = fn + 1;
    else
        tp = tp + 1;
    end
    
    x = r2(a,1);
    yhat = -1.3*x+257;
    if r2(a,2) >= yhat
        error = error + 1;          %error if above line for women
        fp = fp + 1;
    else
        tn = tn + 1;
    end
end
error = error / 4000;
disp("Scenario B")
disp("Error Rate:")
disp(error)
disp("Accuracy Rate:")
disp(1-error)
disp("True Positive Rate")
disp(tp / 2000)
disp("True Negative Rate")
disp(tn / 2000)
disp("False Positive Rate")
disp(fp / 2000)
disp("False Negative Rate")
disp(fn / 2000)
