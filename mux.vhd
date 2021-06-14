----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/14/2021 09:38:31 PM
-- Design Name: 
-- Module Name: mux_4_na_1 - Behavioral
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

entity mux_4_na_1 is
    generic (WIDTH: positive := 8);
    Port ( x0 : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           x1 : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           x2 : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           x3 : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           sel : in STD_LOGIC_VECTOR(1 downto 0);
           y : out STD_LOGIC_VECTOR(WIDTH-1 downto 0));
end mux_4_na_1;

architecture Behavioral of mux_4_na_1 is

begin
    
    mux: process (x0, x1, x2, x3, sel) is
        begin
             case sel is
                when "00" => y <= x0;
                when "01" => y <= x1;
                when "10" => y <= x2;
                when others => y <= x3;
             end case;
        end process;

end Behavioral;
