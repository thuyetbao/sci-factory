# (Vision) Implement Captchas OCR

## **Overview**

Captchas are images containing a few characters (usually letters and numbers) that are used to verify that a user is not a bot.
By using a model to guess the characters in the image, it is possible to bypass this security measure for certain services.

This model aims to solve the problem of Captchas recognition by implementing an OCR model using
Convolutional Neural Networks (CNNs), Recurrent Neural Networks (RNNs), and Connectionist Temporal Classification (CTC) loss.

## **Detail**

### **Dataset**

The dataset consists of image files of captchas and their corresponding labels, which are the filename of the image without the file extension.
For example, the image file "km92af.png" has the label "km92af".

### **Flow**

**Step 1**: Download the dataset from the provided link and split it into training and testing sets.

**Step 2**: Build the engine model by using the Functional API and compile it with the Adam optimizer and CTC loss.

**Step 3**: Execute the fit method with epochs 100 and monitor the validation loss.

**Step 4**: Output the model and predict the labels of the testing set.

## **Terms**

[1] Functional API

## **References**

<https://keras.io/examples/vision/captcha_ocr/>
