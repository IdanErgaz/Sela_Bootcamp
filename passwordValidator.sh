#!/bin/bash
while getopts ":h" option; do #ading case flag for -h HELP
   case $option in
      h) # display Help
        echo ======================================
	echo ==== Password Validator: H E L P =====
	echo ======================================
   	echo "The script should validate the password policy."
   	echo "Password should include Lowercase, Uppercase and digits."
   	echo "special chareters are NOT allow!!!"
   	echo
   	echo "Be aware: in case you don't use a flag, you must run the script with password after."
   	echo
   	echo "Syntax: scriptTemplate [-h]"
   	echo "options:"
   	echo "h)     Print the HELP."

         exit;;
    
esac

done

password=$1  #store user input in password
password_length=${#password}  #set password length


if [[ $password_length -ge 10 ]]&&[[ $password =~ [0-9] ]] && [[ "$password" =~ [[:upper:]] ]] && [[ "$password" =~ [[:lower:]] ]] && !  [ "${password//[^@#$%&*+=-]/}" ];#Check if password has Min 10 charcters, lowercase, Uppercase, Digit, WIHTOUT special charecters!!!
        then
                echo "$(tput setaf 2)The Password is FINE! it feet the password mandatoy policy v v v"
                exit 0;

else

	
	if [ "${password//[^@#$%&*+=-]/}" ] ;#validate that the password doesn't contain special characters.
	then 
		echo  "$(tput setaf 1)validation failed - Password should NOT include special characters!!." 
		exit 1
	fi	
                                       



        if [[ $password_length -lt 10 ]] ;        #check password length
                then
                        echo "$(tput setaf 1)validation failed - Password should be at least 10 characters length."
                        exit 1;
        fi

        if [[ $password =~ [0-9] ]]; #validate that password has at least one digit
        
 	then
                       echo "$(tput setaf 2)Password contains at least one digit v"
         else
                      echo "$(tput setaf 1)validation failed - Password should include digits!!!"
                       exit 1;
        fi

        if [[ "$password" =~ [[:upper:]] ]];#Validate that the password has upercase letter
                then
                        echo "$(tput setaf 2)uppercase character found v"
        else
                 echo "$(tput setaf 1)validation failed - Password should include Upercase letter!!!"
                 exit 1;
        fi

        if [[ "$password" =~ [[:lower:]] ]];#Validate that the password has lowercase letter
                then
                         echo "$(tput setaf 2)lowercase character found v"
        else
                 echo "$(tput setaf 1)validation failed - Password should include lowercase letter!!!"
                 exit 1;
        fi



fi

