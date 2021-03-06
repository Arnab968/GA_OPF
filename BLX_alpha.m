function y1 =BLX_alpha(x1,x2,VarMin,VarMax)
    
    nVar=numel(x1);
    ng=floor(nVar/2);
    x1_pow=x1(:,1:ng);
    x1_volt=x1(:,ng+1:end);
    x2_pow=x2(:,1:ng);
    x2_volt=x2(:,ng+1:end);
    y1_pow=zeros(1,ng);
    y1_volt=zeros(1,nVar-ng);
%     y2=zeros(1,nVar);
    alpha=0.5;
    for i=1:ng
  
    Cmax=max(x1_pow(1,i),x2_pow(1,i));
    Cmin=min(x1_pow(1,i),x2_pow(1,i));
    I=Cmax-Cmin;
    
    y1_pow(1,i)=(Cmin- I*alpha) + rand*((Cmax+ I*alpha)-(Cmin- I*alpha));
    end
    
    for i=1:nVar-ng
        Cmax=max(x1_volt(1,i),x2_volt(1,i));
        Cmin=min(x1_volt(1,i),x2_volt(1,i));
        I=Cmax-Cmin;
    
        y1_volt(1,i)=(Cmin- I*alpha) + rand*((Cmax+ I*alpha)-(Cmin- I*alpha));
%     y2(1,i)=(Cmin- I*alpha) + rand*((Cmax+ I*alpha)-(Cmin- I*alpha));
    end
    
    y1=[y1_pow y1_volt];
    for i=1:nVar
      if y1(1,i)>VarMax(i)
          y1(1,i)=VarMax(i);
      end
      if y1(1,i)<VarMin(i)
          y1(1,i)=VarMin(i);
      end
    end
    

end
