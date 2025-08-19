%ejercicio 1
A = -2;
B = 3;
C = 5;
D = 0;

sys_ss = ss(A,B,C,D);
figure;
step(sys_ss)
disp('funcion de transferencia de 1')

tf(sys_ss)
%% 
%ejercicio 2

A = [0 1; -3 -4];
B = [0 1; 1 2];
C = [1 0];
D = [0 0];

estado2 = ss(A,B,C,D);
figure;
step(estado2);

disp("funcion de transferencia ejercicio 2")
[num1, den1] = ss2tf(A,B,C,D,1);
[num2, den2] = ss2tf(A,B,C,D,2);
disp('matriz 1'),
disp(num1)
disp(den1)
disp('matriz 2'),
disp(num2)
disp(den2)

%%
%ejercicio 3

A = [0 1 0; 0 0 1; -6 -11 -6];
B = [0; 0; 1];
C = [1 0 0; 0 1 0];
D = [0;0];

estado3 = ss(A,B,C,D);
figure;
step(estado3);

[num, den] = ss2tf(A,B,C,D,1);
disp('funcion de transferencia ejercicio 3')
disp('y1(s)/u(s)'), 
disp(num(1,:))
disp(den)
disp('y2(s)/u(s)'), 
disp(num(2,:))
disp(den)

%% 
%%ejercicio 4

A = [0 1 0 0; 0 0 1 0; 0 0 0 1; -2 -5 -3 -1];
B = [0 1; 1 0;0 1; 1 1];
C = [1 0 0 0; 0 1 0 0];
D = [0 0;0 0];

estado4 = ss(A,B,C,D);
figure;
step(estado4);
disp('funciones de transferencia ejericcio 4')
% Funciones de transferencia respecto a u1
[num_u1, den_u1] = ss2tf(A,B,C,D,1);
disp('y1(s)/u1(s)')
disp(num_u1(1,:));
disp(den_u1);
disp('y2(s)/u1(s)')
disp(num_u1(2,:));
disp(den_u1);
% Funciones de transferencia respecto a u2
[num_u2, den_u2] = ss2tf(A,B,C,D,2);
disp('y1(s)/u2(s)')
disp(num_u2(1,:));
disp(den_u2);
disp('y2(s)/u2(s)')
disp(num_u2(2,:));
disp(den_u2);


%% ejercicio 5
A = [0 1 0; 0 0 1; -4 -5 -2];
B = [1 0; 0 1;1 1];
C = [1 0 0; 0 1 1];
D = [1 0;0 1];

estado5 = ss(A,B,C,D);
figure;
step(estado5)
disp('funciones de transferencia ejercicio 5')
% Funciones de transferencia respecto a u1
[num_u1, den_u1] = ss2tf(A,B,C,D,1);
disp('y1(s)/u1(s)')
disp(num_u1(1,:));
disp(den_u1);
disp('y2(s)/u1(s)')
disp(num_u1(2,:));
disp(den_u1);
% Funciones de transferencia respecto a u2
[num_u2, den_u2] = ss2tf(A,B,C,D,2);
disp('y1(s)/u2(s)')
disp(num_u2(1,:));
disp(den_u2);
disp('y2(s)/u2(s)')
disp(num_u2(2,:));
disp(den_u2);