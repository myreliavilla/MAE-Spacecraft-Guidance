# MAE-Spacecraft-Guidance
A collection of problems solved involving orbits 

#Homework 2 Number 7
Write a function in matlab or python that, given an eccentricity,
converts mean anomaly to eccentric anomaly and true anomaly. Using
that function, plot the eccentric and true anomalies versus the mean
anomaly for mean anomaly between M = 0 and M = π. The two
functions should both be depicted in the same plot (clearly indicating
which is which). You are free to use any eccentricity, e ≥ 0.1.

#Homework 3 Problem 5
Write [matlab or python] code that takes in (a, e, i, Ω, ω, τ ), the
μ = Gm for the central body (e.g., planet), and a time range, say from
t0 to t1, and generates the vehicle trajectory. Apply this to the vehicle
in Problem 2. Take t0 = τ and t1 = 9AM PST, of the same day. Plot
the three components of the perifocal position, ~rperi(t) (i.e., r
peri 1(t),rperi2(t) and rperi3(t)), as functions of time, preferably all on the same
graph. Also plot the three components of the PCI position, ~rP CI (t)(i.e., rP CI1(t), rP CI2(t) and rP CI3(t)), as functions of time, preferably all
on the same graph. Lastly, plot the PCI trajectory in three dimensions,
i.e., as a curve in three dimensions. You must include your code in your
submitted homework; including it as part of the pdf is fine.

#Homework 4 Problem 3
Consider that same groundstation, and suppose that it is 1PM.
Suppose that in an ENU system centered at this groundstation, a satel-
lite currently has position and velocity given by
~r enu =
in kilometers and kilometers per second, respectively. What are the po-
sition and velocity in the ECEF system? Suppose the ECI and ECEF
systems were aligned at 9AM (of this same day). What are the satel-
lite’s position and velocity in the ECI system?

#Homework 4 Problem 4
Extend your [matlab or python] code that takes in (a, e, i, Ω, ω, τ ),
the μ = Gm for the central body (Earth in this problem), and a time
range, say from t0 to t1, and generates the vehicle trajectory in ECI to
now also generate the trajectory in ECEF. Extend it further to produce

the groundtrack as a plot of geocentric latitude versus longitude of
the spacecraft in a spherical earth model (where longitude should run
from zero to 2π radians). Apply this to an Earth satellite with orbital
elements given by

a = 10, 000 km, e = 0.3, i =
π
6
radians,

Ω = π
3
radians, ω =
π
4
radians and τ = 3AM PST.
For simplicity, suppose ECI and ECEF are aligned at time t = τ . Plot
each of the components of the ECEF position as a function of time,
from t0 = 3 AM PST to t1 = 11 AM PST, preferably all on the same
graph. Also plot the groundtrack over that period.
