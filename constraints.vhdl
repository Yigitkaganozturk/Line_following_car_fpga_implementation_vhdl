set_property -dict { PACKAGE_PIN J1   IOSTANDARD LVCMOS33 } [get_ports {pwm1}];#Sch name = JA1
set_property -dict { PACKAGE_PIN L2   IOSTANDARD LVCMOS33 } [get_ports {pwm2}];#Sch name = JA2

set_property -dict { PACKAGE_PIN W5   IOSTANDARD LVCMOS33 } [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

set_property -dict { PACKAGE_PIN A14   IOSTANDARD LVCMOS33 } [get_ports {light}];#Sch name = JB1


set_property -dict { PACKAGE_PIN P3    IOSTANDARD LVCMOS33 } [get_ports {control[0]}]
set_property -dict { PACKAGE_PIN N3    IOSTANDARD LVCMOS33 } [get_ports {control[1]}]
set_property -dict { PACKAGE_PIN P1    IOSTANDARD LVCMOS33 } [get_ports {control[2]}]
set_property -dict { PACKAGE_PIN L1    IOSTANDARD LVCMOS33 } [get_ports {control[3]}]

set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports {sw}]
