library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity timer is
    generic ( const: integer:= 100000000 );
Port ( clk : in STD_LOGIC;
           sr : in STD_LOGIC;
           rslt_o : out std_logic_vector (2 downto 0));
end timer;

architecture Behavioral of timer is
signal flag: integer:=0;
signal Dtimer: std_logic_vector (2 downto 0):="000";
signal Qtimer: std_logic_vector (2 downto 0):="000";
signal nwclk : std_logic:='0';
signal chose : std_logic_vector (3 downto 0):="0000";
begin
process(clk)
begin
if rising_edge(clk) then
    if flag >= const then 
        nwclk <= not(nwclk);
        flag <= 1;
else 
   
        flag <= flag + 1;
    end if;
end if;
end process;
process(nwclk,sr)
begin
if sr = '0' then
    Qtimer <= "000";
else
    if rising_edge(nwclk) then
        Qtimer <= Dtimer;
    end if;
end if;
end process;
chose <= sr & Qtimer;
with chose select
Dtimer <= "111" when "1111",
          "001" when "1000",
          "010" when "1001", 
          "011" when "1010",
          "100" when "1011",
          "101" when "1100",
          "110" when "1101", 
          "111" when "1110",
          "000" when others;
rslt_o <= Qtimer;
end Behavioral;
