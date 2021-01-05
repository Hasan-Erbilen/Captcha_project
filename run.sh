

now=$(date)
echo "$now"
echo "Current date: $now"

modelFile="TRAIN_sonuc"
captchaDir="ERBILENH-project2rpi "
outputFile="OUTPUT.txt"

outputModified=" M $outputFile"
newOutputFileAdded="?? $outputFile"
modelModified=" M $outputFile"



# create venv if none exists
if [  ! -d "./temp/bin" ]; then
    
    echo "Creating venv..."
    python3 -m venv temp python=3.8

    # virtual env is activated
    echo "Activating venv..."
    . ./temp/bin/activate

    echo "Installing wheel..."
    pip3 install wheel
 
    echo "Installing tflite_runtime..."
    pip3 install https://github.com/google-coral/pycoral/releases/download/release-frogfish/tflite_runtime-2.5.0-cp38-cp38-linux_armv7l.whl

    echo "Installing cv2..."
    pip3 install opencv-python

    echo "Installing numpy..."
    pip3 install numpy
else
    echo "Venv already exists"
    source temp/bin/activate
fi



echo "Enter details to pull from raspCaptcha repo:"
git checkout origin/main classify.py
git checkout origin/main $modelFile

python3 classify.py --model-name $modelFile --captcha-dir  $captchaDir $outputFile --symbols piazza_2.txt


status=`git status --porcelain`

if [[ "$status" == "$outputModified" ]] || [[ "$status" == "$newOutputFileAdded" ]]; then
    echo "Output file has been changed:"
    echo "$status"
    git add $outputFile
    git commit -a -m "Current changes: $outputFile $now"
    git push
elif [[ "$status" ]]; then
    echo "Some other files have been changed:"
    echo "$status"
else
    echo "No file changes in the output detected!"
fi
