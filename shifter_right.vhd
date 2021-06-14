----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/14/2021 09:44:20 PM
-- Design Name: 
-- Module Name: shifter_right - Behavioral
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

entity shifter_right is
    generic (WIDTH: positive := 8);
    Port ( x : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           y : out STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           b_reg_0 : out STD_LOGIC);
end shifter_right;

architecture Behavioral of shifter_right is

begin

    shift: process (x) is
    begin
       b_reg_0 <= x(0);
       y <= '0' & x(WIDTH-2 downto 0);
    end process;

end Behavioral;
