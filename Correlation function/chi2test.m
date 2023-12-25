function [chi2,chi2_pValue] = chi2test(table)
% function [chi2,chi2_pValue] = chi2test(table)

% [row col] = size(table);
% T = sum(sum(table));
R = sum(table,2);
C = sum(table,1);
table(:,C==0)=[];
table(R==0,:)=[];
[row,col] = size(table);
T = sum(sum(table));
R = sum(table,2);
C = sum(table,1);
df = (row-1)*(col-1);
if df == 1
    if R(1)*R(2)*C(1)*C(2) == 0
        chi2 = 0;
    else
        chi2 = (abs(table(1,1)*table(2,2)-table(1,2)*table(2,1)) - T/2)^2 * T / (R(1)*R(2)*C(1)*C(2));
    end
else
    sigma = (table .^2) ./ (R * C);
    sigma(isnan(sigma)) = 0;
    sigma = sum(sum( sigma ));
    chi2 = T * (sigma-1);
end
% chi2=chi2/df;
chi2_pValue = 1 - chi2cdf(chi2,df);
