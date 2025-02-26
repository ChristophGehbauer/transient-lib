﻿within TransiEnt.Storage.Heat.HotWaterStorage_L4.Utilities;
function get_SolarInputFraction_Exp "returns vector with fraction of total inflow for each solar input layer. sum of fractions is 1."



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




  // - the exponent can be changed.
  // - the standard value for the exponent is 2.
  // - the higher the value the more fluid flows in the segment with the smallest
  //   temperature difference
extends TransiEnt.Basics.Icons.Function;

input Integer nSolarInputLayer;
input Real T_solar_input_layer[nSolarInputLayer];
input Real T_load;
input Real exp = 2;

output Real layer_mass_flow_fraction[nSolarInputLayer];

protected
Real sum_dT_layer;
Real dT_max;
Real dT_layer[nSolarInputLayer];
Real dT_layer_nomalized[nSolarInputLayer];
Real dT_layer_sq[nSolarInputLayer];
Real eps=0.0001;
algorithm
  sum_dT_layer :=0;
  dT_max :=0;
  for layer in 1:nSolarInputLayer loop
    dT_layer[layer] :=  max((((T_load - T_solar_input_layer[layer])^2)^0.5)^exp, eps);
  end for;
  dT_max :=max(dT_layer);
  dT_layer_nomalized :=dT_layer/dT_max;
  for layer in 1:nSolarInputLayer loop
    dT_layer_sq[layer] := dT_layer_nomalized[layer]^exp;
    sum_dT_layer :=  sum_dT_layer + 1/dT_layer_sq[layer];
  end for;
  for layer in 1:nSolarInputLayer loop
    layer_mass_flow_fraction[layer] := (1/dT_layer_sq[layer]) / (sum_dT_layer);
  end for;
  annotation (
  Documentation(
  revisions="<html>
  <ul>
  <li>
  20.2.2013<br>
  Function added to the HVAC_Lib by Paul Harmsen.
  </li>
  </ul>
  </html>", info="<html>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">1. Purpose of model</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">2. Level of detail, physical effects considered, and physical insight</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">3. Limits of validity </span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
<p><b><span style=\"font-family: MS Shell Dlg 2; color: #008000;\">4. Interfaces</span></b></p>
<p><span style=\"font-family: MS Shell Dlg 2;\">(no remarks)</span></p>
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
</html>"));
end get_SolarInputFraction_Exp;
