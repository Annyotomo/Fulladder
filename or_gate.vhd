library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR_gate is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out STD_LOGIC);
end OR_gate;

architecture Structural of OR_gate is

    -- NAND_gate কম্পোনেন্ট ডিক্লেয়ারেশন
    component NAND_gate is
        Port ( A : in  STD_LOGIC;
               B : in  STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

    signal w1, w2 : STD_LOGIC;

begin
    -- ৩টি NAND গেট ব্যবহার করে OR গেট ডিজাইন
    NAND1: NAND_gate port map (A => A,  B => A,  Y => w1);
    NAND2: NAND_gate port map (A => B,  B => B,  Y => w2);
    NAND3: NAND_gate port map (A => w1, B => w2, Y => Y);

end Structural;