﻿within TransiEnt.Basics.Blocks.Check;
model TestDiscreteTimeSlewRateLimiter "Model for testing the TimeSlewRateLimiter model"



//________________________________________________________________________________//
// Component of the TransiEnt Library, version: 2.0.3                             //
//                                                                                //
// Licensed by Hamburg University of Technology under the 3-BSD-clause.           //
// Copyright 2021, Hamburg University of Technology.                              //
//________________________________________________________________________________//
//                                                                                //
// TransiEnt.EE, ResiliEntEE, IntegraNet and IntegraNet II are research projects  //
// supported by the German Federal Ministry of Economics and Energy               //
// (FKZ 03ET4003, 03ET4048, 0324027 and 03EI1008).                                //
// The TransiEnt Library research team consists of the following project partners://
// Institute of Engineering Thermodynamics (Hamburg University of Technology),    //
// Institute of Energy Systems (Hamburg University of Technology),                //
// Institute of Electrical Power and Energy Technology                            //
// (Hamburg University of Technology)                                             //
// Fraunhofer Institute for Environmental, Safety, and Energy Technology UMSICHT, //
// Gas- und WÃ¤rme-Institut Essen						  //
// and                                                                            //
// XRG Simulation GmbH (Hamburg, Germany).                                        //
//________________________________________________________________________________//




  extends Icons.Checkmodel;
  DiscreteTimeSlewRateLimiter SlewRateLimiter(
    samplePeriod=60,
    startTime=0,
    Rising=1/3600,
    Falling=-1/1800,
    Max=1,
    Min=0) annotation (Placement(transformation(extent={{12,-42},{44,-10}})));
  Modelica.Blocks.Sources.TimeTable Testdata(table=[0,0; 3600,1; 5400,0; 7200,1; 9000,1; 12600,0; 12600,1; 16200,1; 16200,0; 18000,0; 18000,1.2; 22320,1.2; 22320,-0.1; 26000,-0.1]) annotation (Placement(transformation(extent={{-60,-44},{-24,-8}})));
equation
  connect(Testdata.y, SlewRateLimiter.u) annotation (Line(points={{-22.2,-26},{-16,-26},{8.8,-26}}, color={0,0,127}));
  annotation (
    experiment(
      StopTime=26000,
      Interval=30,
      Tolerance=1e-006),
    __Dymola_experimentSetupOutput,
    Diagram(graphics={Text(
          extent={{-48,74},{50,26}},
          lineColor={0,0,0},
          textString="Look at:
Testdata.y
SlewRateLimiter.y
SlewRateLimiter.Max
SlewRateLimiter.Min

")}),
    Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Test environment for TimeSlewRateLimiter</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
</html>"));
end TestDiscreteTimeSlewRateLimiter;
