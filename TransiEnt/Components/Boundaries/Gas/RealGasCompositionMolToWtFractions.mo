﻿within TransiEnt.Components.Boundaries.Gas;
model RealGasCompositionMolToWtFractions "Boundary for real gas composition, input: mole fractions, output: mass fractions"




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
  extends TransiEnt.Basics.Icons.TableIcon;

  outer TransiEnt.SimCenter simCenter;

  // _____________________________________________
  //
  //        Constants and Parameters
  // _____________________________________________

  parameter TILMedia.VLEFluidTypes.BaseVLEFluid medium=simCenter.gasModel1;
  parameter SI.MoleFraction[medium.nc-1] x_in "Mole fraction vector of size(nc-1)";
  final parameter SI.MolarMass[medium.nc] M_i=TILMedia.Internals.VLEFluidConfigurations.FullyMixtureCompatible.VLEFluidFunctions.molarMass_n(medium,0:medium.nc-1) "Molar mass vector for components of mixture";

  // _____________________________________________
  //
  //        Variable Declarations
  // _____________________________________________
  Modelica.Units.SI.MolarMass M "Molar mass of mixture";
  Modelica.Units.SI.VolumeFraction[medium.nc] x;

  // _____________________________________________
  //
  //               Interfaces
  // _____________________________________________
  TransiEnt.Basics.Interfaces.General.MassFractionOut[medium.nc-1] xi "composition of gas to be set" annotation (Placement(transformation(extent=
            {{100,0},{120,20}}), iconTransformation(extent={{80,-20},{120,20}})));

  // _____________________________________________
  //
  //        Characteristic Equations
  // _____________________________________________
equation

  //Get full size molar composition vector (nc components)
  for i in 1:medium.nc-1 loop
    x[i] = x_in[i];
  end for;
  x[end] =1-sum(x_in);

  //Calculate mass fraction from molar fraction
  xi = x[1:end-1].*M_i[1:end-1]/M;

  //Calculate average molar mass
  M = M_i*x;

annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Define mole fractions of real gas composition and convert them into mass fractions.</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>xi: RealOutput of mass fractions in [kg/kg]</p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<p>M is the molar mass of the mixture</p>
<p>X is the volume fraction</p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations)</p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation or testing necessary)</p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks)</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Created by Lisa Andresen (andresen@tuhh.de), Apr 2014</p>
</html>"));
end RealGasCompositionMolToWtFractions;
