function [Out_FDispEn, npdf]=EFFDispEn(x,m,nc,tau)
% 
% This function calculates new fractional order ensemble fluctuation dispersion entropy of a univariate
% signal x, using different mapping approaches (MA)
%
% Inputs:
%
% x: univariate signal - a vector of size 1 x N (the number of sample points)
% m: embedding dimension
% nc: number of classes (it is usually equal to a number between 2 and 8 - we used c=5 in Ref. [1])
% MA: mapping approach, chosen from the following options (we used 'LOGSIG' in [1]):
% 'LM' (linear mapping),
% 'NCDF' (normal cumulative distribution function),
% 'TANSIG' (tangent sigmoid),
% 'LOGSIG' 'logarithm sigmoid',
% 'SORT' (sorting method).
%%
N=length(x);
sigma_x=std(x);
mu_x=mean(x);
%% 'LM'
        y=mapminmax(x,0,1);
        y(y==1)=1-1e-10;
        y(y==0)=1e-10;
        z=round(y*nc+0.5);
        all_patterns=[1:2*nc-1]';

for f=2:m-1
    temp=all_patterns;
    all_patterns=[];
    j=1;
    for w=1:2*nc-1
        [a,b]=size(temp);
        all_patterns(j:j+a-1,:)=[temp,w*ones(a,1)];
        j=j+a;
    end
end


N_PDE=(2*nc-1)^(m-1);
for i=1:N_PDE
    key(i)=0;
    for ii=1:m-1
        key(i)=key(i)*100+all_patterns(i,ii);
    end
end


ind =hankel(1:N-(m-1)*tau, N-(m-1)*tau:N)';
embd2 = z(ind(:, 1:tau:end));
dembd2=diff(embd2)'+nc;

emb=zeros(N-(m-1)*tau,1);
for i_e=m-1:-1:1
    emb=dembd2(:,i_e)*100^(i_e-1)+emb;
end

pdf1=zeros(1,N_PDE);

for id=1:N_PDE
    [R,C]=find(emb==key(id));
    pdf1(id)=length(R);
end
        
%% 'NCDF'
        y=normcdf(x,mu_x,sigma_x);
        y=mapminmax(y,0,1);
        y(y==1)=1-1e-10;
        y(y==0)=1e-10;
        z=round(y*nc+0.5);
        all_patterns=[1:2*nc-1]';

for f=2:m-1
    temp=all_patterns;
    all_patterns=[];
    j=1;
    for w=1:2*nc-1
        [a,b]=size(temp);
        all_patterns(j:j+a-1,:)=[temp,w*ones(a,1)];
        j=j+a;
    end
end


N_PDE=(2*nc-1)^(m-1);
for i=1:N_PDE
    key(i)=0;
    for ii=1:m-1
        key(i)=key(i)*100+all_patterns(i,ii);
    end
end


ind =hankel(1:N-(m-1)*tau, N-(m-1)*tau:N)';
embd2 = z(ind(:, 1:tau:end));
dembd2=diff(embd2)'+nc;

emb=zeros(N-(m-1)*tau,1);
for i_e=m-1:-1:1
    emb=dembd2(:,i_e)*100^(i_e-1)+emb;
end

pdf2=zeros(1,N_PDE);

for id=1:N_PDE
    [R,C]=find(emb==key(id));
    pdf2(id)=length(R);
end
        
%%  'LOGSIG'
        y=logsig((x-mu_x)/sigma_x);
        y=mapminmax(y,0,1);
        y(y==1)=1-1e-10;
        y(y==0)=1e-10;
        z=round(y*nc+0.5);
        all_patterns=[1:2*nc-1]';

for f=2:m-1
    temp=all_patterns;
    all_patterns=[];
    j=1;
    for w=1:2*nc-1
        [a,b]=size(temp);
        all_patterns(j:j+a-1,:)=[temp,w*ones(a,1)];
        j=j+a;
    end
end


N_PDE=(2*nc-1)^(m-1);
for i=1:N_PDE
    key(i)=0;
    for ii=1:m-1
        key(i)=key(i)*100+all_patterns(i,ii);
    end
