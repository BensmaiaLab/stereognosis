# Stereognosis Experiment

* See also: [LabSharing\Stereognosis](\\bensmaia-lab\LabSharing\Stereognosis)

Setup to build using Jenkins on blbld.uchicago.edu

## Protocol Overview

1. Protocol start
    1. Initialize apparatus and communications
1. Start recording (for this trial? Or through whole session?)
    1. trial start:
        1. Subject readiness: Subject with an arm in an armrest with light sensor (should be dark)
        1. Move plates into grasp range.
        1. Play tones?
        1. Subject grasps plates and matches force sensor target for n seconds
        1. Detect adaquate grip
        1. Reward subject
        1. Reset, move plates to home
    1. Loop for next trial
1. Stop recording

## Todo

* Issue: Left trackpad sensor not connected
* Setup jenkins with build target.


## Motors

* Stage In/Out
* Aperture
* Rotation


## Components
* [Current code](https://github.com/nishbo/touch_pad_deeplabcut_rig)
* [ExperimentCore](https://github.com/BensmaiaLab/experimentCore)
  * [Repo](https://github.com/psychopy/psychopy)
* [NCams](https://github.com/CMGreenspon/NCams)

### Third Party

* [OpenEphys for neural recording](https://open-ephys.org/)
* [Tekscan](https://www.tekscan.com/)
* [PsychoPy](https://www.psychopy.org/)
* Blackrock (Optional, using the openephys currently)


#### OpenEphys
Neural recording software for Open Ephys 128ch acquisition board
https://open-ephys.atlassian.net/wiki/spaces/OEW/pages/491527/Open+Ephys+GUI



#### Tekscan

Tekscan 5051 is capable of up to 20khz sampling with VersaTek hub.
Assume ~2000 sensels x 300hz x 16-bit sampling = 1.2 MBps / sec of data.

* ? - https://www.microchip.com/design-centers/capacitive-touch-sensing
* https://www.tekscan.com/products-solutions/pressure-mapping-sensors/5051

The sensors we are using are from Tekscan. We have a cd in the lab with their .Net based SDK & all the manuals. Additionally the company sent us an older version of the API that supports C++, find it here:
https://drive.google.com/file/d/1648yYxH9xtHlSKvrmmZaY_wclZA6qpmo/view?usp=sharing  

Some links that Tekscan sent us earlier (unsure if they are useful):

The SDK is a .Net based solution. There are no traditional C++ style -lib or -h files.
It is also COM-enabled to potentially give another optional way of integrating with the it.

There are numerous online references of how to call a managed DLL (such as the SDK) from C++:

* Demonstrates creating a "wrapper":
  * https://www.codeproject.com/Tips/695387/Calling-Csharp-NET-methods-from-unmanaged-C-Cplusp
  * https://stackoverflow.com/questions/225277/calling-managed-code-from-unmanaged-code
* Using COM
  * http://msdn.microsoft.com/en-us/library/zsfww439.aspx
* Reverse P/Invoke
  * http://tigerang.blogspot.ca/2008/09/reverse-pinvoke.html
  * http://blogs.msdn.com/b/junfeng/archive/2008/01/28/reverse-p-invoke-and-exception.aspx
* Using CLR Hosting (ICLRRuntimeHost::ExecuteInDefaultAppDomain())
  * http://msdn.microsoft.com/en-us/library/dd380850%28v=vs.110%29.aspx
  * http://msdn.microsoft.com/en-us/library/ms164411%28v=vs.110%29.aspx
  * https://stackoverflow.com/a/4283104/184528
* Interprocess communication (IPC)
  * https://stackoverflow.com/q/19999049/184528
  * http://www.codeproject.com/Tips/420582/Inter-Process-Communication-between-Csharp-and-Cpl


## Apparatus
* (Valve for water reward)[https://ph.parker.com/us/12051/en/series-3-miniature-inert-liquid-valve/003-0865-900]
  * PN# 003-0865-9000
  * Plugged into NI-DAQ

### Rack
ERS-16U - KX0318
https://www.aurayaudio.com/product/10387/Auray-ERS_16U-16U-Steel-Equipment-Rack-with-3''-Casters-(16-RU)

2 x Superlogics rackmount PCs - SL-2U-AQ370M-GD-QUIET
SN# 248900002 and 3
https://www.superlogics.com/industrial-computers/rack-mount-computers/quiet-rackmount-pc/sl-2u-ah370m-gd-quiet.html

NAN Instruments Electrode Drive

### Teknic

[ClearPath System](https://www.teknic.com/clearpath-model-support/)

[Support Docs](https://www.teknic.com/products/clearpath-brushless-dc-servo-motors/model-support-sc-dc/)

* [Power Supply](https://www.teknic.com/ipc-5/)
  * PN# IPC-5 SN# 2990243
  * Output 75VDC Nom. - Current 5A RMS
  * Input 1600 VA
* [Power4-Hub](https://www.teknic.com/POWER4-HUB/)
  * PN# 1107659G (Custom Enclosure)
* [Control Hub (SC4-HUB)](https://www.teknic.com/sc4-hub/)
  * PN or SN? 1107578L
* 2x [CPM-SCHP-2311S-ELSA](https://www.teknic.com/model-info/CPM-SCHP-2311S-ELSA/)
  * 24-75 VDC 10A
  * FW: 1.7.6 5E67 P2
  * Warranty thru 2021-07-12
  * SN: 49000492C
  * SN: 49000551C
* 1x [CPM-SCHP-3421S-ELSA](https://www.teknic.com/model-info/CPM-SCHP-3421S-ELSA/)
  * 24-75 VDC 10A
  * FW: 1.7.6 5E67 S1
  * Warranty thru 2021-07-12
  * SN: 44001413C
* 2X [Brake](http://www.automation4less.com/store/proddetail.asp?prod=MPC034-24-0500)
  * P/N: MPC034-24-008 REV:A
  * 24VDC 1.68Nm, 0.41A, 9.8W
  * S/N: 000089 M11/18

### Open Ephys

* [Acquisition Board v2.2 rev 3 (Jan 2017)](https://open-ephys.org/acq-board)

### NI

* [Multifunction I/O via USB](https://www.ni.com/en-us/support/model.usb-6001.html)
  * M/N: USB-6001
  * P/N: 154424D-03L
  * S/N: 1D6DDD6
