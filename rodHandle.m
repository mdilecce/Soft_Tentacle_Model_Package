classdef rodHandle<handle
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
        E (1,1) {mustBeReal,mustBePositive} = 200e9; %Young Modulus[kPA]
        G (1,1) {mustBeReal,mustBePositive} = 80e9; %Shear Modulus [kPA]
        Kse (3,3); % Shear and Extension Stiffness Matrix      
        Kbt (3,3); % Bending and Torsion Stiffness Matrix

        %Material Property - Density
        rho (3,3) {mustBeReal,mustBePositive} = 8000;

        %Material Property - Magnetization Momentum

        %Gravity
        g = [9.81; 0; 0];

        %Boundary Conditions
        %Proximal
        p0 (3,1) {mustBeReal} = [0;0;0];
        h0 (4,1) {mustBeReal}= [1;0;0;0]

        %State
        y = []; %= [p; h; n; m];
        s = []

    end

    %General ODE
    methods (Access=public)
        
        function obj=rodHandle()

            obj.A = pi*obj.r^2; %Area [m^3]
            obj.Ixx= pi*obj.r^4/4; %Inertia XX Cylinder [m^3]
            obj.Iyy= pi*obj.r^4/4; %Inertia YY Cylinder [m^3]
            obj.Izz= obj.Ixx + obj.Iyy; %Inertia ZZ Cylinder [m^3]
            obj.J= diag([obj.Ixx,obj.Iyy,obj.Izz]); %Inertia Matrix 3x3 [m^3]

            obj.Kse = diag([obj.G, obj.G, obj.E])*obj.A; % Shear and Extension Stiffness Matrix      
            obj.Kbt = diag([obj.E, obj.E, obj.G])*obj.J; % Bending and Torsion Stiffness Matrix

        end

        function solveIVP(obj,n0,m0)
            %y0 = [obj.p0;reshape(obj.R0,9,1);n0;m0];
            y0 = [obj.p0;obj.h0;n0;m0];
            [obj.s,obj.y] = ode45(@obj.rodModelOde,[0,obj.L],y0);
        end

        %ODE System
        function ys = rodModelOde(obj,~,y)

            %R = reshape(y(4:12),3,3);
            %n = y(13:15);
            %m = y(16:18);
            
            h = y(4:7);
            R = Q2Rot(h);
            n = y(8:10);
            m = y(11:13);
    
            v = obj.Kse^-1*R.'*n + [0;0;1];
            u = obj.Kbt^-1*R.'*m;
    
            ps = R*v;  
            Rs = R*hat(u);
            ns = -obj.rho*obj.A*obj.g;
            ms = -hat(ps)*n;

            hs = [ 0  , -u(1), -u(2), -u(3);
                u(1),   0  ,  u(3), -u(2);
                u(2), -u(3),   0  ,  u(1);
                u(3),  u(2), -u(1),   0  ] * h/2;
    
            %ys = [ps; reshape(Rs,9,1); ns; ms];
            ys = [ps;hs;ns;ms];

        end

    end

    methods (Access=?plotRod)
        function [p,h,s,r]=returnStatusDef(obj)
            p=obj.y(:,1:3);
            h=obj.y(:,4:7);
            s=obj.s;
            r=obj.r;
        end
    end

    methods (Access=public) 

%         function l=plotRod(obj,argsLine)
%             arguments
%                 obj 
%                 argsLine.?matlab.graphics.primitive.chart.Line;    
%             end
%             propertyCell = namedargs2cell(argsLine);
%             plot3(obj.y(:,1),obj.y(:,2),obj.y(:,3),propertyCell{:});  
%             title('Rod Current Solution');  
%             axis([-obj.L/2 obj.L/2 -obj.L/2 obj.L/2 -obj.L obj.L])
%             grid on;   daspect([1 1 1]);  
%             xlabel('x (m)');   ylabel('y (m)');  zlabel('z (m)');
%         end

    end
 


end