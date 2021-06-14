----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/14/2021 11:55:12 PM
-- Design Name: 
-- Module Name: top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( a_in : in STD_LOGIC_VECTOR(7 downto 0);
           b_in : in STD_LOGIC_VECTOR(7 downto 0);
           start : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           r_out : out STD_LOGIC_VECTOR(15 downto 0);
           ready : out STD_LOGIC);
end top;

architecture Behavioral of top is
signal count_0_s, b_reg_0_s: STD_LOGIC;
signal sel_s: STD_LOGIC_VECTOR(1 downto 0);

begin
    
    data_path1: entity work.data_path
        generic map(WIDTH => 8)
        port map(a_in => a_in,
                 b_in => b_in,
                 clk => clk,
                 sel => sel_s,
                 count_0 => count_0_s,
                 b_reg_0 => b_reg_0_s,
                 r_out => r_out);
                 
    ctrl_path1: entity work.control_path
        port map(count_0 => count_0_s,
                 b_reg_0 => b_reg_0_s,
                 start => start,
                 clk => clk,
                 reset => reset,
                 sel => sel_s,
                 ready => ready);             

end Behavioral;
