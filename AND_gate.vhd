library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_gate is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out STD_LOGIC);
end AND_gate;

architecture Structural of AND_gate is

    -- NAND_gate কম্পোনেন্ট ডিক্লেয়ারেশন
    component NAND_gate is
        Port ( A : in  STD_LOGIC;
               B : in  STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

    signal w1 : STD_LOGIC;

begin
    -- ২টি NAND গেট ব্যবহার করে AND গেট ডিজাইন
    NAND1: NAND_gate port map (A => A,  B => B,  Y => w1);
    NAND2: NAND_gate port map (A => w1, B => w1, Y => Y);

end Structural;