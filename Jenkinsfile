#!groovy​

def workspaceLocation

pipeline   {
    agent any 
    stages {
		
		stage('sql build')
		{
    
	steps
    {
	
     dir('../Sca_Northwind') 
        {
		
		echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
		echo "workspace location is ${env.WORKSPACE}"
				
		echo "Cleanup Workspace"
			cleanWs()
			echo " BuildScripts sql starting"

				
		checkout([
			$class: 'GitSCM', 
			branches: [[name: '*/sca-april']], 
			doGenerateSubmoduleConfigurations: false, 
			extensions: [], 
			submoduleCfg: [], 
			userRemoteConfigs: [[credentialsId: 'njain', url: 'https://github.com/nitinj8787/SCA_Nothwind.git']]
			])
			
			script
			{
					echo "2 Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
					echo "2 workspace location is ${env.WORKSPACE}"
	
			
				powershell "./SqlCIPipeline.ps1 ${env.WORKSPACE}"
			}
			 }
	}
	}
}
}
