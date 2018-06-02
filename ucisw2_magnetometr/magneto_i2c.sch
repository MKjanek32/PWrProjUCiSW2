<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK" />
        <signal name="Reset" />
        <signal name="DRDY" />
        <signal name="Rate(2:0)" />
        <signal name="DRLED" />
        <signal name="DS(7:0)" />
        <signal name="DS_EN(3:0)" />
        <signal name="XLXN_278(15:0)" />
        <signal name="XLXN_264" />
        <signal name="H_SYNC" />
        <signal name="V_SYNC" />
        <signal name="V_R(4:0)" />
        <signal name="V_G(5:0)" />
        <signal name="V_B(4:0)" />
        <signal name="SCL" />
        <signal name="SDA" />
        <signal name="NACK" />
        <signal name="XLXN_94(2:0)" />
        <signal name="XLXN_110(15:0)" />
        <signal name="XLXN_111(15:0)" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="Reset" />
        <port polarity="Input" name="DRDY" />
        <port polarity="Input" name="Rate(2:0)" />
        <port polarity="Output" name="DRLED" />
        <port polarity="Output" name="DS(7:0)" />
        <port polarity="Output" name="DS_EN(3:0)" />
        <port polarity="Output" name="H_SYNC" />
        <port polarity="Output" name="V_SYNC" />
        <port polarity="Output" name="V_R(4:0)" />
        <port polarity="Output" name="V_G(5:0)" />
        <port polarity="Output" name="V_B(4:0)" />
        <port polarity="BiDirectional" name="SCL" />
        <port polarity="BiDirectional" name="SDA" />
        <port polarity="Output" name="NACK" />
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="MagnetoHMC5883LCtrl">
            <timestamp>2018-5-25T11:43:31</timestamp>
            <rect width="304" x="64" y="-512" height="512" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-336" y2="-336" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="432" y1="-480" y2="-480" x1="368" />
            <rect width="64" x="368" y="-428" height="24" />
            <line x2="432" y1="-416" y2="-416" x1="368" />
            <rect width="64" x="368" y="-364" height="24" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <rect width="64" x="368" y="-300" height="24" />
            <line x2="432" y1="-288" y2="-288" x1="368" />
            <rect width="64" x="368" y="-236" height="24" />
            <line x2="432" y1="-224" y2="-224" x1="368" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <blockdef name="Display4x7S">
            <timestamp>2018-5-25T12:38:38</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="VGACompass">
            <timestamp>2018-5-28T23:28:4</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <rect width="64" x="0" y="-60" height="24" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="inv" name="XLXI_20(2:0)">
            <blockpin signalname="Rate(2:0)" name="I" />
            <blockpin signalname="XLXN_94(2:0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_19">
            <blockpin signalname="DRDY" name="I" />
            <blockpin signalname="DRLED" name="O" />
        </block>
        <block symbolname="Display4x7S" name="ZAxisDisp">
            <blockpin signalname="CLK" name="Clk" />
            <blockpin signalname="XLXN_278(15:0)" name="DI(15:0)" />
            <blockpin name="DP(3:0)" />
            <blockpin name="Blank(3:0)" />
            <blockpin signalname="DS_EN(3:0)" name="DS_EN(3:0)" />
            <blockpin signalname="DS(7:0)" name="DS(7:0)" />
        </block>
        <block symbolname="MagnetoHMC5883LCtrl" name="MagnetoCtrl">
            <blockpin signalname="XLXN_94(2:0)" name="OutputRate(2:0)" />
            <blockpin signalname="CLK" name="Clk" />
            <blockpin signalname="XLXN_264" name="Reset" />
            <blockpin signalname="DRDY" name="DRDY" />
            <blockpin name="DR_New" />
            <blockpin name="ID(23:0)" />
            <blockpin signalname="XLXN_110(15:0)" name="DRX(15:0)" />
            <blockpin signalname="XLXN_111(15:0)" name="DRY(15:0)" />
            <blockpin signalname="XLXN_278(15:0)" name="DRZ(15:0)" />
            <blockpin signalname="NACK" name="NACK" />
            <blockpin signalname="SDA" name="SDA" />
            <blockpin signalname="SCL" name="SCL" />
        </block>
        <block symbolname="inv" name="XLXI_5">
            <blockpin signalname="Reset" name="I" />
            <blockpin signalname="XLXN_264" name="O" />
        </block>
        <block symbolname="VGACompass" name="CompassDisp">
            <blockpin signalname="XLXN_264" name="Reset" />
            <blockpin signalname="CLK" name="Clk" />
            <blockpin signalname="XLXN_110(15:0)" name="DRX(15:0)" />
            <blockpin signalname="XLXN_111(15:0)" name="DRY(15:0)" />
            <blockpin signalname="H_SYNC" name="H_SYNC" />
            <blockpin signalname="V_SYNC" name="V_SYNC" />
            <blockpin signalname="V_R(4:0)" name="V_R(4:0)" />
            <blockpin signalname="V_G(5:0)" name="V_G(5:0)" />
            <blockpin signalname="V_B(4:0)" name="V_B(4:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="Reset">
            <wire x2="208" y1="432" y2="432" x1="176" />
        </branch>
        <branch name="DRDY">
            <wire x2="400" y1="576" y2="576" x1="176" />
            <wire x2="480" y1="576" y2="576" x1="400" />
            <wire x2="400" y1="576" y2="1040" x1="400" />
            <wire x2="1312" y1="1040" y2="1040" x1="400" />
        </branch>
        <instance x="208" y="176" name="XLXI_20(2:0)" orien="R0" />
        <branch name="Rate(2:0)">
            <wire x2="208" y1="144" y2="144" x1="176" />
        </branch>
        <iomarker fontsize="28" x="176" y="144" name="Rate(2:0)" orien="R180" />
        <iomarker fontsize="28" x="176" y="288" name="CLK" orien="R180" />
        <iomarker fontsize="28" x="176" y="432" name="Reset" orien="R180" />
        <iomarker fontsize="28" x="176" y="576" name="DRDY" orien="R180" />
        <branch name="DRLED">
            <wire x2="1648" y1="1040" y2="1040" x1="1536" />
        </branch>
        <iomarker fontsize="28" x="1648" y="1040" name="DRLED" orien="R0" />
        <iomarker fontsize="28" x="1648" y="928" name="DS(7:0)" orien="R0" />
        <iomarker fontsize="28" x="1648" y="736" name="DS_EN(3:0)" orien="R0" />
        <instance x="1232" y="960" name="ZAxisDisp" orien="R0">
        </instance>
        <iomarker fontsize="28" x="1648" y="128" name="H_SYNC" orien="R0" />
        <iomarker fontsize="28" x="1648" y="192" name="V_SYNC" orien="R0" />
        <iomarker fontsize="28" x="1648" y="256" name="V_R(4:0)" orien="R0" />
        <iomarker fontsize="28" x="1648" y="320" name="V_G(5:0)" orien="R0" />
        <iomarker fontsize="28" x="1648" y="384" name="V_B(4:0)" orien="R0" />
        <iomarker fontsize="28" x="1648" y="592" name="SCL" orien="R0" />
        <iomarker fontsize="28" x="1648" y="528" name="SDA" orien="R0" />
        <iomarker fontsize="28" x="1648" y="464" name="NACK" orien="R0" />
        <instance x="480" y="624" name="MagnetoCtrl" orien="R0">
        </instance>
        <branch name="DS(7:0)">
            <wire x2="1648" y1="928" y2="928" x1="1616" />
        </branch>
        <branch name="DS_EN(3:0)">
            <wire x2="1648" y1="736" y2="736" x1="1616" />
        </branch>
        <branch name="XLXN_278(15:0)">
            <wire x2="960" y1="400" y2="400" x1="912" />
            <wire x2="960" y1="400" y2="800" x1="960" />
            <wire x2="1232" y1="800" y2="800" x1="960" />
        </branch>
        <branch name="XLXN_264">
            <wire x2="464" y1="432" y2="432" x1="432" />
            <wire x2="480" y1="432" y2="432" x1="464" />
            <wire x2="464" y1="432" y2="656" x1="464" />
            <wire x2="992" y1="656" y2="656" x1="464" />
            <wire x2="1232" y1="128" y2="128" x1="992" />
            <wire x2="992" y1="128" y2="656" x1="992" />
        </branch>
        <branch name="H_SYNC">
            <wire x2="1648" y1="128" y2="128" x1="1616" />
        </branch>
        <branch name="V_SYNC">
            <wire x2="1648" y1="192" y2="192" x1="1616" />
        </branch>
        <branch name="V_R(4:0)">
            <wire x2="1648" y1="256" y2="256" x1="1616" />
        </branch>
        <branch name="V_G(5:0)">
            <wire x2="1648" y1="320" y2="320" x1="1616" />
        </branch>
        <branch name="V_B(4:0)">
            <wire x2="1648" y1="384" y2="384" x1="1616" />
        </branch>
        <branch name="SCL">
            <wire x2="1648" y1="592" y2="592" x1="912" />
        </branch>
        <branch name="SDA">
            <wire x2="1648" y1="528" y2="528" x1="912" />
        </branch>
        <branch name="NACK">
            <wire x2="1648" y1="464" y2="464" x1="912" />
        </branch>
        <branch name="XLXN_94(2:0)">
            <wire x2="480" y1="144" y2="144" x1="432" />
        </branch>
        <branch name="XLXN_110(15:0)">
            <wire x2="1136" y1="272" y2="272" x1="912" />
            <wire x2="1136" y1="272" y2="288" x1="1136" />
            <wire x2="1232" y1="288" y2="288" x1="1136" />
        </branch>
        <branch name="XLXN_111(15:0)">
            <wire x2="1056" y1="336" y2="336" x1="912" />
            <wire x2="1056" y1="336" y2="368" x1="1056" />
            <wire x2="1232" y1="368" y2="368" x1="1056" />
        </branch>
        <branch name="CLK">
            <wire x2="432" y1="288" y2="288" x1="176" />
            <wire x2="432" y1="288" y2="688" x1="432" />
            <wire x2="1024" y1="688" y2="688" x1="432" />
            <wire x2="1024" y1="688" y2="736" x1="1024" />
            <wire x2="1232" y1="736" y2="736" x1="1024" />
            <wire x2="480" y1="288" y2="288" x1="432" />
            <wire x2="1024" y1="208" y2="688" x1="1024" />
            <wire x2="1232" y1="208" y2="208" x1="1024" />
        </branch>
        <instance x="208" y="464" name="XLXI_5" orien="R0" />
        <instance x="1312" y="1072" name="XLXI_19" orien="R0" />
        <instance x="1232" y="416" name="CompassDisp" orien="R0">
        </instance>
    </sheet>
</drawing>