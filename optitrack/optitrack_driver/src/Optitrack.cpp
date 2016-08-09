/*
# Copyright (c) 2011, Georgia Tech Research Corporation
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Georgia Tech Research Corporation nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY GEORGIA TECH RESEARCH CORPORATION ''AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL GEORGIA TECH BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA,
# OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

## author Advait Jain (Healthcare Robotics Lab, Georgia Tech.)
## author Chih-Hung Aaron King (Healthcare Robotics Lab, Georgia Tech.)
*/

//== This application listens for a rigid body named 'Tracker' on a remote machine
//== and publishes & tf it's position and orientation through ROS.


#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <geometry_msgs/TransformStamped.h>
#include <optitrack_driver/OptiTrackData.h>
#include <stdio.h>
#define _USE_MATH_DEFINES //for PI
#include <math.h>
#define PI M_PI

#include <vrpn_Connection.h>
#include <vrpn_Tracker.h> 

#include <LinearMath/btQuaternion.h>

void VRPN_CALLBACK track_target (void *, const vrpn_TRACKERCB t);

class TargetState{
    public:
        geometry_msgs::TransformStamped target;
        optitrack_driver::OptiTrackData target_optitrack;
};


TargetState *target_state;
std::string frame_id;

static int numeric_id = 0;

// set to true in the VRPN callback function.
bool fresh_data = false;
vrpn_TRACKERCB prev_vrpn_data;


class Rigid_Body {
    private:
        ros::Publisher target_pub;
        ros::Publisher target_pub_optitrack;
        tf::TransformBroadcaster br;
        vrpn_Connection *connection;
        vrpn_Tracker_Remote *tracker;

    public:
        Rigid_Body(ros::NodeHandle& nh, std::string server_ip,
                   int port) 
        {
            target_pub = nh.advertise<geometry_msgs::TransformStamped>("pose", 100);
            target_pub_optitrack = nh.advertise<optitrack_driver::OptiTrackData>("/optitrack/data", 1);
            std::string connec_nm = server_ip + ":" + boost::lexical_cast<std::string>(port);
            connection = vrpn_get_connection_by_name(connec_nm.c_str());
            std::string target_name = nh.getNamespace().substr(1);
            tracker = new vrpn_Tracker_Remote(target_name.c_str(), connection);
            this->tracker->register_change_handler(NULL, track_target);
        }

        void publish_target_state(TargetState *target_state)
        {
            br.sendTransform(target_state->target);
            target_pub.publish(target_state->target);
            target_pub_optitrack.publish(target_state->target_optitrack);
        }    	

        void step_vrpn()
        {
            this->tracker->mainloop();
            this->connection->mainloop();
        }
};

