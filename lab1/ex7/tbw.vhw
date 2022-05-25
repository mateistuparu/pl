--------------------------------------------------------------------------------
-- Copyright (c) 1995-2007 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.2i
--  \   \         Application : ISE
--  /   /         Filename : tbw.vhw
-- /___/   /\     Timestamp : Tue Mar 17 18:58:09 2020
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: tbw
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY tbw IS
END tbw;

ARCHITECTURE testbench_arch OF tbw IS
    FILE RESULTS: TEXT OPEN WRITE_MODE IS "results.txt";

    COMPONENT exemplu7
        PORT (
            iaSel : In std_logic_vector (1 DownTo 0);
            iaData0 : In std_logic_vector (1 DownTo 0);
            iaData1 : In std_logic_vector (1 DownTo 0);
            iaData2 : In std_logic_vector (1 DownTo 0);
            iaData3 : In std_logic_vector (1 DownTo 0);
            iEnable : In std_logic;
            oaY : Out std_logic
        );
    END COMPONENT;

    SIGNAL iaSel : std_logic_vector (1 DownTo 0) := "00";
    SIGNAL iaData0 : std_logic_vector (1 DownTo 0) := "00";
    SIGNAL iaData1 : std_logic_vector (1 DownTo 0) := "00";
    SIGNAL iaData2 : std_logic_vector (1 DownTo 0) := "00";
    SIGNAL iaData3 : std_logic_vector (1 DownTo 0) := "00";
    SIGNAL iEnable : std_logic := '0';
    SIGNAL oaY : std_logic := '0';

    BEGIN
        UUT : exemplu7
        PORT MAP (
            iaSel => iaSel,
            iaData0 => iaData0,
            iaData1 => iaData1,
            iaData2 => iaData2,
            iaData3 => iaData3,
            iEnable => iEnable,
            oaY => oaY
        );

        PROCESS
            BEGIN
                -- -------------  Current Time:  300ns
                WAIT FOR 300 ns;
                iEnable <= '1';
                iaData0 <= "01";
                iaData1 <= "01";
                iaData3 <= "01";
                -- -------------------------------------
                -- -------------  Current Time:  400ns
                WAIT FOR 100 ns;
                iaData0 <= "11";
                iaData2 <= "01";
                -- -------------------------------------
                -- -------------  Current Time:  500ns
                WAIT FOR 100 ns;
                iaSel <= "01";
                iaData0 <= "10";
                -- -------------------------------------
                -- -------------  Current Time:  600ns
                WAIT FOR 100 ns;
                iaSel <= "10";
                iaData0 <= "00";
                iaData1 <= "11";
                -- -------------------------------------
                -- -------------  Current Time:  700ns
                WAIT FOR 100 ns;
                iaSel <= "11";
                iaData0 <= "11";
                iaData2 <= "11";
                iaData3 <= "11";
                -- -------------------------------------
                -- -------------  Current Time:  800ns
                WAIT FOR 100 ns;
                iaData0 <= "01";
                iaData1 <= "10";
                -- -------------------------------------
                -- -------------  Current Time:  1000ns
                WAIT FOR 200 ns;
                iaData0 <= "10";
                iaData1 <= "00";
                iaData2 <= "10";

            END PROCESS;

    END testbench_arch;

