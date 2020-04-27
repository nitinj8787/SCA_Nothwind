

# Required - the location of your source code
   #$scriptsFolder = "https://svn.peppergroup.co.uk:800/svn/systems/TestDevOps/Northwind/trunk"
   
   $workspaceLocation = $args[0]  #"E:\Jenkins\workspace\branches_Sca_Northwind_June-ILGBSSYUO43BLWHWV4JDTVB3ZAMCKNM42ETBP7K2RB5X5Y6YUTWA"
   
   write-host "workspaceLocation is " $workspaceLocation
   
   $scriptsFolder = $workspaceLocation.Replace("branches_","").Split("-")[0]+"\SCA_Northwind_trunk"

   write-host "scriptsFolder is " $scriptsFolder

   $separater = "workspace"
   
   # Required - package name and version number (must not already exist in output directory)
   $packageID = ($scriptsFolder -Split $separater)[1].Split("\")[1]

   write-host $packageID
  
   $packageVersion = "0.1"# + $args[0]
   
   # Required - An output directory in which to save your build artifacts (must already exist)
   $outputDir = "E:\Jenkins\workspace\TestSqlDevops\DbNugetPkgs\"
   $outputFolder = $packageID.Split("_")[-1]  
   
   # Optional - If using an alternate SQL instance for schema validation provide details here. Also, uncomment this parameter from line 34 below.
   #$buildDb = "Data Source=.\SQL2014"
      
   # Required for sync step only - the database you wish to deploy to. Uncomment below and also lines 46-8 if running a sync step.
   $targetServerInstance = "COMMODUS\DEV3"
   $targetDatabaseName = "Northwind_PreProd"
   
   # Optional - If using SQL Auth for target DB add a username and password. Also, uncomment these parameters from line 42 below.
   #$username = "OAKWOODHOLDINGS\PaymentHandlerTestWS"
   #$password = "Welcome7839!"
 
# Script to build DB (you can probably leave this as is)
   
   $errorActionPreference = "stop"
    
   # Validate the scripts folder
   $validatedScriptsFolder = Invoke-DatabaseBuild $scriptsFolder # -TemporaryDatabaseServer $buildDb
 
   # Export NuGet package
   $package = New-DatabaseBuildArtifact $validatedScriptsFolder -PackageId $packageID -PackageVersion $packageVersion
   Export-DatabaseBuildArtifact $package -Path $outputDir$outputFolder -Force
 
