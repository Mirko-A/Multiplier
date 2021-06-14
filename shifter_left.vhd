----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/14/2021 09:43:39 PM
-- Design Name: 
-- Module Name: shifter_left - Behavioral
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

entity shifter_left is
    generic (WIDTH: positive := 8);
    Port ( x : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           y : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end shifter_left;

architecture Behavioral of shifter_left is

begin
    
    shift: process (x) is
    begin
        y <= x(WIDTH-1 downto 1) & '0';
    end process;
    
end Behavioral;
