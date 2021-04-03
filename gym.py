#!/usr/bin/env python3
import sys
import pywhatkit as kit
from datetime import datetime


def helper():
    print("Usage: gym <flag>\n"
          + "Optional flag values are:\n"
          + "\t-h: Print this help menu\n"
          + "\t-w: Send current workout via whatsapp\n"
          + "\t-s: Set the next workout")


def whatsapp(currentWorkoutFilePath, phone_number):
    currentWorkout = ""
    with open(currentWorkoutFilePath, 'r') as workoutFile:
        currentWorkout = workoutFile.read()
    now = datetime.now()
    hour = now.strftime("%H")
    intHour = int(hour)
    minute = now.strftime("%M")
    intMinute = int(minute)
    intMinute += 1
    kit.sendwhatmsg(
        phone_number, "Today's workout is: {}".format(currentWorkout), intHour, intMinute)


def main():
    currentWorkoutFilePath = "/home/dandan/customStartupScripts/currentWorkout.txt"
    A = "Chest, Shoulders and Triceps"
    B = "Legs, Back and Biceps"
    phone_number = ""
    with open("./pywhatkit_dbs.txt", 'r') as phone_file:
        phone_data = (line.rstrip() for line in phone_file)
        phone_data = list(line for line in phone_data if line)
        for line in phone_data:
            if "Phone" in line:
                halves = line.split(":")
                phone_number = halves[1].strip()
                break
    if len(sys.argv) > 1:
        flag = sys.argv[1]
        if flag == "-h":
            helper()
            return
        elif flag == "-w":
            whatsapp(currentWorkoutFilePath, phone_number)
            return
        elif flag == "-s":
            currentWorkout = ""
            with open(currentWorkoutFilePath, 'r') as workoutFile:
                currentWorkout = workoutFile.read()
            with open(currentWorkoutFilePath, 'w') as workoutFile:
                if currentWorkout == A:
                    workoutFile.write(B)
                elif currentWorkout == B:
                    workoutFile.write(A)
                else:
                    print("Error")
            return
    else:
        with open(currentWorkoutFilePath, 'r') as workoutFile:
            currentWorkout = workoutFile.read()
            print(currentWorkout)
        return


if __name__ == "__main__":
    main()
