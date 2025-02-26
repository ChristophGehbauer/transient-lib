﻿within TransiEnt.Consumer.Electrical.Base;
partial model PartialElectricConsumer_L1 "L1/2 Partial Base class for electric consumer models"




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

  import TransiEnt;
  extends TransiEnt.Basics.Icons.ElectricalConsumer;

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  TransiEnt.Basics.Interfaces.Electrical.ActivePowerPort epp annotation (Placement(transformation(extent={{-108,-10},{-88,10}}), iconTransformation(extent={{-108,-10},{-88,10}})));

  // _____________________________________________
  //
  //                  Interfaces
  // _____________________________________________

  outer TransiEnt.ModelStatistics modelStatistics;
  outer TransiEnt.SimCenter simCenter;

  // _____________________________________________
  //
  //           Instances of other Classes
  // _____________________________________________

  TransiEnt.Components.Boundaries.Electrical.ActivePower.Power partialElectricBoundary annotation (choicesAllMatching=true, Placement(transformation(extent={{57,-90},{77,-70}})));
  TransiEnt.Components.Statistics.Collectors.LocalCollectors.CollectElectricPower collectElectricPower annotation (Placement(transformation(extent={{-100,100},{-80,80}})));

equation
  // _____________________________________________
  //
  //           Characteristic equations
  // _____________________________________________

  collectElectricPower.powerCollector.P=epp.P;

  // _____________________________________________
  //
  //               Connect Statements
  // _____________________________________________
  connect(modelStatistics.powerCollector[EnergyResource.Consumer],collectElectricPower.powerCollector);

  connect(partialElectricBoundary.epp, epp) annotation (Line(
      points={{57,-80},{-4,-80},{-98,-80},{-98,0}},
      color={0,135,135},
      thickness=0.5));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                               graphics={                                       Line(
          points={{-98,14},{-98,46},{-90,46},{-90,76}},
          pattern=LinePattern.Dash,
          smooth=Smooth.None,
          color={0,0,0},
          arrow={Arrow.None,Arrow.Filled})}),
                                          Icon(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Documentation(info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p>L1/2 Partial Base class for electric consumer models.</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p>L1/2 (defined in the CodingConventions</p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p>epp: active power port</p>
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
<p><span style=\"font-family: MS Shell Dlg 2;\">Model created by Pascal Dubucq (dubucq@tuhh.de) on 01.10.2014</span></p>
</html>"));
end PartialElectricConsumer_L1;
