library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity sub is 

port (  
    clk         : in    std_logic;
    rst         : in    std_logic;
    --en            : in    std_logic;  
    idata    : in    std_logic_vector (11 downto 0);
    odata    : out  std_logic_vector (11 downto 0)  
);
end sub;

architecture beh of sub is
signal p1,p2 :std_logic_vector (11 downto 0);
begin
    process (clk, rst) 
        begin
            if (rst = '1') then
                odata  <= "000000000000";
            elsif (rising_edge (clk)) then  
                    p1 <= idata;
                    p2 <= p1(11 downto 0)- idata(11 downto 0);
                    --p2 <= std_logic_vector(unsigned(p1(11 downto 0)) - unsigned(idata(11 downto 0)));

            end if;             
    end process;
    odata<=p2;
end beh;
