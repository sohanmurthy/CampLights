CampLights
==========

Whether you're relaxing in the woods or gettin' dusty on the playa, camping is more fun with funky lights!


### Hardware:
The basic system consists of a Raspberry Pi 3, FadeCandy controller, WS2811 LEDs embedded into 14" paper lanterns, and a battery pack. **Lots of assembly is required.** Before you get started, you'll also need plenty of header pins, solder, shrink tubing, and connector wire.

#### Basic stuff
1. Raspberry Pi 3
2. [FadeCandy controller](https://www.adafruit.com/product/1689)
3. WS2811 LEDs (I went with 100 of [these](https://www.amazon.com/Rextin-500PCS-Digital-Addressable-Waterproof/dp/B01AU6UG5C) as they are waterproof and easy to cut apart into smaller strands.
4. A solid battery pack. This is where things can get complicated depending on the scale of your project (more on that below), but for this setup I got a [RAVPower 22000mAh Portable Charger](https://www.amazon.com/RAVPower-Portable-22000mAh-Li-polymer-Smartphone/dp/B01G1XH46M/).

<img src="https://github.com/sohanmurthy/CampLights/blob/master/img/completed_lantern.jpg" width = 50%/>

*One completed lantern*

#### Add-ons!
1. [RGB-123 FadeCandy breakout board](http://rgb-123.com/product/fadecandy-breakout/). This thing makes working with a FadeCandy so, so much easier. Worth the extra money in my opinion.
2. 3-pin weatherproof connectors. You're likely going to be splitting up your LEDs into smaller strands for flexible arrangements. These connectors provide additional safety and security in the outdoors. I purchased [these 22mm diameter connectors](https://www.amazon.com/gp/product/B01EMFU30U/). They're quite hefty. The smaller ones would be sufficient.
6. A weatherproof box to house everything in. [This one](https://www.amazon.com/gp/product/B00274SLK8/) fits the bill nicely.
7. Paper lanterns! [14" diameter lanterns](https://www.amazon.com/Just-Artifacts-White-Paper-Lanterns/dp/B01CEXC0BW/) neatly fit 5 LEDs each if you purchase the configuration above.

<img src="https://github.com/sohanmurthy/CampLights/blob/master/img/one_strand.jpg" width = 50%/>

*A 5-LED strand with 3-pin weatherproof connectors*

#### Batteries? How do they work?

In theory, one WS2811 LED consumes 60 mA (milliamps) of power. That's assuming its running max white, full brightness. That doesn't sound like much but if you do the math for this setup, 60 mA * 100 LEDs = 6A of current.

That's a lot of current. Way more than the 2.4 amps the battery I chose can put out. To meet the 6A power requirement, you'd probably need a hefty 12V lead acid battery with a step-down converter.

However, practically speaking, for an artsy installation like this one, there is *never* a situation where all 100 LEDs are running max white, full brightness. In my tests, the battery pack above performs great. It can power the whole installation, including Raspberry Pi, for well over 8 hours without overheating or generally breaking a sweat. (If you're doing the math at home, 22Ah / 2.4A = ~9 hours of battery life.)

If your installation is more than 100 LEDs, disregard everything I just said. You really *do* need something hefty that can chuck out a lot of amps.

<img src="https://github.com/sohanmurthy/CampLights/blob/master/img/eletrical_box.jpg" width=50%/>

*All the stuff in a weatherproof box*


### Software installation:

1. Install [Processing 3](https://processing.org/download/?processing) onto your Raspberry Pi by running `curl https://processing.org/download/install-arm.sh | sudo sh`
2. Install [Fadecandy server](https://github.com/scanlime/fadecandy)
3. Clone this repo into your Processing sketchbook folder.

Special thanks to [Mark Slee](https://github.com/mcslee/) & [Heron Arts](https://github.com/heronarts/) for developing [LX Studio](http://lx.studio) and the [P3LX library]((https://github.com/heronarts/P3LX)), which powers this setup.
