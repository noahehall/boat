Vessel
======

about
-----
- extendable default OS configurations


Interface
---------
- configure proc: bool
- dirs strtab
- transport enum[Transport]
- update proc: bool
- upgrade proc: bool
- version strtab
- workflow


Attributes
----------
- dirs

  - install e.g. /opt
  - fetch e.g. /tmp

- version

  - min: without blatant security risks
  - prod: recommended e.g. LTS
  - edge: latest available

- transport

  - default: the transport expected to always exist, e.g. apt on ubuntu
  - xyz: configuration for transport XYZ tailored for this vessel

- workflow

  - X
  - Y
  - Z


Procs
-----
- configure
