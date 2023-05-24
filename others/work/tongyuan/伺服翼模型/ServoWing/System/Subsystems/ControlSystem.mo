within ServoWing.System.Subsystems;
model ControlSystem "控制系统"
  extends Controller.PMSMControllerX(Kp3 = 2142 * 57.3, 
    p = 2, 
    U_dc = 220, T_PWM = 1e-4, Kp1 = 2.607, Ki1 = 0, T1 = 1e-5, Kp2 = 0.456, Ki2 = 0.01, T2 = 1e-4, u_max3 = 1885, u_max2 = 120, 
    T3 = 0.001, 
    u_max1 = 220, 
    u_max4 = 8.5 / 180 * pi);



end ControlSystem;