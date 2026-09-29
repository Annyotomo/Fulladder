library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port ( A    : in  STD_LOGIC;
           B    : in  STD_LOGIC;
           Cin  : in  STD_LOGIC;
           S    : out STD_LOGIC;
           Cout : out STD_LOGIC);
end Full_Adder;

architecture Structural of Full_Adder is

    -- AND_gate কম্পোনেন্ট
    component AND_gate is
        Port ( A : in  STD_LOGIC;
               B : in  STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

    -- OR_gate কম্পোনেন্ট
    component OR_gate is
        Port ( A : in  STD_LOGIC;
               B : in  STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

    -- XOR_gate কম্পোনেন্ট
    component XOR_gate is
        Port ( A : in  STD_LOGIC;
               B : in  STD_LOGIC;
               Y : out STD_LOGIC);
    end component;

    -- ইন্টারনাল কানেকশনের জন্য সিগন্যাল
    signal s_xor1 : STD_LOGIC;
    signal s_and1 : STD_LOGIC;
    signal s_and2 : STD_LOGIC;

begin

    -- ১ম XOR গেট: A এবং B
    XOR1: XOR_gate port map (
        A => A,
        B => B,
        Y => s_xor1
    );

    -- ২য় XOR গেট: s_xor1 এবং Cin -> ফাইনাল Sum (S)
    XOR2: XOR_gate port map (
        A => s_xor1,
        B => Cin,
        Y => S
    );

    -- ১ম AND গেট: A এবং B
    AND1: AND_gate port map (
        A => A,
        B => B,
        Y => s_and1
    );

    -- ২য় AND গেট: s_xor1 এবং Cin
    AND2: AND_gate port map (
        A => s_xor1,
        B => Cin,
        Y => s_and2
    );

    -- OR গেট: AND1 এবং AND2 এর যোগফল -> ফাইনাল Carry (Cout)
    OR1: OR_gate port map (
        A => s_and1,
        B => s_and2,
        Y => Cout
    );

end Structural;