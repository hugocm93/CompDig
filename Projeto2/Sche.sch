<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_3" />
        <signal name="XLXN_13" />
        <signal name="XLXN_14(3:0)" />
        <signal name="XLXN_15" />
        <signal name="XLXN_16" />
        <signal name="XLXN_17(3:0)" />
        <signal name="XLXN_1" />
        <signal name="XLXN_19" />
        <signal name="Reset" />
        <signal name="clk" />
        <signal name="XLXN_22" />
        <signal name="XLXN_8" />
        <signal name="hex2(3:0)" />
        <signal name="XLXN_26(3:0)" />
        <signal name="hex_out(6:0)" />
        <signal name="XLXN_28" />
        <signal name="c" />
        <signal name="XLXN_31" />
        <port polarity="Input" name="Reset" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="hex2(3:0)" />
        <port polarity="Output" name="hex_out(6:0)" />
        <port polarity="Output" name="c" />
        <blockdef name="display_7_seg">
            <timestamp>2017-3-27T15:20:44</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="d_ff_reset">
            <timestamp>2017-3-20T14:39:26</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="mod_m_counter">
            <timestamp>2017-4-3T14:12:20</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="d_ff_reset" name="XLXI_5">
            <blockpin signalname="XLXN_31" name="clk" />
            <blockpin signalname="Reset" name="reset" />
            <blockpin signalname="XLXN_8" name="d" />
            <blockpin signalname="XLXN_1" name="q" />
        </block>
        <block symbolname="inv" name="XLXI_9">
            <blockpin signalname="XLXN_1" name="I" />
            <blockpin signalname="XLXN_8" name="O" />
        </block>
        <block symbolname="mod_m_counter" name="XLXI_10">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="Reset" name="reset" />
            <blockpin signalname="XLXN_31" name="max_tick" />
            <blockpin name="q(18:0)" />
        </block>
        <block symbolname="display_7_seg" name="XLXI_6">
            <blockpin signalname="XLXN_1" name="clk" />
            <blockpin signalname="hex2(3:0)" name="hex1(3:0)" />
            <blockpin signalname="hex2(3:0)" name="hex2(3:0)" />
            <blockpin signalname="c" name="c" />
            <blockpin signalname="hex_out(6:0)" name="hex7seg(6:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="704" y="1872" name="XLXI_5" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="1184" y1="1712" y2="1712" x1="1088" />
            <wire x2="1488" y1="1712" y2="1712" x1="1184" />
            <wire x2="1488" y1="1712" y2="1744" x1="1488" />
            <wire x2="1792" y1="1744" y2="1744" x1="1488" />
            <wire x2="1184" y1="1712" y2="1792" x1="1184" />
        </branch>
        <branch name="Reset">
            <wire x2="656" y1="1776" y2="1776" x1="624" />
            <wire x2="704" y1="1776" y2="1776" x1="656" />
            <wire x2="1280" y1="1504" y2="1504" x1="656" />
            <wire x2="656" y1="1504" y2="1776" x1="656" />
        </branch>
        <branch name="clk">
            <wire x2="1280" y1="1440" y2="1440" x1="1168" />
        </branch>
        <branch name="XLXN_8">
            <wire x2="704" y1="1840" y2="1840" x1="688" />
            <wire x2="688" y1="1840" y2="2096" x1="688" />
            <wire x2="1184" y1="2096" y2="2096" x1="688" />
            <wire x2="1184" y1="2016" y2="2096" x1="1184" />
        </branch>
        <instance x="1280" y="1536" name="XLXI_10" orien="R0">
        </instance>
        <branch name="hex2(3:0)">
            <wire x2="1520" y1="1808" y2="1872" x1="1520" />
            <wire x2="1632" y1="1872" y2="1872" x1="1520" />
            <wire x2="1792" y1="1872" y2="1872" x1="1632" />
            <wire x2="1792" y1="1808" y2="1808" x1="1632" />
            <wire x2="1632" y1="1808" y2="1872" x1="1632" />
        </branch>
        <branch name="hex_out(6:0)">
            <wire x2="2192" y1="1872" y2="1872" x1="2176" />
            <wire x2="2192" y1="1872" y2="2032" x1="2192" />
            <wire x2="2208" y1="2032" y2="2032" x1="2192" />
        </branch>
        <branch name="c">
            <wire x2="2304" y1="1744" y2="1744" x1="2176" />
            <wire x2="2320" y1="1616" y2="1616" x1="2304" />
            <wire x2="2304" y1="1616" y2="1744" x1="2304" />
        </branch>
        <instance x="1792" y="1904" name="XLXI_6" orien="R0">
        </instance>
        <iomarker fontsize="28" x="624" y="1776" name="Reset" orien="R180" />
        <iomarker fontsize="28" x="1168" y="1440" name="clk" orien="R180" />
        <iomarker fontsize="28" x="1520" y="1808" name="hex2(3:0)" orien="R180" />
        <iomarker fontsize="28" x="2208" y="2032" name="hex_out(6:0)" orien="R0" />
        <iomarker fontsize="28" x="2320" y="1616" name="c" orien="R0" />
        <instance x="1152" y="1792" name="XLXI_9" orien="R90" />
        <branch name="XLXN_31">
            <wire x2="1744" y1="1600" y2="1600" x1="688" />
            <wire x2="688" y1="1600" y2="1712" x1="688" />
            <wire x2="704" y1="1712" y2="1712" x1="688" />
            <wire x2="1744" y1="1440" y2="1440" x1="1664" />
            <wire x2="1744" y1="1440" y2="1600" x1="1744" />
        </branch>
    </sheet>
</drawing>