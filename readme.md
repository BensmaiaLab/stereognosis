# Stereognosis Experiment



## Components

* (ExperimentCore)[https://github.com/BensmaiaLab/experimentCore]
  * (Repo)[https://github.com/psychopy/psychopy]
* (NCams)[https://github.com/CMGreenspon/NCams]
* (TouchPad)[https://github.com/nishbo/touch_pad_deeplabcut_rig]

### Third Party

* OpenEphys
* Tekscan
* (PsychoPy)[https://www.psychopy.org/]

#### OpenEphys
Neural recording software for Open Ephys 128ch acquisition board
https://open-ephys.atlassian.net/wiki/spaces/OEW/pages/491527/Open+Ephys+GUI

#### Tekscan

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