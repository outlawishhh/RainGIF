# RainGIF

A lightweight GIF player for Rainmeter.

## Overview

RainGIF renders animated GIFs directly on your desktop as lightweight widgets. By utilizing a simple companion script to extract the GIF's individual frames into a highly optimized sequence, the skin achieves fluid playback without relying on heavy external plugins.

## Features

* Smooth animated GIF playback on your desktop
* Native `ffmpeg` frame extraction utility included
* Custom dimensions and adjustable framerates
* Zero external Rainmeter plugins required
* Lightweight performance footprint

## Preview

https://github.com/user-attachments/assets/2d208b41-b56c-4a58-9cff-9a7091435809

## Installation

### Requirements

* Rainmeter 4.5 or higher
* Windows 10/11
* **[FFmpeg](https://ffmpeg.org/download.html)** installed and added to your system's environmental `PATH` (for frame extraction)

### Setup

```bash
git clone https://github.com/outlawishhh/RainGIF.git

```

Copy the `RainGIF` folder into your Rainmeter skins directory:

```text
Documents/
└── Rainmeter/
    └── Skins/
        └── RainGIF/
            ├── @Resources/
            │   ├── extract_frames.bat
            │   └── input.gif
            └── RainGIF.ini

```

1. Navigate to the skin's `@Resources` folder (`Documents\Rainmeter\Skins\RainGIF\@Resources\`).
2. Replace `input.gif` with your custom GIF. **It must exactly be named `input.gif`**.
3. Double-click and run `extract_frames.bat`. The script will output the frames and tell you exactly how many it found.
4. Open `RainGIF.ini` and update the `FrameCount` variable to match the number given by the script.

Refresh Rainmeter and load the skin through the Rainmeter manager.

#### Release Package

Prebuilt `.rmskin` package is available from the Releases page and can be installed directly through Rainmeter.

## Customization

Edit the variables and settings section to customize the appearance and performance:

```ini
[Rainmeter]
Update=1

[Variables]
Width=352
Height=200
FrameCount=120
FrameRateDivider=3
CurrentFrame=1

```

### Available Options

| Variable / Setting | Description |
| --- | --- |
| **Update** | Specifies how often the skin updates in milliseconds. Setting this to a very low value (like `1`) ensures maximum fluid rendering but might cause lag on lower-end systems. Increase this if you experience performance drops. |
| **Width** | Width of the image widget |
| **Height** | Height of the image widget |
| **FrameCount** | Total number of frames extracted (Must match your GIF) |
| **FrameRateDivider** | Controls playback speed (Higher value = slower playback) |

> **Note:** To see the frame counter on your screen for debugging, look at the bottom of `RainGIF.ini` and uncomment the `[MeterDebug]` meter by removing the semicolons (`;`).

## How It Works

The batch file feeds your `input.gif` into `ffmpeg`, splitting it cleanly into sequentially numbered images (`frame1.png`, `frame2.png`, etc.) inside the `@Resources\frames\` folder.

Once loaded, Rainmeter uses a native `Calc` measure that increments a variable count on every update tick. A basic image meter then uses this dynamic variable to rapidly swap the source image filename, rebuilding the moving image perfectly.

## Credits

Created by **Outlawishhh**

Designed and implemented from scratch for Rainmeter.

## License

Copyright (C) 2026 Outlawishhh

Licensed under the GNU General Public License v3.0 (GPL-3.0).

You are free to use, modify, and redistribute this project under the terms of the GPL-3.0 license. Any distributed modifications must also remain open source and retain attribution to the original author.

See the [LICENSE](https://www.google.com/search?q=LICENSE) file for details.
