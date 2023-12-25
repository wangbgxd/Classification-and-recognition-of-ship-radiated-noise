function [varargout]= SAM_SSD(varargin)
warning off; 
if nargin==2
    y=varargin{1};
    Fs=varargin{2};
    Times=inf;
    Nstdd=1.2;
elseif nargin==3
    y=varargin{1};
    Fs=varargin{2};
    Times=varargin{3};
    Nstdd=1.2;
elseif nargin==4
    y=varargin{1}; 
    Fs=varargin{2}; 
    Times=varargin{3}; 
    Nstdd=varargin{4}; 
end

    k1=0;
    th=0.01;
    y=y(:)';
    L=length(y);

    y = y-mean(y); 

    if Fs/L <= 0.5
        lf = L;
    else
        lf = 2*Fs;
    end
    RR1=zeros(size(y)); %初始化输出
    orig = y;
    remen = 1;  %迭代停止标准
    testcond = 0;
    time=0;
   
    while (remen > th&&time<Times)
        time=time+1;
        k1 = k1+1;
        y = y-mean(y);  %输入信号均值向0逼近
        v2=y;
        clear nmmt;
        [nmmt,ff] = pwelch(v2,[],[],4096,Fs);
        [~,in3] = max(nmmt);
        nmmt = nmmt';
        if ((k1 == 1) && (ff(in3)/Fs < 1e-3))  
            l = floor(L/3);    

       
            M = zeros(L-(l-1), l);
            for k=1:L-(l-1)
                M(k,:) = v2(k:k+(l-1));
            end
            [U,S,V] = svd(M);   
            U(:,l+1:end) = [];
            S(l+1:end,:) = [];
            V(:,l+1:end) = [];

            rM = rot90(U(:,1)*S(1,:)*V');  %将数组旋转90°
            r = zeros(1,L);
            [~,m] = size(rM);
            for k=-(l-1):L-(l)
                r(k+l) = sum(diag(rM,k))/m;  
            end
        else % 以后的运行中
            l_m = floor(Fs/ff(in3)*Nstdd);
   
            for cont = 1:2 
                v2 = v2-mean(v2);
                [deltaf] = gaussfit_SSD(ff,nmmt');
                
                [~,iiii1] = min(abs(ff-(ff(in3)-deltaf)));
                [~,iiii2] = min(abs(ff-(ff(in3)+deltaf)));
                
                 l = floor(Fs/ff(in3)*Nstdd);   
                if l <= 2 
                    l=2;
                elseif l > floor(L/3)
                    l = floor(L/3);
                end
                
                M=zeros(L, l);
                
                for k=1:l
                    M(:,k)=[v2(end-k+2:end)'; v2(1:end-k+1)'];
                end
                [U,S,V] = svd(M,0);

             
                 if size(U,2)>l
                    yy = abs(fft(U(:,1:l),lf));
                else
                    yy = abs(fft(U,lf));
                end
                yy_n = size(yy,1);
                ff2 = (0:yy_n-1)*Fs/yy_n;
                yy(floor(yy_n/2)+1:end,:) = [];
                ff2(floor(length(ff2)/2)+1:end) = [];
                % %
                if size(U,2)>l
                    [~,ind1] = max(yy(:,1:l));
                else
                    [~,ind1] = max(yy);
                end

                ii2 = find(ff2(ind1)>ff(iiii1) & ff2(ind1)<ff(iiii2)); %0.31
                [~,indom] = min(abs(ff2-ff(in3)));
                [~, maxindom] = max(yy(indom,:));

                if isempty(ii2)
                    rM=U(:,1)*S(1,:)*V';
                else
                    if ii2(ii2==maxindom)
                        rM = U(:,ii2)*S(ii2,:)*V';
                    else
                        ii2 = [maxindom,ii2];
                        rM = U(:,ii2)*S(ii2,:)*V';
                    end
                end
                if cont == 2
                    vr = r;
                end

                [~,m] = size(rM);

                for k=-(L-1):0
                    kl = k+L;
                    if kl >= m
                        r(kl) = sum(diag(rM,k))/m;    
                    else
                        r(kl) = (sum(diag(rM,k))+sum(diag(rM,kl)))/m;
                    end
                end
                r = fliplr(r);

                if cont == 2 && r*(y-r)'<0 % check condition for convergence
                    r = vr;
                end
                v2 = r;
            end
                        
        end
        
        RR1(k1,:) = (y*r'/(r*r'))*r;
        y=y-RR1(k1,:);  %残余信号
        remenold = remen;  
        if testcond  %如果达到停止条件？
            remen = sum((sum(RR1(stept:end,:),1)-orig2).^2)/(sum(orig2.^2));
            if k1 == stept+3
                break
            end
        else
            remen = sum((sum(RR1(1:end,:),1)-orig).^2)/(sum(orig.^2));  
        end
        % in rare cases, convergence becomes very slow; the algorithm is then
        % stopped if no real improvement in decomposition is detected (this is 
        % something to fix in future versions of SSD)
        if abs(remenold - remen)< 1e-5  
            testcond = 1;
            stept = k1+1;
            orig2 = y;
        end
     

    end
  
    if testcond
    fprintf('分解完成，残余信号与原始信号的均方误差能量为： %3.1f\n %',(1-sum((sum(RR1(1:end,:),1)-orig).^2)/(sum(orig.^2)))*100);
    end
%
    ftemp = (0:size(RR1,2)-1)*Fs/size(RR1,2);
    sprr = abs(fft(RR1'));
    [~,isprr] = max(sprr);
    fsprr = ftemp(isprr);
    [~,iord] = sort(fsprr,'descend');
    RR1 = RR1(iord,:);

    SSD_Output = RR1;

if nargout>0
    varargout{1}=SSD_Output;
end  
if nargout>1
    varargout{2}=y;
end

end


function [deltaf, deltaf2] = gaussfit_SSD(ff,nmmt)
    [pks,lcs] = findpeaks(nmmt);
    [~,inpks] = sort(pks,'descend');
    in1 = lcs(inpks(1));
    in2 = lcs(inpks(2));

    is1 = find(nmmt(in1+1:end)<2/3*nmmt(in1),1,'first');
    is2 = find(nmmt(in2+1:end)<2/3*nmmt(in2),1,'first');

    estsig1 = abs(ff(in1)-ff(in1+is1));

    if isempty(is2) %isempty 确定数组是否为空
        estsig2 = 4*abs(ff(in1)-ff(in2));
    else
        estsig2 = abs(ff(in2)-ff(in2+is2));
    end

    ff_in1 = -((ff-ff(in1)).^2);
    ff_in2 = -((ff-ff(in2)).^2);
    ff_m_in1_in2 = -((ff-0.5*(ff(in1)+ff(in2))).^2);

    Phi = @(x)(nmmt-(x(1)*exp(ff_in1/(2*(x(4))^2))+x(2)*exp(ff_in2/(2*(x(5))^2))+x(3)*exp(ff_m_in1_in2/(2*(x(6))^2))));
    x0 = [nmmt(in1)/2 nmmt(in2)/2 nmmt(round(mean([in1,in2])))/4 estsig1 estsig2 4*abs(ff(in1)-ff(in2))];
    x=SAM_LMF(Phi,x0);

    deltaf = abs(x(4))*2.5;
    deltaf2 = abs(x(6));
end

