<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <blockdef name="eq1">
            <timestamp>2017-3-13T14:32:17</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="ftclex">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <rect width="256" x="64" y="-448" height="384" />
        </blockdef>
        <block symbolname="eq1" name="XLXI_1">
            <blockpin name="i0" />
            <blockpin name="i1" />
            <blockpin name="eq" />
        </block>
        <block symbolname="ftclex" name="XLXI_2">
            <blockpin name="C" />
            <blockpin name="CE" />
            <blockpin name="CLR" />
            <blockpin name="D" />
            <blockpin name="L" />
            <blockpin name="T" />
            <blockpin name="Q" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="944" y="800" name="XLXI_1" orien="R0">
        </instance>
        <instance x="288" y="1488" name="XLXI_2" orien="R0" />
    </sheet>
</drawing>