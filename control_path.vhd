----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/14/2021 11:04:18 PM
-- Design Name: 
-- Module Name: control_path - Behavioral
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

entity control_path is
    Port ( count_0 : in STD_LOGIC;
           b_reg_0 : in STD_LOGIC;
           start : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           sel : out STD_LOGIC_VECTOR(1 downto 0);
           ready : out STD_LOGIC);
end control_path;

architecture Behavioral of control_path is
    type states is (idle, add, shift);
    signal state_next, state_reg: states;
    
begin
    
    process (clk) is
    begin
        if(clk'event and clk = '1') then
            if(reset = '1') then
                state_reg <= idle;
            else
                state_reg <= state_next; 
            end if;
        end if;
    end process;
    
    process (state_reg, b_reg_0, start, count_0) is
    begin
        state_next <= state_reg;
        ready <= '0';
        sel <= "00";
        case state_reg is
            when idle =>
                ready <= '1';
                sel <= "00";
                if (start = '1') then
                    if (b_reg_0 = '0') then
                        state_next <= shift;
                    else 
                        state_next <= add;
                    end if;
                end if;
            when add =>
                sel <= "10";
                state_next <= shift;
            when shift =>
                sel <= "01";
                if (count_0 = '1') then
                    state_next <= idle;
                else 
                    if (b_reg_0 = '0') then
                        state_next <= state_reg;
                    else 
                        state_next <= add;
                    end if;
                end if;
            when others => 
        end case;
    end process;
    
end Behavioral;
