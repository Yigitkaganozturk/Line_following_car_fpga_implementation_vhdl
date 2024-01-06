library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity servo_driver is
    generic ( pwmp1 : integer:=150000;
              pwmp2 : integer:=200000;
              pwmp3 : integer:=100000 );
    Port ( pwmout : out STD_LOGIC;
           clk : in STD_LOGIC;
           sw : in std_logic:='0';
           mode : in STD_LOGIC_VECTOR (1 downto 0));
end servo_driver;

architecture Behavioral of servo_driver is
signal flag : integer :=0;
signal carry: std_logic:='0';
signal chosn : integer:=75000;
begin
with mode select 
chosn <= pwmp2 when "10",
         pwmp3 when "01",
         pwmp1 when others;
process(clk)
begin
if rising_edge(clk) then
 											       
if flag >= chosn then 
carry<= not(carry);
flag <= 1;
else
flag <= flag+1;
end if;
end if;
end process;
pwmout<= carry and sw;

end Behavioral;
