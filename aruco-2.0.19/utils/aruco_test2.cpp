/*****************************************************************************************
Copyright 2011 Rafael Muñoz Salinas. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are
permitted provided that the following conditions are met:

   1. Redistributions of source code must retain the above copyright notice, this list of
      conditions and the following disclaimer.

   2. Redistributions in binary form must reproduce the above copyright notice, this list
      of conditions and the following disclaimer in the documentation and/or other materials
      provided with the distribution.

THIS SOFTWARE IS PROVIDED BY Rafael Muñoz Salinas ''AS IS'' AND ANY EXPRESS OR IMPLIED
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Rafael Muñoz Salinas OR
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The views and conclusions contained in the software and documentation are those of the
authors and should not be interpreted as representing official policies, either expressed
or implied, of Rafael Muñoz Salinas.
********************************************************************************************/
#include <string>
#include <iostream>
#include <fstream>
#include <sstream>
#include "aruco.h"
#include "cvdrawingutils.h"
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
using namespace cv;
using namespace aruco;

MarkerDetector MDetector;
VideoCapture TheVideoCapturer;
vector< Marker > TheMarkers;
Mat TheInputImage, TheInputImageCopy;
CameraParameters TheCameraParameters;
struct SavedPose{
	float position2[3];
	float orientation2[4];
};
float t[3];
float r[4];
SavedPose pose;

int main(int argc, char **argv) {
        ///////////  PARSE ARGUMENTS
        string TheInputVideo = "live";
        // read camera parameters if passed
        TheCameraParameters.readFromXMLFile("../out.yml");
        float TheMarkerSize = 2;
        ///////////  OPEN VIDEO
        // read from camera or from  file
        int vIdx = 0;
        // check if the :idx is here
        cout << "Opening camera index " << vIdx << endl;
        TheVideoCapturer.open(vIdx);
        // check video is open
        if (!TheVideoCapturer.isOpened()) {
        	cout<<"Could not open video"<<endl;
        	throw std::runtime_error("Could not open video");
        }
        ///// CONFIGURE DATA
        // read first image to get the dimensions
        TheVideoCapturer >> TheInputImage;
        Rect rect(0, 0, TheInputImage.cols/3, TheInputImage.rows/3);
		Mat true_img = TheInputImage(rect).clone();
        if (TheCameraParameters.isValid())
            TheCameraParameters.resize(true_img.size());

        MDetector.setThresholdParams(7, 7);
        MDetector.setThresholdParamRange(2, 0);
        //MDetector.setCornerRefinementMethod(aruco::MarkerDetector::SUBPIX);

        int index = 0;
        // capture until press ESC or until the end of the video
		bool write=true;
		bool read =true;
        do {
            TheVideoCapturer.retrieve(TheInputImage);
            //Rect rect(0, 0, TheInputImage.cols/3, TheInputImage.rows/3);
			//Mat true_img = TheInputImage(rect).clone();
            // Detection of markers in the image passed
            //TheMarkers= MDetector.detect(true_img, TheCameraParameters, TheMarkerSize);
            TheMarkers= MDetector.detect(TheInputImage, TheCameraParameters, TheMarkerSize);
	    	double position[3];
	    	double orientation[4];
            // print marker info
            for (unsigned int i = 0; i < TheMarkers.size(); i++) {
            if(TheMarkers[i].id==213&&read){
				TheMarkers[i].OgreGetPoseParameters(position,orientation);
				for(unsigned int j = 0; j < sizeof(position)/sizeof(*position); j++){
					pose.position2[j]=position[j];
		    		cout << pose.position2[j] << " ";
				}
				cout<<" : ";
            	for(unsigned int j = 0; j < sizeof(orientation)/sizeof(*orientation); j++){
		    		pose.orientation2[j]=orientation[j];
		    		cout << pose.orientation2[j] << " ";
				}
				cout << endl;
				write = true;
				read = false;
            }else if (TheMarkers[i].id==115&&read){
           		TheMarkers[i].OgreGetPoseParameters(position,orientation);
            	if(write){
            		for(unsigned int j=0;j<3;j++){
            			t[j]=position[j]-pose.position2[j];
            		}
            		for(unsigned int j=0;j<4;j++){
            			r[j]=orientation[j]-pose.orientation2[j];
            		}
            		write = false;
            	}
            	for(unsigned int j = 0; j < sizeof(position)/sizeof(*position); j++){
		    		cout << position[j]-t[j] << " ";
				}
				cout<<" : ";
            	for(unsigned int j = 0; j < sizeof(orientation)/sizeof(*orientation); j++){
		    		cout << orientation[j]-r[j] << " ";
				}
				cout << endl;
				read = false;
            }else if (TheMarkers[i].id==73&&read){
           		TheMarkers[i].OgreGetPoseParameters(position,orientation);
            	if(write){
            		for(unsigned int j=0;j<3;j++){
            			t[j]=position[j]-pose.position2[j];
            		}
            		for(unsigned int j=0;j<4;j++){
            			r[j]=orientation[j]-pose.orientation2[j];
            		}
            		write = false;
            	}
            	for(unsigned int j = 0; j < sizeof(position)/sizeof(*position); j++){
		    		cout << position[j]-t[j] << " ";
				}
				cout<<" : ";
            	for(unsigned int j = 0; j < sizeof(orientation)/sizeof(*orientation); j++){
		    		cout << orientation[j]-r[j] << " ";
				}
				cout << endl;
				read = false;
            }
            }
            read = true;
        } while (TheVideoCapturer.grab());
}
