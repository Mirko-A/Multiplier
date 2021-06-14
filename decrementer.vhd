----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/14/2021 09:49:15 PM
-- Design Name: 
-- Module Name: decrementer - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decrementer is
    generic (WIDTH: positive := 8);
    Port ( x : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           y : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end decrementer;

architecture Behavioral of decrementer is

begin
    
    decrement: process (x) is
    begin
        y <= std_logic_vector(unsigned(x) - to_unsigned(1, WIDTH));
    end process;

end Behavioral;
