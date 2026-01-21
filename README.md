<img src="strathsdr_banner.png" width="100%">

<table border="0" align="center">
    <tr border="0">
        <td align="center" width="50%" border="0">
            <img src="https://www.rfsocbook.com/wp-content/uploads/2022/12/RFSoC3D_v4-1433x1536.png" alt="oscthumb" style="width: 60%" border="0"/>
        </td>
        <td align="center" width="50%" border="0">
            <font size=7><b>Available Now!</b></font size> <br> <font size=5>Software Defined Radio with Zynq® UltraScale+ RFSoC</font size> <br> <font size=4><a href="https://rfsocbook.com/">Free Download</a> <br><a href="https://www.amazon.com/Software-Defined-Radio-Ultrascale-RFSoC/dp/1739588606?keywords=zynq+rfsoc&qid=1673452844&sprefix=%2Caps%2C137&sr=8-1&linkCode=ll1&tag=thzybo-20&linkId=0bf245a543fd4af4625086df4c190928&language=en_US&ref_=as_li_ss_tl">Printed Edition</a></font size>
        </td>
    </tr>
</table>

# RFSoC Radio Transceiver
This repository is compatible with [PYNQ images v3.0.1](https://github.com/Xilinx/PYNQ/releases) and higher for the following RFSoC development boards:
* [ZCU208](https://www.xilinx.com/products/boards-and-kits/zcu208.html),
* [ZCU111](https://www.xilinx.com/products/boards-and-kits/zcu111.html),
* [RFSoC4x2](http://rfsoc-pynq.io/),
* [RFSoC2x2](http://rfsoc-pynq.io/),

The following boards are limited to PYNQ version 2.7 and Vivado 2020.2 since this board is not officially supported by PYNQ and no official SD card image exists:
* [ZCU216](https://www.xilinx.com/products/boards-and-kits/zcu216.html).

The SD card image for this board has been made available from the following repository: [sarafs1926/ZCU216-PYNQ](https://github.com/sarafs1926/ZCU216-PYNQ).

## Introduction
This repository contains a BPSK & QPSK transceiver radio design for RFSoC platforms. The radio is capable of transmitting and receiving BPSK & QPSK modulated waveforms in loopback, or between RFSoC development boards running the same design. A simple "hello world" example is presented demonstrating that transmitted waveforms can be received, synchronised, and the payload extracted for analysis. Check out the demonstration below and the quick start guide to install the project on your RFSoC platform.

<p align="center">
  <img src="demonstration.gif"/>
<p/>

## Quick Start
Follow the instructions below to install the radio demonstrator on your development board. **You will need to give your board access to the internet**.
* Power on your RFSoC development board with an SD Card containing a fresh PYNQ v2.7 image or higher.
* Navigate to Jupyter Labs by opening a browser (preferably Chrome) and connecting to `http://<board_ip_address>:9090/lab`.
* We need to open a terminal in Jupyter Lab. Firstly, open a launcher window as shown in the figure below:

<p align="center">
  <img src="../master/open_jupyter_launcher.jpg" width="50%" height="50%" />
<p/>

* Now open a terminal in Jupyter as illustrated below:

<p align="center">
  <img src="../master/open_terminal_window.jpg" width="50%" height="50%" />
<p/>

* Now simply install the radio demonstrator through PIP by executing the following command in the terminal:

```sh
pip3 install https://github.com/strath-sdr/rfsoc_radio/releases/download/v0.3.4/rfsoc_radio.tar.gz
python -m rfsoc_radio install
```

Once installation has complete, you will find the radio demonstrator notebooks located in the jupyter home workspace in the `rfsoc_radio` folder.

## Using the Project Files
The following software is required to use the project files in this repository.
- Vivado Design Suite 2024.1
- System Generator for DSP
- MATLAB R2020a

### System Generator
The Tx and Rx IPs are in separate directories in `rfsoc_radio/boards/ip/sysgen/` that can be opened using the appropriate System Generator dialogue. Due to the large amount of decimation and interpolation in both IPs, simulating the output can take an extraordinarily long time. A less extreme multirate system would simulate much faster! 

### Vivado
This project can be built with Vivado from the command line. Open Vivado 2020.2 and execute the following into the tcl console:

```sh
cd /<repository-location>/boards/<board-name>/rfsoc_radio/
```

Now that we have moved into the correct directory, make the Vivado project by running the make commands below sequentially.

```sh
make block_design
make bitstream
```

Alternatively, you can run the entire project build by executing the following into the tcl console:
```sh
make all
```

## License 
[BSD 3-Clause](../../blob/master/LICENSE)
