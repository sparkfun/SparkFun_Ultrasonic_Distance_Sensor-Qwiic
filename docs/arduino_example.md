---
icon: simple/arduino
---

Now that we've installed the Arduino library, it's time to upload our first sketch to make sure everything is working properly.


###Example 1

This first example just does some basic measurements. To find Example 1, go to **File** > **Examples** > **SparkFun Qwiic Ultrasonic Arduino Library** > **Example1_BasicReadings**:


<figure markdown>
[![Ultrasonic Arduino Example 1](assets/img/Example1_Menu.jpg){ width="90%" }](assets/img/Example1_Menu.jpg "Click to enlarge")
<figcaption markdown>Finding Example 1</figcaption>
</figure>

Alternatively, you can expand the link below and copy and paste the code into a shiny new Arduino sketch: 

??? "Example 1 Arduino Code"
	```
	--8<-- "https://raw.githubusercontent.com/sparkfun/SparkFun_Qwiic_Ultrasonic_Arduino_Library/v10/examples/Example1_BasicReadings/Example1_BasicReadings.ino"
	```


Make sure you've selected the correct board and port in the Tools menu and then hit the upload button. Once the code has finished uploading, go ahead and open a [Serial Monitor](https://learn.sparkfun.com/tutorials/terminal-basics). You should see something similar to the following. 

<figure markdown>
[![Ultrasonic Distance Sensor Arduino Example 1 Output](assets/img/Example1_Output.jpg){ width="90%" }](assets/img/Example1_Output.jpg "Click to enlarge")
<figcaption markdown>Example 1 Output</figcaption>
</figure>

Note the output change when the mouse is moved closer to the sensor. 



### Example 2

Let's add in an LCD screen to display our measurements. For this example you will need another [Qwiic Cable](https://www.sparkfun.com/products/14427) and the [SparkFun Qwiic OLED Display (0.91 in., 128x32)](https://www.sparkfun.com/products/24606).

To display the sensor readings on the connected Qwiic OLED, we will need to install the SparkFun Qwiic OLED library. You can install this library to automatically in the Arduino IDE's Library Manager by searching for "**SparkFun Qwiic OLED**". Or you can manually download it from the [GitHub repository](https://github.com/sparkfun/SparkFun_Qwiic_OLED_Arduino_Library). 

<center>
	[Download the SparkFun Qwiic OLED Library (ZIP)](https://github.com/sparkfun/SparkFun_Qwiic_OLED_Arduino_Library/archive/refs/heads/main.zip){ .md-button .md-button--primary }
</center>



To find Example 2, go to **File** > **Examples** > **SparkFun Qwiic Ultrasonic Arduino Library** > **Example2_OLED_Distance**:


<figure markdown>
[![Ultrasonic Arduino Example 2](assets/img/Example2_Menu.jpg){ width="90%" }](assets/img/Example2_Menu.jpg "Click to enlarge")
<figcaption markdown>Finding Example 2</figcaption>
</figure>

Alternatively, you can expand the link below and copy and paste the code into a shiny new Arduino sketch: 

??? "Example 2 Arduino Code"
	```
	--8<-- "https://raw.githubusercontent.com/sparkfun/SparkFun_Qwiic_Ultrasonic_Arduino_Library/v10/examples/Example2_OLED_Distance/Example2_OLED_Distance.ino"
	```

We have code, now let's hookup the hardware! The Qwiic system makes this example quite literally plug and play. Use Qwiic cables to make your hardware setup look like this: 

<figure markdown>
[![Example 2 Hardware Hookup](assets/img/24805-Ultrasonic-Distance-Sensor-Action-4.jpg){ width="90%" }](assets/img/24805-Ultrasonic-Distance-Sensor-Action-4.jpg "Click to enlarge")
<figcaption markdown>Example 2 Hardware Hookup</figcaption>
</figure>


Make sure you've selected the correct board and port in the Tools menu and then hit the upload button. Once the code has finished uploading, you should see something similar to the following. 


<figure markdown>
[![Oh no! A dinosaur is approaching distance sensor and now it's only 61mm away!](assets/img/SEN-24805-GIF.gif){ width="90%" }](assets/img/SEN-24805-GIF.gif "Click to enlarge")
<figcaption markdown>Run away!</figcaption>
</figure>


Try moving an object (like your hand or a dinosaur) closer to the sensor - notice the output of the OLED shows you how close the object is! Grr. Rawr!

### Going Further

There are more examples in the Arduino Library that allow you to change the I<sup>2</sup>C address or use the Trigger and Echo Pins. Feel free to check them out! 