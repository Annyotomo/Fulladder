library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           S : out STD_LOGIC;
           C : out STD_LOGIC);
end Half_Adder;

architecture Structural of Half_Adder is

    -- AND_gate কম্পোনেন্ট ডিক্লেয়ারেশন
    component AND_gate is
        Port ( A : in  STD_LOGIC;
               B : in  STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

    -- XOR_gate কম্পোনেন্ট ডিক্লেয়ারেশন
    component XOR_gate is
        Port ( A : in  STD_LOGIC;
               B : in  STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

begin
    -- AND এবং XOR গেট দিয়ে Half Adder সংযোগ
    AND1: AND_gate port map (A => A, B => B, Y => C);
    XOR1: XOR_gate port map (A => A, B => B, Y => S);

end Structural;