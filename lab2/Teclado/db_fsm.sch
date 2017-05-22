<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_6" />
        <signal name="XLXN_7" />
        <signal name="XLXN_19" />
        <signal name="button" />
        <signal name="result" />
        <signal name="XLXN_23" />
        <signal name="clk" />
        <signal name="XLXN_62" />
        <port polarity="Input" name="button" />
        <port polarity="Output" name="result" />
        <port polarity="Input" name="clk" />
        <blockdef name="xor2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="60" y1="-128" y2="-128" x1="0" />
            <line x2="208" y1="-96" y2="-96" x1="256" />
            <arc ex="44" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <arc ex="64" ey="-144" sx="64" sy="-48" r="56" cx="32" cy="-96" />
            <line x2="64" y1="-144" y2="-144" x1="128" />
            <line x2="64" y1="-48" y2="-48" x1="128" />
            <arc ex="128" ey="-144" sx="208" sy="-96" r="88" cx="132" cy="-56" />
            <arc ex="208" ey="-96" sx="128" sy="-48" r="88" cx="132" cy="-136" />
        </blockdef>
        <blockdef name="fd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
        </blockdef>
        <blockdef name="fde">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
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
        <blockdef name="cb16ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <rect width="64" x="320" y="-268" height="24" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <block symbolname="xor2" name="XLXI_9">
            <blockpin signalname="XLXN_6" name="I0" />
            <blockpin signalname="XLXN_19" name="I1" />
            <blockpin signalname="XLXN_7" name="O" />
        </block>
        <block symbolname="fd" name="XLXI_30">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="button" name="D" />
            <blockpin signalname="XLXN_6" name="Q" />
        </block>
        <block symbolname="fd" name="XLXI_31">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_6" name="D" />
            <blockpin signalname="XLXN_19" name="Q" />
        </block>
        <block symbolname="fde" name="XLXI_40">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_62" name="CE" />
            <blockpin signalname="XLXN_19" name="D" />
            <blockpin signalname="result" name="Q" />
        </block>
        <block symbolname="inv" name="XLXI_41">
            <blockpin signalname="XLXN_62" name="I" />
            <blockpin signalname="XLXN_23" name="O" />
        </block>
        <block symbolname="cb16ce" name="XLXI_46">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_23" name="CE" />
            <blockpin signalname="XLXN_7" name="CLR" />
            <blockpin name="CEO" />
            <blockpin name="Q(15:0)" />
            <blockpin signalname="XLXN_62" name="TC" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1552" y="1552" name="XLXI_9" orien="R0" />
        <iomarker fontsize="28" x="288" y="1792" name="clk" orien="R180" />
        <branch name="XLXN_6">
            <wire x2="960" y1="1264" y2="1264" x1="880" />
            <wire x2="1008" y1="1264" y2="1264" x1="960" />
            <wire x2="960" y1="1264" y2="1488" x1="960" />
            <wire x2="1552" y1="1488" y2="1488" x1="960" />
        </branch>
        <instance x="496" y="1520" name="XLXI_30" orien="R0" />
        <instance x="1008" y="1520" name="XLXI_31" orien="R0" />
        <branch name="button">
            <wire x2="496" y1="1264" y2="1264" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="1264" name="button" orien="R180" />
        <branch name="result">
            <wire x2="3200" y1="1248" y2="1248" x1="3184" />
        </branch>
        <instance x="2400" y="1728" name="XLXI_41" orien="M0" />
        <branch name="clk">
            <wire x2="432" y1="1792" y2="1792" x1="288" />
            <wire x2="928" y1="1792" y2="1792" x1="432" />
            <wire x2="1936" y1="1792" y2="1792" x1="928" />
            <wire x2="2624" y1="1792" y2="1792" x1="1936" />
            <wire x2="496" y1="1392" y2="1392" x1="432" />
            <wire x2="432" y1="1392" y2="1792" x1="432" />
            <wire x2="1008" y1="1392" y2="1392" x1="928" />
            <wire x2="928" y1="1392" y2="1792" x1="928" />
            <wire x2="2032" y1="1520" y2="1520" x1="1936" />
            <wire x2="1936" y1="1520" y2="1792" x1="1936" />
            <wire x2="2800" y1="1376" y2="1376" x1="2624" />
            <wire x2="2624" y1="1376" y2="1792" x1="2624" />
        </branch>
        <iomarker fontsize="28" x="3200" y="1248" name="result" orien="R0" />
        <instance x="2800" y="1504" name="XLXI_40" orien="R0" />
        <branch name="XLXN_19">
            <wire x2="1472" y1="1264" y2="1264" x1="1392" />
            <wire x2="1472" y1="1264" y2="1424" x1="1472" />
            <wire x2="1552" y1="1424" y2="1424" x1="1472" />
            <wire x2="2800" y1="1248" y2="1248" x1="1472" />
            <wire x2="1472" y1="1248" y2="1264" x1="1472" />
        </branch>
        <branch name="XLXN_23">
            <wire x2="2032" y1="1456" y2="1456" x1="2016" />
            <wire x2="2016" y1="1456" y2="1696" x1="2016" />
            <wire x2="2176" y1="1696" y2="1696" x1="2016" />
        </branch>
        <branch name="XLXN_7">
            <wire x2="1824" y1="1456" y2="1456" x1="1808" />
            <wire x2="1824" y1="1456" y2="1616" x1="1824" />
            <wire x2="2032" y1="1616" y2="1616" x1="1824" />
        </branch>
        <instance x="2032" y="1648" name="XLXI_46" orien="R0" />
        <branch name="XLXN_62">
            <wire x2="2496" y1="1696" y2="1696" x1="2400" />
            <wire x2="2496" y1="1520" y2="1520" x1="2416" />
            <wire x2="2496" y1="1520" y2="1696" x1="2496" />
            <wire x2="2496" y1="1312" y2="1520" x1="2496" />
            <wire x2="2800" y1="1312" y2="1312" x1="2496" />
        </branch>
    </sheet>
</drawing>