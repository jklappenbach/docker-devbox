# docker-devbox
A development environment based on docker for ubuntu linux. This was developed from the desire to have a light weight linux development environment on OSX, specifically for C++ projects, where OSX updates can often break tooling.  

## Building
The docker file provided does a few of the things you'll need in order to customize the minimal ubuntu image used.  

- Add apt install statements for any additional packages you need
- Change the user created to your desired.  If root access is fine, you can even remove the user creation.

Once you're set, run ./build-ubuntu-devbox.sh

## Launching
You'll start the docker instance by taking the example command in run-example.sh, and customize it for your own purposes.  
- Customize the port
- Customize the mounted volume.  You can use either your own filesystem or a docker volume.
- Remove --rm if you want to keep the container running after exiting the initial session created by -it

## Working in the environment
I'm using Idea's CLion, which features a mode to allow the IDE to be used on remote machines via SSH.  There are other tooling options for SSH, but this appears to be a good fit so far  with low latency when run on the local machine.  

After you start the instance, be sure to change your password with a call to passwd.

There is one caveat, and that is when ever you update the operating system or otherwise change the filesystem outside of your attached source volume, you will need to commit that version of the container to an image before shutting it down.  When restarting, you'll use  the updated image.  If you stop your container without committing the image, you'll lose everything that happened in the interrim.  Your work will be fine on the attached volume, but any changes to the os, including installations (make install / cmake --target install / apt install / etc) will be lost.
 
