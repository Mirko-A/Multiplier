----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/14/2021 10:06:05 PM
-- Design Name: 
-- Module Name: adder - Behavioral
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

entity adder is
    generic (WIDTH: positive := 8);
    Port ( a : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           b : in STD_LOGIC_VECTOR(2*WIDTH-1 downto 0);
           c : out STD_LOGIC_VECTOR(2*WIDTH-1 downto 0));
end adder;

architecture Behavioral of adder is

begin
    
    add: process (a, b) is
    begin
        c <= std_logic_vector(unsigned(a) - unsigned(b));
    end process;

end Behavioral;
