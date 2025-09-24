% Parámetros
R = 10;        % Ohm
L = 2e-3;      % H
C = 10e-6;     % F
Vin = 120;     % V


A = [0      -1/L;
     1/C  -1/(R*C)];
B = [Vin/L; 0];
Cmat = [0 1];


p = [-5e4 + 5e4j, -5e4 - 5e4j, -1e4];


A_aug = [A, zeros(2,1);
        -Cmat, 0];
B_aug = [B; 0];
C_aug = [Cmat, 0];


Co = ctrb(A_aug, B_aug);
rankCo = rank(Co);
fprintf('Rango de la matriz de controlabilidad : %d (esperado 3)\n', rankCo);
if rankCo < 3
    error('Sistema aumentado NO es controlable -> no puedes usar place/acker directamente.');
end


K_place = place(A_aug, B_aug, p); 
disp('K (place):'); disp(K_place);


K_acker = acker(A_aug, B_aug, p);
disp('K (acker):'); disp(K_acker);


Acl = A_aug - B_aug*K_place;
eigAcl = eig(Acl);
disp('Autovalores del lazo cerrado con K_place:'); disp(eigAcl);


disp('A_aug - B_aug*K_place ='); disp(Acl);



%% 
disp('matrices aumentadas');
disp('matriz A');
disp(A_aug);
disp('matriz B');
disp(B_aug);
disp('matriz C');
disp(Cmat);
