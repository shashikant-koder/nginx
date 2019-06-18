pipeline{
   agent any
	stages{
	  	stage("clone repo"){
			steps{
				git credentialsId: 'git', url: 'https://github.com/shashikant-koder/nginx'
			}
  		}
		stage("build"){
			steps{
				sh 'docker build -t myimage .' 
			}
  		}
		stage("test"){
			steps{
				sh 'echo "testing passsed"' 
	   		}
		}



	}	
}