end


ind =hankel(1:N-(m-1)*tau, N-(m-1)*tau:N)';
embd2 = z(ind(:, 1:tau:end));
dembd2=diff(embd2)'+nc;

emb=zeros(N-(m-1)*tau,1);
for i_e=m-1:-1:1
    emb=dembd2(:,i_e)*100^(i_e-1)+emb;
end

pdf3=zeros(1,N_PDE);

for id=1:N_PDE
    [R,C]=find(emb==key(id));
    pdf3(id)=length(R);
end
        
%% 'TANSIG'
        y=tansig((x-mu_x)/sigma_x)+1;
        y=mapminmax(y,0,1);
        y(y==1)=1-1e-10;
        y(y==0)=1e-10;
        z=round(y*nc+0.5);
        all_patterns=[1:2*nc-1]';

for f=2:m-1
    temp=all_patterns;
    all_patterns=[];
    j=1;
    for w=1:2*nc-1
        [a,b]=size(temp);
        all_patterns(j:j+a-1,:)=[temp,w*ones(a,1)];
        j=j+a;
    end
end


N_PDE=(2*nc-1)^(m-1);
for i=1:N_PDE
    key(i)=0;
    for ii=1:m-1
        key(i)=key(i)*100+all_patterns(i,ii);
    end
end


ind =hankel(1:N-(m-1)*tau, N-(m-1)*tau:N)';
embd2 = z(ind(:, 1:tau:end));
dembd2=diff(embd2)'+nc;

emb=zeros(N-(m-1)*tau,1);
for i_e=m-1:-1:1
    emb=dembd2(:,i_e)*100^(i_e-1)+emb;
end

pdf4=zeros(1,N_PDE);

for id=1:N_PDE
    [R,C]=find(emb==key(id));
    pdf4(id)=length(R);
end
        
%%  'SORT'
        x=x(1:nc*floor(N/nc));
        N=length(x);
        [sx osx]=sort(x);
        Fl_NC=N/nc;
        cx=[];
        for i=1:nc
            cx=[cx i*ones(1,Fl_NC)];
        end
        for i=1:N
            z(i)=cx(osx==i);
        end
        all_patterns=[1:2*nc-1]';

for f=2:m-1
    temp=all_patterns;
    all_patterns=[];
    j=1;
    for w=1:2*nc-1
        [a,b]=size(temp);
        all_patterns(j:j+a-1,:)=[temp,w*ones(a,1)];
        j=j+a;
    end
end


N_PDE=(2*nc-1)^(m-1);
for i=1:N_PDE
    key(i)=0;
    for ii=1:m-1
        key(i)=key(i)*100+all_patterns(i,ii);
    end
end


ind =hankel(1:N-(m-1)*tau, N-(m-1)*tau:N)';
embd2 = z(ind(:, 1:tau:end));
dembd2=diff(embd2)'+nc;

emb=zeros(N-(m-1)*tau,1);
for i_e=m-1:-1:1
    emb=dembd2(:,i_e)*100^(i_e-1)+emb;
end

pdf5=zeros(1,N_PDE);

for id=1:N_PDE
    [R,C]=find(emb==key(id));
    pdf5(id)=length(R);
end
        
%%   主部分
pdf_sary(1,:)=pdf1+pdf2+pdf3+pdf4+pdf5;
[r1,c1]=size(pdf_sary);
npdf=pdf_sary/(5*(N-(m-1)*tau));
p=npdf(npdf~=0);
[r2,c2]=size(p);
a=0.1;
for q=1:c2
    Out(1,q)=(0.9511 *sum(p(q)^a .* log(p(q))))+((-1)^(1/2))*(( 0.3090*sum(p(q)^a .* log(p(q)))));
end
for q=1:c2
    a(1,q)=real(Out(1,q));
    b(1,q)=imag(Out(1,q));
end
max_i=max(a);
max_j=max(b);
Out_FDispEn=max(abs(max_i),abs(max_j));
Out_FDispEn=Out_FDispEn/log(c1);
end