//== Tracker Position/Orientation Callback ==--
void VRPN_CALLBACK track_target (void *, const vrpn_TRACKERCB t)
{
    btQuaternion q_orig(t.quat[0], t.quat[1], t.quat[2], t.quat[3]);
    btQuaternion q_fix(0.70710678, 0., 0., 0.70710678);

    // optitrak <-- funky <-- object
    // the q_fix.inverse() esures that when optitrak_funky says 0 0 0
    // for roll pitch yaw, there is still a rotation that aligns the
    // object frame with the /optitrak frame (and not /optitrak_funky)
    btQuaternion q_rot = q_fix * q_orig * q_fix.inverse();

    //btScalar ang = q_rot.getAngle();
    btVector3 axis = q_rot.getAxis();
    btVector3 pos(t.pos[0], t.pos[1], t.pos[2]);
    //btVector3 pos(t.pos[0], -t.pos[2], t.pos[1]);
    //btVector3 new_pos = pos.rotate(axis, ang);

    // verifying that each callback indeed gives fresh data.
    if ( prev_vrpn_data.quat[0] == t.quat[0] and \
         prev_vrpn_data.quat[1] == t.quat[1] and \
         prev_vrpn_data.quat[2] == t.quat[2] and \
         prev_vrpn_data.quat[3] == t.quat[3] and \
         prev_vrpn_data.pos[0] == t.pos[0] and \
         prev_vrpn_data.pos[1] == t.pos[1] and \
         prev_vrpn_data.pos[2] == t.pos[2] )
        ROS_WARN("Repeated Values");

    prev_vrpn_data = t;

    target_state->target.transform.translation.x = pos.x();
    target_state->target.transform.translation.y = pos.y();
    target_state->target.transform.translation.z = pos.z();

/*
    target_state->target.transform.rotation.x = q_rot.x();
    target_state->target.transform.rotation.y = q_rot.y();
    target_state->target.transform.rotation.z = q_rot.z();
    target_state->target.transform.rotation.w = q_rot.w();
    */
    
    target_state->target.transform.rotation.x = q_orig.x();
    target_state->target.transform.rotation.y = q_orig.y();
    target_state->target.transform.rotation.z = q_orig.z();
    target_state->target.transform.rotation.w = q_orig.w();

    target_state->target.header.frame_id = "optitrak";
    target_state->target.child_frame_id = frame_id;
    target_state->target.header.stamp = ros::Time::now();

	//The Vicon axes are different from the optitrack axes
	//Also, Vicon reports in m and Optitrack in cm
    target_state->target_optitrack.position.x = pos.x();
    target_state->target_optitrack.position.y = -pos.z();
    target_state->target_optitrack.position.z = pos.y();
    
    //convert Euler angles from quaternion
    //http://en.wikipedia.org/wiki/Conversion_between_quaternions_and_Euler_angles#Conversion
    double phi, theta, psi;
    double q0, q1, q2, q3;
    //We are converting to Vicon axes, so Z and Y are changed
    //q0 = t.quat[3]; q1 = t.quat[0]; q2 = t.quat[1]; q3 = t.quat[2];
    //q0 = q_rot.w(); q1 = q_rot.x(); q2 = q_rot.y(); q3 = q_rot.z();
    q0 = q_orig.w(); q1 = q_orig.x(); q2 = -q_orig.z(); q3 = q_orig.y();
    
    //This assumes an X,Y,Z rotation order for the euler angles
    //That is, an X,Y,Z in the Vicon frame
#define USE_DEGREES 0
#if (USE_DEGREES)
    
    phi = 180.0/PI*atan2(2.0*(q0*q1 + q2*q3), 1.0 - 2.0*(q1*q1 + q2*q2));
    theta = 180.0/PI*asin(2.0*(q0*q2 - q3*q1));
    psi = 180.0/PI*atan2(2.0*(q0*q3 + q1*q2), 1.0 - 2.0*(q2*q2 + q3*q3));
#else
    phi = atan2(2.0*(q0*q1 + q2*q3), 1.0 - 2.0*(q1*q1 + q2*q2));
    theta = asin(2.0*(q0*q2 - q3*q1));
    psi = atan2(2.0*(q0*q3 + q1*q2), 1.0 - 2.0*(q2*q2 + q3*q3));
#endif //(USE_DEGREES)
    

    target_state->target_optitrack.orientation.x = phi;
    target_state->target_optitrack.orientation.y = theta;
    target_state->target_optitrack.orientation.z = psi;

    target_state->target_optitrack.id = numeric_id;

    target_state->target_optitrack.header.frame_id = std::string(std::string("optitrak") +
			std::string(frame_id)).c_str();
    target_state->target_optitrack.header.stamp = ros::Time::now();

    fresh_data = true;
}



int main(int argc, char* argv[])
{
    ros::init(argc, argv, "vrpn_tracked_object_1");
    ros::NodeHandle nh("~");

    target_state = new TargetState;
    //frame_id = nh.getNamespace().substr(1);
    frame_id = nh.getNamespace();

    std::string vrpn_server_ip;
    int vrpn_port;
    std::string tracked_object_name;

    nh.param<std::string>("vrpn_server_ip", vrpn_server_ip, std::string());
    nh.param<int>("vrpn_port", vrpn_port, 3883);

    nh.param<int>("numeric_id", numeric_id, 0);

    std::cout<<"vrpn_server_ip:"<<vrpn_server_ip<<std::endl;
    std::cout<<"vrpn_port:"<<vrpn_port<<std::endl;

    Rigid_Body tool(nh, vrpn_server_ip, vrpn_port);

    ros::Rate loop_rate(1000);

    while(ros::ok())
    {
        tool.step_vrpn();
        //vrpn_SleepMsecs(10);
        if (fresh_data == true)
        { // only publish when receive data over VRPN.
            tool.publish_target_state(target_state);
            fresh_data = false;
        }
        //ros::spinOnce();
        loop_rate.sleep();
    }
	return 0;
}



