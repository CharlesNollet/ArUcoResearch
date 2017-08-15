#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include "aruco.h"
using namespace cv;
using namespace aruco;

bool The3DInfoAvailable = false;
float TheMarkerSize = 1.6;
VideoCapture TheVideoCapturer;
Mat TheInputImage;
CameraParameters TheCameraParameters;
MarkerMap TheMarkerMapConfig;
MarkerDetector TheMarkerDetector;
MarkerMapPoseTracker TheMSPoseTracker;

int main(int argc, char **argv) {
    TheMarkerMapConfig.readFromFile("../mapGun.yml");
    // read from camera or from  file
    TheVideoCapturer.open(0);
    // check video is open
    if (!TheVideoCapturer.isOpened())  throw std::runtime_error("Could not open video");

    // read first image to get the dimensions
    TheVideoCapturer >> TheInputImage;
    // read camera parameters if passed
    TheCameraParameters.readFromXMLFile("../out.yml");
    TheCameraParameters.resize(TheInputImage.size());
       
	//prepare the detector
    /*MarkerDetector::Params params=TheMarkerDetector.getParams();
    params._cornerMethod=MarkerDetector::SUBPIX;
    params._subpix_wsize= (15./2000.)*float(TheInputImage.cols) ;//search corner subpix in a 5x5 widow area
    TheMarkerDetector.setParams(params);*/

    //prepare the pose tracker if possible
    //if the camera parameers are avaiable, and the markerset can be expressed in meters, then go
    if ( TheMarkerMapConfig.isExpressedInPixels() && TheMarkerSize>0)
        TheMarkerMapConfig=TheMarkerMapConfig.convertToMeters(TheMarkerSize);
	cout<<"TheCameraParameters.isValid()="<<TheCameraParameters.isValid()<<" "<<TheMarkerMapConfig.isExpressedInMeters()<<endl;
    if (TheCameraParameters.isValid() && TheMarkerMapConfig.isExpressedInMeters()  )
        TheMSPoseTracker.setParams(TheCameraParameters,TheMarkerMapConfig);

	float orientation[4];
	float position[3];
	bool print=false;
    do {
        TheVideoCapturer.retrieve(TheInputImage);
        // Detection of the board
        vector<aruco::Marker> detected_markers=TheMarkerDetector.detect(TheInputImage);
        //print the markers detected that belongs to the markerset
        for(auto idx:TheMarkerMapConfig.getIndices(detected_markers)){
            //detect 3d info if possible
           	if (TheMSPoseTracker.isValid()){
               	if ( TheMSPoseTracker.estimatePose(detected_markers)){
					cv::Mat matrix=TheMSPoseTracker.getRTMatrix();
					position[0]=-1*matrix.at<float> (0,3);
					position[1]=-1*matrix.at<float> (1,3);
					position[2]=matrix.at<float> (2,3);
					//orientation[0]=sqrt(1+matrix.at<float> (0,0)+matrix.at<float> (1,1)+matrix.at<float> (2,2))/2;
					//orientation[1]=(matrix.at<float> (2,1)-matrix.at<float> (1,2))/(4*orientation[0]);
					//orientation[2]=(matrix.at<float> (0,2)-matrix.at<float> (2,0))/(4*orientation[0]);
					//orientation[3]=(matrix.at<float> (1,0)-matrix.at<float> (0,1))/(4*orientation[0]);
					float trace = matrix.at<float> (0,0) + matrix.at<float> (1,1) + matrix.at<float> (2,2);
  					if( trace > 0 ) {// I changed M_EPSILON to 0
    					float s = 0.5f / sqrtf(trace+ 1.0f);
    					orientation[0] = 0.25f / s;
    					orientation[1] = ( matrix.at<float> (2,1)-matrix.at<float> (1,2)) * s;
    					orientation[2] = ( matrix.at<float> (0,2)-matrix.at<float> (2,0)) * s;
    					orientation[3] = ( matrix.at<float> (1,0)-matrix.at<float> (0,1)) * s;
  					} else {
    					if ( matrix.at<float> (0,0) > matrix.at<float> (1,1) && matrix.at<float> (0,0) > matrix.at<float> (2,2)) {
     						float s = 2.0f * sqrtf( 1.0f + matrix.at<float> (0,0) - matrix.at<float> (1,1) - matrix.at<float> (2,2));
      						orientation[0] = (matrix.at<float> (2,1) - matrix.at<float> (1,2)) / s;
      						orientation[1] = 0.25f * s;
      						orientation[2] = (matrix.at<float> (0,1) + matrix.at<float> (1,0)) / s;
      						orientation[3] = (matrix.at<float> (0,2) + matrix.at<float> (2,0)) / s;
    					} else if (matrix.at<float> (1,1) > matrix.at<float> (2,2)) {
      						float s = 2.0f * sqrtf( 1.0f + matrix.at<float> (1,1) - matrix.at<float> (0,0) - matrix.at<float> (2,2));
      						orientation[0] = (matrix.at<float> (0,2) - matrix.at<float> (2,0)) / s;
      						orientation[1] = (matrix.at<float> (0,1) + matrix.at<float> (1,0)) / s;
      						orientation[2] = 0.25f * s;
      						orientation[3] = (matrix.at<float> (1,2) + matrix.at<float> (2,1)) / s;
    					} else {
      						float s = 2.0f * sqrtf( 1.0f + matrix.at<float> (2,2) - matrix.at<float> (0,0) - matrix.at<float> (1,1));
      						orientation[0] = (matrix.at<float> (1,0) - matrix.at<float> (0,1) ) / s;
      						orientation[1] = (matrix.at<float> (0,2) + matrix.at<float> (2,0)) / s;
      						orientation[2] = (matrix.at<float> (1,2) + matrix.at<float> (2,1)) / s;
      						orientation[3] = 0.25f * s;
   	 					}
  					}
              	}
			}
			print = true;
		}
		if(print){
			for(unsigned int j = 0; j < sizeof(position)/sizeof(*position); j++){
        		float test = position[j];
        		cout << test << " ";
        	}
        	cout<<" : ";
    	    for(unsigned int j = 0; j < sizeof(orientation)/sizeof(*orientation); j++){
        		float test2 = orientation[j];
        		cout << test2 << " ";
        	}
        	cout << endl;
			print=false;
		}
		
    } while (TheVideoCapturer.grab() );
}

