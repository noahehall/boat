Transport
=========

about
-----
- service that transports X to vessel Y
- required to update captainsLog before & after calling duty Procs

  - this sets the before & after marks in case of rollbacks
  - passes captainsLogger to duties for tracking graphs of invocations


Interface
---------
- add proc(Duty): bool
- post proc: bool
- pre proc: bool
- rm proc(Duty): bool
- rmForce proc: same as rm, but more aggressive
- workflow


Attributes
----------
- workflow

  - X
  - Y
  - Z


Procs
-----
- add

  - captainsLog(nil, duty, action)
  - duty.add(self) -> bool | err
  - err | bool ? self.rm(Duty) -> captainsLog(false, duty, action)
  - captainsLog(true, duty, action)

- rm

  - captainsLog(nil, duty, action)
  - duty.rm(self) -> bool | err
  - err | bool ? duty.rmForce(self) -> self.rmForce(duty) -> captainsLog(false, duty, action)
  - captainsLog(true, duty, action)
