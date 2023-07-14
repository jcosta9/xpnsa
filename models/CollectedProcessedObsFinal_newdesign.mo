block CollectedProcessedObsFinal_newdesign
  Modelica.Blocks.Interfaces.BooleanInput sig_sensor_collected annotation(
    Placement(visible = true, transformation(origin = {-4, -42}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-110, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput sig_centralhub_processed annotation(
    Placement(visible = true, transformation(origin = {-38, -42}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-110, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(
    Placement(visible = true, transformation(origin = {138, 66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression SetBoolean1(y = timer.y > 2.5) annotation(
    Placement(visible = true, transformation(origin = {29, -27}, extent = {{-9, -5}, {9, 5}}, rotation = 0)));
  Modelica.Blocks.Logical.Timer timer annotation(
    Placement(visible = true, transformation(origin = {46, 10}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.StateGraph.StepWithSignal error(nIn = 1, nOut = 0) annotation(
    Placement(visible = true, transformation(origin = {84, 26}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.StateGraph.InitialStepWithSignal Initial(nIn = 2, nOut = 2) annotation(
    Placement(visible = true, transformation(origin = {-16, 26}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.StateGraph.StepWithSignal collectedReached(nIn = 1, nOut = 2) annotation(
    Placement(visible = true, transformation(origin = {36, 26}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.StateGraph.StepWithSignal BatteryOff(nIn = 1, nOut = 1) annotation(
    Placement(visible = true, transformation(origin = {-74, 26}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Logical.Not not1 annotation(
    Placement(visible = true, transformation(origin = {-46, -22}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal t4 annotation(
    Placement(visible = true, transformation(origin = {-38, 54}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal t2 annotation(
    Placement(visible = true, transformation(origin = {62, 26}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal t3 annotation(
    Placement(visible = true, transformation(origin = {-22, -6}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal t1 annotation(
    Placement(visible = true, transformation(origin = {12, 26}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  Modelica.StateGraph.TransitionWithSignal t5 annotation(
    Placement(visible = true, transformation(origin = {-54, 26}, extent = {{-12, -12}, {12, 12}}, rotation = 0)));
  Modelica.Blocks.Interfaces.BooleanInput sig_battery_on annotation(
    Placement(visible = true, transformation(origin = {-82, -22}, extent = {{-12, -12}, {12, 12}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.And and1 annotation(
    Placement(visible = true, transformation(origin = {52, -22}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(Initial.outPort[2], t1.inPort) annotation(
    Line(points = {{-7.6, 26}, {8.4, 26}}));
  connect(collectedReached.outPort[1], t2.inPort) annotation(
    Line(points = {{44.4, 26}, {58.4, 26}}));
  connect(BatteryOff.outPort[1], t5.inPort) annotation(
    Line(points = {{-65.6, 26}, {-58.6, 26}}));
  connect(Initial.outPort[1], t4.inPort) annotation(
    Line(points = {{-7.6, 26}, {-0.6, 26}, {-0.6, 54}, {-34, 54}}));
  connect(t4.outPort, BatteryOff.inPort[1]) annotation(
    Line(points = {{-39.5, 54}, {-89.75, 54}, {-89.75, 26}, {-83, 26}}));
  connect(t3.outPort, Initial.inPort[2]) annotation(
    Line(points = {{-23.5, -6}, {-35.5, -6}, {-35.5, 26}, {-23.5, 26}}));
  connect(t1.outPort, collectedReached.inPort[1]) annotation(
    Line(points = {{13.8, 26}, {27.8, 26}}));
  connect(t5.outPort, Initial.inPort[1]) annotation(
    Line(points = {{-52.2, 26}, {-25.4, 26}}));
  connect(collectedReached.outPort[2], t3.inPort) annotation(
    Line(points = {{44.4, 26}, {52.4, 26}, {52.4, -6}, {-18, -6}}));
  connect(t2.outPort, error.inPort[1]) annotation(
    Line(points = {{63.8, 26}, {75.8, 26}}));
  connect(collectedReached.active, timer.u) annotation(
    Line(points = {{36, 17.2}, {36, 9.2}, {42, 9.2}}, color = {255, 0, 255}));
  connect(sig_centralhub_processed, t3.condition) annotation(
    Line(points = {{-38, -42}, {-22, -42}, {-22, -18}}, color = {255, 0, 255}));
  connect(sig_sensor_collected, t1.condition) annotation(
    Line(points = {{-4, -42}, {12, -42}, {12, 12}}, color = {255, 0, 255}));
  connect(sig_battery_on, not1.u) annotation(
    Line(points = {{-82, -22}, {-51, -22}}, color = {255, 0, 255}));
  connect(SetBoolean1.y, and1.u2) annotation(
    Line(points = {{38.9, -27}, {44.8, -27}}, color = {255, 0, 255}));
  connect(not1.y, and1.u1) annotation(
    Line(points = {{-42, -22}, {45, -22}}, color = {255, 0, 255}));
  connect(sig_battery_on, t5.condition) annotation(
    Line(points = {{-82, -22}, {-54, -22}, {-54, 12}}, color = {255, 0, 255}));
  connect(and1.y, t2.condition) annotation(
    Line(points = {{58, -22}, {62, -22}, {62, 12}}, color = {255, 0, 255}));
  connect(not1.y, t4.condition) annotation(
    Line(points = {{-42, -22}, {-38, -22}, {-38, 42}}, color = {255, 0, 255}));
  annotation(
    uses(Modelica(version = "4.0.0")),
    Icon(graphics = {Text(origin = {-3, -62}, extent = {{-33, 36}, {33, -36}}, textString = "%name"), Ellipse(origin = {3, 0}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{79, -36}, {-79, 36}}), Ellipse(origin = {0, 3}, fillPattern = FillPattern.Solid, extent = {{100, -47}, {-100, 47}}), Ellipse(origin = {0, 3}, extent = {{100, -47}, {-100, 47}}), Ellipse(origin = {5, 0}, fillPattern = FillPattern.Solid, extent = {{25, -34}, {-25, 34}}), Ellipse(origin = {0, 3}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{96, -43}, {-96, 43}}), Ellipse(origin = {5, 0}, fillPattern = FillPattern.Solid, extent = {{25, -34}, {-25, 34}})}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
  Diagram(coordinateSystem(extent = {{-100, 80}, {160, -60}})),
  version = "");
end CollectedProcessedObsFinal_newdesign;
