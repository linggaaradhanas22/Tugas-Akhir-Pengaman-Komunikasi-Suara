library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;

entity fixed_point_sub_tb is
end fixed_point_sub_tb;

architecture behavior of fixed_point_sub_tb is
    -- Q2.17 format
    signal a : sfixed(1 downto -17);
    
    -- Q11.8 format
    signal b : sfixed(10 downto -8);
    
    -- Intermediate signals to show the resizing steps
    signal a_resized : sfixed(10 downto -17);  -- A after resize to Q11.17
    signal b_resized : sfixed(10 downto -17);  -- B after resize to Q11.17
    signal result : sfixed(11 downto -17);     -- Final result in Q11.17
    
begin
    -- Resize both operands to Q11.17 before subtraction
    a_resized <= resize(a, 10, -17);
    b_resized <= resize(b, 10, -17);
    
    -- Now we can safely subtract them
    result <= a_resized - b_resized;
    
    process
    begin
        -- Test case
        a <= to_sfixed(1.5, a);     -- Q2.17 number
        b <= to_sfixed(100.75, b);  -- Q11.8 number
        
        wait for 10 ns;
        
        report "Original values:";
        report "A (Q2.17) = " & real'image(to_real(a));
        report "B (Q11.8) = " & real'image(to_real(b));
        
        report "After resize:";
        report "A_resized (Q11.17) = " & real'image(to_real(a_resized));
        report "B_resized (Q11.17) = " & real'image(to_real(b_resized));
        
        report "Final result:";
        report "Result (Q11.17) = " & real'image(to_real(result));
        
        wait;
    end process;
    
end behavior;