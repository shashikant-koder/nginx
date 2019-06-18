pipeline{
   agent any
	stages{
	  	stage("clone repo"){
			steps{
				git credentialsId: 'git', url: 'https://github.com/shashikant-koder/nginx'
			}
  		}
	}	
}
