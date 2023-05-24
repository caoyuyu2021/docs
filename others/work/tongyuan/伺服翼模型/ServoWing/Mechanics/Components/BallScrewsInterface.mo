within ServoWing.Mechanics.Components;
partial model BallScrewsInterface "滚珠丝杠接口"
  Interfaces.RotationalInterfaces.Flange_a flange_r
    annotation (Placement(transformation(origin = {-100.0, 0.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
  Interfaces.TranslationalInterfaces.Flange_a flange_t
    annotation (Placement(transformation(origin = {0.0, 50.0}, 
      extent = {{-10.0, -10.0}, {10.0, 10.0}})));
end BallScrewsInterface;