---
icon: material/book-open-page-variant
---


<div class="grid cards desc" markdown>

-    <a href="https://www.sparkfun.com/products/24805">
    **SparkFun Ultrasonic Distance Sensor - TCT40 (Qwiic)**<br>
    **SKU:** SEN-24805

    ---

    <figure markdown>
    ![Product Thumbnail](https://cdn.sparkfun.com/r/600-600/assets/parts/2/5/0/9/7/SEN-24805-Ultrasonic-Distance-Sensor-Feature_2.jpg)
    </figure></a>
    
-    The SparkFun Qwiic Ultrasonic Distance Sensor, a user-friendly upgrade to the popular HC-SR04 sensor, offers non-contact distance measurement from 2cm to 400cm with an accuracy of 3mm. This sensor is designed to seamlessly integrate with the Qwiic ecosystem for I<sup>2</sup>C communication, making it a breeze to add to your existing projects and daisy-chain with other Qwiic components.

    With its wide range of applications, the SparkFun Qwiic Ultrasonic Distance Sensor is a versatile tool for robotics projects, obstacle avoidance systems, and any application that requires accurate distance measurement without physical contact. Its adaptability makes it a valuable addition to your toolkit.


    <center>
    [Purchase from SparkFun :fontawesome-solid-cart-plus:{ .heart }](https://www.sparkfun.com/products/24805){ .md-button .md-button--primary }
    </center>

</div>

## Required Materials

To follow along with this tutorial, you will need the following materials. You may not need everything though depending on what you have. Add it to your cart, read through the guide, and adjust the cart as necessary.

<table style="border-style:none">
    <tr>
        <td>
            <a href="https://www.sparkfun.com/products/24805">
                <center><img src="https://cdn.sparkfun.com/r/600-600/assets/parts/2/5/0/9/7/SEN-24805-Ultrasonic-Distance-Sensor-Feature_2.jpg" style="width:140px; height:140px; object-fit:contain;" alt="SparkFun Ultrasonic Distance Sensor - TCT40 (Qwiic)"></center>
                <h3 class="title">SparkFun Ultrasonic Distance Sensor - TCT40 (Qwiic)</h3>
            </a>
            SEN-24805
        </td>
        <td>
            <a href=" https://www.sparkfun.com/products/10215">
                <center><img src="https://cdn.sparkfun.com//assets/parts/4/5/5/8/10215-01.jpg" style="width:140px; height:140px; object-fit:contain;" alt="USB micro-B Cable - 6 Foot" height="140"></center>
                <h3 class="title">USB micro-B Cable - 6 Foot</h3>
            </a>
            CAB-10215
        </td>
<!--        <td>
            <a href="https://www.sparkfun.com/products/17153">
                <center><img src="https://cdn.sparkfun.com//assets/parts/1/6/1/3/5/17153-SparkFun_Qwiic_OLED_Display__0.91_in__128x32_-05.jpg" style="width:140px; height:140px; object-fit:contain;" alt="SparkFun Qwiic OLED Display (0.91 in., 128x32)" >
                </center>
                <h3 class="title">SparkFun Qwiic OLED Display (0.91 in., 128x32)</h3>
            </a>
            LCD-17153
        </td>-->
        <td>
            <a href="https://www.sparkfun.com/products/14427">
                <center><img src="https://cdn.sparkfun.com//assets/parts/1/2/4/5/3/14427-Qwiic_Cable_-_100mm-01.jpg" style="width:140px; height:140px; object-fit:contain;" alt="Qwiic Cable - 100mm" >
                </center>
                <h3 class="title">Qwiic Cable - 100mm</h3>
            </a>
            PRT-14427
        </td>
        <td>
            <a href="https://www.sparkfun.com/products/15123">
                <center><img src="https://cdn.sparkfun.com//assets/parts/1/3/4/9/2/15123-SparkFun_RedBoard_Qwiic-01a.jpg" style="width:140px; height:140px; object-fit:contain;" alt="SparkFun RedBoard Qwiic" >
                </center>
                <h3 class="title">SparkFun RedBoard Qwiic</h3>
            </a>
            DEV-15123
        </td>
    </tr>
</table>


## Suggested Reading

Below are a few tutorials that may help users familiarize themselves with various aspects of the board.

<div class="grid cards hide col-4" markdown align="center">

-   <a href="https://learn.sparkfun.com/tutorials/how-to-solder-through-hole-soldering">
    <figure markdown>
    ![How to Solder: Through-Hole Soldering](https://cdn.sparkfun.com/assets/learn_tutorials/5/Soldering_Action-01.jpg)
    </figure>
    </a>
    <a href="https://learn.sparkfun.com/tutorials/how-to-solder-through-hole-soldering">**How to Solder: Through-Hole Soldering**
    </a>

-   <a href="https://learn.sparkfun.com/tutorials/82">
    <figure markdown>
    ![I2C](https://cdn.sparkfun.com/assets/learn_tutorials/8/2/I2C-Block-Diagram.jpg)
    </figure>
    </a>
    <a href="https://learn.sparkfun.com/tutorials/82">**I2C**
    </a>

-   <a href="https://learn.sparkfun.com/tutorials/terminal-basics">
    <figure markdown>
    ![SPI](https://cdn.sparkfun.com/assets/learn_tutorials/1/1/2/terminalThumb.jpg)
    </figure>
    </a>
    <a href="https://learn.sparkfun.com/tutorials/terminal-basics">**Serial Terminal Basics**
    </a>
</div>

<center>
<div align="center">
    <div style="top:5px;left:5px;background-color:Gray;position:relative">
        <div style="top:-5px;left:-5px;background-color:#ffffff;position:relative;border:1px solid black;">
            <a href="https://www.sparkfun.com/qwiic"><img src="https://cdn.sparkfun.com/assets/custom_pages/2/7/2/qwiic-logo.png" alt="Qwiic Connect System" title="Qwiic Connect System"></a>
        </div>
    </div>
</div>
</center>

The SparkFun Ultrasonic Distance Sensor - TCT40 (Qwiic) takes advantage of the [Qwiic connect system](https://www.sparkfun.com/qwiic). We recommend familiarizing yourself with the **Logic Levels** and **I<sup>2</sup>C** tutorials.  Click on the banner above to learn more about [Qwiic products](https://www.sparkfun.com/qwiic).

<center>
    <iframe width="600" height="327" src="https://www.youtube.com/embed/x0RDEHqFIF8" title="SparkFun's Qwiic Connect System" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</center>
