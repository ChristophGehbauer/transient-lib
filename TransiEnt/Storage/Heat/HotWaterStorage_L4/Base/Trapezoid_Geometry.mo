﻿within TransiEnt.Storage.Heat.HotWaterStorage_L4.Base;
model Trapezoid_Geometry "Geometry with vertical trapezoid crosssection extending the partial_Geometry"



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





  // The model extends the model partial_Geometry.
  // This model discribes the a vertiical cylindric geometry for the hot water storage.

  // The Content of the Base class Partial_geometry is:
  //    parameter SI.Volume volume "Volume of Tank";
  //    parameter SI.Length height "height of tank";
  //    parameter Integer nSeg "number of vertical tank segments";
  //
  //    parameter SI.Volume volume_Seg[nSeg] "Volume of segments of the tank";
  //    parameter SI.Area A_wall[nSeg]
  //     "Area of wall around the segments (without top and botom area)";
  //    parameter SI.Area A_top "Top Area of Tank";
  //    parameter SI.Area A_bottom "Top Area of Tank";
  //
  //    parameter SI.Length height_Seg = height / nSeg "Height of a tank segment";

  // _____________________________________________
  //
  //          Imports and Class Hierarchy
  // _____________________________________________

  extends TransiEnt.Storage.Heat.HotWaterStorage_L4.Base.Partial_Geometry(
    final volume_Seg=Volumes,
    final A_cross=CrossAreas,
    final A_wall=WallAreas,
    final A_top=length*width_top,
    final A_bottom=length*width_bottom);

import      Modelica.Units.SI;

  // _____________________________________________
  //
  //          Parameters
  // _____________________________________________

  parameter SI.Length length "length of the storage";
  parameter SI.Length width_top "Width at top of the storage";
  parameter SI.Length width_bottom "Width at bottom of the storage";

  // _____________________________________________
  //
  //                    Variables
  // _____________________________________________

protected
  parameter SI.Length Delta_width= (width_top - width_bottom)/nSeg;
  parameter SI.Area[nSeg-1] CrossAreas = Utilities.trapezoid_Geometry_CrossAreas(nSeg, width_top, Delta_width, length);
  parameter SI.Area[nSeg] WallAreas = Utilities.trapezoid_Geometry_WallAreas(nSeg, Delta_width, height, length);
  parameter SI.Volume[nSeg] Volumes = Utilities.trapezoid_Geometry_Volumes(nSeg,width_top, height, length, CrossAreas);

equation
  // Conditions to terminate simulation
  assert(length>0,"Length has to be positve");
  assert(width_top>0,"Width has to be positve");
  assert(width_bottom>0,"Width has to be positve");

annotation (Documentation(info="<html>
<h4><span style=\"color: #008000\">1. Purpose of model</span></h4>
<p>Geometry with trapezoidal vertical cross-section for the one dimensional hot water storage. The model delivers shape informations for all segments. </p>
<h4><span style=\"color: #008000\">2. Level of detail, physical effects considered, and physical insight</span></h4>
<p>No physical effects considered.</p>
<h4><span style=\"color: #008000\">3. Limits of validity </span></h4>
<p>The will be descretized in segments of same height. </p>
<h4><span style=\"color: #008000\">4. Interfaces</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color: #008000\">5. Nomenclature</span></h4>
<h5>Needed</h5>
<p><br>height: Height of storage</p><p><br>length: Length of storage</p><p><br>width_top: Width of top area of storage</p><p><br>width_bottom: Width of bottom area of storage</p><p><br>nSeg: Number of vertical tank segments (min = 2)</p>
<h5>Calculated</h5>
<p>height_Seg: Height of one storage segment</p><p>volume_Seg[nSeg]: Volumes of the storage segments</p><p>A_wall[nSeg]: Areas of wall around the storage segments</p><p>A_top: Top area of storage</p><p>A_bottom: Bottom area of storage</p><p>A_cross[nSeg-1]: Cross-sectional areas between the segments of the storage </p>
<h4><span style=\"color: #008000\">6. Governing Equations</span></h4>
<p>(no equations) </p>
<h4><span style=\"color: #008000\">7. Remarks for Usage</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color: #008000\">8. Validation</span></h4>
<p>(no validation) </p>
<h4><span style=\"color: #008000\">9. References</span></h4>
<p>(no remarks) </p>
<h4><span style=\"color: #008000\">10. Version History</span></h4>
<p>Model created by Tobias Ramm (tobias.ramm@tuhh.de) on Fri Mar 20 2015</p>
<p>Revised and edited by Lisa Andresen (andresen@tuhh.de), Jun 2015</p>
</html>"));
end Trapezoid_Geometry;
