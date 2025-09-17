m = .25429;
M = .08967;
g=9.80665;
l =.1129;
I= .00056639;

ec1 = (-m*g)/M;
ec2 = ((M+m)*g)/M*l;
ec3 = 1/M;
ec4 = -1/M*l;

A = [0,0,1,0;
    0,0,0,1;
    0,ec1,0,0;
    0,ec2,0,0];
B = [0;
     0;
     ec3;
     ec4];

%% 

n = size(A, 1);
C = ctrb(A, B);
rank_C = rank(C);
disp(rank_C);
disp(C);
%% 
syms s k1 k2 k3 k4

sI = s*eye(4);
K =[k1,k2,k3,k4];

lc = (A-B*K);
disp("esto es lazo cerrado");
disp(lc)

policar = (sI - lc);
disp(policar);

det_policar = det(policar);
disp(det_policar);


%% 
% Polos deseados
p1 = -30.2174 + 27.551j;
p2 = -30.2174 - 27.551j;
p3 = -1.153 + 1.027j;
p4 = -1.153 - 1.027j;

polinomio_deseado = poly([p1 p2 p3 p4]);
disp(polinomio_deseado)

%% 

% Extraer los coeficientes de ambos polinomios
%coef_caracteristico = sym2poly(det_policar);

coef_caracteristico = coeffs(det_policar, s, 'All');

coef_deseado = polinomio_deseado;
disp(coef_caracteristico);
disp(coef_deseado);
%% 

% Igualar los coeficientes y resolver para K
ecuaciones = [
    coef_caracteristico(2) == coef_deseado(2);
    coef_caracteristico(3) == coef_deseado(3);
    coef_caracteristico(4) == coef_deseado(4);
    coef_caracteristico(5) == coef_deseado(5)
];
ganancias_k = solve(ecuaciones, [k1, k2, k3, k4]);
K1 = [double(ganancias_k.k1), double(ganancias_k.k2), double(ganancias_k.k3), double(ganancias_k.k4)];
disp('el vector de k ganancias es');
disp(K1);


%% 
Aprueba = (A-B*K1);
polosevaluar = eig(Aprueba);
disp(polosevaluar);


%% 
bk = B*K1;
disp('matriz B');
disp(B);
disp("vector de k ganancias");
disp(K1);
disp('B por K');
disp(bk);


