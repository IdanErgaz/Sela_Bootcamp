$input=$args[0]
Write-Host "`nPassword must meet complexity requirements: 
`nAt least one upper case English letter [A-Z]`nAt least one lower case English letter [a-z]`nAt least one digit [0-9] `nMinimum 10 charecters."

if(($input -cmatch '[a-z]') -and ($input -cmatch '[A-Z]') -and ($input -match '\d') -and ($input.length -ge 10) ) #Check if password has Min 10 charcters, lowercase, Uppercase, Digit, WIHTOUT special charecters!!!
{
    Write-Output "$input is valid password - Youre password is according to the policy! v v v " #print if true
	exit 0 
}
else
{
	if(($input.length -ge 10)) #Check if password has minimum 10 characters
	{
		 Write-Output "Password has length of min 10 chracters v "
		 
	}
		else
	{
		Write-Output "Password should have at least 10 characters X"
	} 
	

	if(($input -cmatch '[a-z]')) #Check if password has at least one lowercase letter
	{
		Write-Output "Password has lowercase letter v "  #if true
	}
	else
	{
		Write-Output "Password should include lowercase letter!!! X"  #if not 
	}

	#if (($input -match '!|@|#|%|^|&|$')) #Validate that the password doesn't contain special characters
	#	{
	#	 Write-Output "Password should not include special charecters!! X" #print if true
	#	}
	#else
	#{
#		Write-Output "Password DOESN'T include special characters!!! V  " #print if false
#	}

	if ((($input -match '\d'))) #Validate that the password has at least one digit
		{ 
		Write-Output "Password includes at least one Digit v"  #print if true
		}
	else
	{
		Write-Output "$input is Invalid password - Password should contain digit!! X" #print if false
	}

	if(($input -cmatch '[A-Z]')) #Vlidate that password contains at least one Uppercase letter
	{
		Write-Output "Password has Uppercase letter  v " #print if true
	}
	else
	{
		Write-Output "Password should include Uppercase letter!!! X" #print if false
	}
exit 1
	}

