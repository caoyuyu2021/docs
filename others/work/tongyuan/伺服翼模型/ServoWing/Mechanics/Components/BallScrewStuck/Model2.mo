within ServoWing.Mechanics.Components.BallScrewStuck;
model Model2
  SI.Force Fat_max;
  // parameter Real Q1 = 230;
  // Real Q[43];
  Real Q[44];
  annotation (experiment(Algorithm = Rkfix4, IntegratorStep = 0.002, NumberOfIntervals = 500, StartTime = 0, StopTime = 1, Tolerance = 1e-08));
equation 
  Q[1] = 230;
  Fat_max = 0.7173 * sum(Q);
  for i in 1:43 loop 
    1.714 * (abs(Q[i + 1])) ^ (2 / 3) = 1.714 * (abs(Q[i])) ^ (2 / 3) - 0.1872 * Fat_max;
  end for;
end Model2;