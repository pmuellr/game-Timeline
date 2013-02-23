# Licensed under the Tumbolia Public License. See footer for details.

assert = require "assert"

r = "red"
b = "brown"
g = "green"
y = "yellow"

PipeMap[ 1] = [1, 2, 4, 3]; PipeStone[ 1] = [r, b, y, g]
PipeMap[ 2] = [1, 3, 2, 4]; PipeStone[ 2] = [r, b, y, g]
PipeMap[ 3] = [1, 3, 4, 2]; PipeStone[ 3] = [b, y, g, r]
PipeMap[ 4] = [1, 4, 2, 3]; PipeStone[ 4] = [y, g, b, r]
PipeMap[ 5] = [1, 4, 3, 2]; PipeStone[ 5] = [r, y, b, g]
PipeMap[ 6] = [2, 1, 3, 4]; PipeStone[ 6] = [b, r, y, g]
PipeMap[ 7] = [2, 1, 4, 3]; PipeStone[ 7] = [r, b, g, y]
PipeMap[ 8] = [2, 3, 1, 4]; PipeStone[ 8] = [b, r, y, g]
PipeMap[ 9] = [2, 3, 4, 1]; PipeStone[ 9] = [b, g, y, r]
PipeMap[10] = [2, 4, 1, 3]; PipeStone[10] = [g, y, b, r]
PipeMap[11] = [2, 4, 3, 1]; PipeStone[11] = [y, b, r, g]
PipeMap[12] = [3, 1, 2, 4]; PipeStone[12] = [r, g, y, b]
PipeMap[13] = [3, 1, 4, 2]; PipeStone[13] = [g, b, y, r]
PipeMap[14] = [3, 2, 1, 4]; PipeStone[14] = [r, g, b, y]
PipeMap[15] = [3, 2, 4, 1]; PipeStone[15] = [g, b, r, y]
PipeMap[16] = [3, 4, 1, 2]; PipeStone[16] = [y, b, r, g]
PipeMap[17] = [3, 4, 2, 1]; PipeStone[17] = [b, y, r, g]
PipeMap[18] = [4, 1, 2, 3]; PipeStone[18] = [g, b, y, r]
PipeMap[19] = [4, 1, 3, 2]; PipeStone[19] = [r, b, g, y]
PipeMap[20] = [4, 2, 1, 3]; PipeStone[20] = [y, b, g, r]
PipeMap[21] = [4, 2, 3, 1]; PipeStone[21] = [y, b, g, r]
PipeMap[22] = [4, 3, 1, 2]; PipeStone[22] = [b, y, r, g]
PipeMap[23] = [4, 3, 2, 1]; PipeStone[23] = [b, y, r, g]
PipeMap[24] = [1, 2, 4, 3]; PipeStone[24] = [r, b, y, g]
PipeMap[25] = [1, 3, 2, 4]; PipeStone[25] = [r, b, y, g]
PipeMap[26] = [1, 3, 4, 2]; PipeStone[26] = [b, y, g, r]
PipeMap[27] = [1, 4, 2, 3]; PipeStone[27] = [y, g, b, r]
PipeMap[28] = [1, 4, 3, 2]; PipeStone[28] = [r, y, b, g]
PipeMap[29] = [2, 1, 3, 4]; PipeStone[29] = [b, r, y, g]
PipeMap[30] = [2, 1, 4, 3]; PipeStone[30] = [r, b, g, y]
PipeMap[31] = [2, 3, 1, 4]; PipeStone[31] = [b, r, y, g]
PipeMap[32] = [2, 3, 4, 1]; PipeStone[32] = [b, g, y, r]
PipeMap[33] = [2, 4, 1, 3]; PipeStone[33] = [g, y, b, r]
PipeMap[34] = [2, 4, 3, 1]; PipeStone[34] = [y, b, r, g]
PipeMap[35] = [3, 1, 2, 4]; PipeStone[35] = [r, g, y, b]
PipeMap[36] = [3, 1, 4, 2]; PipeStone[36] = [g, b, y, r]
PipeMap[37] = [3, 2, 1, 4]; PipeStone[37] = [r, g, b, y]
PipeMap[38] = [3, 2, 4, 1]; PipeStone[38] = [g, b, r, y]
PipeMap[39] = [3, 4, 1, 2]; PipeStone[39] = [y, b, r, g]
PipeMap[40] = [3, 4, 2, 1]; PipeStone[40] = [b, y, r, g]
PipeMap[41] = [4, 1, 2, 3]; PipeStone[41] = [g, b, y, r]
PipeMap[42] = [4, 1, 3, 2]; PipeStone[42] = [r, b, g, y]
PipeMap[43] = [4, 2, 1, 3]; PipeStone[43] = [y, b, g, r]
PipeMap[44] = [4, 2, 3, 1]; PipeStone[44] = [y, b, g, r]
PipeMap[45] = [4, 3, 1, 2]; PipeStone[45] = [b, y, r, g]
PipeMap[46] = [4, 3, 2, 1]; PipeStone[46] = [b, y, r, g]

#-------------------------------------------------------------------------------
for i in [1..46]
    map = PipeMap[i].slice().sort.join("")
    assert.equal map, "1234", "map of #{i} ain't right"

    stone = PipeStone[i].slice().sort.join(",")
    assert.equal stone, "brown,green,red,yellow", "stone of #{i} ain't right"

#-------------------------------------------------------------------------------
module.exports = class Card

    #---------------------------------------------------------------------------
    constructor: (@index) ->
        @image     = "cards/card-p#{right2(@index)}.png"
        @pipeMap   = PipeMap[@index]
        @pipeStone = PipeStone[@index]

    #---------------------------------------------------------------------------
    in2out: (index) ->
        return @pipeMap[index+1]

    #---------------------------------------------------------------------------
    out2in: (index) ->
        return @pipeMap.indexOf(index) + 1

    #---------------------------------------------------------------------------
    stoneAt: (index) ->
        return @pipeStone[index+1]

#-------------------------------------------------------------------------------
right2 = (n) ->
    n = "0#{n}" if n < 10
    return n

#-------------------------------------------------------------------------------
# Copyright (c) 2013 Patrick Mueller
#
# Tumbolia Public License
#
# Copying and distribution of this file, with or without modification, are
# permitted in any medium without royalty provided the copyright notice and
# this notice are preserved.
#
# TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
#   0. opan saurce LOL
#-------------------------------------------------------------------------------