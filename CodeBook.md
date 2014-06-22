CodeBook
=========================

The following file explains all the transformations perform on the data as well as the name of the variables used to label  them. 

Variables
---------

We used a total of 68 variables according to what was specified in the project. These variables were the ones who measured the mean and standard deviation of different features as the boddy acceleration in X direction, etc. The indexes of the variables used based on the file *features.txt* is the following: 

* 1,2,3,4,5,6,41,42,43,44,45,46,81,82,83,84,85,86,121,122,123,124,125,126,161,162,163,164,165,166,201,202,214,215,227,228,240,241,253,254,266,267,268,269,270,271,345,346,347,348,349,350,424,425,426,427,428,429,503,504,516,517,529,530,542,543

The variables stated above correspond to the next names:

1. "Subject_ID",
2. "TotalBodyAccel_Mean_X"
3. "TotalBodyAccel_Mean_Y"
4. "TotalBodyAccel_Mean_Z", 
5. "TotalBodyAccel_StdDev_X"
6. "TotalBodyAccel_StdDev_Y"
7. "TotalBodyAccel_StdDev_Z"
8. "TotalGravAccel_Mean_X"
9. "TotalGravAccel_Mean_Y"
10. "TotalGravAccel_Mean_Z"
11. "TotalGravAccel_StdDev_X"
12. "TotalGravAccel_StdDev_Y"
13. "TotalGravAccel_StdDev_Z"
14. "TotalBodyAccelJerk_Mean_X"
15. "TotalBodyAccelJerk_Mean_Y"
16. "TotalBodyAccelJerk_Mean_Z"
17. "TotalBodyAccelJerk_StdDev_X"
18. "TotalBodyAccelJerk_StdDev_Y"
19. "TotalBodyAccelJerk_StdDev_Z"
20. "TotalBodyGyro_Mean_X"
21. "TotalBodyGyro_Mean_Y"
22. "TotalBodyGyro_Mean_Z" 
23. "TotalBodyGyro_StdDev_X"
24. "TotalBodyGyro_StdDev_Y"
25. "TotalBodyGyro_StdDev_Z"
26. "TotalBodyGyroJerk_Mean_X"
27. "TotalBodyGyroJerk_Mean_Y"
28. "TotalBodyGyroJerk_Mean_Z"
29. "TotalBodyGyroJerk_StdDev_X"
30. "TotalBodyGyroJerk_StdDev_Y"
31. "TotalBodyGyroJerk_StdDev_Z"
32. "TotalBodyAccelMag_Mean"
33. "TotalBodyAccelMag_StdDev"
34. "TotalGravityAccelMag_Mean"
35. "TotalGravityAccelMag_StdDev"
36. "TotalGravityAccelMagJerk_Mean"
37. "TotalGravityAccelMagJerk_StdDev"
38. "TotalBodyGyroMag_Mean"
39. "TotalBodyGyroMag_StdDev"
40. "TotalBodyGyroJerkMag_Mean"
41. "TotalBodyGyroJerkMag_StdDev"
42. "FreqBodyAccel_Mean_X"
43. "FreqBodyAccel_Mean_Y"
44. "FreqBodyAccel_Mean_Z"
45. "FreqBodyAccel_StdDev_X"
46. "FreqBoddyAccel_StdDev_Y"
47. "FreqBodyAccel_StdDev_Z"
48. "FreqBodyAccelJerk_Mean_X"
49. "FreqBodyAccelJerk_Mean_Y"
50. "FreqBodyAccelJerk_Mean_Z"
51. "FreqBodyAccelJerk_StdDev_X"
52. "FreqBoddyAccelJerk_StdDev_Y"
53. "FreqBodyAccelJerk_StdDev_Z"
54. "FreqBodyGyro_Mean_X"
55. "FreqBodyGyro_Mean_Y"
56. "FreqBodyGyro_Mean_Z""
57. "FreqBodyGyro_StdDev_X"
58. "FreqBoddyGyro_StdDev_Y"
59. "FreqBodyGyro_StdDev_Z"
60. "FreqBodyAccelMag_Mean"
61. "FreqBodyAccelMag_StdDev"
62. "FreqBodyAccelMagJerk_Mean"
63. "FreqGravityAccelJerk_StdDev"
64. "FreqBodyGyroMag_Mean"
65. "FreqBodyGyroMag_StdDev"           
66. "TotalBodyGyroJerkMag_Mean"
67. "TotalBodyGyroJerkMag_StdDev"
68. "Activity"

### Units ####

The variables with the prefix *Freq* were measured in Hertz, as the the variables with *accel* in their names their unit is $$m/s^{2}$$. Features with *gyro* measures the angular velocity, therfore it's unit is $$Rads/s$$ 

The activity labes is composed of 6 diferent activities: 

* Walking
* Walking Upstairs
* Walikng Downstairs
* Sitting
* Standing
* Laying