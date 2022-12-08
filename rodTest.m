function rodTest
r = 2e-3; %Radius [m]
L = 10e-3; %Length [m]

ui = [0;0;1];

A = pi*r^2; %Area [m^3]
Ixx = pi*r^4/4; %Inertia XX Cylinder [m^3]
Iyy = pi*r^4/4; %Inertia YY Cylinder [m^3]
Izz = Ixx + Iyy; %Inertia ZZ Cylinder [m^3]
J = diag([Ixx,Iyy,Izz]); %Inertia Matrix 3x3 [m^3]

E = 128e6; %Young Modulus[kPA]
G = E*2; %Shear Modulus [kPA]

Kse = diag([G, G, E])*A; % Shear and Extension Stiffness Matrix
Kbt = diag([E, E, G])*J; % Bending and Torsion Stiffness Matrix


concentration = 1.5; %Concentrtion Proportion [1]
rho_S = 1070; %Density Silicon [Kg*m^-3]
rho_M = 7000; %Density NdFeB [Kg*m^-3]
rho = 2*(rho_S*rho_M)/(rho_M+concentration*rho_S); %Density Doped Silicon [Kg*m^-3] 

m_concentration = mkpp([0.5 1 1.5],[120 60;50,120]);
%plot(0.5:0.01:1.5,ppval(m_concentration,0.5:0.01:1.5))
mc= ppval(m_concentration,1.5); %Magnetization [kA/m]
mv = [0;0;1]; %Magnetization Vector
mm = (mc*A)*mv/(pi*4e-7);

g = [0; 0; -9.81]; %Gravity Vector [N]

B = [0;0;0];


p0 = [0;0;0];
h0 = [1;0;0;0];

hat = @(y)[  0   -y(3)  y(2) ; y(3)   0   -y(1) ; -y(2)  y(1)   0];
inv_hat = @(skew)[skew(3,2); skew(1,3); skew(2,1)];

RotH = @(h) eye(3) + 2/(h'*h) * ...
    [-h(3)^2-h(4)^2  , h(2)*h(3)-h(4)*h(1),  h(2)*h(4)+h(3)*h(1);
    h(2)*h(3)+h(4)*h(1), -h(2)^2-h(4)^2 ,  h(3)*h(4)-h(2)*h(1);
    h(2)*h(4)-h(3)*h(1), h(3)*h(4)+h(2)*h(1), -h(2)^2-h(3)^2  ];

init_guess = zeros(6,1);
global y; %Forward declaration for future scoping rule changes
fsolve(@rodShootingMethod, init_guess); %Use convex optimization to solve ICs

%Visualization
plot3(y(:,1),y(:,2),y(:,3));  title('Rod BVP Solution');  axis([-L/2 L/2 -L/2 L/2 0 L])
grid on;  daspect([1 1 1]);  xlabel('x (m)');  ylabel('y (m)');  zlabel('z (m)');


function residual = rodShootingMethod(guess)
   %Guessed Initial Condition
   n0 = guess(1:3);
   m0 = guess(4:6);
   y0 = [p0; h0; n0; m0];

   [s,y] = ode45(@rodMagOde,[0 L],y0);
   
   n = y(end,8:10);
   m = y(end,11:end);
   residual = [n;m];
end

function [ys] = rodMagOde(s,y)
    %y = [p;h;n;m]
    p = y(1:3);
    h = y(4:7);
    n = y(8:10);
    m = y(11:end);
    R = RotH(h);

    v = Kse^-1*R.'*n + [0;0;1];
    u = Kbt^-1*R.'*m;

    fg = rho*A*g;
    fm = 0;
    f = fg+fm;

    tm = hat(R*mm)*B;  
    t = tm;

    ps = R*v;
    hs =  [ 0  , -u(1), -u(2), -u(3);
            u(1),   0  ,  u(3), -u(2);
            u(2), -u(3),   0  ,  u(1);
            u(3),  u(2), -u(1),   0  ] * h/2;
    ns = -f;
    ms = -hat(ps)*n - t;

    ys = [ps;hs;ns;ms];
end

end