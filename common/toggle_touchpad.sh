#!/bin/bash
if synclient -l | grep "TouchpadOff .*=.*0" ; then
	synclient TouchpadOff=1 ;
else 
	synclient TouchpadOff=0 ;
fi

if synclient -l | grep "TouchpadOff .*=.*2" ; then
	synclient TouchpadOff=1 ;
fi
