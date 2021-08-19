git clone https://github.com/bclipp/MLOps_lambda_python.git
cd MLOps_lambda_python
#get model
# sudo apt install python3-testresources
pip3 install -t ./package -r requirements.txt
cd package
zip -r9 ../../lambda_deployment_function.zip .
cd ..
rm -rf package/
zip -gr ../lambda_deployment_function.zip *