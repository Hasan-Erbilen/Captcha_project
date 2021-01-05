# Project2
This project is about applying a deep learning approach (CNN) in order to break variable length captchas in python.
Required dependencies: python-captcha, opencv, python-tensorflow (CPU or GPU)

# Generating captchas
This generates 150000 128x64 pixel captchas with 6 symbols per captcha, using the
set of symbols in the piazza_2.txt file. The captchas are stored in the folder
test folders, which is created if it doesn't exist. The names of the captcha images
are scrambled.

   ./generate.py -S piazza_2.txt -c 150000 -o train

   ./generate.py -S piazza_2.txt -c 30000 -o valitaion


To train and validate a neural network, we need two sets of data: a big
training set, and a smaller validation set. The network is trained on the
training set, and tested on the validation set, so it is very important that
there are no images that are in both sets.
# Training the model

  python3 Train.py --width 128 --height 64 --length 6 --symbols symbols.txt --batch-size 4 --epochs 2 --output-model TRAIN_sonuc.h5 --train-dataset train --validate-dataset validation

Train the neural network for 8 epochs on the data specified.The suggested training dataset size for the initial training for captcha length of 6 symbols
is 1500000 images, with a validation dataset size of 30000 images.

# Running the classifier
You should be in the virtual environment and should to install these library before run this command.
-	pip3 install wheel
- pip3 install https://github.com/google-coral/pycoral/releases/download/release-frogfish/tflite_runtime-2.5.0-cp38-cp38-linux_armv7l.whl
-	pip3 install opencv-python
-	pip3 install numpy
and then run the classsifier

   python3 classify.py --model-name TRAIN_sonuc --captcha-dir  ERBILENH-project2rpi --output last_output.txt --symbols piazza_2.txt

# Alternative 
You can the script bash run.sh as an alternative :)






