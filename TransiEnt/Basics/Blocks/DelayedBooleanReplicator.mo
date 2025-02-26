﻿within TransiEnt.Basics.Blocks;
model DelayedBooleanReplicator



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





  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends Modelica.Blocks.Icons.BooleanBlock;

  // _____________________________________________
  //
  //        Constants and Hidden Parameters
  // _____________________________________________

  final parameter Integer ntime=integer(t_pred/samplePeriod+1);

  // _____________________________________________
  //
  //               Visible Parameters
  // _____________________________________________

  parameter SI.Time t_pred(min=0)=3600 "Time horizon of prediction input (min=0)";
  parameter SI.Time samplePeriod=60 "Period of one cycle";
  parameter Integer nout=1;

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  Modelica.Blocks.Interfaces.BooleanInput u[nout] annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.BooleanOutput y[nout,ntime] annotation (Placement(transformation(extent={{100,-10},{120,10}})));

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  Modelica.Blocks.Math.RealToBoolean realToBoolean[nout,ntime] annotation (Placement(transformation(extent={{52,-10},{72,10}})));
  BooleanToReal booleanToReal[nout] annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  DelayedReplicator delayedReplicator[nout](each t_pred=t_pred, each samplePeriod=samplePeriod) annotation (Placement(transformation(extent={{-12,-10},{8,10}})));

  // _____________________________________________
  //
  //           Characteristic Equations
  // _____________________________________________

equation

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(u, booleanToReal.u) annotation (Line(points={{-120,0},{-101,0},{-82,0}}, color={255,0,255}));
  connect(realToBoolean.y, y) annotation (Line(points={{73,0},{110,0}},         color={255,0,255}));
  connect(booleanToReal.y, delayedReplicator.u) annotation (Line(points={{-59,0},{-36,0},{-14,0}}, color={0,0,127}));
  connect(delayedReplicator.y, realToBoolean.u) annotation (Line(points={{9,0},{30,0},{50,0}}, color={0,0,127}));

  annotation (Diagram(graphics,
                      coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})), Icon(graphics={
        Line(points={{-80,80},{-88,80}}, color={192,192,192}),
        Line(points={{-80,-80},{-88,-80}}, color={192,192,192}),
        Line(points={{-80,-88},{-80,86}}, color={192,192,192}),
        Polygon(
          points={{-80,96},{-86,80},{-74,80},{-80,96}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-100,0},{84,0}}, color={192,192,192}),
        Polygon(
          points={{100,0},{84,6},{84,-6},{100,0}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,-64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},{57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}},
                                                            color={0,0,127},
              smooth=Smooth.Bezier),
        Line(points={{-64,0},{-52.7,34.2},{-45.5,53.1},{-39.1,66.4},{-33.4,74.6},{-27.8,79.1},{-22.2,79.8},{-16.6,76.6},{-10.9,69.7},{-5.3,59.4},{1.1,44.1},{9.17,21.2},{26.1,-30.8},{33.3,-50.2},{39.7,-64.2},{45.3,-73.1},{51,-78.4},{56.6,-80},{62.2,-77.6},{67.9,-71.5},{73.5,-61.9},{79.9,-47.2},{88,-24.8},{96,0}},
                                                           color={0,0,0},
              smooth=Smooth.Bezier),
        Line(points={{-64,-30},{-64,0}}, color={192,192,192}),
        Line(points={{-94,-26},{-80,-26}}, color={192,192,192}),
        Line(points={{-64,-26},{-50,-26}}, color={192,192,192}),
        Polygon(
          points={{-80,-26},{-88,-24},{-88,-28},{-80,-26}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-56,-24},{-64,-26},{-56,-28},{-56,-24}},
          lineColor={192,192,192},
          fillColor={192,192,192},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Transforms an input value to a vector of n outputs with different delays ranging from 0 to t_prediction by using n instances MSL <a href=\"Modelica.Blocks.Nonlinear.FixedDelay\">delay</a> block. </span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The purpose of this block is to connect a prediction of some kind e.g. with prediction horizon of 1 hour and produce n predictionsby shifting</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(Purely technical component without physical modeling.)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(Purely technical component without physical modeling.)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Modelica RealInput: u</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Modelica RealOutput: y</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no elements)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no equations)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p>Tested in check model &quot;TestDelayedBooleanReplicator&quot;</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Pascal Dubucq (dubucq@tuhh.de), Aug 2014</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model revised by Pascal Dubucq (dubucq@tuhh.de), Apr 2017 : code conventions</span></p>
</html>"));
end DelayedBooleanReplicator;
