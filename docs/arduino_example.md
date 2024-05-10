---
icon: simple/arduino
---

Now that we've installed the Arduino, it's time to upload our first sketch to make sure everything is working properly.


Our friends over at Zio have provided an example to get you started with this Ultrasonic Distance Sensor. In order to do so, you'll need to install a few libraries first. 


To display the sensor readings on the connected Qwiic OLED, we will use three Adafruit libraries:

* [Adafruit BusIO GitHub](https://github.com/adafruit/Adafruit_BusIO)
* [Adafruit GFX GitHub](https://github.com/adafruit/Adafruit-GFX-Library)
* [Adafruit SSD1306 GitHub](https://github.com/adafruit/Adafruit_SSD1306)

#### Adafruit BusIO Library

You can install this library to automatically in the Arduino IDE's Library Manager by searching for "**Adafruit BusIO**". Or you can manually download it from the [GitHub repository](https://github.com/adafruit/Adafruit_BusIO). 

-> <!-- button(Download the Adafruit BusIO Library (ZIP), https://github.com/adafruit/Adafruit_BusIO/archive/master.zip) --> <-

#### Adafruit GFX Library

You can install this library to automatically in the Arduino IDE's Library Manager by searching for "**Adafruit GFX**". Or you can manually download it from the [GitHub repository](https://github.com/adafruit/Adafruit-GFX-Library). 

-> <!-- button(Download the Adafruit GFX Library (ZIP), https://github.com/adafruit/Adafruit-GFX-Library/archive/master.zip) --> <-

####Adafruit SSD1306 Library

You can install this library to automatically in the Arduino IDE's Library Manager by searching for "**Adafruit SSD1306 Library**". Or you can manually download it from the [GitHub repository](https://github.com/adafruit/Adafruit_SSD1306). 

-> <!-- button(Download the Adafruit SSD1306 Library (ZIP), https://github.com/adafruit/Adafruit_SSD1306/archive/master.zip) --> <-

<br />

<div class="alert alert-info" role="alert">
  <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
   <strong>Pro tip: </strong> Trying to do a search for the Adafruit libraries and not finding them? Make sure you have the Adafruit json link in your Preferences. After your SparkFun json link, of course. <br /><br />
   
   <img src="https://cdn.sparkfun.com/assets/learn_tutorials/1/5/9/8/AdafruitJSONinPreferences.png" alt="Image of preferences dialog">

</div>

###Example 1

This example lives in the [GitHub Repo](https://github.com/sparkfun/Zio-Qwiic-Ultrasonic-Distance-Sensor) in the <i>Arduino</i> folder. Feel free to download the code, alternatively you can copy the code below into a blank Arduino sketch. Select your board (for this example we'd select "SparkFun RedBoard") and the port your board has enumerated on. Go ahead and upload your code. 
Alternatively, you can expand the link below and copy and paste the code into a shiny new Arduino sketch: 

??? "Example 1 Arduino Code"
	```
	--8<-- "https://raw.githubusercontent.com/sparkfun/SparkFun_LSM6DSV16X_Arduino_Library/main/examples/example1_basic/example1_basic.ino"
	```

Make sure you've selected the correct board and port in the Tools menu and then hit the upload button. Once the code has finished uploading, go ahead and open a [Serial Monitor](https://learn.sparkfun.com/tutorials/terminal-basics). You should see something similar to the following. Note the obvious changes where the sensor was turned upright. 

<figure markdown>
[![LSM6DSV16X Arduino Example 1 Output](assets/imgs/Example1_Output.jpg){ width="90%" }](assets/imgs/Example1_Output.jpg "Click to enlarge")
<figcaption markdown>Example 1 Output</figcaption>
</figure>


Try moving an object (like your hand or a dinosaur) closer to the sensor - notice the output of the OLED shows you how close the object is! Grr. Rawr!

-> [![Oh no! A dinosaur is approaching distance sensor and now it's only 61mm away!](https://cdn.sparkfun.com/assets/learn_tutorials/1/5/9/8/Ultrasonic_HC-SR04.gif)](https://cdn.sparkfun.com/assets/learn_tutorials/1/5/9/8/Ultrasonic_HC-SR04.gif) <-

->_Curse your sudden but inevitable betrayal!_<-

<!--Open the [Arduino Serial Monitor](https://learn.sparkfun.com/tutorials/terminal-basics/arduino-serial-monitor-windows-mac-linux) at **9600** baud to start viewing the distance sensing information!

Try moving an object (your hand or a dinosaur) closer to the sensor - notice the output of the 
-->




