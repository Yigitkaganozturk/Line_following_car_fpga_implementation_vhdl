library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity top_module is
    Port ( clk : in STD_LOGIC;
           sw : in std_logic;
           pwm1 : out STD_LOGIC;
   											             
pwm2 : out STD_LOGIC;
           control: out std_logic_vector (3 downto 0);
           light : in STD_LOGIC);
end top_module;

architecture Behavioral of top_module is
component servo_driver is
    generic ( pwmp1 : integer:=150000;
              pwmp2 : integer:=200000;
              pwmp3 : integer:=100000 );
    Port ( 
           pwmout : out STD_LOGIC;
           clk : in STD_LOGIC;
           sw : in std_logic;
           mode : std_logic_vector (1 downto 0));
end component;

component timer is
 											       
    generic  ( const : integer := 100000000);
    Port ( clk : in STD_LOGIC;
           sr : in STD_LOGIC;
           rslt_o : out STD_LOGIC_VECTOR (2 downto 0));
end component;
signal timeing : std_logic_vector (2 downto 0):= "000";
signal selector : std_logic_vector (3 downto 0):="0000";
signal determine1 : std_logic_vector (1 downto 0):="00";
signal determine2 : std_logic_vector (1 downto 0):="00";
begin
wh1 : servo_driver generic map( pwmp1 => 150000, pwmp2 => 175000, pwmp3 => 125000 ) port map(pwmout=>pwm1,clk=>clk,mode=>determine1,sw=>sw);
wh2 : servo_driver generic map( pwmp1 => 150000, pwmp2 => 200000, pwmp3 => 100000 ) port map(pwmout=>pwm2,clk=>clk,mode=>determine2,sw=>sw);
timer1 : timer generic map(const=> 25000000 ) port map(clk=>clk,sr=>light,rslt_o=>timeing);
selector <= light & timeing;
with selector select
determine1 <= "01" when "1001",
              --"01" when "1010",
              
              --"01" when "1011",
              "10" when "1100",
              
              "10" when "1101",
              --"10" when "1110",
              
              "01" when "0000",
              
              "00" when others;

with selector select
determine2 <= "01" when "1001",
              --"01" when "1010",
              
              --"01" when "1011",
              "10" when "1100",
             										       
              "10" when "1101",
              --"10" when "1110",
              
              "10" when "0000",

              "00" when others;
control <= selector;
end Behavioral;
