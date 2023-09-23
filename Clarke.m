function [K]=Clarke(E0,Ns)
% 
% ���ܣ�ʹ�ó����˲�������Clarkeģ��
% ���ߣ�hhuyudi
% �ο���MIMO-OFDM Wireless Communications with MATLAB
%        �ο����� FWGN С�� 
%
%��������ƵΪ926Hz���������ʱ��Ϊ50us���������Ϊʮ���
fd=295;     % ���Doppler
% E0 = 4.048e-5;
ts=1e-3;    % ������Сʱ��50΢��
fs=1/ts;    % sample frequency
% Ns=1e4;     % �������,10w
% Ns=1;
% M=2^12;     % ��FFT���ܵ���������ʹ������غ���ͨ��FFT���㹦�����ܶȣ����������
% t=(0:Ns-1)*ts;% ������ʱ�䣬��ͼʹ��
% tt=(0:M-1)*ts;% ������ʱ�䣬��ͼʹ��--�����ͼ
% ff=(-M/2:M/2-1)/(M*ts*fd);% Ƶ�ʹ�һ�����������ܶ���ͼʹ��
% temp=zeros(3,Ns); % 3*Ns�ľ���
%                   % temp��1�������洢������������غ���
%                   % temp��2�������洢ones��1��Ns��������غ��������ڹ�һ��
%                   % temp��3�������洢������������Ļ���غ���
                  
%generat channel information
[h,h_1,Nfft,Nifft,Doppler_coeff]=Clarke_model(fd,fs,Ns,E0); % ��һ����Clarkeģ�ͣ�����Ϊ1
K=abs(h_1);
%����غ����������Ļ���غ�����Ϊ�˽����׼ȷ������50�η���ȡƽ��ֵ
% for ii=1:50
%     [h,h_1,Nfft,Nifft,Doppler_coeff]=Clarke_model(fd,fs,Ns,E0);
%     yy=xcorr(h);
%     yy_cs=xcorr(real(h),imag(h));
%     temp(1,:)=temp(1,:)+yy(Ns:length(yy));
%     temp(3,:)=temp(3,:)+yy_cs(Ns:length(yy_cs));
% end

%��ͼ
%Clarkeģ�͸�����ķ������桢���ȷֲ�����λ�ֲ�
% figure(1);
% subplot(211)
% semilogy([1:Ns]*ts,abs(h));             % �ŵ�����
% hold on;
% xlabel('ʱ��/s');ylabel('����/db');title('�ŵ�ʱ������');
% str=sprintf('channel model by Clarke with fm=%dHz,Ts=%ds',fd,ts);
% title(str);
% 
% % ���ȷֲ�
% subplot(223);
% hist(abs(h), 50);
% xlabel('����');ylabel('ͳ�ƴ���');title('���ȷֲ�');
% 
% % ��λ�ֲ�
% subplot(224);
% hist(angle(h),50);
% xlabel('��λ/rad');ylabel('ͳ�ƴ���');title('��λ�ֲ�');

a=1;
end
%%����غ����ͻ���غ������㣬�������ܶ������б��
% temp(1,:)=temp(1,:)/50;
% temp(3,:)=temp(3,:)/50;
% %���ڹ�һ��
% yyy=xcorr(ones(1,Ns));
% temp(2,:)=yyy(Ns:length(yy));
% %����غ����ͷ�������غ�����ȡM���㣬���й�һ��
% for k=1:M
%     simulated_corr(k)=real(temp(1,k))/temp(2,k);
%     simulated_corr_cs(k)=real(temp(3,k))/temp(2,k);
% end
% classical_corr=besselj(0,2*pi*fd*tt);
% 
% %%��ͼ������غ����ͻ���غ���
% figure(2);
% subplot(211)
% plot(tt,simulated_corr,'k-');
% title('����غ���'); grid on; 
% xlabel('ʱ���/s');ylabel('���ϵ��');
% % axis([0 0.004 -0.5 1]);
% legend('������');
% subplot(212)
% plot(tt,simulated_corr_cs,'k-');
% title('����غ���'); grid on; 
% xlabel('ʱ���/s');ylabel('���ϵ��');
% axis([0 0.004 -0.2 0.2]);