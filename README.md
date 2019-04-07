# Coding Challenge
# Part 1
Please read [The Sreenivasan Lab Coding Manual](https://github.com/vbabushkin/CodingChallenge/blob/master/The%20Sreenivasan%20Lab%20Coding%20Manual.docx) before starting the coding challenge.
# Part 2
You are provided with a real, though quite simple, experiment code ( so called TRST for Triangle Rotated Stimulus Test ).  
In TRST folder locate [main.m](https://github.com/vbabushkin/CodingChallenge/blob/master/TRST/main.m)and open it in Matlab, run it and go through all the trials. 
As soon as you run the main.m you will see in Command Line window a following prompt, asking to submit subject and session number. You can type any integer for subject and session number. 

`
Please type subject number: 0
`

`
Please type session number: 0
`

Type 1 for the prompt asking for the distance from the screen:

`
Is the Viewing Distance -- 60.0cm (Yes = 1, No = 0)  1
`
# Coding Challenge Questions
1.	The user results file and log file overwrites each time you run the main.m (for given date). Please modify the code to prevent overwriting of data files.
2.	Each time the code generates a new taskmap for any subject except for subject # 0. However, if the taskmap for given subject already exists it does not allow to proceed with this subject within the same session throwing the following error:


`
Error using initSubjectInfo (line 57)
`

`
ERROR! Result data file already exists! Choose a different subject/session number.
`

This is a good practice preventing overwriting files. Add a feature, allowing the experimenter to select whether the taskmap file should be overwritten or not. 

3. The probe triangle orientation is selected randomly. However, in several cases it overlays the stimulus triangle and the subject has nothing to do but just to submit the response without rotating the triangle. Modify the code to ensure the difference btw stimulus and presented probe triangle orientations no less than 30 degrees. 

4. Currently the task consists of 10 trials. However, if the number of trials increases we need to let the subject rest after some number of trials is completed. Please introduce a functionality into the program, that splits the number of trials into a specified number of blocks. There should be a break screen with the following text: 'End of Block (block number). Press Space to Continue'. This functionality should allow the participant to start the next block themselves by pressing the Space Key.

5.	Add code to [showFeedbackWindow.m](https://github.com/vbabushkin/CodingChallenge/blob/master/TRST/showFeedbackWindow.m) function to show feedback on screen after every trial. The feedback must include the Number of points earned for the current trial, the total number of points earned and the reported orientation (black triangle) overlayed to the actual orientation (white triangle).
6.	Modify the code to allow the experimenter to exit the program any time ‘Q’ key is pressed. Make sure that adding this functionality updates the resReport so that no data is lost if the program is quit.
7.	For some MEG and fMRI experiments we use a buttonbox to submit the responses  and a dial for rotations. Since you dont have a dial or a buttonbox, yu have to immitate this functionality with your computer keyboard. Create a new version of the code to allow subject to roate the cursor (‘t’ key – rotates clockwise, ‘b’ –key counterclockwise) and lock your responses pressing any key from 1 to 4 (immitates buttonbox functionality).

## Part 3
There are different ways to measure the working memory capacity. The widely accepted one is closely related to the notion of “set size” – the number of items stored in the working memory.  Currently our code asks to remember only one stimulus.
1.	Modify the code to remember five stimuli. Create 12 different orientations and select 5 in random every time the experiment is run. For example below we have selected following 5 out of 12 main orientations [30, 90, 150, 270, 340]. The triangles must be placed in these orientations plus some jitter between [-10,10]  degrees. Please ensure the triangles are not overlapping.

![alt text](https://github.com/vbabushkin/CodingChallenge/blob/master/img1.png)

2.	In Part 2 the response triangle was presented in the center of the screen. Now that we have five stimuli we need to pick one of them randomly for the participant to report on.  Modify the response screen to present this randomly picked stimulus at its corresponding location. In addition it should be presented in a random orientation. The subject has to adjust the orientation of the triangle. We expect something like this:

![alt text](https://github.com/vbabushkin/CodingChallenge/blob/master/img2.png)

3.	Make sure the feedback reflects these changes.

## Part 4
This part requires you to make a version of the code in which they report color rather than orientation. So, every triangle needs to have a different color and the subject will be asked to report the color of one of the five triangles.

1.	Make another version of task that cues the color. In supportFiles folder load the colorwheel360.mat and pick up 5 main colors for the 5 triangles (must be picked up from 12 equidistant colors in the matrix plus the jitter – within 5 rows up or down). You must get the following stimulus screen:

![alt text](https://github.com/vbabushkin/CodingChallenge/blob/master/img5.png)

2. Replace the orientation wheel with the colorwheel using the code in drawColorwheel.m

3. Modify the code so the color of the triangle changes with the position of the cursor on the colorwheel as it is rotated.

![alt text](https://github.com/vbabushkin/CodingChallenge/blob/master/img3.png)

4.	Make sure the probe screen duration is limited, usually, the subject has to respond within 20 seconds. If no response has been received – the program marks the corresponding values in datafile as “NaN”  and moves to another trial.


