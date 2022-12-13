classdef rodModel
    %rodModel

    properties

        %Geometry Property
        r (1,1) {mustBeReal,mustBePositive} = 1e-3; %Radius [m]
        L (1,1) {mustBeReal,mustBePositive} = 0.5; %Length [m]

        %Geometry Parameters - Hypotesis Cylinder
        A (1,1); %Area [m^3]
        Ixx (1,1); %Inertia XX Cylinder [m^3]
        Iyy (1,1); %Inertia YY Cylinder [m^3]
        Izz (1,1); %Inertia ZZ Cylinder [m^3]
        J (3,3); %Inertia Matrix 3x3 [m^3]

        %Elastic Parameters
        E (1,1) {mustBeReal,mustBePositive} = 200e7; %Young Modulus[kPA]
        G (1,1) {mustBeReal,mustBePositive} = 80e9; %Shear Modulus [kPA]
        Kse (3,3); % Shear and Extension Stiffness Matrix      
        Kbt (3,3); % Bending and Torsion Stiffness Matrix

        %Material Property - Density
        rho (3,3) {mustBeReal,mustBePositive} = 8000;

        %Material Property - Magnetization Momentum

        %Gravity
        g = [9.81; 0; 0];

        %Boundary Conditions
        p0 (3,1) {mustBeReal} = [0;0;0];
        R0 (3,3) {mustBeReal} = eye(3);
        RL (3,3) {mustBeReal} = eye(3);
        pL (3,1);

        %State
        y = [] %= [p; h; n; m];

    end

    methods (Access=public)
        
        function obj=rodModel()

            obj.A = pi*obj.r^2; %Area [m^3]
            obj.Ixx= pi*obj.r^4/4; %Inertia XX Cylinder [m^3]
            obj.Iyy= pi*obj.r^4/4; %Inertia YY Cylinder [m^3]
            obj.Izz= obj.Ixx + obj.Iyy; %Inertia ZZ Cylinder [m^3]
            obj.J= diag([obj.Ixx,obj.Iyy,obj.Izz]); %Inertia Matrix 3x3 [m^3]

            obj.Kse = diag([obj.G, obj.G, obj.E])*obj.A; % Shear and Extension Stiffness Matrix      
            obj.Kbt = diag([obj.E, obj.E, obj.G])*obj.J; % Bending and Torsion Stiffness Matrix

        end

        function obj=solveBVP(obj,pL)
            obj.pL = pL;
            init_guess = zeros(6,1);
            fsolve(@(x) RodShootingMethod(obj,x), init_guess);
        end

        function plotRod(parent)
             plot3(parent,obj.y(:,1),obj.y(:,2),obj.y(:,3));  
             title('Rod BVP Solution');  
             axis([-obj.L/2 obj.L/2 -obj.L/2 obj.L/2 -obj.L obj.L])
             grid on;  
             daspect([1 1 1]);  
             xlabel('x (m)');  
             ylabel('y (m)');  
             zlabel('z (m)');
        end

        function residual = RodShootingMethod(obj,guess) 
            %Optimization objective function

            %Update guessed initial conditions
            n0 = guess(1:3); 
            m0 = guess(4:6);
            y0 = [obj.p0; reshape(obj.R0,9,1); n0; m0];

            %Numerically solve the resulting IVP
            [s,obj.y] = ode45(@(x,y) RodODE(obj,x,y),[0 obj.L],y0);  
            
            %Calculate distal constraint violation
            pL_shot = obj.y(end,1:3)';           
            RL_shot = reshape(obj.y(end,4:12),3,3);
            position_error = pL_shot - obj.pL;
            rotation_error = inv_hat( RL_shot'*obj.RL - RL_shot*obj.RL');
            residual = [position_error; rotation_error];
        end
    
        %ODE System
        function ys = RodODE(obj,s,y)

            R = reshape(y(4:12),3,3);
            n = y(13:15);
            m = y(16:18);
    
            v = obj.Kse^-1*R.'*n + [0;0;1];
            u = obj.Kbt^-1*R.'*m;
    
            ps = R*v;
            Rs = R*hat(u);
            ns = -obj.rho*obj.A*obj.g;
            ms = -hat(ps)*n;
    
            ys = [ps; reshape(Rs,9,1); ns; ms];

        end

    end

end