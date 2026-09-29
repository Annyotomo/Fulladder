library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder_tb is
end Full_Adder_tb;

architecture behavior of Full_Adder_tb is 

    -- Unit Under Test (UUT) কম্পোনেন্ট
    component Full_Adder
    port(
         A    : in  std_logic;
         B    : in  std_logic;
         Cin  : in  std_logic;
         S    : out std_logic;
         Cout : out std_logic
        );
    end component;

   -- ইনপুট সিগন্যাল
   signal A    : std_logic := '0';
   signal B    : std_logic := '0';
   signal Cin  : std_logic := '0';

   -- আউটপুট সিগন্যাল
   signal S    : std_logic;
   signal Cout : std_logic;

begin

   -- UUT সংযোগ
   uut: Full_Adder port map (
          A => A,
          B => B,
          Cin => Cin,
          S => S,
          Cout => Cout
        );

   -- স্টিমুলাস প্রসেস (সব ৮টি কম্বিনেশন টেস্ট)
   stim_proc: process
   begin		
      -- 1: 0 + 0 + 0 = 0 (S=0, Cout=0)
      A <= '0'; B <= '0'; Cin <= '0'; wait for 50 ns;
      
      -- 2: 0 + 0 + 1 = 1 (S=1, Cout=0)
      A <= '0'; B <= '0'; Cin <= '1'; wait for 50 ns;
      
      -- 3: 0 + 1 + 0 = 1 (S=1, Cout=0)
      A <= '0'; B <= '1'; Cin <= '0'; wait for 50 ns;
      
      -- 4: 0 + 1 + 1 = 2 (S=0, Cout=1)
      A <= '0'; B <= '1'; Cin <= '1'; wait for 50 ns;
      
      -- 5: 1 + 0 + 0 = 1 (S=1, Cout=0)
      A <= '1'; B <= '0'; Cin <= '0'; wait for 50 ns;
      
      -- 6: 1 + 0 + 1 = 2 (S=0, Cout=1)
      A <= '1'; B <= '0'; Cin <= '1'; wait for 50 ns;
      
      -- 7: 1 + 1 + 0 = 2 (S=0, Cout=1)
      A <= '1'; B <= '1'; Cin <= '0'; wait for 50 ns;
      
      -- 8: 1 + 1 + 1 = 3 (S=1, Cout=1)
      A <= '1'; B <= '1'; Cin <= '1'; wait for 50 ns;

      wait;
   end process;

end behavior;