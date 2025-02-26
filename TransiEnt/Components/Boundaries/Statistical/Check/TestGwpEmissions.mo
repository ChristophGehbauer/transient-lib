﻿within TransiEnt.Components.Boundaries.Statistical.Check;
model TestGwpEmissions "Minimal example for electric boundaries with interface L1"



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




  extends TransiEnt.Basics.Icons.Checkmodel;


  inner ModelStatistics           modelStatistics
    annotation (Placement(transformation(extent={{-98,80},{-78,100}})));
  GwpEmissions gwpEmissionSource annotation (Placement(transformation(extent={{-18,-14},{18,20}})));
  Modelica.Blocks.Sources.Cosine m_flow_gwp(
    amplitude=0.1*500/1e3/3600,
    f=1/86400,
    offset=500/1e3/3600) "Specify in SI units (kg/s)" annotation (Placement(transformation(extent={{-52,32},{-32,52}})));
equation
  connect(m_flow_gwp.y, gwpEmissionSource.m_flow_set) annotation (Line(points={{-31,42},{-10.8,42},{-10.8,23.4}},
                                                                                                          color={0,0,127}));
public
function plotResult

  constant String resultFileName = "TestGwpEmissions.mat";

  output String resultFile;

algorithm
  clearlog();
    assert(cd(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR)), "Error changing directory: Working directory must be set as environment variable with name 'workingdir' for this script to work.");
  resultFile :=TransiEnt.Basics.Functions.fullPathName(Modelica.Utilities.System.getEnvironmentVariable(TransiEnt.Basics.Types.WORKINGDIR) + "/" + resultFileName);
  removePlots();
  createPlot(id=1, position={97, 35, 584, 421}, y={"m_flow_gwp.y"}, range={0.0, 90000.0, 0.00012000000000000004, 0.00016000000000000004}, grid=true, colors={{28,108,200}},filename=resultFile);
  createPlot(id=1, position={97, 35, 584, 137}, y={"modelStatistics.gwpEmissions.m_CDE_total"}, range={0.0, 90000.0, -10.0, 20.0}, grid=true, subPlot=2, colors={{28,108,200}},filename=resultFile);
  createPlot(id=1, position={97, 35, 584, 137}, y={"modelStatistics.gwpEmissions.m_flow_CDE_total_heat"}, range={0.0, 90000.0, 0.00012000000000000002, 0.00018000000000000004}, grid=true, subPlot=3, colors={{28,108,200}},filename=resultFile);
  resultFile := "Successfully plotted results for file: " + resultFile;

end plotResult;
  annotation (Diagram(graphics,
                      coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Time-variant or constant source term for model statistics of gwp emissions. Can be used, if gwp emissions should be captured in model statistics which are not modeled in a detailed component model.</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(Purely technical component without physical modeling.)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(Purely technical component without physical modeling.)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">5. Nomenclature</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no elements)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">6. Governing Equations</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no equations)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">7. Remarks for Usage</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">8. Validation</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">9. References</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">10. Version History</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Pascal Dubucq (dubucq@tuhh.de) on 28.06.2017</span></p>
</html>"),
    experiment(StopTime=86400));
end TestGwpEmissions;
