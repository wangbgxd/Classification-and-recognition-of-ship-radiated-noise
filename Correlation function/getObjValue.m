function objValue = getObjValue(parameter)
% Ŀ�꺯����һ������ʽ���̣�Ψһ�Ĵ����ǲ�������������������������ΪĿ�꺯����ֵ��
% ����ʾ����һ����������񣬲������׼ȷ�ʣ���С�������ʣ���Ŀ�꺯����
% ������ѵ����������Ҫ��ȡѵ�������Լ���Ӧ�ı�ǩ�������Ŀ�꺯���ڲ���ȡ���ݣ������ַ�ʽ��
% 
% ��1������ѵ�����ݺͱ�ǩ��ȫ�ֱ���
% ��2������load������ȡѵ�����ݺͱ�ǩ
% ��3������evalin������ȡ�������ռ��ѵ�����ݺͱ�ǩ

    % ѵ������
   
    P_train = evalin('base', 'P_train');
    T_train = evalin('base', 'T_train');
    P_test = evalin('base', 'P_test');
    T_test = evalin('base', 'T_test');    % SVM����

    c = parameter(1, 1);
    g = parameter(1, 2);

    % ѵ���Ͳ���
    cmd = ['-s 0 -t 2 ', '-c ',num2str(c), ' -g ', num2str(g), ' -q'];
    model = libsvmtrain(T_train, P_train, cmd); 
    [~,acc,~]=libsvmpredict(T_test,P_test,model); % SVMģ��Ԥ�⼰�侫��
    if size(acc,1) == 0
        objValue = 1;
    else
    objValue=1-acc(1)/100; % �Է���Ԥ���������Ϊ�Ż���Ŀ�꺯��ֵ
    end
end

