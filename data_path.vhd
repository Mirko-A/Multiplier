----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/14/2021 10:23:06 PM
-- Design Name: 
-- Module Name: data_path - Behavioral
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

entity data_path is
    generic (WIDTH: positive := 8);
    Port ( a_in : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           b_in : in STD_LOGIC_VECTOR(WIDTH-1 downto 0);
           
           clk : in STD_LOGIC;
           
           sel : in STD_LOGIC_VECTOR(1 downto 0);
           count_0 : out STD_LOGIC;
           b_reg_0: out STD_LOGIC;
           
           r_out : out STD_LOGIC_VECTOR(2*WIDTH-1 downto 0));
end data_path;

architecture Behavioral of data_path is
signal a_next_s, a_reg_s: STD_LOGIC_VECTOR(WIDTH-1 downto 0);
signal b_next_s, b_reg_s: STD_LOGIC_VECTOR(WIDTH-1 downto 0);
signal n_next_s, n_reg_s: STD_LOGIC_VECTOR(WIDTH-1 downto 0);
signal p_next_s, p_reg_s: STD_LOGIC_VECTOR(2*WIDTH-1 downto 0);
signal shift_left_out_s, shift_right_out_s: STD_LOGIC_VECTOR(WIDTH-1 downto 0);
signal decrementer_out_s: STD_LOGIC_VECTOR(WIDTH-1 downto 0);
signal adder_out_s: STD_LOGIC_VECTOR(2*WIDTH-1 downto 0);

begin
    r_out <= p_reg_s;
    
    shift_left1: entity work.shifter_left
        generic map(WIDTH => WIDTH)
        port map(x => a_reg_s,
                 y => shift_left_out_s);
                     
    shift_right1: entity work.shifter_right
        generic map(WIDTH => WIDTH)
        port map(x => b_reg_s,
                 y => shift_right_out_s);
         
    decr1: entity work.decrementer
        generic map(WIDTH => WIDTH)
        port map(x => n_reg_s,
                 y => decrementer_out_s);                                  
                 
    adder1: entity work.adder
        generic map(WIDTH => WIDTH)
        port map(a => a_reg_s,
                 b => p_reg_s,
                 c => adder_out_s);       
    
    comp1: entity work.comparator
        generic map(WIDTH => WIDTH)
        port map(x => n_next_s,
                 y => count_0);   
                 
    mux_a: entity work.mux_4_na_1
        generic map(WIDTH => WIDTH)
        port map(x0 => a_in,
                 x1 => a_reg_s,
                 x2 => shift_left_out_s,
                 x3 => (others => '0'), -- da li moze ovako ili mora cast
                 sel => sel,
                 y => a_next_s);
                            
   mux_b: entity work.mux_4_na_1
        generic map(WIDTH => WIDTH)
        port map(x0 => b_in,
                 x1 => b_reg_s,
                 x2 => shift_right_out_s,
                 x3 => (others => '0'),
                 sel => sel,
                 y => b_next_s);
                                                    
   mux_n: entity work.mux_4_na_1
        generic map(WIDTH => WIDTH)
        port map(x0 => (others => '0'),
                        x1 => n_reg_s,
                        x2 => decrementer_out_s,
                        x3 => (others => '0'),
                        sel => sel,
                        y => n_next_s);
                                                                       
   mux_p: entity work.mux_4_na_1
        generic map(WIDTH => 2*WIDTH)
        port map(x0 => (others => '0'),
                        x1 => adder_out_s,
                        x2 => p_reg_s,
                        x3 => (others => '0'),
                        sel => sel,
                        y => p_next_s);   
    
    a_reg: entity work.pipo_reg
        generic map(WIDTH => WIDTH)
        port map(clk => clk,
                 d => a_next_s,
                 q => a_reg_s);
                 
    b_reg: entity work.pipo_reg
         generic map(WIDTH => WIDTH)
         port map(clk => clk,
                  d => b_next_s,
                  q => b_reg_s);
                                  
    n_reg: entity work.pipo_reg
         generic map(WIDTH => WIDTH)
         port map(clk => clk,
                  d => n_next_s,
                  q => n_reg_s);
    
    p_reg: entity work.pipo_reg
         generic map(WIDTH => 2*WIDTH)
         port map(clk => clk,
                  d => p_next_s,
                  q => p_reg_s);
                                                     
end Behavioral;
