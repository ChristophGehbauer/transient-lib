within TransiEnt.Basics.Media.Solids;
model AeratedConcrete "Aerated Concrete"



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




  extends ClaRa.Basics.Media.Solids.BaseSolid(
    final d = 400.0,
    final cp_nominal = 1000.0,
    final lambda_nominal = 0.13,
    final nu_nominal=-1,
    final E_nominal=-1,
    final G_nominal=-1,
    final beta_nominal=-1);

    // Data is an avergage of typical values, as given in the VDI Heat Atlas in section Dec


equation
  //d=d_nominal;
  cp=cp_nominal;
  lambda=lambda_nominal;
  nu = nu_nominal;
  E = E_nominal;
  G = G_nominal;
  beta = beta_nominal;

  annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>This model contains some material data of aerated concrete</p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>(Purely technical component without physical modeling.)</p>
<h4><span style=\"color: #008000\">4.Interfaces</span></h4>
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
<p>Data&nbsp;is&nbsp;an&nbsp;avergage&nbsp;of&nbsp;typical&nbsp;values,&nbsp;as&nbsp;given&nbsp;in&nbsp;the&nbsp;VDI&nbsp;Heat&nbsp;Atlas&nbsp;in&nbsp;section&nbsp;Dec.</p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Created by Michael von der Heyde (heyde@tuhh.de), March 2021, for the FES research project</p>
</html>"));
end AeratedConcrete;
