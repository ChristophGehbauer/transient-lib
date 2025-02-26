﻿within TransiEnt.Producer.Combined.LargeScaleCHP.Base;
model PQBoundaries



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

  extends TransiEnt.Basics.Icons.PQDiagramIcon;

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Thermal.HeatFlowRateIn Q_flow annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerOut P_max annotation (Placement(transformation(extent={{100,34},{120,54}})));
  TransiEnt.Basics.Interfaces.Electrical.ElectricPowerOut P_min annotation (Placement(transformation(extent={{100,-40},{120,-20}})));

  // _____________________________________________
  //
  //             Parameters
  // _____________________________________________

  parameter TransiEnt.Producer.Combined.LargeScaleCHP.Base.Characteristics.Generic_PQ_Characteristics PQCharacteristics=Characteristics.PQ_Characteristics_WW1() annotation (choicesAllMatching);
  parameter SI.Power Q_flow_nom=Q_flow_nom_PQCharacteristics;
  parameter SI.Power P_n=P_n_PQCharacteristics;
  final parameter SI.Power Q_flow_nom_PQCharacteristics=max(PQCharacteristics.PQboundaries[:, 1]);
  final parameter SI.Power P_n_PQCharacteristics=max(PQCharacteristics.PQboundaries[:, 2:3]);

  // _____________________________________________
  //
  //             Components
  // _____________________________________________

  Modelica.Blocks.Tables.CombiTable1Ds PQTableCalculation(
    table=PQCharacteristics.PQboundaries,
    columns={2,3},
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments)
                   annotation (Placement(transformation(extent={{-14,-10},{6,10}})));
  Modelica.Blocks.Math.Gain gain_Q_flow(k=PQCharacteristics.k_Q_flow*Q_flow_nom_PQCharacteristics/Q_flow_nom) annotation (Placement(transformation(extent={{-68,-10},{-48,10}})));
  Modelica.Blocks.Math.Gain gain_P_max(k=PQCharacteristics.k_P_el*P_n/P_n_PQCharacteristics) annotation (Placement(transformation(extent={{54,34},{74,54}})));
  Modelica.Blocks.Math.Gain gain_P_min(k=PQCharacteristics.k_P_el*P_n/P_n_PQCharacteristics) annotation (Placement(transformation(extent={{56,-42},{76,-22}})));
equation
  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________

  connect(Q_flow, gain_Q_flow.u) annotation (Line(points={{-120,0},{-95,0},{-70,0}}, color={0,0,127}));
  connect(PQTableCalculation.y[1], gain_P_max.u) annotation (Line(points={{7,0},{18,0},{18,44},{52,44}},       color={0,0,127}));
  connect(PQTableCalculation.y[2], gain_P_min.u) annotation (Line(points={{7,0},{18,0},{18,-32},{54,-32}},     color={0,0,127}));
  connect(gain_P_max.y, P_max) annotation (Line(points={{75,44},{110,44}}, color={0,0,127}));
  connect(gain_P_min.y, P_min) annotation (Line(points={{77,-32},{90,-32},{90,-30},{110,-30}}, color={0,0,127}));
  connect(gain_Q_flow.y, PQTableCalculation.u) annotation (Line(points={{-47,0},{-16,0}}, color={0,0,127}));
  annotation (Diagram(graphics,
                      coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})), Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">The operation limits (maximum and minimum) of condensation-extraction CHP plants can be defined with this model. It displays the heat output at the x-axis and the power output at the y-axis. </span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">RealInput - Heat flow input signal</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">RealOutput - Maximum Power output signal</span></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">RealOutput - Minimum Power output signal</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model modified by Oliver Schülting (oliver.schuelting@tuhh.de), Jun 2018: Scaling, depending on P_n and Q_n added</span></p>
</html>"));
end PQBoundaries;
