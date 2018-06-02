<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_5" />
        <signal name="OutputRate(2:0)" />
        <signal name="Clk" />
        <signal name="XLXN_6" />
        <signal name="XLXN_27(7:0)" />
        <signal name="XLXN_28(7:0)" />
        <signal name="XLXN_29(3:0)" />
        <signal name="XLXN_4" />
        <signal name="XLXN_52" />
        <signal name="XLXN_54" />
        <signal name="XLXN_55" />
        <signal name="XLXN_57(7:0)" />
        <signal name="DRDY" />
        <signal name="DR_New" />
        <signal name="ID(23:0)" />
        <signal name="DRX(15:0)" />
        <signal name="DRY(15:0)" />
        <signal name="DRZ(15:0)" />
        <signal name="SDA" />
        <signal name="SCL" />
        <signal name="NACK" />
        <signal name="Reset" />
        <port polarity="Input" name="OutputRate(2:0)" />
        <port polarity="Input" name="Clk" />
        <port polarity="Input" name="DRDY" />
        <port polarity="Output" name="DR_New" />
        <port polarity="Output" name="ID(23:0)" />
        <port polarity="Output" name="DRX(15:0)" />
        <port polarity="Output" name="DRY(15:0)" />
        <port polarity="Output" name="DRZ(15:0)" />
        <port polarity="BiDirectional" name="SDA" />
        <port polarity="BiDirectional" name="SCL" />
        <port polarity="Output" name="NACK" />
        <port polarity="Input" name="Reset" />
        <blockdef name="I2C_Master">
            <timestamp>2015-11-24T14:12:50</timestamp>
            <rect width="336" x="64" y="-512" height="572" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="464" y1="-480" y2="-480" x1="400" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <line x2="0" y1="-256" y2="-256" x1="64" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
            <line x2="464" y1="-256" y2="-256" x1="400" />
            <line x2="464" y1="-192" y2="-192" x1="400" />
            <rect width="64" x="400" y="-140" height="24" />
            <line x2="464" y1="-128" y2="-128" x1="400" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
            <line x2="464" y1="32" y2="32" x1="400" />
        </blockdef>
        <blockdef name="Magneto_Drv">
            <timestamp>2018-4-17T13:58:12</timestamp>
            <rect width="400" x="64" y="-704" height="704" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-592" y2="-592" x1="64" />
            <line x2="0" y1="-512" y2="-512" x1="64" />
            <line x2="0" y1="-432" y2="-432" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <rect width="64" x="0" y="-204" height="24" />
            <line x2="0" y1="-192" y2="-192" x1="64" />
            <rect width="64" x="0" y="-124" height="24" />
            <line x2="0" y1="-112" y2="-112" x1="64" />
            <line x2="528" y1="-672" y2="-672" x1="464" />
            <line x2="528" y1="-608" y2="-608" x1="464" />
            <line x2="528" y1="-544" y2="-544" x1="464" />
            <line x2="528" y1="-480" y2="-480" x1="464" />
            <rect width="64" x="464" y="-428" height="24" />
            <line x2="528" y1="-416" y2="-416" x1="464" />
            <rect width="64" x="464" y="-364" height="24" />
            <line x2="528" y1="-352" y2="-352" x1="464" />
            <rect width="64" x="464" y="-300" height="24" />
            <line x2="528" y1="-288" y2="-288" x1="464" />
            <rect width="64" x="464" y="-236" height="24" />
            <line x2="528" y1="-224" y2="-224" x1="464" />
            <rect width="64" x="464" y="-172" height="24" />
            <line x2="528" y1="-160" y2="-160" x1="464" />
            <rect width="64" x="464" y="-108" height="24" />
            <line x2="528" y1="-96" y2="-96" x1="464" />
            <rect width="64" x="464" y="-44" height="24" />
            <line x2="528" y1="-32" y2="-32" x1="464" />
        </blockdef>
        <block symbolname="I2C_Master" name="I2CCtrl">
            <blockpin signalname="XLXN_4" name="Go" />
            <blockpin signalname="XLXN_28(7:0)" name="Address(7:0)" />
            <blockpin signalname="XLXN_29(3:0)" name="ReadCnt(3:0)" />
            <blockpin signalname="SDA" name="SDA" />
            <blockpin signalname="SCL" name="SCL" />
            <blockpin signalname="XLXN_6" name="FIFO_Pop" />
            <blockpin signalname="XLXN_5" name="FIFO_Push" />
            <blockpin signalname="XLXN_27(7:0)" name="FIFO_DI(7:0)" />
            <blockpin signalname="XLXN_52" name="FIFO_Empty" />
            <blockpin signalname="XLXN_54" name="FIFO_Full" />
            <blockpin signalname="XLXN_57(7:0)" name="FIFO_DO(7:0)" />
            <blockpin signalname="Reset" name="Reset" />
            <blockpin signalname="Clk" name="Clk" />
            <blockpin signalname="XLXN_55" name="Busy" />
            <blockpin signalname="NACK" name="NACK" />
        </block>
        <block symbolname="Magneto_Drv" name="MagnetoInterface">
            <blockpin signalname="XLXN_52" name="I2C_FIFO_Empty" />
            <blockpin signalname="XLXN_54" name="I2C_FIFO_Full" />
            <blockpin signalname="XLXN_55" name="I2C_Busy" />
            <blockpin signalname="DRDY" name="DRDY" />
            <blockpin signalname="Reset" name="Reset" />
            <blockpin signalname="Clk" name="Clk" />
            <blockpin signalname="XLXN_57(7:0)" name="I2C_FIFO_DO(7:0)" />
            <blockpin signalname="OutputRate(2:0)" name="OutputRate(2:0)" />
            <blockpin signalname="XLXN_4" name="I2C_Go" />
            <blockpin signalname="XLXN_5" name="I2C_FIFO_Push" />
            <blockpin signalname="XLXN_6" name="I2C_FIFO_Pop" />
            <blockpin signalname="DR_New" name="DR_New" />
            <blockpin signalname="XLXN_27(7:0)" name="I2C_FIFO_DI(7:0)" />
            <blockpin signalname="XLXN_28(7:0)" name="I2C_Addr(7:0)" />
            <blockpin signalname="XLXN_29(3:0)" name="I2C_ReadCnt(3:0)" />
            <blockpin signalname="ID(23:0)" name="ID(23:0)" />
            <blockpin signalname="DRX(15:0)" name="DRX(15:0)" />
            <blockpin signalname="DRY(15:0)" name="DRY(15:0)" />
            <blockpin signalname="DRZ(15:0)" name="DRZ(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_5">
            <wire x2="1328" y1="720" y2="720" x1="1008" />
            <wire x2="1328" y1="528" y2="720" x1="1328" />
            <wire x2="1408" y1="528" y2="528" x1="1328" />
        </branch>
        <branch name="OutputRate(2:0)">
            <wire x2="464" y1="1216" y2="1216" x1="256" />
            <wire x2="480" y1="1216" y2="1216" x1="464" />
        </branch>
        <branch name="Clk">
            <wire x2="304" y1="1056" y2="1056" x1="256" />
            <wire x2="480" y1="1056" y2="1056" x1="304" />
            <wire x2="304" y1="1056" y2="1440" x1="304" />
            <wire x2="1392" y1="1440" y2="1440" x1="304" />
            <wire x2="1408" y1="752" y2="752" x1="1392" />
            <wire x2="1392" y1="752" y2="1440" x1="1392" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="1296" y1="784" y2="784" x1="1008" />
            <wire x2="1296" y1="464" y2="784" x1="1296" />
            <wire x2="1408" y1="464" y2="464" x1="1296" />
        </branch>
        <branch name="XLXN_27(7:0)">
            <wire x2="1264" y1="912" y2="912" x1="1008" />
            <wire x2="1264" y1="592" y2="912" x1="1264" />
            <wire x2="1408" y1="592" y2="592" x1="1264" />
        </branch>
        <branch name="XLXN_28(7:0)">
            <wire x2="1232" y1="976" y2="976" x1="1008" />
            <wire x2="1232" y1="304" y2="976" x1="1232" />
            <wire x2="1408" y1="304" y2="304" x1="1232" />
        </branch>
        <branch name="XLXN_29(3:0)">
            <wire x2="1200" y1="1040" y2="1040" x1="1008" />
            <wire x2="1200" y1="368" y2="1040" x1="1200" />
            <wire x2="1408" y1="368" y2="368" x1="1200" />
        </branch>
        <branch name="XLXN_4">
            <wire x2="1168" y1="656" y2="656" x1="1008" />
            <wire x2="1408" y1="240" y2="240" x1="1168" />
            <wire x2="1168" y1="240" y2="656" x1="1168" />
        </branch>
        <instance x="1408" y="720" name="I2CCtrl" orien="R0">
        </instance>
        <branch name="XLXN_52">
            <wire x2="432" y1="112" y2="656" x1="432" />
            <wire x2="480" y1="656" y2="656" x1="432" />
            <wire x2="1936" y1="112" y2="112" x1="432" />
            <wire x2="1936" y1="112" y2="464" x1="1936" />
            <wire x2="1936" y1="464" y2="464" x1="1872" />
        </branch>
        <branch name="XLXN_54">
            <wire x2="400" y1="80" y2="736" x1="400" />
            <wire x2="480" y1="736" y2="736" x1="400" />
            <wire x2="1968" y1="80" y2="80" x1="400" />
            <wire x2="1968" y1="80" y2="528" x1="1968" />
            <wire x2="1968" y1="528" y2="528" x1="1872" />
        </branch>
        <branch name="XLXN_55">
            <wire x2="336" y1="16" y2="816" x1="336" />
            <wire x2="480" y1="816" y2="816" x1="336" />
            <wire x2="2032" y1="16" y2="16" x1="336" />
            <wire x2="2032" y1="16" y2="688" x1="2032" />
            <wire x2="2032" y1="688" y2="688" x1="1872" />
        </branch>
        <branch name="XLXN_57(7:0)">
            <wire x2="368" y1="48" y2="1136" x1="368" />
            <wire x2="480" y1="1136" y2="1136" x1="368" />
            <wire x2="2000" y1="48" y2="48" x1="368" />
            <wire x2="2000" y1="48" y2="592" x1="2000" />
            <wire x2="2000" y1="592" y2="592" x1="1872" />
        </branch>
        <instance x="480" y="1328" name="MagnetoInterface" orien="R0">
        </instance>
        <branch name="DRDY">
            <wire x2="480" y1="896" y2="896" x1="464" />
            <wire x2="464" y1="896" y2="1376" x1="464" />
            <wire x2="2080" y1="1376" y2="1376" x1="464" />
        </branch>
        <branch name="DR_New">
            <wire x2="1024" y1="848" y2="848" x1="1008" />
            <wire x2="2080" y1="848" y2="848" x1="1024" />
        </branch>
        <branch name="ID(23:0)">
            <wire x2="1024" y1="1104" y2="1104" x1="1008" />
            <wire x2="2080" y1="1104" y2="1104" x1="1024" />
        </branch>
        <branch name="DRX(15:0)">
            <wire x2="1024" y1="1168" y2="1168" x1="1008" />
            <wire x2="2080" y1="1168" y2="1168" x1="1024" />
        </branch>
        <branch name="DRY(15:0)">
            <wire x2="1024" y1="1232" y2="1232" x1="1008" />
            <wire x2="2080" y1="1232" y2="1232" x1="1024" />
        </branch>
        <branch name="DRZ(15:0)">
            <wire x2="1024" y1="1296" y2="1296" x1="1008" />
            <wire x2="2080" y1="1296" y2="1296" x1="1024" />
        </branch>
        <branch name="SDA">
            <wire x2="1888" y1="240" y2="240" x1="1872" />
            <wire x2="2080" y1="240" y2="240" x1="1888" />
        </branch>
        <branch name="SCL">
            <wire x2="1888" y1="304" y2="304" x1="1872" />
            <wire x2="2080" y1="304" y2="304" x1="1888" />
        </branch>
        <branch name="NACK">
            <wire x2="1888" y1="752" y2="752" x1="1872" />
            <wire x2="2080" y1="752" y2="752" x1="1888" />
        </branch>
        <branch name="Reset">
            <wire x2="336" y1="976" y2="976" x1="240" />
            <wire x2="480" y1="976" y2="976" x1="336" />
            <wire x2="336" y1="976" y2="1408" x1="336" />
            <wire x2="1360" y1="1408" y2="1408" x1="336" />
            <wire x2="1360" y1="688" y2="1408" x1="1360" />
            <wire x2="1408" y1="688" y2="688" x1="1360" />
        </branch>
        <iomarker fontsize="28" x="2080" y="304" name="SCL" orien="R0" />
        <iomarker fontsize="28" x="2080" y="240" name="SDA" orien="R0" />
        <iomarker fontsize="28" x="2080" y="752" name="NACK" orien="R0" />
        <iomarker fontsize="28" x="2080" y="1376" name="DRDY" orien="R0" />
        <iomarker fontsize="28" x="2080" y="848" name="DR_New" orien="R0" />
        <iomarker fontsize="28" x="2080" y="1104" name="ID(23:0)" orien="R0" />
        <iomarker fontsize="28" x="2080" y="1168" name="DRX(15:0)" orien="R0" />
        <iomarker fontsize="28" x="2080" y="1232" name="DRY(15:0)" orien="R0" />
        <iomarker fontsize="28" x="2080" y="1296" name="DRZ(15:0)" orien="R0" />
        <iomarker fontsize="28" x="256" y="1216" name="OutputRate(2:0)" orien="R180" />
        <iomarker fontsize="28" x="256" y="1056" name="Clk" orien="R180" />
        <iomarker fontsize="28" x="240" y="976" name="Reset" orien="R180" />
    </sheet>
</drawing>