function Problem4uia
  global k; k = 0.1;
  global ax2;
  ax1 = axes('Position',[0 0 1 1]); 
  set(ax1,'Visible','off')
  ax2 = axes ('position', [0.2, 0.2, 0.7, 0.6]);
  plotter()
  axes(ax1)
  text(0.05,.075,'k:','FontSize',16)
  %% Add ui 'slider' element      
  hslider = uicontrol (                    ...
         'style', 'slider',                ...
         'Units', 'normalized',            ...
         'Position',[0.1 0.025 0.8 0.1], ...
         'min', 0.001,                         ...
         'max', 0.3,                        ...
         'value', k,                      ...
         'callback', {@slide1}          ...
       );
end

function plotter()
  global k;
  global ax2;
  load('bacteria.mat','BacteriaData')

hours = linspace(min(BacteriaData(:,1)),max(BacteriaData(:,1)));

plot(ax2,BacteriaData(:,1),BacteriaData(:,2),'.','MarkerSize',20)
hold on
plot(ax2,hours,0.02*exp(k*hours) ,'linewidth',2)
hold off
set(gca,'FontSize',20)
xlabel('Year')
ylabel('Population Density')
title({'Bacteria Population w/' ;sprintf('k=%1.2f',k)})
ylim([0,1.2*max(BacteriaData(:,2))])
xlim([min(hours),max(hours)])
end
function slide1 (h, event)
  global k;
  k = get (h, 'value');
  plotter()
end