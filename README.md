# Autolayout-CollectionViewExample
This repo demonstrates a frustration with autolayout and aspect ratio constraints, when trying to dynamically size collection view cells such that there be only one cell per row in a UICollectionViewFlowLayout. When loading a cell from a xib/storyboard to use as an offscreen cell that handles size calculations, you cannot inform the cell what width it should be and expect it to calculate its height based on that width, since the size the cell was when it was loaded from the xib/storyboard is encoded as an autolayout constraint which cannot be broken or worked around as far as I know.

This is an example illustrating the question I posed on stack overflow here: https://stackoverflow.com/questions/30113202/how-can-i-calculate-the-size-of-a-uicollectionviewcell-loaded-from-a-xib-with-au

The storyboard has a collection view cell in it that has an aspect ratio of 3:2 as a constraint. Ideally if we set the sizing cell's width to the device's width and ask the system to calculate the system layout size, it should resize the height to match the aspect ratio, but there will be unsatisfiable constraint exceptions thrown here as I explained above.
