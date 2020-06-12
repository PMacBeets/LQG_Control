
  
%syms Jp Jy Dp Dy Ksp Kpp Kyy Kpy Kyp
w1 = 0.1;


s = tf('s');
num = [1 1];
den =[1 2]
G = tf(num,den)

numC = [1]
denC = [1];
C = tf(numC,denC)

