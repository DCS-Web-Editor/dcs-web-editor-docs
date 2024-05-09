
# UI Tools

## Navigation and Shortcuts
  
### Mouse Navigation

Left-click and drag to move around the map. 
  
Click on points of interest, such as airports, to open information windows.  
  
Right-click anywhere on the map to open a coordinate window where you can click on your preferred coordinate type to copy it to clipboard. Also contained within this window is a `Paste here` button, which you can use to paste any units or other entities currently contained within your clipboard.

The `GoogleMaps` and `SkyVector` buttons will take you to the respective mapping and flight planning websites.

### Keyboard Shortcuts

- Shift + Left-Click + Drag -> Box-select units, triggers, waypoints, drawings etc.
- Delete -> Delete selected units, triggers, waypoints.
- Escape -> Deselect all.
- Right-Click -> Deselect all, open mouse location info / coordinates.
- Paint Mode + Left Click + MouseMove -> Draw lines. Left-click to delete lines.
- Paint Mode + Left Click + CTRL + MouseMove -> Draw dotted lines.
- Ctrl + S -> Save mission.
- Ctrl + Shift + S -> QuickSave mission ( no prompt ).
- Ctrl + C -> Copy selected units, triggers.
- Ctrl + V -> Paste selected units, triggers.
- Ctrl + L -> Load mission.
- Ctrl + Z -> Undo ( up to 20 steps ).
- u -> toggle (U)NITS window.
- l -> toggle UNIT (L)IST window.
- Shift + R -> Random rotation of selected units.
- Shift + Alt + R -> Align selected units rotation to 0°.
- Shift + L -> Align selected units to line ( uses paste x/y offset ).
- Shift + P -> Randomize position of selected units ( uses paste x/y offset ).
- Shift + G -> Align selected units to grid ( uses paste x/y offset ).
- Shift + T -> Transform / scale / rotate selected units. Press ESCAPE to exit transform mode.
- If the fonts are too large/small, you can also use the browser zoom `Ctrl +`  and `Ctrl -`.

### 3D Editor Shortcuts

- Ctrl -> Ground view while holding.
- Alt -> Bird's Eye view while holding.
- 1 -> Point camera North.
- 2 -> Point camera East.
- 3 -> Point camera South.
- 4 -> Point camera West.

## Map Tools

Map Tiles:  
  
![ui-map-tiles](./images/ui-map-tiles.png)  
  
Opens a menu where you are able to choose your desired map tile type, as well as map options to customize your experience.  
  
Marker Color: 
  
![ui-marker](./images/ui-marker.png)
  
Reveals the marker color palatte. Choose your color and then left-click anywhere on the map to close the window.
  
The bottom left of the map screen consists of six blocks of information.
There's the location block:

![ui-coordinates](./images/ui-coordinates.png)  
  
The map zoom and scale bars:

![ui-map-zoom](./images/ui-map-zoom.png)  
  
![ui-scale](./images/ui-scale.png)  

The Drawing tool:

![ui-drawing-tool](./images/ui-drawing-tool.png)

When selected, this tool allows for painting on the map with a marker using your mouse. Color is selected via the Marker Color tool previously noted. Click on any mark to erase it.

The Text tool:

![ui-text-tool](./images/ui-text-tool.png)

Enable this tool and click anywhere on the map to insert text. Text color is chosen via the Marker Color tool. The tool must be enabled to click-delete present text.
  
Polyline Measurement tool:

![ui-polyline-tool](./images/ui-polyline-tool.png)  
  
To use this tool, click on the top arrow button to highlight and activate it. Click anywhere on the map to begin your measurement sequence. You may create as many sequence legs as you desire.  
You will notice an information box accompanying each point:

![ui-polyline-info](./images/ui-polyline-info.png)  
  
The top number represents the incoming leg azimuth, while the second number represents the outgoing leg azimuth.
The grey number is the current leg length, and the green number is the total length of the sequence.  
  
To erase all measurement sequences, press the `x` on the Polyline Measurement tool.  
  
To change the measurement units, click the bottom and final button of the tool. This will cycle between nm (nautical miles), km (kilometers), and mi (miles).  
  

## Panel Tools

These tools are found at the bottom of the Editor Main Panel.

### Offset

The Offset Tool:  
![ui-offset-tool](./images/ui-offset-tool.png)  
  
This panel contains two fields to input numbers according to your desired paste offset ranges. Insert negative values for left/down.

Undo:

![ui-undo-button](./images/ui-undo-button.png)

This button has the same function as the keyboard shortcut. Sequentially undo previous edits.

![ui-undo-history](./images/ui-undo-history.png)

The tool will also display the action to be undone, as well as how many edits are in memory.
