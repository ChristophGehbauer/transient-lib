﻿within TransiEnt.Storage.Gas.Base;
partial model HeatTransferOuterTemperature_L2 "Base class for L2 heat transfer models with an outer temperature"




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

  extends ClaRa.Basics.Icons.Alpha;

  // _____________________________________________
  //
  //             Visible Parameters
  // _____________________________________________

  parameter SI.Area A_heat=10 "Heat transfer surface";

  // _____________________________________________
  //
  //                Interfaces
  // _____________________________________________

  Basics.Interfaces.General.TemperatureIn T_outer annotation (Placement(transformation(extent={{-120,-20},{-80,20}})));
  ClaRa.Basics.Interfaces.HeatPort_a heat annotation (Placement(transformation(extent={{90,-10},{110,10}}), iconTransformation(extent={{90,-10},{110,10}})));
  annotation (Icon(graphics), Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>This model represents a base class for heat transfer models. </p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">3. Limits of validity</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>heat: heat port</p>
<p>T_outer: input for the outer temperature</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>(no elements)</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<p><b><span style=\"color: #008000;\">8. Validation</span></b> </p>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Carsten Bode (c.bode@tuhh.de) in May 2019</p>
</html>"));
end HeatTransferOuterTemperature_L2;
