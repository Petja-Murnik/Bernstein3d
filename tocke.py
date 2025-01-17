import numpy as np

d = 2 
V1 = np.array([0,0,0])
V2 = np.array([0,1,0])
V3 =  np.array([1,1,0])
V4 = np.array([0,0,1])



for ix in range(d+1):
    for iy in range(d- (ix)+1) :
        for iz in range(d- (ix) -(iy) +1):
            for il in range(d  - (ix ) -(iy )  - (iz )+1 ):
                il = d  - (ix ) -(iy )  - (iz ) 
                tocka = (ix * V1 + iy* V2 + iz * V3 + il*V4)/d


                coordinate_string = f"\\coordinate (V_{ix}_{iy}_{il}) at ({tocka[0]}, {tocka[1]}, {tocka[2]});"
                print(coordinate_string)

                coordinate_string = f"\\filldraw[red,] (V_{ix}_{iy}_{il}) circle (0.7pt);"
                print(coordinate_string)

