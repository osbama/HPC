.. _about_dilhan:

============
About Dilhan
============


Resource description
====================

Key numbers about the Dilhan cluster: compute nodes, node interconnect,
operating system, and storage configuration.



+-------------------------+----------------------------------------------+---------------------------------------------+
|                         | Aggregated                                   | Per node                                    |
+=========================+==============================================+=============================================+
|  |  # Nodes             |  | 11  servers                               |  | 1          Server                        |
+-------------------------+----------------------------------------------+---------------------------------------------+
|  | # CPU's / # Cores    |  | 22/352                                    |  | 2/32                                     |
+-------------------------+----------------------------------------------+---------------------------------------------+
|  | Processors           |  | 22 x Intel Xeon E5 2640                   |  | 2 x Intel Xeon E5 2640                   | 
+-------------------------+----------------------------------------------+---------------------------------------------+
| Total memory            |  352 GB                                      | 32 GB                                       |
+-------------------------+----------------------------------------------+---------------------------------------------+
| Internal storage        |  3 TB                                        | 278 GB                                      |
+-------------------------+----------------------------------------------+---------------------------------------------+
| Centralized storage     |  5 TB (Raid)                                 |                                             |
+-------------------------+----------------------------------------------+---------------------------------------------+
| Interconnect            | 10 Gigabit fiber and 1 Gigabit Ethernet      | 10 Gigabit fiber and 1 Gigabit Ethernet     |
+-------------------------+----------------------------------------------+---------------------------------------------+

+-------------------------------------+-----------------------+
| Compute racks                       | 11                    |
+-------------------------------------+-----------------------+
| Infrastructure racks                | 1                     |
+-------------------------------------+-----------------------+
| Storage racks                       | 1                     |
+-------------------------------------+-----------------------+

 


 
.. _linux-cluster:

Dilhan - a Linux cluster 
========================

This is just a quick and brief introduction to the general features of Linux Clusters.

A Linux Cluster - one machine, consisting of many machines
----------------------------------------------------------

On one hand you can look at large Linux Clusters as rather large and powerful supercomputers, but on the other hand you can look at them as just a large bunch of servers and some storage system(s) connected with each other through a (high speed) network. Both of these views are fully correct, and it's therefore important to be aware of the strengths and the limitations of such a system.

Clusters vs. SMP’s
------------------

On SMP systems most of the resources (CPU, memory, home disks, work disks, etc) are more or less uniformly accessible for any job running on the system. This is a rather simple picture to understand, it’s nearly as your desktop machine – just more of everything: More users, more CPU’s, more memory, more disks etc.

On a Linux Cluster the picture is quite different. The system consists of several independent compute nodes (servers) connected with each other through some (high speed) network and maybe hooked up on some storage system. So the HW resources (like CPU, memory, disk, etc) in a cluster are in general distributed and only locally accessible at each server.



Dilhan Eryurt
========================

Dilhan Eryurt (29 November 1926 – 13 September 2012) was a Turkish astrophysicist who made major contributions to scientific research on the formation and evolution of the Sun and other main sequence stars.

From 1961 to 1973, Eryurt worked for NASA, performing research for the Apollo program. She then established the astrophysics department at the Middle East Technical University (METU) in Turkey. She was the Dean of METU's science and literature faculty from 1988 to 1993. 

`Wikipedia <https://en.wikipedia.org/wiki/Dilhan_Eryurt>`_ 
