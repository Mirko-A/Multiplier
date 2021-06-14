----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/14/2021 10:17:01 PM
-- Design Name: 
-- Module Name: comparator - Behavioral
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

entity comparator is
    generic (WIDTH: positive := 8);
    Port ( x : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           y : out STD_LOGIC);
end comparator;

architecture Behavioral of comparator is

begin
    
    comp: process is
    begin
        if(x = std_logic_vector(to_unsigned(0, WIDTH))) then
            y <= '1';
        else
            y <= '0';
        end if;
    end process;

end Behavioral;
