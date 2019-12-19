## Developing new Bus Routes for Underserved Populations in Western Vermont

For an independent problem in Human GIS, students had to develop a new public transit route to connect rural communities in Western Vermont with the bus station in Middlebury, which served as a hub for other transportation services. Additionally, access to Middlebury is important for marginalized farm workers because it has the nearest hospital and related health services. Students had to consider how to make their route the most efficient in order to serve the most people possible. 

### Data 

All data for this lab was provided by the professor in the following [file](ip2.gpkg).
It includes relevant data such as "roads", "ACTR_Stops", "blocks" (Census block groups), and "e911", which shows all residential properties in Addison County.

Roads are provided by ESRI
ACTR Stops are provided by [ACTR](https://actr-vt.org/)
e911 locations are provided by the Vermont Open Geodata Portal
Census block groups and towns are provided by the 2010 U.S. Census



### Methods 

1. Using Route Analysis tools in QGIS, I calculated which roads offer the most efficient link from Middlebury to Weybridge, Addison, Bridport, Shoreham, and Cornwall (in that order). 

2. Next, I joined information from "e911" to "blocks" to determine where residencies are located, and then used QGIS's Buffer and Iso-Area tools to demonstrate the homes within a 15-minute walk to the proposed bus stop.

3. After the buffer area was created, I used population information to calculate the percentage of people in the communities who had easy access to the bus route. 


### Discussion 

Addison County Transit Resources, or ACTR, is the only public transport option for Addison County, VT. Much of the county is rural, and the main services shuttle people to and from Middlebury and Burlington, principally. However, this leaves numerous towns underserved by public transport options, especially lower-income laborers who do not own personal vehicles. The most glaring missing route to ACTR’s current services would be in the western portion of the county. This map illustrates a proposed route, which would connect five towns in the region with the bigger ACTR hub in Middlebury, VT. Times between stops are listed, as well as the total route time. 
