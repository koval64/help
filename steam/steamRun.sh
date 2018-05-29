##!/bin/bash

# You could try to launch steam with:
#
# LD_PRELOAD='/usr/$LIB/libstdc++.so.6' steam
#
# or remove the libgcc_s.so, libstdc++.so and libxcb.so libraries
# in the steam folder. Either should force steam to use the newer
# ubuntu libraries instead of steam libraries.





# to play Portal 2, Black Mesa run Steam from console, by typing:

LD_PRELOAD='/usr/$LIB/libstdc++.so.6' steam


# or in steam client, right mouse click on game, choose Properties > General > Set Launch Options and type:

LD_PRELOAD='/usr/$LIB/libstdc++.so.6' %command%




# to play turmoil on ati cards:

R600_DEBUG="vs,ps" %command%
