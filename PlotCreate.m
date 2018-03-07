for i=1:5
%Streamflow Charts
    subplot(2,5,i)
    hold on
    plot(t,Truth(i,:)')
    plot(t,vamean(i,:)')
    qname = strcat('q_',num2str(i))
    ylabel(qname)
    xlabel('time')
    hold off
%Height Charts    
    subplot(2,5,i+5)
    hold on
    plot(t,Truth(i+5,:)')
    plot(t,vamean(i+5,:)')
        qname = strcat('sp_',num2str(i))
    ylabel(qname)
    xlabel('time')
    hold off
end