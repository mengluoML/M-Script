clear,clc
%x=xlsread('qsone','12','d2:d57');
x=xlsread('fbt','b1:k217');
g=input('number of groups, g= ')
rg=max(x)-min(x);
ii=fix(rg/(g-1)*10)/10;
xi=linspace(min(x)-.5*ii,max(x)+.5*ii,g+1);
subplot(2,2,1);
xi1=xi-ii/4;
hist(x,xi)
axis tight
subplot(2,2,2)
xi2=xi;
hist(x,xi2)
axis tight
subplot(2,2,3)
xi3=xi+ii/4;
hist(x,xi3)
axis tight
subplot(2,2,4)
xi4=xi+ii/2;
hist(x,xi4)
axis tight
sel=input('put your selection, sel= ')
figure(1),clf
if sel==1
    xi=xi1;
elseif sel==2
    xi=xi2;
elseif sel==3
    xi=xi3;  
elseif sel==4
    xi=xi4;
end
f=hist(x,xi);
if f(1)==0;
    f(1)=[];xi(1)=[];
end
g=size(f,2);
if f(g)==0
    f(g)=[];xi(g)=[];
end
g=size(f,2);
f,xi
hist(x,xi)
h = findobj(gca,'Type','patch');
set(h,'FaceColor','w','EdgeColor','k')
%axis tight
pause(5)
hold on
%f1=[0,f,0];
%x1=[xi(1)-ii,xi,xi(g)+ii];
%plot(x1,f1,'r-','linewidth',3)
%axis tight
%stop
fx=@(b,x)b(1)*exp(-b(2)*(x-b(3)).^2)+b(4)*exp(-b(5)*(x-b(6)).^2)+b(7)*exp(-b(8)*(x-b(9)).^2)+b(10)*exp(-b(11)*(x-b(12)).^2)+b(13)*exp(-b(14)*(x-b(15)).^2);
fx=@(b,x)b(1)*exp(-b(2)*(x-b(3)).^2)+b(4)*exp(-b(5)*(x-b(6)).^2)+b(7)*exp(-b(8)*(x-b(9)).^2)+b(10)*exp(-b(11)*(x-b(12)).^2);%+b(13)*exp(-b(14)*(x-b(15)).^2);
fx1=@(b,x)b(1)*exp(-b(2)*(x-b(3)).^2);
fx2=@(b,x)b(4)*exp(-b(5)*(x-b(6)).^2);
fx3=@(b,x)b(7)*exp(-b(8)*(x-b(9)).^2);
fx4=@(b,x)b(10)*exp(-b(11)*(x-b(12)).^2);
fx5=@(b,x)b(13)*exp(-b(14)*(x-b(15)).^2);

bf2=[47.4440055257276,0.250641461469084,5.45053972954869,10.4418732605697,0.482113195308932,8.37556546013277,9.26946864668084,1.56281539712817,11.2365478896466,31.5539710598415,4.39852628815945,2.91852943989290,4.94947468685170,20.7245851173361,13.8689242409882];
bf2=[41.1485948591184,0.207903898934259,5.78960027163648,5.66834620280001,1.82055234366712,9.00616669382678,8.17844014691022,1.09104156761997,11.1280721794383,21.1064076388585,1.18234564818916,3.30995320234491,2.60924866626161,2.94907701464767,14.0968269537564];
bf24=[18.2273904383865,1.36633167822269,3.30194279108961,2.61451841264028,3.04407921338995,14.1003166246735,40.3782269312620,0.170446095788044,5.77042254866628,7.74517313903107,0.850059465988464,11.0863962130384];
b11=[29.2618256771255,0.707971515354240,3.93817232330731,3.48428100909976,6.57625984251418,8.90036453305442,15.3382244828413,0.506388051977225,6.06883730740831];
b11=[35.3669352430104,0.736697941944700,4.01322509054029,4.14292277768848,0.336555998878205,7.87937790759826,21.1995516552962,1.95748197218530,6.01533087996405];
b21=[29.3577024701647,0.433400784558821,4.16451150866867,6.22951404398978,1.06683752320358,11.2562779368233,11.9972621171453,0.298970499627336,7.50001952862036];
b21=[25.2769980622702,0.441102459576264,3.94009643109662,4.51332489573799,0.883914232872690,11.9602157412736,15.5451810782633,0.130919648832287,6.63771431693940];
bf22=[38.9847692563404,0.608689893226669,5.03564554523040,5.53010167660457,2.28021451588478,9.19315765496642,33.5304530864815,0.307976600142839,7.38322254352367,17.1795884846724,2.12559269067381,3.15647551703315,4.39429169207045,0.363194188675386,12.6582847309277];
bf28=[4.48507768620407,0.493106740221991,12.8575821535149,33.6538089683426,0.231928234439842,7.36741960601253,35.5566550431324,0.624879341140145,4.99941102865116,17.0635273755997,2.15802977258740,3.15320039994561];
b12=[18.6177416420740,1.15351101525132,7.75298916482653,26.1799822464908,0.261138461363941,4.66187026469391,8.24399602464273,0.843510609397530,10.5616278008664];
b22=[28.6360071082420,0.104828581391091,6.44303949987869,9.42076460302669,1.02759868424667,3.75116162860370];

b=bf24;
%figure(1),clf
%hold on
x1=0:.01:15;
y=fx(b,x1);
y1=fx1(b,x1);
y2=fx2(b,x1);
y3=fx3(b,x1);
y4=fx4(b,x1);
%y5=fx5(b,x1);
plot(x1,y,'k-','linewidth',3)
plot(x1,y1,'b-','linewidth',2)
plot(x1,y2,'g-','linewidth',2)
plot(x1,y3,'c-','linewidth',2)
plot(x1,y4,'r-','linewidth',2)
%plot(x1,y5,'m-','linewidth',2)
plot(x1,y,'k-','linewidth',3)
title('YXD053  F2')
axis([.5,15,0,45])
N=sum(f);
disp([ '    miu,          sigma2,            sigma ,           N']) 
rst(1,1)=b(3);rst(1,2)=.5/b(2);rst(1,3)=sqrt(rst(1,2));rst(1,4)=N*b(1)/(b(1)+b(4)+b(7)+b(10));%+b(13));
rst(2,1)=b(6);rst(2,2)=.5/b(5);rst(2,3)=sqrt(rst(2,2));rst(2,4)=N*b(4)/(b(1)+b(4)+b(7)+b(10));%+b(13));
rst(3,1)=b(9);rst(3,2)=.5/b(8);rst(3,3)=sqrt(rst(3,2));rst(3,4)=N*b(7)/(b(1)+b(4)+b(7)+b(10));%+b(13));
rst(4,1)=b(12);rst(4,2)=.5/b(11);rst(4,3)=sqrt(rst(4,2));rst(4,4)=N*b(10)/(b(1)+b(4)+b(7)+b(10));%+b(13));
%rst(5,1)=b(15);rst(5,2)=.5/b(14);rst(5,3)=sqrt(rst(5,2));rst(5,4)=N*b(13)/(b(1)+b(4)+b(7)+b(10)+b(13));
disp(rst)
